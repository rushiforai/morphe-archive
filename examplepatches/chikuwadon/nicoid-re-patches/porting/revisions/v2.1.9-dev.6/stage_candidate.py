#!/usr/bin/env python3
"""Stage v2.1.9-dev.6 from the SHA-256-pinned dev.5 MPP."""
import argparse
from copy import copy
from hashlib import sha256
import os
from pathlib import Path
import subprocess
import sys
from tempfile import TemporaryDirectory
from zipfile import ZipFile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
TOOLS = ROOT / "porting/revisions/v2.0.0-dev.1/tools"
sys.path.insert(0, str(ROOT / ".github/scripts"))
from verify_android_mpp import validate_mpp

BASE_VERSION = "2.1.9-dev.5"
VERSION = "2.1.9-dev.6"
BASE_SHA = "33d919168b716e15c8e0379942ce022008eb80a5da916fd232f5429fb3dba863"
PACKAGE = Path("e/e/a")
HELPERS = "nicoid/helpers.mpe"
EXTENSION = "extensions/extension.mpe"
MANIFEST = "META-INF/MANIFEST.MF"

def require(condition, message):
    if not condition:
        raise ValueError(message)

def once(source, start, replacement):
    require(source.count(start) == 1, "Missing or ambiguous source anchor: " + repr(start))
    return source.replace(start, replacement, 1)

def change_method(source, signature, transform):
    start = source.index(signature)
    end = source.index('.end method', start) + len('.end method')
    old = source[start:end]
    return source[:start] + transform(old) + source[end:]


def patch_temp(source):
    # Single localized title shared with both confirmation entry points.
    start = r"""    const-string v2, "Delete all cached videos"

    const-string v3, "\u522a\u9664\u6240\u6709\u5df2\u5feb\u53d6\u7684\u5f71\u7247"

    const-string v4, "\u30ad\u30e3\u30c3\u30b7\u30e5\u6e08\u307f\u52d5\u753b\u3092\u3059\u3079\u3066\u524a\u9664"

    invoke-static {p0, v4, v2, v3}, Le/e/a/TemporaryCache221;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;"""
    source = once(source, start, '    invoke-static {p0}, Le/e/a/TemporaryCache221;->videoTitle(Landroid/content/Context;)Ljava/lang/String;')
    title = start.replace('v2', 'v0').replace('v3', 'v1').replace('v4', 'v2')
    return source + '\n\n.method static videoTitle(Landroid/content/Context;)Ljava/lang/String;\n    .registers 4\n\n' + title + '\n\n    move-result-object v0\n\n    return-object v0\n.end method\n'


def patch_dev115(source):
    title = r"""    const-string v2, "Delete all cached videos?"

    const-string v3, "\u522a\u9664\u5168\u90e8\u5feb\u53d6\u5f71\u7247\uff1f"

    const-string v4, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u3059\u3079\u3066\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {p0, v4, v2, v3}, Le/e/a/Dev115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;"""
    source = once(source, title, '    invoke-static {p0}, Le/e/a/TemporaryCache221;->videoTitle(Landroid/content/Context;)Ljava/lang/String;')
    # Inventory must use the location captured at confirmation, not re-read it.
    count_sig = 'count(Landroid/content/Context;)Le/e/a/Dev115$Count;'
    require(source.count(count_sig) == 4, 'Unexpected inventory callers')
    def count(m):
        m = once(m, '    .param p0, "c"    # Landroid/content/Context;', '    .param p0, "root"    # Ljava/lang/String;')
        return once(m, '    invoke-static {p0}, Le/e/a/Dev115;->folder(Landroid/content/Context;)Ljava/lang/String;\n\n    move-result-object v2', '    move-object v2, p0')
    source = change_method(source, '.method private static '+count_sig, count)
    for name, activity, root in [('lambda$cacheSettings$3','p0','p1'),('lambda$confirm$7','p1','p0'),('lambda$remove$11','p1','p0')]:
        old = f'    invoke-virtual {{{activity}}}, Landroid/preference/PreferenceActivity;->getApplicationContext()Landroid/content/Context;\n\n    move-result-object v0\n\n    invoke-static {{v0}}, Le/e/a/Dev115;->{count_sig}'
        source = change_method(source, '.method static synthetic '+name+'(', lambda m: once(m,old,f'    invoke-static {{{root}}}, Le/e/a/Dev115;->{count_sig}'))
    source = source.replace(count_sig, 'count(Ljava/lang/String;)Le/e/a/Dev115$Count;')
    # Recheck on the UI thread before dispatch, then carry the path into the worker.
    def removal(m):
        return r""".method private static remove(Landroid/preference/PreferenceActivity;Ljava/lang/String;Le/e/a/Dev115$Count;)V
    .registers 7
    :try_start_0
    invoke-static {p0}, Le/e/a/Dev115;->folder(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :changed
    new-instance v0, Le/e/a/Dev115$12;
    invoke-direct {v0, p1, p0, p2}, Le/e/a/Dev115$12;-><init>(Ljava/lang/String;Landroid/preference/PreferenceActivity;Le/e/a/Dev115$Count;)V
    const/4 v1, 0x0
    invoke-static {p0, v1, v0, p1}, Le/e/a/CacheControl110;->removeScoped(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return-void
    :changed
    invoke-static {p0}, Le/e/a/Dev115;->lambda$confirm$6(Landroid/preference/PreferenceActivity;)V
    return-void
    :catch_0
    move-exception v0
    const-string v1, "Cannot start cache deletion."
    const-string v2, "\u7121\u6cd5\u958b\u59cb\u522a\u9664\u5feb\u53d6\u3002"
    const-string v3, "\u30ad\u30e3\u30c3\u30b7\u30e5\u524a\u9664\u3092\u958b\u59cb\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002"
    invoke-static {p0, v3, v1, v2}, Le/e/a/Dev115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-static {p0, v1}, Le/e/a/Dev115;->info(Landroid/app/Activity;Ljava/lang/String;)V
    return-void
.end method"""
    require('.method static synthetic lambda$confirm$6(Landroid/preference/PreferenceActivity;)V' in source,'Missing cancellation message')
    return change_method(source,'.method private static remove(Landroid/preference/',removal)


