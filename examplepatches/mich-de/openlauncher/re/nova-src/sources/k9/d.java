package k9;

import android.opengl.GLES20;
import com.google.android.gms.internal.measurement.a0;

/* loaded from: classes2.dex */
public final class d extends a0 {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f71215c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d(String str, int i5) {
        super(str);
        this.f71215c = i5;
    }

    @Override // com.google.android.gms.internal.measurement.a0
    public final void c(int i5) {
        switch (this.f71215c) {
            case 0:
                this.f32362a = GLES20.glGetAttribLocation(i5, (String) this.f32363b);
                e.b();
                break;
            default:
                this.f32362a = GLES20.glGetUniformLocation(i5, (String) this.f32363b);
                e.b();
                break;
        }
    }
}
