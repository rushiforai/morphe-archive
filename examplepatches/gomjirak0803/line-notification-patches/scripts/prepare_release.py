"""Prepare a patch-only release from the verified bundle; never handles app APKs or keys."""
from pathlib import Path
import hashlib,json,os,re,subprocess,zipfile
from datetime import datetime,timezone
from build import ROOT,BUILD,VERSION,tool_paths,run

REPO="gomjirak0803/line-notification-patches"
def main():
    java,_,_,runtime,compiler=tool_paths()
    bundle=ROOT/f"patches/build/libs/line-notification-patches-{VERSION}.mpp"
    assert bundle.is_file()
    helper=BUILD/"release-helper";helper.mkdir(parents=True,exist_ok=True)
    run([java,"-cp",os.pathsep.join(str(p) for p in compiler.glob("*.jar")),"org.jetbrains.kotlin.cli.jvm.K2JVMCompiler","-no-stdlib","-no-reflect","-jvm-target","11","-language-version","2.0","-classpath",os.pathsep.join([str(runtime),str(compiler/"kotlin-stdlib.jar")]),"-d",helper,ROOT/"patches/src/main/kotlin/util/PatchListGenerator.kt"])
    run([java,"-cp",os.pathsep.join([str(helper),str(runtime),str(compiler/"kotlin-stdlib.jar")]),"util.PatchListGeneratorKt",bundle,ROOT/"patches-list.json"])
    listing=json.loads((ROOT/"patches-list.json").read_text());assert listing["version"]==VERSION and len(listing["patches"])==6
    url=f"https://github.com/{REPO}/releases/download/v{VERSION}"
    notes=(ROOT/"docs/RELEASE_NOTES.md").read_text(encoding="utf-8").strip()
    metadata={"created_at":datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%S"),"description":notes,"download_url":url+"/"+bundle.name,"signature_download_url":"","version":VERSION}
    (ROOT/"patches-bundle.json").write_text(json.dumps(metadata,indent=2),encoding="utf-8")
    out=ROOT/"artifacts/publish";out.mkdir(parents=True,exist_ok=True)
    import shutil
    shutil.copy2(bundle,out/bundle.name)
    files=[ROOT/p for p in subprocess.check_output(["git","ls-files","--cached","--others","--exclude-standard"],cwd=ROOT,text=True,encoding="utf-8").splitlines() if (ROOT/p).is_file()]
    source=out/f"line-notification-patches-{VERSION}-source.zip"
    with zipfile.ZipFile(source,"w",zipfile.ZIP_DEFLATED) as z:
        for p in sorted(files):
            rel=p.relative_to(ROOT)
            if any(s in {".git",".tools","artifacts","apk","build"} for s in rel.parts):raise RuntimeError("Private path in source selection")
            if p.suffix.lower() in {".apk",".apkm",".p12",".key",".db",".png",".jpg",".mpp"}:raise RuntimeError("Unexpected source artifact")
            data=p.read_bytes()
            if re.search(rb"-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----|github_pat_[A-Za-z0-9_]{30,}|ghp_[A-Za-z0-9]{25,}",data):raise RuntimeError("Secret pattern found")
            z.writestr(f"line-notification-patches-{VERSION}/"+rel.as_posix(),data)
    for name in ["LICENSE","NOTICE","THIRD_PARTY_NOTICES.md","patches-list.json","patches-bundle.json"]:shutil.copy2(ROOT/name,out/name)
    (out/"SHA256SUMS.txt").write_text("".join(hashlib.sha256(p.read_bytes()).hexdigest()+"  "+p.name+"\n" for p in sorted(out.iterdir()) if p.is_file() and p.name!="SHA256SUMS.txt"),encoding="ascii")
    print("Prepared",VERSION,"with",len(files),"source files; no APKs or keys")
if __name__=="__main__":main()