def patch_cache_control(source):
    # Keep existing API for single/bulk operations; confirmed all-delete carries the exact folder.
    old_remove = '.method static remove(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;)V'
    new_remove = old_remove.replace('remove(', 'removeScoped(').replace('Ljava/lang/Runnable;)','Ljava/lang/Runnable;Ljava/lang/String;)')
    wrapper = old_remove + '\n    .registers 4\n    const/4 v0, 0x0\n    invoke-static {p0, p1, p2, v0}, Le/e/a/CacheControl110;->removeScoped(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;)V\n    return-void\n.end method\n\n'
    def rem(m):
        m=once(m,old_remove,new_remove)
        m=once(m,'.registers 7','.registers 8')
        m=once(m,'invoke-direct {v1, p0, p1, p2}, Le/e/a/CacheControl110$$ExternalSyntheticLambda6;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;)V','invoke-direct {v1, p0, p1, p2, p3}, Le/e/a/CacheControl110$$ExternalSyntheticLambda6;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;)V')
        return wrapper+m
    source=change_method(source,old_remove,rem)
    old_del='.method static delete(Landroid/content/Context;Ljava/lang/String;)Z'
    new_del=old_del.replace('delete(','deleteScoped(').replace('Ljava/lang/String;)','Ljava/lang/String;Ljava/lang/String;)')
    wrap=old_del+'\n    .registers 3\n    const/4 v0, 0x0\n    invoke-static {p0, p1, v0}, Le/e/a/CacheControl110;->deleteScoped(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z\n    move-result v0\n    return v0\n.end method\n\n'
    def delete(m):
        m=once(m,old_del,new_del);m=once(m,'.registers 9','.registers 10')
        anchor='    new-instance v2, Le/e/a/CacheFile;\n\n    invoke-direct {v2, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V'
        guard='''    if-eqz p2, :scope_ok
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :scope_pinned
    return v0
    :scope_pinned
    move-object v1, p2
    :scope_ok

'''
        m=once(m,anchor,guard+anchor)
        # CacheFile may report an inaccessible folder as null; never report success.
        m=once(m,'    array-length v2, v1','    if-nez v1, :scope_files\n    return v0\n    :scope_files\n    array-length v2, v1')
        # Reuse the parsed ID, avoiding a second name extraction/regex match for each file.
        m=once(m,'    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;\n\n    move-result-object v6\n\n    invoke-static {v6}, Le/e/a/CacheFolders;->videoId(Ljava/lang/String;)Ljava/lang/String;\n\n    move-result-object v6\n\n    invoke-virtual {p1, v6}', '    invoke-virtual {p1, v6}')
        return wrap+m
    source=change_method(source,old_del,delete)
    old_lambda='.method static synthetic lambda$6(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;)V'
    def worker(m):
        m=once(m,old_lambda,old_lambda.replace('Ljava/lang/Runnable;)','Ljava/lang/Runnable;Ljava/lang/String;)'))
        m=once(m,'.registers 4','.registers 5')
        return once(m,'invoke-static {p0, p1}, Le/e/a/CacheControl110;->delete(Landroid/content/Context;Ljava/lang/String;)Z','invoke-static {p0, p1, p3}, Le/e/a/CacheControl110;->deleteScoped(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z')
    source=change_method(source,old_lambda,worker)
    # Remember the worker's selected root before publication to the jobs map.
    def register(m):
        anchor='    :goto_0\n    sget-object v1, Le/e/a/CacheControl110;->jobs:Ljava/util/Map;'
        addition='    :goto_0\n    invoke-static {}, Le/e/a/CacheControl110;->captureJobRoot()Ljava/lang/String;\n    move-result-object v1\n    iput-object v1, v0, Le/e/a/CacheControl110$Job;->cacheRoot:Ljava/lang/String;\n\n    sget-object v1, Le/e/a/CacheControl110;->jobs:Ljava/util/Map;'
        return once(m,anchor,addition)
    source=change_method(source,'.method public static register(Ljava/lang/Thread;)V',register)
    # Interrupted workers must not sweep media in a different selected location.
    def cleanup(m):
        anchor='    :cond_0\n    new-instance v0, Ljava/lang/StringBuilder;\n\n    sget-object v1, Le/e/a/CacheFolders;->context:Landroid/content/Context;\n\n    invoke-static {v1}, Le/e/a/CacheFolders;->root(Landroid/content/Context;)Ljava/lang/String;\n\n    move-result-object v1'
        repl='    :cond_0\n    iget-object v1, p0, Le/e/a/CacheControl110$Job;->cacheRoot:Ljava/lang/String;\n    if-eqz v1, :cond_3\n    invoke-static {}, Le/e/a/CacheControl110;->captureJobRoot()Ljava/lang/String;\n    move-result-object v0\n    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z\n    move-result v0\n    if-eqz v0, :cond_3\n    new-instance v0, Ljava/lang/StringBuilder;'
        return once(m,anchor,repl)
    source=change_method(source,'.method static cleanup(Le/e/a/CacheControl110$Job;)V',cleanup)
    source += r"""

.method private static captureJobRoot()Ljava/lang/String;
    .registers 3
    const/4 v0, 0x0
    :try_start_0
    sget-object v1, Le/e/a/CacheFolders;->context:Landroid/content/Context;
    if-eqz v1, :missing
    invoke-static {v1}, Le/e/a/CacheFolders;->root(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :missing
    const-string v2, "/@nicoid-cache/unselected"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :missing
    return-object v1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    :catch_0
    move-exception v1
    :missing
    return-object v0
.end method
"""
    def fallback(m):
        return once(m,r'''    const-string v0, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u3059\u3079\u3066\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;''','    invoke-static {p0}, Le/e/a/TemporaryCache221;->videoTitle(Landroid/content/Context;)Ljava/lang/String;')
    return change_method(source,'.method static synthetic lambda$4(Landroid/preference/',fallback)


