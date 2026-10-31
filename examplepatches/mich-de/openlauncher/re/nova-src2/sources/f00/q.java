package f00;

import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import kotlin.Unit;
import kotlin.jvm.functions.Function6;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class q implements Function6 {

    /* renamed from: a, reason: collision with root package name */
    public static final q f53311a = new q();

    /* JADX WARN: Removed duplicated region for block: B:17:0x0073  */
    @Override // kotlin.jvm.functions.Function6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
        boolean z11;
        c0 c0Var = (c0) obj3;
        ((Number) obj4).intValue();
        ((Number) obj6).intValue();
        Ref.ObjectRef objectRef = new Ref.ObjectRef();
        objectRef.f71863a = (String) obj;
        Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
        objectRef2.f71863a = (String) obj2;
        p1.t tVar = (p1.t) ((p1.o) obj5);
        tVar.b0(859894428);
        PackageInfo packageInfo = c0Var.f53241d;
        if (packageInfo != null) {
            Signature[] signatureArr = packageInfo.signatures;
            if ((signatureArr != null ? signatureArr.length : 0) > 0) {
                Intrinsics.d(signatureArr);
                int length = signatureArr.length;
                for (int i5 = 0; i5 < length; i5++) {
                    Signature[] signatureArr2 = packageInfo.signatures;
                    Intrinsics.d(signatureArr2);
                    if ("3082035d30820245a003020102020428809937300d06092a864886f70d01010b0500305f310b3009060355040613025553310b300906035504081302494c3110300e060355040713074368696361676f311b3019060355040a13125465736c61436f696c20536f667477617265311430120603550403130b4b6576696e204261727279301e170d3137303631333036323230345a170d3432303630373036323230345a305f310b3009060355040613025553310b300906035504081302494c3110300e060355040713074368696361676f311b3019060355040a13125465736c61436f696c20536f667477617265311430120603550403130b4b6576696e20426172727930820122300d06092a864886f70d01010105000382010f003082010a02820101008399d5657cd6891b6a12c3dcea5b01c1b0fde824715467a21935f6ec1a2995a1ff44b40d15eefcaf8dcf4065eb83390cfc10321147d978d44b4ac42bf53c164eb6ebef0a30f6450b72997585081b32983a49c43872bed85688ae15f6464425ae4ad9c7c75886426d68366870c79edaea3aa598fb55e69fa805346a8ede9a82bda1a2db04acfcb963c72d74876c98ee440cb8331c47117e76e056056edd3b8e73b67d3b489fe1ac1803f29ef05f8242cb1302b6e55ef1ff4be200497939d292555ac09387269619842764a22d2b4faa465ef0117ab5f4a66a3f4683e8842001d48bdcdf9ac6a5c21a8074486a7cfac40d9d16dbb54c9e3d861717cd6de6b25cc10203010001a321301f301d0603551d0e0416041472c6629a0f94790a09ca684976f774a124756c45300d06092a864886f70d01010b05000382010100563cb6445e45e7c4c5aede35865f1cb587809f2d25e35c15612198d4fc9d20e00143d52c311528e2b4dd4d14dc794eeb03fd2b302d73be090378a98d1cfa14d90d223c0595259f39c78a4958c7533644b309ce58032afba60c29afe9775cf0feddf10e54629e82734f15d48d9ef6f9ce53bbd9111e53ffe5ffece384c374ef885dc7257a472894f011b865875f9fad106a42629388d89518d19e5f8823711fcb7cc43de043f5b8fead804d274b7fef572506bc539bbcd63bfcfeef0db0af09694059d593bdfe87117e6ac3c786c65dacdd5c4700f9da9579d4a2b7387252288842c51daba253e68456f81171958ed9907cfc4819551839728e03f23a0673abe3".equals(signatureArr2[i5].toCharsString())) {
                        objectRef2.f71863a = packageInfo.versionName + "\n" + objectRef2.f71863a;
                        z11 = true;
                        break;
                    }
                }
                z11 = false;
                if (!z11) {
                    objectRef2.f71863a = packageInfo.versionName + " (Unofficial)\n" + objectRef2.f71863a;
                }
            } else {
                z11 = false;
                if (!z11) {
                }
            }
        } else {
            objectRef.f71863a = x7.f.Y(tVar, 2132018043) + " " + objectRef.f71863a;
            objectRef2.f71863a = x7.f.Y(tVar, 2132018737);
        }
        tVar.p(false);
        b0.d(c0Var.f53246i.f83363b.getValue() == e10.f0.f51517c, x1.f.d(2034714158, new p(c0Var, objectRef, objectRef2), tVar), tVar, 48);
        return Unit.f71706a;
    }
}
