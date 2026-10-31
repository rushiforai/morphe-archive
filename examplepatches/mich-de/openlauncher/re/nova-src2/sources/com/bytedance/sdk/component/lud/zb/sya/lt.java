package com.bytedance.sdk.component.lud.zb.sya;

import android.content.Context;
import android.graphics.Bitmap;
import android.widget.ImageView;
import com.bytedance.sdk.component.lud.htf;
import com.bytedance.sdk.component.lud.pmi;
import com.bytedance.sdk.component.lud.ry;
import com.bytedance.sdk.component.lud.thx;
import com.bytedance.sdk.component.lud.wie;
import java.io.File;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;

/* loaded from: classes2.dex */
public class lt {

    /* renamed from: dj, reason: collision with root package name */
    private volatile pmi f23976dj;
    private ExecutorService fby;

    /* renamed from: jw, reason: collision with root package name */
    private Context f23977jw;

    /* renamed from: lt, reason: collision with root package name */
    private com.bytedance.sdk.component.lud.dj f23978lt;
    private volatile wie sya;

    /* renamed from: ul, reason: collision with root package name */
    private ExecutorService f23979ul;

    /* renamed from: zb, reason: collision with root package name */
    private final ry f23980zb;
    private Map<String, List<sya>> ycx = new ConcurrentHashMap();
    private Map<String, com.bytedance.sdk.component.lud.sya> lud = new ConcurrentHashMap();

    public lt(Context context, ry ryVar) {
        this.f23980zb = (ry) ul.ycx(ryVar);
        this.f23977jw = context;
        com.bytedance.sdk.component.lud.zb.sya.ycx.zb.ycx(context, ryVar.lud());
    }

    private ExecutorService ea() {
        ExecutorService executorServiceYcx = this.f23980zb.ycx();
        return executorServiceYcx != null ? executorServiceYcx : com.bytedance.sdk.component.lud.zb.ycx.zb.ycx();
    }

    private com.bytedance.sdk.component.lud.dj jc() {
        com.bytedance.sdk.component.lud.dj djVarSya = this.f23980zb.sya();
        return djVarSya == null ? new com.bytedance.sdk.component.lud.ycx.ycx() : djVarSya;
    }

    public Collection<com.bytedance.sdk.component.lud.sya> dj() {
        return this.lud.values();
    }

    public ExecutorService fby() {
        ExecutorService executorServiceZb;
        htf htfVarZb = this.f23980zb.zb();
        if (htfVarZb != null && (executorServiceZb = htfVarZb.zb()) != null) {
            return executorServiceZb;
        }
        if (this.fby == null) {
            this.fby = com.bytedance.sdk.component.lud.zb.ycx.zb.ycx();
        }
        return this.fby;
    }

    public Map<String, List<sya>> jw() {
        return this.ycx;
    }

    public ExecutorService lt() {
        ExecutorService executorServiceYcx;
        htf htfVarZb = this.f23980zb.zb();
        if (htfVarZb != null && (executorServiceYcx = htfVarZb.ycx()) != null) {
            return executorServiceYcx;
        }
        if (this.f23979ul == null) {
            this.f23979ul = ea();
        }
        return this.f23979ul;
    }

    public com.bytedance.sdk.component.lud.dj lud() {
        if (this.f23978lt == null) {
            this.f23978lt = jc();
        }
        return this.f23978lt;
    }

    public pmi sya() {
        return this.f23976dj;
    }

    public thx ul() {
        ry ryVar = this.f23980zb;
        if (ryVar != null) {
            return ryVar.lt();
        }
        return null;
    }

    public Context ycx() {
        return this.f23977jw;
    }

    public boolean zb() {
        return this.f23980zb.ul();
    }

    private com.bytedance.sdk.component.lud.sya dj(com.bytedance.sdk.component.lud.zb zbVar) {
        com.bytedance.sdk.component.lud.sya syaVarDj = this.f23980zb.dj();
        return syaVarDj != null ? syaVarDj : new com.bytedance.sdk.component.lud.zb.sya.ycx.ycx.zb(zbVar.fby(), zbVar.ycx());
    }

    public com.bytedance.sdk.component.lud.sya sya(com.bytedance.sdk.component.lud.zb zbVar) {
        if (zbVar == null) {
            zbVar = com.bytedance.sdk.component.lud.zb.sya.ycx.zb.jw();
        }
        String string = zbVar.fby().toString();
        com.bytedance.sdk.component.lud.sya syaVar = this.lud.get(string);
        if (syaVar != null) {
            return syaVar;
        }
        com.bytedance.sdk.component.lud.sya syaVarDj = dj(zbVar);
        this.lud.put(string, syaVarDj);
        return syaVarDj;
    }

    public wie ycx(com.bytedance.sdk.component.lud.zb zbVar) {
        if (zbVar == null) {
            zbVar = com.bytedance.sdk.component.lud.zb.sya.ycx.zb.jw();
        }
        if (this.sya == null) {
            synchronized (com.bytedance.sdk.component.lud.zb.sya.ycx.zb.sya.class) {
                try {
                    if (this.sya == null) {
                        this.sya = new com.bytedance.sdk.component.lud.zb.sya.ycx.zb.sya(new com.bytedance.sdk.component.lud.zb.sya.ycx.zb.ycx(zbVar.zb(), zbVar.sya()));
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return this.sya;
    }

    public pmi zb(com.bytedance.sdk.component.lud.zb zbVar) {
        if (zbVar == null) {
            zbVar = com.bytedance.sdk.component.lud.zb.sya.ycx.zb.jw();
        }
        if (this.f23976dj == null) {
            synchronized (com.bytedance.sdk.component.lud.zb.sya.ycx.zb.zb.class) {
                try {
                    if (this.f23976dj == null) {
                        this.f23976dj = new com.bytedance.sdk.component.lud.zb.sya.ycx.zb.zb(zbVar.zb(), zbVar.dj());
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return this.f23976dj;
    }

    public com.bytedance.sdk.component.lud.sya ycx(String str) {
        return sya(com.bytedance.sdk.component.lud.zb.sya.ycx.zb.ycx(new File(str)));
    }

    public com.bytedance.sdk.component.lud.zb.sya.zb.zb ycx(sya syaVar) {
        ImageView.ScaleType scaleTypeJw = syaVar.jw();
        if (scaleTypeJw == null) {
            scaleTypeJw = com.bytedance.sdk.component.lud.zb.sya.zb.zb.ycx;
        }
        ImageView.ScaleType scaleType = scaleTypeJw;
        Bitmap.Config configJc = syaVar.jc();
        if (configJc == null) {
            configJc = com.bytedance.sdk.component.lud.zb.sya.zb.zb.f24042zb;
        }
        return new com.bytedance.sdk.component.lud.zb.sya.zb.zb(syaVar.zb(), syaVar.sya(), scaleType, configJc, syaVar.dj(), syaVar.lud());
    }
}
