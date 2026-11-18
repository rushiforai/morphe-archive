"""Check that local Pro only changes the client capability-tier input."""
import argparse,re
from pathlib import Path
from verify_dumpert import Smali,canonicalize
from rtl_vm import Memory, Reference, parse, execute


def verify(root:Path,original:Path):
    a,b=Smali(root),Smali(original)
    owner,sig="Leh5;","j(Lft0;Lhw7;Z)Ljava/lang/Object;"
    assert canonicalize(a.body(owner,sig))[:1]==["sget-object p2, Lhw7;->e:Lhw7;"],"Local Pro tier input not overridden"
    without_override=re.sub(r"^\s*sget-object p2, Lhw7;->e:Lhw7;\s*$", "", a.body(owner,sig),count=1,flags=re.M)
    assert canonicalize(without_override)==canonicalize(b.body(owner,sig)),"Original capability factory changed"
    # Purchasing, server entitlement acquisition and JSON status errors remain authentic.
    for cls in ["Ltw7;","Ler2;","Lcom/lucky_apps/rainviewer/common/user/worker/PremiumWorker;","Lcom/lucky_apps/data/purchase/entity/PurchaseObject;","Lsl;"]:
        for method in re.findall(r"^\.method[^\n]* (\S+\([^\n]+)",b.text(cls),re.M):
            assert canonicalize(a.body(cls,method))==canonicalize(b.body(cls,method)),"Server/billing behavior changed: "+cls+method
    verify_free_requests(a)
    print("Local Pro capability override and Free request limits verified; billing and response enforcement unchanged")


def verify_free_requests(smali):
    def no_calls(method,args):raise AssertionError("Frame cadence read Pro settings: "+method)
    assert execute(parse(smali.body("Lm04;","k()I")),{},no_calls,memory=Memory())==300
    assert execute(parse(smali.body("Lsh2;","f(Z)V")),{},no_calls,memory=Memory()) is None
    def constructor(method,args):
        assert method in ["Ljava/lang/Object;-><init>()V","Ljs2;-><init>(Ljava/lang/Object;I)V","Ln9;-><init>(Ljava/lang/Object;I)V","Lwb7;-><init>(Lvm2;)V"],method
    maps="Lcom/lucky_apps/data/radarsmap/entity/request/MapsRequest;"
    for values,expected in [
        ([3600,7200,300,1,86400,0],[3600,7200,300,1,86400,0]),
        ([172800,7200,120,1,259200,1],[21600,7200,300,1,86400,0]),
        ([0,0,600,0,0,1],[0,0,600,0,0,0]),
    ]:
        receiver=Reference({},maps)
        execute(parse(smali.body(maps,"<init>(IIIIIZ)V")),dict(p0=receiver,**{"p"+str(i+1):x for i,x in enumerate(values)}),constructor,memory=Memory())
        fields=["pastInterval:I","nowcastInterval:I","step:I","nwpLayers:I","nwpInterval:I","radarAccumulation:Z"]
        assert [receiver.value[maps+"->"+f] for f in fields]==expected,"Map request escaped Free limits"
    forecast="Lcom/lucky_apps/common/data/forecasts/entity/ForecastRequest;"
    for flags in range(8):
        receiver=Reference({},forecast)
        execute(parse(smali.body(forecast,"<init>(IDDZZZ)V")),{"p0":receiver,"p1":7,"p2":1.25,"p3":0,"p4":2.5,"p5":0,"p6":flags&1,"p7":(flags>>1)&1,"p8":(flags>>2)&1},constructor,memory=Memory())
        assert all(receiver.value[forecast+"->"+f+":Z"]==0 for f in ["moreDaysInCharts","expandedNowcast","aqi"]),"Forecast requested paid extensions"
        assert receiver.value[forecast+"->requestTag:I"]==7


if __name__=="__main__":
    p=argparse.ArgumentParser();p.add_argument("decoded",type=Path);p.add_argument("original",type=Path);v=p.parse_args();verify(v.decoded,v.original)
