"""Syntax validation over ALL embedded estimator shaders (swp_shaders.h).

Mirrors diagnostics/steamlink-vd-hevc10/validate_shader_syntax.py: keep the
production source untouched, compile it with the repo's glslang toolchain,
and record diagnostics + outcomes in a JSON report next to this script.

Expected outcomes (also pinned in swp_manifest.json):
  - glslang 1.x rejects `#extension GL_QCOM_block_match` ("extension not
    supported") — REPRODUCED on this toolchain on 2026-10-17 by probing
    glslang.exe directly. The two QCOM-containing shaders are therefore
    validated two ways: (a) as-is, where that exact rejection is the
    EXPECTED outcome; (b) as a dialect probe where the SWP_SAD macro is
    pointed at a plain-GLSL stub (the same fallback body), so the entire
    remaining grammar (uniforms, loops, search code) must compile clean.
  - every other full shader (vert, median, extrap, fallback L1) must
    compile clean as-is.
  - the uniform reflection gate links each composed program the worker builds
    (`-l -q`, same quad vertex shader) and requires every `ULocDef` name in
    swp_est_worker.cpp to be an active uniform: `glGetUniformLocation` returns
    -1 for a declared-but-unread uniform, and setup treats that as fatal.
Exit code 0 = all expectations met.
"""
import json
import re
import subprocess
import sys
import tempfile
from pathlib import Path

HERE = Path(__file__).resolve().parent          # .../extensions/gxr-spacewarp-layer/tests
SRC = HERE.parent / "src"
SHADERS_H = SRC / "swp_shaders.h"
WORKER_CPP = SRC / "swp_est_worker.cpp"

# glslang.exe shipped by the wave's tooling tree (sibling of the repo root).
ROOTS = [HERE.parents[3], HERE.parents[3].parent, HERE.parent.parent]
GLSLANG = None
for root in ROOTS:
    cand = (root / "builds" / "steamlink-patches" / "build" / "tooling" / "bin" /
            "glslang.exe")
    if cand.is_file():
        GLSLANG = cand
        break

JUNK_MARKERS = ("decryptionKey", "texelFetch...", "numPixels...")
FAILURES = []


def fail(msg):
    FAILURES.append(msg)
    print("FAIL:", msg)


def extract_shaders(text):
    """Pull every #define SWP_GLSL_* R"GLSL(...)GLSL" body plus the exported
    `static const char* const swp_*` compositions."""
    macros = {}
    for m in re.finditer(r'#define\s+(SWP_GLSL_[A-Z_0-9]+)\s+R"GLSL\((.*?)\)GLSL"',
                         text, re.S):
        macros[m.group(1)] = m.group(2)
    consts = {}
    for m in re.finditer(
            r'static\s+const\s+char\*\s+const\s+(swp_[A-Za-z_0-9]+)\s*=([^;]+);', text):
        name, expr = m.group(1), m.group(2)
        consts[name] = expr
    return macros, consts


