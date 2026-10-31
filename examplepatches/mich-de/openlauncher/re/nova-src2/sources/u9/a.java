package u9;

import java.util.ArrayList;
import sg.h0;

/* loaded from: classes.dex */
public class a extends h0 {

    /* renamed from: d, reason: collision with root package name */
    public boolean f90687d;

    public a(String str, boolean z11) {
        super(1, str, z11);
        this.f90687d = z11;
        ArrayList arrayList = b.f90688a;
        synchronized (arrayList) {
            arrayList.add(this);
        }
    }

    @Override // sg.h0
    public final StringBuilder a(StringBuilder sb2) {
        super.a(sb2);
        sb2.append(", mCurrentValue=");
        sb2.append(this.f90687d);
        return sb2;
    }

    @Override // sg.h0
    public final boolean b() {
        return this.f90687d;
    }
}