def patch_cache_job(source):
    return once(source, '.field id:Ljava/lang/String;', '.field id:Ljava/lang/String;\n\n.field cacheRoot:Ljava/lang/String;')


def patch_cache_worker(source):
    cl='Le/e/a/CacheControl110$$ExternalSyntheticLambda6;'
    source=once(source,'.field public final synthetic f$2:Ljava/lang/Runnable;', '.field public final synthetic f$2:Ljava/lang/Runnable;\n\n.field public final synthetic f$3:Ljava/lang/String;')
    source=once(source,'<init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;)V\n    .registers 4','<init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;)V\n    .registers 5')
    source=once(source,f'    iput-object p3, p0, {cl}->f$2:Ljava/lang/Runnable;',f'    iput-object p3, p0, {cl}->f$2:Ljava/lang/Runnable;\n\n    iput-object p4, p0, {cl}->f$3:Ljava/lang/String;')
    source=once(source,'.method public final run()V\n    .registers 4','.method public final run()V\n    .registers 5')
    return once(source,'    invoke-static {v0, v1, v2}, Le/e/a/CacheControl110;->lambda$6(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;)V',f'    iget-object v3, p0, {cl}->f$3:Ljava/lang/String;\n\n    invoke-static {{v0, v1, v2, v3}}, Le/e/a/CacheControl110;->lambda$6(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;)V')