def resolve_compositions(macros, consts):
    """Build each compilable shader source. Mirrors the header's composition
    table and the worker's BuildPassProgram parts exactly; the exported const
    expressions are then checked against these builds."""
    ver = "#version 320 es\n"
    direct = macros["SWP_GLSL_DIRECT_PREFIX"]
    fb = macros["SWP_GLSL_FALLBACK_PREFIX"]
    expect_expr = {
        "swp_vert_quad": "SWP_GLSL_VERSION SWP_GLSL_QUAD_VERT",
        "swp_version_line": "SWP_GLSL_VERSION",
        "swp_sad_direct_prefix": "SWP_GLSL_DIRECT_PREFIX",
        "swp_sad_fallback_prefix": "SWP_GLSL_FALLBACK_PREFIX",
        "swp_dense_core": "SWP_GLSL_DENSE_CORE",
        "swp_refine_core": "SWP_GLSL_REFINE_CORE",
        "swp_downsample_frag": "SWP_GLSL_DOWNSAMPLE_FRAG",
        "swp_median_frag": "SWP_GLSL_MEDIAN_FRAG",
        "swp_extrap_frag": "SWP_GLSL_EXTRAP_FRAG",
        "swp_align_frag": "SWP_GLSL_ALIGN_FRAG",
        "swp_dense_frag": "SWP_GLSL_VERSION SWP_GLSL_DIRECT_PREFIX SWP_GLSL_DENSE_CORE",
        "swp_dense_fallback_frag": "SWP_GLSL_VERSION SWP_GLSL_FALLBACK_PREFIX SWP_GLSL_DENSE_CORE",
        "swp_refine_frag": "SWP_GLSL_VERSION SWP_GLSL_DIRECT_PREFIX SWP_GLSL_REFINE_CORE",
        "swp_refine_fallback_frag": "SWP_GLSL_VERSION SWP_GLSL_FALLBACK_PREFIX SWP_GLSL_REFINE_CORE",
    }
    for name, want in expect_expr.items():
        got = consts.get(name, "").replace("\n", " ").strip()
        if got != want:
            fail(f"composition drift: const {name} != {want!r} (got {got!r})")
    out = {
        "swp_vert_quad": macros["SWP_GLSL_VERSION"] + macros["SWP_GLSL_QUAD_VERT"],
        "swp_downsample_frag": macros["SWP_GLSL_DOWNSAMPLE_FRAG"],
        "swp_dense_frag": ver + direct + macros["SWP_GLSL_DENSE_CORE"],
        "swp_dense_fallback_frag": ver + fb + macros["SWP_GLSL_DENSE_CORE"],
        "swp_median_frag": macros["SWP_GLSL_MEDIAN_FRAG"],
        "swp_refine_frag": ver + direct + macros["SWP_GLSL_REFINE_CORE"],
        "swp_refine_fallback_frag": ver + fb + macros["SWP_GLSL_REFINE_CORE"],
        "swp_extrap_frag": macros["SWP_GLSL_EXTRAP_FRAG"],
        "swp_align_frag": macros["SWP_GLSL_ALIGN_FRAG"],
    }
    return out


def structural_checks(name, src):
    if "\t" in src:
        fail(f"{name}: tab character in shader source")
    for junk in JUNK_MARKERS:
        if junk in src:
            fail(f"{name}: junk/obfuscation marker {junk!r}")
    if src.count("{") != src.count("}"):
        fail(f"{name}: unbalanced braces")
    if src.count("(") != src.count(")"):
        fail(f"{name}: unbalanced parens")
    if not src.startswith("#version 320 es\n"):
        fail(f"{name}: does not start with '#version 320 es'")
    if not src.isascii():
        fail(f"{name}: non-ASCII byte in source")


def qcom_stub_probe(src):
    """Dialect probe: swap the QCOM macro for the plain-GLSL SAD body so the
    rest of the grammar is exercised on a toolchain without the extension."""
    if "blockMatchSADQCOM" not in src:
        return None
    stub = '''precision highp int;
precision highp float;
float swpSadProbe(highp sampler2D texA, ivec2 cA, highp sampler2D texB, ivec2 cB, int blockSize) {
    float sad = 0.0;
    for (int y = 0; y < blockSize; ++y) {
        for (int x = 0; x < blockSize; ++x) {
            ivec2 t = ivec2(x, y);
            vec3 a = texelFetch(texA, cA + t, 0).rgb;
            vec3 b = texelFetch(texB, cB + t, 0).rgb;
            sad += abs(a.r - b.r) + abs(a.g - b.g) + abs(a.b - b.b);
        }
    }
    return sad;
}
'''
    out = src.replace("#extension GL_QCOM_block_match : require", "")
    out = out.replace(
        "#define SWP_SAD(tA, cA, tB, cB, bs) blockMatchSADQCOM(tA, cA, tB, cB, bs).x",
        "#define SWP_SAD(tA, cA, tB, cB, bs) swpSadProbe(tA, cA, tB, cB, bs)")
    ver = "#version 320 es\n"
    assert out.startswith(ver), "probe source lost its version line"
    return ver + stub + out[len(ver):]


