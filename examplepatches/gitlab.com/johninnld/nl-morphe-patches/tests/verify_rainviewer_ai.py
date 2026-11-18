"""Execute the actual emitted forecast model constructor and AI dispatch guard."""
import argparse
from pathlib import Path
from verify_dumpert import Smali
from rtl_vm import Memory,Reference,parse,execute

MODEL="Lif2;"
SIG="<init>(Lbl7;Lri6;Ljava/util/TimeZone;Ljava/lang/String;Lf9;Lzw4;Luw4;Lhw4;Lsx5;Lvv2;Lgc2;Lic2;Ljava/lang/Long;Lfc2;ZZZZZZLf24;Lq97;ZLy6a;)V"


def verify(root:Path):
    smali=Smali(root)
    gone=Reference({},"Lpi6;")
    def call(method,args):
        assert method in ["Ljava/lang/Object;->getClass()Ljava/lang/Class;","Ljava/lang/Object;-><init>()V"],method
    for selected in ["Lpi6;","Lqi6;"]:
        model=Reference({},MODEL)
        inputs={"p"+str(i):Reference({},"Ljava/lang/Object;") for i in range(1,25)}
        inputs.update({"p"+str(i):0 for i in [15,16,17,18,19,20,23]})
        inputs.update({"p0":model,"p2":Reference({},selected)})
        header=inputs["p1"]
        execute(parse(smali.body(MODEL,SIG)),inputs,call,memory=Memory(statics={"Lpi6;->b:Lpi6;":gone}))
        assert model.value[MODEL+"->b:Lri6;"] is gone
        assert model.value[MODEL+"->a:Lbl7;"] is header,"Normal forecast model changed"
    def no_calls(method,args):raise AssertionError("AI request dispatched: "+method)
    assert execute(parse(smali.body("Lsh2;","f(Z)V")),{},no_calls,memory=Memory()) is None
    print("Forecast AI UI state hidden for initial/cached selection; dispatch stopped")


if __name__=="__main__":
    p=argparse.ArgumentParser();p.add_argument("decoded",type=Path);verify(p.parse_args().decoded)
