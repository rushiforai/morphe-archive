package z80;

import ai.y0;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;
import m90.j0;

/* loaded from: classes5.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final String f98311a;

    /* renamed from: b, reason: collision with root package name */
    public final long[] f98312b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f98313c;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f98314d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f98315e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f98316f;

    /* renamed from: g, reason: collision with root package name */
    public y0 f98317g;

    /* renamed from: h, reason: collision with root package name */
    public int f98318h;

    /* renamed from: i, reason: collision with root package name */
    public long f98319i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ f f98320j;

    public d(f fVar, String key) {
        Intrinsics.g(key, "key");
        this.f98320j = fVar;
        this.f98311a = key;
        fVar.getClass();
        this.f98312b = new long[2];
        this.f98313c = new ArrayList();
        this.f98314d = new ArrayList();
        StringBuilder sb2 = new StringBuilder(key);
        sb2.append('.');
        int length = sb2.length();
        for (int i5 = 0; i5 < 2; i5++) {
            sb2.append(i5);
            this.f98313c.add(new File(this.f98320j.f98330a, sb2.toString()));
            sb2.append(".tmp");
            this.f98314d.add(new File(this.f98320j.f98330a, sb2.toString()));
            sb2.setLength(length);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v5, types: [z80.c] */
    public final e a() throws IOException {
        byte[] bArr = y80.c.f96853a;
        if (!this.f98315e) {
            return null;
        }
        f fVar = this.f98320j;
        if (!fVar.f98340k && (this.f98317g != null || this.f98316f)) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        long[] jArr = (long[]) this.f98312b.clone();
        for (int i5 = 0; i5 < 2; i5++) {
            try {
                File file = (File) this.f98313c.get(i5);
                Intrinsics.g(file, "file");
                m90.d dVarU = x7.f.U(file);
                if (!fVar.f98340k) {
                    this.f98318h++;
                    dVarU = new c(dVarU, fVar, this);
                }
                arrayList.add(dVarU);
            } catch (FileNotFoundException unused) {
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    y80.c.c((j0) it.next());
                }
                try {
                    fVar.A(this);
                    return null;
                } catch (IOException unused2) {
                    return null;
                }
            }
        }
        return new e(this.f98320j, this.f98311a, this.f98319i, arrayList, jArr);
    }
}