def run_glslang(path, kind):
    if not GLSLANG:
        return None, "glslang unavailable"
    r = subprocess.run([str(GLSLANG), "-S", kind, str(path)],
                       capture_output=True, text=True, timeout=120)
    return r.returncode, (r.stdout + r.stderr).strip()


# Programs the worker links, and the compositions each one may build. GME/H1
# compose behind either SAD prefix and both arms must resolve the same names.
REFLECT_PROGRAMS = {
    "progDown": ("down", ("swp_downsample_frag",)),
    "progDense": ("dense", ("swp_dense_fallback_frag",)),
    "progDenseQcom": ("dense", ("swp_dense_frag",)),
    "progMedian": ("median", ("swp_median_frag",)),
    "progRefine": ("refine", ("swp_refine_fallback_frag",)),
    "progRefineQcom": ("refine", ("swp_refine_frag",)),
    "progExtrap": ("extrap", ("swp_extrap_frag",)),
    "progAlign": ("align", ("swp_align_frag",)),
}


def extract_worker_uniforms(text):
    """ULocDef arrays and the ResolveUniforms(program, array, count) calls that
    swp_est_worker.cpp resolves strictly at setup."""
    defs = {}
    for m in re.finditer(
            r'ULocDef\s+([A-Za-z_][A-Za-z_0-9]*)\s*\[\s*\]\s*=\s*\{(.*?)\};', text, re.S):
        defs[m.group(1)] = re.findall(r'\{\s*"([^"]+)"\s*,', m.group(2))
    progs = {}
    for m in re.finditer(
            r'ResolveUniforms\(\s*g\.(prog[A-Za-z_0-9]+)\s*,\s*'
            r'([A-Za-z_][A-Za-z_0-9]*)\s*,\s*(\d+)\s*\)', text):
        progs[m.group(1)] = (m.group(2), int(m.group(3)))
    return defs, progs


def parse_uniform_reflection(log):
    """Names under glslang's `Uniform reflection:` heading (active uniforms;
    the same view glGetUniformLocation resolves against)."""
    names, in_uniforms = [], False
    for line in log.splitlines():
        s = line.strip()
        if s == "Uniform reflection:":
            in_uniforms = True
            continue
        if not in_uniforms:
            continue
        if not s:
            break
        m = re.match(r'([A-Za-z_][A-Za-z_0-9]*)(?:\[\d+\])?\s*:', s)
        if m:
            names.append(m.group(1))
    return names


def link_reflect(vert_path, frag_path):
    r = subprocess.run([str(GLSLANG), "-l", "-q", str(vert_path), str(frag_path)],
                       capture_output=True, text=True, timeout=120)
    return r.returncode, (r.stdout + r.stderr).strip()


def check_uniform_reflection(comp, macros, tmp, report):
    """Regression: a name the worker resolves must be an ACTIVE uniform of the
    linked program. A declaration the shader body never reads is dropped by
    link reflection, so strict glGetUniformLocation returns -1 and the whole
    estimator stands down for the session."""
    defs, progs = extract_worker_uniforms(WORKER_CPP.read_text(encoding="utf8"))
    if not progs:
        fail("worker: no ResolveUniforms(program, array, count) call parsed")
        return
    vert_path = tmp / "reflect_quad.vert"
    vert_path.write_text(macros["SWP_GLSL_VERSION"] + macros["SWP_GLSL_QUAD_VERT"],
                         encoding="ascii", newline="\n")
    seen = {}
    for prog, (array, count) in sorted(progs.items()):
        if prog not in REFLECT_PROGRAMS:
            fail(f"worker: {prog} has no reflection mapping in this test")
            continue
        if array not in defs:
            fail(f"worker: {prog} references unknown uniform array {array}")
            continue
        names = defs[array]
        if count != len(names):
            fail(f"worker: ResolveUniforms({prog}, {array}, {count}) "
                 f"does not match the array's {len(names)} entries")
        _, variants = REFLECT_PROGRAMS[prog]
        for variant in variants:
            src = comp[variant]
            probe = qcom_stub_probe(src) if "blockMatchSADQCOM" in src else None
            path = tmp / f"reflect_{variant}.frag"
            path.write_text(src, encoding="ascii", newline="\n")
            code, log = link_reflect(vert_path, path)
            if code != 0 and probe is not None and "GL_QCOM_block_match" in log:
                path = tmp / f"reflect_{variant}.probe.frag"
                path.write_text(probe, encoding="ascii", newline="\n")
                code, log = link_reflect(vert_path, path)
            got = parse_uniform_reflection(log)
            missing = [n for n in names if n not in got]
            seen[variant] = {"program": prog, "defs": array, "glslang_exit": code,
                             "reflected": got, "missing": missing}
            print(f"  reflect {variant}: exit={code} "
                  f"{len(names) - len(missing)}/{len(names)} names active")
            if code != 0:
                fail(f"{variant}: link/reflection failed (exit {code}):\n{log[:800]}")
            elif missing:
                fail(f"{variant}: worker resolves {', '.join(missing)} but link "
                     "reflection omits it (unread declaration => -1 at setup)")
    report["uniform_reflection"] = seen