def patch_image(source):
    # The existing file length is already bounded by 8 MiB. Start with at most
    # 64 KiB, rather than the default 32-byte buffer, retaining the read limit.
    anchor='    new-instance v2, Ljava/io/ByteArrayOutputStream;\n\n    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V'
    replacement='''    long-to-int v3, v2
    const v4, 0x10000
    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I
    move-result v3
    new-instance v2, Ljava/io/ByteArrayOutputStream;
    invoke-direct {v2, v3}, Ljava/io/ByteArrayOutputStream;-><init>(I)V'''
    return change_method(source,'.method declared-synchronized get(Ljava/lang/String;)[B',lambda m: once(m,anchor,replacement))


def patch_version(source):
    require(source.count(BASE_VERSION) > 0, "Missing patch version literal")
    return source.replace(BASE_VERSION, VERSION)

def apply_overlay(directory, edits):
    for relative, transform in edits.items():
        file = directory / relative
        before = file.read_text(encoding="utf-8")
        after = transform(before)
        require(before != after, "No change to " + str(relative))
        file.write_text(after, encoding="utf-8", newline="\n")

def commands(tools):
    classpath = os.pathsep.join(str(tools / member) for member in (
        "assemble/*", "dexlib2.jar", "guava.jar"))
    return ["java", "-cp", classpath]

def disassemble(java, dex, directory):
    subprocess.run(java + ["org.jf.baksmali.Main", "disassemble",
        "--sequential-labels", str(dex), "-o", str(directory)], check=True)

def stage(baseline, output, tools):
    require(baseline.resolve() != output.resolve(), "Input and output must differ")
    require(sha256(baseline.read_bytes()).hexdigest() == BASE_SHA, "Expected the verified dev.5 MPP")
    validate_mpp(baseline, BASE_VERSION)
    edits = {
        HELPERS: {
            PACKAGE / "TemporaryCache221.smali": patch_temp,
            PACKAGE / "Dev115.smali": patch_dev115,
            PACKAGE / "CacheControl110.smali": patch_cache_control,
            PACKAGE / "CacheControl110$Job.smali": patch_cache_job,
            PACKAGE / "CacheControl110$$ExternalSyntheticLambda6.smali": patch_cache_worker,
            PACKAGE / "ImageDiskCache.smali": patch_image,
            PACKAGE / "PatchVersion237.smali": patch_version,
            PACKAGE / "ModernShorts.smali": patch_version,
        },
        EXTENSION: {PACKAGE / "ModernShorts.smali": patch_version},
    }
    java = commands(tools)
    output.parent.mkdir(parents=True, exist_ok=True)
    with TemporaryDirectory(prefix="nicoid-dev219-") as temp, ZipFile(baseline) as old:
        work = Path(temp)
        assets = {}
        for number, (name, transforms) in enumerate(edits.items()):
            src = work / f"base-{number}.dex"
            src.write_bytes(old.read(name))
            folder = work / f"smali-{number}"
            disassemble(java, src, folder)
            apply_overlay(folder, transforms)
            dex = work / f"candidate-{number}.dex"
            subprocess.run(java + ["org.jf.smali.Main", "assemble", "-a", "28",
                str(folder), "-o", str(dex)], check=True)
            checked = work / f"verified-{number}"
            disassemble(java, dex, checked)
            expected = {p.relative_to(folder): p.read_bytes() for p in folder.rglob("*.smali")
                if p.relative_to(folder) not in transforms}
            actual = {p.relative_to(checked): p.read_bytes() for p in checked.rglob("*.smali")
                if p.relative_to(checked) not in transforms}
            require(actual == expected, "Unexpected change to an untouched class in " + name)
            require(all((checked / p).is_file() for p in transforms), "Missing modified class in " + name)
            assets[name] = dex.read_bytes()
        assets[MANIFEST] = once(old.read(MANIFEST),
            f"Version: {BASE_VERSION}\r\n".encode(), f"Version: {VERSION}\r\n".encode())
        candidate = output.with_name(output.name + ".staging")
        try:
            with ZipFile(candidate, "w") as bundle:
                for entry in old.infolist():
                    member = assets.get(entry.filename)
                    bundle.writestr(copy(entry), old.read(entry) if member is None else member)
            validate_mpp(candidate, VERSION)
            with ZipFile(candidate) as new:
                require(new.namelist() == old.namelist() and new.testzip() is None, "Invalid MPP")
                require(all(new.read(name) == old.read(name) for name in old.namelist()
                    if name not in assets), "Unexpected package change")
            candidate.replace(output)
        finally:
            candidate.unlink(missing_ok=True)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--tools", default=TOOLS, type=Path)
    args = parser.parse_args()
    stage(args.input, args.output, args.tools)
