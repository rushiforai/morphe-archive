package defpackage;

import com.medium.proto.model.PostDisplay;
import com.medium.proto.obv.post.DeltaType;
import gen.model.ImageMetadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e4e extends b1 {
    public final /* synthetic */ int e;
    public final z63 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e4e(DeltaType deltaType, z63 z63Var, int i) {
        super(deltaType, z63Var);
        this.e = i;
        deltaType.getClass();
        this.f = z63Var;
    }

    @Override // defpackage.b1
    public final z63 a(fb9 fb9Var) {
        int i = this.e;
        z63 z63Var = this.f;
        switch (i) {
            case 0:
                String str = fb9Var.build().caption;
                fb9Var.c = ((p63) z63Var).a;
                if (str != null) {
                    return new p63(str);
                }
                return null;
            case 1:
                ImageMetadata imageMetadata = fb9Var.build().image;
                fb9Var.d = ((q63) z63Var).a;
                if (imageMetadata != null) {
                    return new q63(imageMetadata);
                }
                return null;
            case 2:
                PostDisplay postDisplay = fb9Var.build().post_display;
                fb9Var.f = ((t63) z63Var).a;
                if (postDisplay != null) {
                    return new t63(postDisplay);
                }
                return null;
            case 3:
                String str2 = fb9Var.build().subtitle;
                fb9Var.b = ((x63) z63Var).a;
                if (str2 != null) {
                    return new x63(str2);
                }
                return null;
            default:
                String str3 = fb9Var.build().title;
                fb9Var.a = ((y63) z63Var).a;
                if (str3 != null) {
                    return new y63(str3);
                }
                return null;
        }
    }

    @Override // defpackage.b1
    public final int b() {
        return -1;
    }

    @Override // defpackage.b1
    public final b1 c(b1 b1Var) {
        if (this.a != b1Var.a) {
            return null;
        }
        f73 f73Var = g73.Companion;
        z63 z63Var = b1Var.b;
        f73Var.getClass();
        b1 b1VarA = f73.a(z63Var);
        if (b1VarA != null) {
            b1VarA.c = this.c;
        }
        return b1VarA;
    }
}
