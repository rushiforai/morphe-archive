"""Read installed Streamer IL without loading or executing its managed code.

Run from repository root: python -B diagnostics/steamlink-vd-streamer/managed-evidence.py --write
Output is limited to selected codec methods; no user settings are read.
"""
import bisect
import hashlib
import json
from pathlib import Path
import struct
import sys

sys.path.insert(0, "build/vd-audit/tools")
import dnfile
from dncil.cil.body import CilMethodBody
from dncil.cil.body.reader import CilMethodBodyReaderBytes

SOURCE = Path("C:/Program Files/Virtual Desktop Streamer/VirtualDesktop.Streamer.exe")
EXPECTED = "6bfec9e4e62509f4fdb0ec21c144b4584f9450701dcf5bd756d6fd2aec7cbb51"
data = SOURCE.read_bytes()
assert hashlib.sha256(data).hexdigest() == EXPECTED, "Different installed Streamer"
if "p" not in globals():
    p = dnfile.dnPE(data=data, clr_lazy_load=True)
owners = {}
for ti, t in enumerate(p.net.mdtables.TypeDef.rows, 1):
    for ix in list(t.MethodList) + list(t.FieldList):
        owners[id(ix.row)] = (ti, str(t.TypeNamespace) + "." + str(t.TypeName))

def label(row):
    if hasattr(row, "TypeName"):
        return ascii(str(row.TypeNamespace) + "." + str(row.TypeName))
    if hasattr(row, "Class"):
        return label(row.Class.row) + "::" + ascii(str(row.Name))
    if hasattr(row, "Name"):
        return ascii(owners.get(id(row), (0, ""))[1]) + "::" + ascii(str(row.Name))
    if hasattr(row, "Method"):
        return label(row.Method.row)
    return type(row).__name__

TABLES = {1: "TypeRef", 2: "TypeDef", 4: "Field", 6: "MethodDef", 10: "MemberRef", 27: "TypeSpec", 43: "MethodSpec"}
def token(value):
    kind, rid = value >> 24, value & 0xffffff
    if kind == 0x70:
        return hex(value) + " " + ascii(str(p.net.user_strings.get(rid)))
    try:
        return hex(value) + " " + label(getattr(p.net.mdtables, TABLES[kind]).rows[rid - 1])
    except (KeyError, IndexError):
        return hex(value)

def body(rid):
    m = p.net.mdtables.MethodDef.rows[rid - 1]
    return CilMethodBody(CilMethodBodyReaderBytes(p.get_data(m.Rva)))

def dump(rid):
    m = p.net.mdtables.MethodDef.rows[rid - 1]
    lines = [f"{token(0x06000000 + rid)} RVA {m.Rva:#x} signature={m.Signature.value.hex()}"]
    if not m.Rva:
        return "\n".join(lines)
    for ins in body(rid).instructions:
        operand = ins.operand
        if hasattr(operand, "value"):
            operand = token(operand.value)
        lines.append(f"{ins.offset:04x} {ins.opcode.name} {operand if operand is not None else ''}")
    return "\n".join(lines)

starts = sorted((m.Rva, i) for i, m in enumerate(p.net.mdtables.MethodDef.rows, 1) if m.Rva)
rvas = [x[0] for x in starts]
def refs(value):
    """Find candidate raw references, then verify decoded IL operand tokens."""
    needle = struct.pack("<I", value)
    candidates = set()
    offset = data.find(needle)
    while offset >= 0:
        try:
            rva = p.get_rva_from_offset(offset)
            pos = bisect.bisect_right(rvas, rva) - 1
            if pos >= 0:
                candidates.add(starts[pos][1])
        except Exception:
            pass
        offset = data.find(needle, offset + 1)
    found = []
    for rid in sorted(candidates):
        try:
            for ins in body(rid).instructions:
                if getattr(ins.operand, "value", None) == value:
                    found.append((rid, ins.offset, ins.opcode.name))
        except Exception:
            pass
    return found

OUTPUTS = {
    "managed-selected.il.txt": [0x3c1, 0x3e2, 0x403, 0x467, 0x476, 0x477, 0x4ac, 0x2155b, 0x21563, 0x2156c, 0x215f0],
    "managed-gamma.il.txt": [0x413, 0x212b0, 0x213e1, 0x21527, 0x21528, 0x2152c, 0x2152d, 0x2152e, 0x2152f, 0x21530, 0x21531, 0x21532, 0x21561],
    "managed-gamma-extra.il.txt": [0x430, 0x21387, 0x21388, 0x213b1, 0x21557, 0x212b1],
    "managed-factory.il.txt": [0x46a, 0x21554, 0x21555, 0x21558],
    "managed-nvenc-input.il.txt": [0x215f9, 0x215fc, 0x215fd],
    "managed-ui.il.txt": [0x57d, 0x57e],
}

def write_evidence():
    output = Path("diagnostics/steamlink-vd-streamer")
    output.mkdir(parents=True, exist_ok=True)
    for filename, rids in OUTPUTS.items():
        (output / filename).write_text("\n\n".join(dump(r) for r in rids), encoding="utf8")
    constants = {}
    for row in p.net.mdtables.Constant:
        if row.Parent.table.name == "Field" and 0x14c41 <= row.Parent.row_index <= 0x14c49:
            constants[str(row.Parent.row.Name)] = int.from_bytes(row.Value.value, "little")
    gamma_attributes = []
    for row in p.net.mdtables.CustomAttribute:
        if row.Parent.table.name == "Property" and str(row.Parent.row.Name) == "Gamma":
            gamma_attributes.append({"type": label(row.Type.row), "blob": row.Value.value.hex()})
    methods = []
    for rid in sorted({r for group in OUTPUTS.values() for r in group}):
        method = p.net.mdtables.MethodDef.rows[rid - 1]
        method_body = body(rid)
        methods.append({"token": hex(0x06000000 + rid), "rva": hex(method.Rva), "label": label(method),
                        "size": method_body.size, "sha256": hashlib.sha256(p.get_data(method.Rva, method_body.size)).hexdigest()})
    receipt = {"source": str(SOURCE), "sha256": EXPECTED, "source_bytes": len(data),
               "assembly_version": "1.34.22.0", "codec_constants": constants,
               "gamma_attributes": gamma_attributes, "methods": methods}
    (output / "managed-routing-index.json").write_text(json.dumps(receipt, indent=2) + "\n", encoding="utf8")
    print(f"Wrote {len(OUTPUTS)} selected IL files and 1 index; {len(methods)} methods; installed executable unchanged.")

if __name__ == "__main__" and "--interactive" not in sys.argv:
    if "--write" in sys.argv:
        write_evidence()
    else:
        print("Use --write to regenerate the selected evidence files; the installed executable is only read.")
