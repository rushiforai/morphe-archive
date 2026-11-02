"""Exercise the emitted hidden map-warning control and disabled fetch condition."""
import argparse
from pathlib import Path
from verify_dumpert import Smali,canonicalize
from rtl_vm import Memory,Reference,parse,execute


def verify(root:Path,original:Path):
    smali,before=Smali(root),Smali(original)
    def call(method,args):
        if method=="Ln55;-><init>(Z)V":
            assert args[1]==0
            return
        assert method=="Ljd3;-><init>(ZZZLq55;Ljava/lang/Integer;)V",method
        assert args[1:4]==[0,0,0] and args[4].descriptor=="Ln55;" and args[5]==0
        args[0].value.update(visible=False,access=False,enabled=False)
    result=execute(parse(smali.body("Lpd3;","e(Lcom/lucky_apps/common/data/radarsmap/entity/MapLayer;)Ljd3;")),{},call,memory=Memory())
    assert result.value==dict(visible=False,access=False,enabled=False)
    def no_call(method,args):raise AssertionError("Warning dispatch read persisted settings: "+method)
    assert execute(parse(smali.body("Ldb;","c()Z")),{},no_call,memory=Memory())==0
    assert canonicalize(smali.body("Lxe2;","a(Lcom/lucky_apps/common/data/forecasts/entity/ForecastRequest;)Ljava/lang/String;"))==canonicalize(before.body("Lxe2;","a(Lcom/lucky_apps/common/data/forecasts/entity/ForecastRequest;)Ljava/lang/String;")),"Ordinary forecast alert request changed"
    print("Map warnings hidden and overlay dispatch disabled; ordinary forecast properties preserved")


if __name__=="__main__":
    p=argparse.ArgumentParser();p.add_argument("decoded",type=Path);p.add_argument("original",type=Path);a=p.parse_args();verify(a.decoded,a.original)