def main():
    text = SHADERS_H.read_text(encoding="utf8")
    macros, consts = extract_shaders(text)
    if len(macros) < 10 or len(consts) != 14:
        fail(f"extraction: macros={len(macros)} consts={len(consts)}")
        sys.exit(1)

    report = {"shaders_h": str(SHADERS_H), "cases": [], "expected": {},
              "uniform_reflection": {}}
    comp = resolve_compositions(macros, consts)
    tmp = Path(tempfile.mkdtemp(prefix="swp-shader-syntax-"))
    for name, src in sorted(comp.items()):
        structural_checks(name, src)
        kind = "vert" if "quad" in name else "frag"
        probe = qcom_stub_probe(src) if "blockMatchSADQCOM" in src else None
        path = tmp / f"{name}.{kind}"
        path.write_text(src, encoding="ascii", newline="\n")
        code, detail = run_glslang(path, kind)
        probe_code = probe_detail = None
        if probe is not None:
            ppath = tmp / f"{name}.probe.{kind}"
            ppath.write_text(probe, encoding="ascii", newline="\n")
            probe_code, probe_detail = run_glslang(ppath, kind)
            if probe_code not in (0, None):
                fail(f"{name}: dialect probe failed to compile:\n{probe_detail}")
        if code not in (0, None):
            # QCOM rejection is expected on this toolchain for as-is compiles.
            if "extension not supported: GL_QCOM_block_match" in detail and probe is not None:
                if probe_code == 0:
                    code = 0  # accepted stance (recorded below)
                    detail = "QCOM extension rejected by host glslang; dialect probe clean"
        elif code == 0:
            pass
        if code not in (0, None):
            fail(f"{name}: glslang exit {code}:\n{detail}")
        report["cases"].append({
            "name": name, "glslang_exit": code, "probe_exit": probe_code,
            "detail": detail[:2000] if detail else "",
        })
        print(f"  {name}: exit={code} probe={probe_code}")

    if GLSLANG is not None:
        check_uniform_reflection(comp, macros, tmp, report)

    if GLSLANG is None:
        fail("glslang.exe not found — syntax validation skipped (structural only)")
        report["glslang"] = "unavailable"
        sys.exit(2)

    report["glslang"] = subprocess.run([str(GLSLANG), "--version"],
                                       capture_output=True, text=True).stdout.strip()
    (HERE / "swp-shader-syntax.json").write_text(
        json.dumps(report, indent=2) + "\n", encoding="utf8")
    if FAILURES:
        print(f"\nFAILED: {len(FAILURES)} check(s) — see swp-shader-syntax.json")
        sys.exit(1)
    print("\nPASS: all embedded estimator shaders validated "
          f"({len(comp)} compositions, {sum(1 for c in report['cases'] if c['probe_exit'] == 0)}"
          " QCOM dialect probes clean)")


if __name__ == "__main__":
    main()