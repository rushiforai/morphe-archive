"""Build officially approved stable v2.0.5 MPP from verified dev.17 sources."""
import argparse,hashlib,importlib.util,os,sys
from pathlib import Path
from tempfile import TemporaryDirectory
VERSION = "2.0.5"
ROOT = Path(__file__).resolve().parent
DEVELOPMENT = ROOT.parent / "v2.0.5-dev.17"
sys.path.insert(0,str(DEVELOPMENT))
spec=importlib.util.spec_from_file_location("nicoid_approved_dev17_builder",DEVELOPMENT/"build_mpp.py")
builder=importlib.util.module_from_spec(spec)
sys.modules[spec.name]=builder
spec.loader.exec_module(builder)
def main():
    parser=argparse.ArgumentParser(description=__doc__)
    for key in ("base","tools","media","output"):parser.add_argument("--"+key,type=Path,required=True)
    parser.add_argument("--compile-jar",type=Path,action="append",default=[])
    args=parser.parse_args()
    if not (os.getenv("GITHUB_ACTIONS")=="true" and
            os.getenv("GITHUB_REF")=="refs/heads/main" and
            os.getenv("NICOID_OFFICIAL_RELEASE_APPROVED") in ("APPROVE","VERIFY")):
        parser.error("Official v2.0.5 restricted to approved main Actions")
    if len(args.compile_jar)<2:parser.error("Missing pinned compiler dependencies")
    if args.base.resolve()==args.output.resolve():parser.error("Do not overwrite stable base MPP")
    if hashlib.sha256(args.base.read_bytes()).hexdigest()!=builder.BASE_HASH:
        parser.error("v1.11.1 official MPP checksum mismatch")
    args.apk=None
    args.ci_without_apk=True
    args.official_release=True
    builder.VERSION=VERSION
    args.output.parent.mkdir(parents=True,exist_ok=True)
    with TemporaryDirectory(prefix="nicoid-approved-205-") as tmp:builder.build(args,Path(tmp))
    print("Created approved v2.0.5 MPP",args.output)
if __name__=="__main__":main()
