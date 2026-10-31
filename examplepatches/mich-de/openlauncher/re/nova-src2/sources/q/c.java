package q;

import ai.w2;
import android.app.Application;
import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.util.SparseArray;
import android.view.KeyEvent;
import android.view.MenuItem;
import androidx.appcompat.widget.ActionMenuView;
import androidx.appcompat.widget.Toolbar;
import bn.s0;
import com.amplitude.android.migration.DatabaseConstants;
import com.google.android.exoplayer2.ParserException;
import com.google.android.gms.internal.consent_sdk.k0;
import com.google.android.gms.internal.measurement.le;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.drawer.drawergroups.DialogAddDrawerGroupFragment;
import cw.y1;
import e10.a3;
import e10.y2;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.util.Arrays;
import java.util.HashMap;
import java.util.UUID;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.Unit;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import mx.g0;
import org.json.JSONException;
import org.json.JSONObject;
import ps.i0;
import r.g2;
import r.o0;
import sp.j0;
import sp.m0;
import sp.r0;
import t0.c1;
import t0.p0;
import t0.q0;
import uy.d0;
import w70.u1;

/* loaded from: classes2.dex */
public class c implements i, o0, r30.b, mb0.e, sg.b, sp.a, fi.f {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f83188a;

    /* renamed from: b, reason: collision with root package name */
    public Object f83189b;

    public /* synthetic */ c(int i5, boolean z11) {
        this.f83188a = i5;
    }

    public static String A(SQLiteDatabase sQLiteDatabase) throws Throwable {
        String[] strArr;
        Cursor cursorQuery;
        Cursor cursor = null;
        try {
            try {
                strArr = new String[]{String.valueOf(s(sQLiteDatabase))};
                cursorQuery = sQLiteDatabase.query(DatabaseConstants.EVENT_TABLE_NAME, new String[]{"value"}, "_id = ?", strArr, null, null, null);
            } catch (SQLException e3) {
                e = e3;
            }
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            cursorQuery.moveToFirst();
            if (cursorQuery.getCount() == 0) {
                cursorQuery.close();
                return null;
            }
            String string = cursorQuery.getString(cursorQuery.getColumnIndex("value"));
            sQLiteDatabase.delete(DatabaseConstants.EVENT_TABLE_NAME, "_id = ?", strArr);
            int i5 = j0.f87597b;
            cursorQuery.close();
            return string;
        } catch (SQLException e11) {
            e = e11;
            cursor = cursorQuery;
            m0.a("fe70");
            throw new IOException(e);
        } catch (Throwable th3) {
            th = th3;
            cursor = cursorQuery;
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    public static c l(Bitmap bitmap) {
        int i5 = r30.a.f85474a;
        y2 y2Var = y2.f51877a;
        Context context = g0.f77088a;
        int iA = r30.a.a(y2Var.D0(g0.e().getResources()), a3.f51435a.n.f77362d);
        if (bitmap.getWidth() > iA && bitmap.getHeight() > iA) {
            float fMin = iA / Math.min(bitmap.getWidth(), bitmap.getHeight());
            bitmap = Bitmap.createScaledBitmap(bitmap, x7.f.O(bitmap.getWidth() * fMin), x7.f.O(fMin * bitmap.getHeight()), true);
        }
        return new c(new aa.n(bitmap, 0, false), 12);
    }

    public static long q(SQLiteDatabase sQLiteDatabase) {
        Cursor cursorRawQuery = null;
        try {
            try {
                cursorRawQuery = sQLiteDatabase.rawQuery("SELECT COUNT(_id) FROM events", null);
                cursorRawQuery.moveToFirst();
                long j11 = cursorRawQuery.getLong(0);
                int i5 = j0.f87597b;
                cursorRawQuery.close();
                return j11;
            } catch (SQLException e3) {
                m0.a("fe58");
                throw new IOException(e3);
            }
        } catch (Throwable th2) {
            if (cursorRawQuery != null) {
                cursorRawQuery.close();
            }
            throw th2;
        }
    }

    public static long s(SQLiteDatabase sQLiteDatabase) {
        Cursor cursorRawQuery = null;
        try {
            try {
                cursorRawQuery = sQLiteDatabase.rawQuery("SELECT MIN(_id) FROM events", null);
                cursorRawQuery.moveToFirst();
                long j11 = cursorRawQuery.getLong(0);
                int i5 = j0.f87597b;
                cursorRawQuery.close();
                return j11;
            } catch (SQLException e3) {
                m0.a("fe57");
                throw new IOException(e3);
            }
        } catch (Throwable th2) {
            if (cursorRawQuery != null) {
                cursorRawQuery.close();
            }
            throw th2;
        }
    }

    private final void x(k kVar) {
    }

    public void B(sd.u uVar) {
        this.f83189b = uVar;
    }

    @Override // q.i
    public boolean a(k kVar, MenuItem menuItem) {
        boolean zOnMenuItemSelected;
        NovaLauncher novaLauncher;
        switch (this.f83188a) {
            case 7:
                g2 g2Var = ((ActionMenuView) this.f83189b).A;
                if (g2Var == null) {
                    return false;
                }
                Toolbar toolbar = g2Var.f84721a;
                if (toolbar.G.a(menuItem)) {
                    zOnMenuItemSelected = true;
                } else {
                    m.m0 m0Var = toolbar.I;
                    zOnMenuItemSelected = m0Var != null ? m0Var.f75309a.f75311b.onMenuItemSelected(0, menuItem) : false;
                }
                return zOnMenuItemSelected;
            default:
                k30.e eVar = (k30.e) ((s0) this.f83189b).f18283f;
                if (eVar != null) {
                    DialogAddDrawerGroupFragment dialogAddDrawerGroupFragment = (DialogAddDrawerGroupFragment) ((com.google.android.material.datepicker.n) eVar.f70933b).f34264b;
                    if (menuItem.getItemId() == 2131428350) {
                        d0 d0Var = d0.f91699e;
                        if (d0Var.j(false).size() <= 1) {
                            k0.x(dialogAddDrawerGroupFragment.getActivity(), "You must have at least one tab", 0).show();
                        } else {
                            d0Var.d(dialogAddDrawerGroupFragment.getActivity().getContentResolver(), dialogAddDrawerGroupFragment.f45734a);
                        }
                        dialogAddDrawerGroupFragment.f45738e.dismiss();
                    } else if (menuItem.getItemId() == 2131428352) {
                        i0.q(dialogAddDrawerGroupFragment.getActivity(), dialogAddDrawerGroupFragment.f45734a, !r1.d());
                        if ((dialogAddDrawerGroupFragment.f45734a instanceof uy.m) && (novaLauncher = NovaLauncher.f45649u1) != null) {
                            novaLauncher.V.p(true);
                        }
                        dialogAddDrawerGroupFragment.f45738e.dismiss();
                    }
                }
                return false;
        }
    }

    @Override // mb0.e
    public Object b(Object obj) {
        pb0.g gVar;
        switch (this.f83188a) {
            case 15:
                mb0.a aVar = (mb0.a) obj;
                pb0.f fVar = (pb0.f) ((pb0.h) this.f83189b).f82520f.get();
                int i5 = fVar.f82514a;
                if (i5 == 0) {
                    gVar = pb0.h.f82518h;
                } else {
                    pb0.g[] gVarArr = fVar.f82515b;
                    long j11 = fVar.f82516c;
                    fVar.f82516c = 1 + j11;
                    gVar = gVarArr[(int) (j11 % i5)];
                }
                return gVar.e(aVar, -1L, TimeUnit.NANOSECONDS);
            default:
                ib0.g gVarQ = ((vh.a) this.f83189b).q();
                gVarQ.c(new nb0.s((mb0.a) obj, gVarQ));
                return gVarQ;
        }
    }

    @Override // q.i
    public void c(k kVar) {
        switch (this.f83188a) {
            case 7:
                i iVar = ((ActionMenuView) this.f83189b).f13748v;
                if (iVar != null) {
                    iVar.c(kVar);
                    break;
                }
                break;
        }
    }

    @Override // r.o0
    public void d(int i5) {
    }

    @Override // r30.b
    public Drawable e(Context context) {
        switch (this.f83188a) {
            case 12:
                return (aa.n) this.f83189b;
            default:
                return ((Icon) this.f83189b).loadDrawable(context);
        }
    }

    @Override // r.o0
    public void f(int i5, float f11) {
    }

    @Override // r.o0
    public void g(int i5) {
    }

    public Object h(ContinuationImpl continuationImpl) {
        w70.g2 g2Var = (w70.g2) this.f83189b;
        Object value = g2Var.getValue();
        return value == null ? u1.o(new y1(g2Var, 10), continuationImpl) : value;
    }

    @Override // fi.f
    public void i(Exception exc) {
        int i5 = r0.f87655b;
        r0.c(exc);
        r0.f87654a = -1.0d;
        ((LinkedBlockingQueue) this.f83189b).offer(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void j(int i5, int i11, ke.k kVar) throws ParserException {
        int i12;
        int i13;
        int i14;
        long j11;
        int i15;
        int i16;
        int i17;
        int i18;
        qe.d dVar = (qe.d) this.f83189b;
        qe.e eVar = dVar.f83963b;
        SparseArray sparseArray = dVar.f83965c;
        com.google.android.gms.internal.consent_sdk.a aVar = dVar.f83971i;
        com.google.android.gms.internal.consent_sdk.a aVar2 = dVar.f83969g;
        int i19 = 1;
        int i21 = 0;
        if (i5 != 161 && i5 != 163) {
            if (i5 == 165) {
                if (dVar.G != 2) {
                    return;
                }
                qe.c cVar = (qe.c) sparseArray.get(dVar.M);
                int i22 = dVar.P;
                com.google.android.gms.internal.consent_sdk.a aVar3 = dVar.n;
                if (i22 != 4 || !"V_VP9".equals(cVar.f83932b)) {
                    kVar.m(i11);
                    return;
                } else {
                    aVar3.U(i11);
                    kVar.readFully((byte[]) aVar3.f31986d, 0, i11);
                    return;
                }
            }
            if (i5 == 16877) {
                dVar.e(i5);
                qe.c cVar2 = dVar.f83981u;
                int i23 = cVar2.f83937g;
                if (i23 != 1685485123 && i23 != 1685480259) {
                    kVar.m(i11);
                    return;
                }
                byte[] bArr = new byte[i11];
                cVar2.N = bArr;
                kVar.readFully(bArr, 0, i11);
                return;
            }
            if (i5 == 16981) {
                dVar.e(i5);
                byte[] bArr2 = new byte[i11];
                dVar.f83981u.f83939i = bArr2;
                kVar.readFully(bArr2, 0, i11);
                return;
            }
            if (i5 == 18402) {
                byte[] bArr3 = new byte[i11];
                kVar.readFully(bArr3, 0, i11);
                dVar.e(i5);
                dVar.f83981u.f83940j = new ke.u(1, 0, 0, bArr3);
                return;
            }
            if (i5 == 21419) {
                Arrays.fill((byte[]) aVar.f31986d, (byte) 0);
                kVar.readFully((byte[]) aVar.f31986d, 4 - i11, i11);
                aVar.Y(0);
                dVar.f83983w = (int) aVar.O();
                return;
            }
            if (i5 == 25506) {
                dVar.e(i5);
                byte[] bArr4 = new byte[i11];
                dVar.f83981u.f83941k = bArr4;
                kVar.readFully(bArr4, 0, i11);
                return;
            }
            if (i5 != 30322) {
                throw ParserException.a("Unexpected id: " + i5, null);
            }
            dVar.e(i5);
            byte[] bArr5 = new byte[i11];
            dVar.f83981u.f83950v = bArr5;
            kVar.readFully(bArr5, 0, i11);
            return;
        }
        if (dVar.G == 0) {
            dVar.M = (int) eVar.b(kVar, false, true, 8);
            dVar.N = eVar.f83990c;
            dVar.I = -9223372036854775807L;
            dVar.G = 1;
            aVar2.U(0);
        }
        qe.c cVar3 = (qe.c) sparseArray.get(dVar.M);
        if (cVar3 == null) {
            kVar.m(i11 - dVar.N);
            dVar.G = 0;
            return;
        }
        cVar3.X.getClass();
        if (dVar.G == 1) {
            dVar.i(kVar, 3);
            int i24 = (((byte[]) aVar2.f31986d)[2] & 6) >> 1;
            int i25 = 255;
            if (i24 == 0) {
                dVar.K = 1;
                int[] iArr = dVar.L;
                if (iArr == null) {
                    iArr = new int[1];
                } else if (iArr.length < 1) {
                    iArr = new int[Math.max(iArr.length * 2, 1)];
                }
                dVar.L = iArr;
                iArr[0] = (i11 - dVar.N) - 3;
            } else {
                dVar.i(kVar, 4);
                int i26 = (((byte[]) aVar2.f31986d)[3] & 255) + 1;
                dVar.K = i26;
                int[] iArr2 = dVar.L;
                if (iArr2 == null) {
                    iArr2 = new int[i26];
                } else if (iArr2.length < i26) {
                    iArr2 = new int[Math.max(iArr2.length * 2, i26)];
                }
                dVar.L = iArr2;
                if (i24 == 2) {
                    int i27 = (i11 - dVar.N) - 4;
                    int i28 = dVar.K;
                    Arrays.fill(iArr2, 0, i28, i27 / i28);
                } else {
                    if (i24 != 1) {
                        if (i24 != 3) {
                            throw ParserException.a("Unexpected lacing value: " + i24, null);
                        }
                        int i29 = 0;
                        int i31 = 0;
                        int i32 = 4;
                        while (true) {
                            int i33 = dVar.K - i19;
                            if (i29 >= i33) {
                                i12 = i19;
                                i13 = i21;
                                dVar.L[i33] = ((i11 - dVar.N) - i32) - i31;
                                break;
                            }
                            dVar.L[i29] = i21;
                            int i34 = i32 + 1;
                            dVar.i(kVar, i34);
                            if (((byte[]) aVar2.f31986d)[i32] == 0) {
                                throw ParserException.a("No valid varint length mask found", null);
                            }
                            int i35 = i19;
                            int i36 = i21;
                            while (true) {
                                if (i36 >= 8) {
                                    i14 = i21;
                                    j11 = 0;
                                    i15 = i34;
                                    break;
                                }
                                int i37 = i35 << (7 - i36);
                                i14 = i21;
                                if ((((byte[]) aVar2.f31986d)[i32] & i37) != 0) {
                                    i15 = i34 + i36;
                                    dVar.i(kVar, i15);
                                    j11 = ((byte[]) aVar2.f31986d)[i32] & i25 & (~i37);
                                    while (i34 < i15) {
                                        j11 = (j11 << 8) | (((byte[]) aVar2.f31986d)[i34] & i25);
                                        i34++;
                                        i25 = 255;
                                    }
                                    if (i29 > 0) {
                                        j11 -= (1 << ((i36 * 7) + 6)) - 1;
                                    }
                                } else {
                                    i36++;
                                    i21 = i14;
                                    i25 = 255;
                                }
                            }
                            if (j11 < -2147483648L || j11 > 2147483647L) {
                                break;
                            }
                            int i38 = (int) j11;
                            int[] iArr3 = dVar.L;
                            if (i29 != 0) {
                                i38 += iArr3[i29 - 1];
                            }
                            iArr3[i29] = i38;
                            i31 += i38;
                            i29++;
                            i32 = i15;
                            i19 = i35;
                            i21 = i14;
                            i25 = 255;
                        }
                        throw ParserException.a("EBML lacing sample size out of range.", null);
                    }
                    int i39 = 0;
                    int i40 = 0;
                    int i41 = 4;
                    while (true) {
                        i16 = dVar.K - 1;
                        if (i39 >= i16) {
                            break;
                        }
                        dVar.L[i39] = 0;
                        while (true) {
                            i17 = i41 + 1;
                            dVar.i(kVar, i17);
                            int i42 = ((byte[]) aVar2.f31986d)[i41] & 255;
                            int[] iArr4 = dVar.L;
                            i18 = iArr4[i39] + i42;
                            iArr4[i39] = i18;
                            if (i42 != 255) {
                                break;
                            } else {
                                i41 = i17;
                            }
                        }
                        i40 += i18;
                        i39++;
                        i41 = i17;
                    }
                    dVar.L[i16] = ((i11 - dVar.N) - i41) - i40;
                }
            }
            i12 = 1;
            i13 = 0;
            byte[] bArr6 = (byte[]) aVar2.f31986d;
            dVar.H = dVar.k((bArr6[i12] & 255) | (bArr6[i13] << 8)) + dVar.B;
            dVar.O = (cVar3.f83934d == 2 || (i5 == 163 && (((byte[]) aVar2.f31986d)[2] & 128) == 128)) ? i12 : i13;
            dVar.G = 2;
            dVar.J = i13;
        } else {
            i12 = 1;
        }
        if (i5 == 163) {
            while (true) {
                int i43 = dVar.J;
                if (i43 >= dVar.K) {
                    dVar.G = 0;
                    return;
                } else {
                    dVar.f(cVar3, ((dVar.J * cVar3.f83935e) / 1000) + dVar.H, dVar.O, dVar.l(kVar, cVar3, dVar.L[i43], false), 0);
                    dVar.J++;
                }
            }
        } else {
            while (true) {
                int i44 = dVar.J;
                if (i44 >= dVar.K) {
                    return;
                }
                int[] iArr5 = dVar.L;
                boolean z11 = i12;
                iArr5[i44] = dVar.l(kVar, cVar3, iArr5[i44], z11);
                dVar.J += z11 ? 1 : 0;
            }
        }
    }

    public sd.v k() {
        return new sd.v((sd.u) this.f83189b);
    }

    public int m() {
        return ((AtomicInteger) this.f83189b).decrementAndGet();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // sp.a
    public boolean n(m0 m0Var, int i5, String str) {
        String str2;
        sp.j jVar = (sp.j) this.f83189b;
        if (i5 != 200) {
            m0.a("e106");
            return false;
        }
        try {
            JSONObject jSONObject = new JSONObject(str);
            if (!jSONObject.optString("status", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b).equalsIgnoreCase("ok")) {
                m0.a("e107");
                return false;
            }
            if (jVar.containsKey("k") && ((String) jVar.get("k")).equalsIgnoreCase("SDID") && !sp.s.c().a(m0Var.f87616a)) {
                sp.s sVarC = sp.s.c();
                Application application = m0Var.f87616a;
                sVarC.getClass();
                sp.s sVar = sp.s.f87658e;
                try {
                    sVarC.f87662d = true;
                    SharedPreferences.Editor editorEdit = application.getSharedPreferences("singular-pref-session", 0).edit();
                    editorEdit.putBoolean("DID_SEND_START_SESSION_WITH_SDID", sVarC.f87662d);
                    editorEdit.commit();
                } catch (Throwable unused) {
                }
            }
            String strOptString = jSONObject.optString("ddl", null);
            String strOptString2 = jSONObject.optString("deferred_passthrough", null);
            int i11 = r0.f87655b;
            m0.f87615q.f87619d.getClass();
            if (!r0.l(strOptString) || !r0.l(strOptString2)) {
                m0Var.f87619d.getClass();
                int i12 = sp.j.f87595c;
            }
            String strOptString3 = jSONObject.optString("resolved_singular_link", null);
            if (!r0.l(strOptString3) && (str2 = (String) jVar.get("singular_link_resolve_required")) != null && Boolean.parseBoolean(str2)) {
                double dP = r0.p(jVar.e());
                m0.f87615q.f87619d.getClass();
                if (dP < 0) {
                    r0.i(Uri.parse(strOptString3));
                }
            }
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("attribution_info");
            if (jSONObjectOptJSONObject != null) {
                m0Var.getClass();
                try {
                    int i13 = wp.a.f94629a;
                    HashMap map = new HashMap();
                    if (jSONObjectOptJSONObject != JSONObject.NULL) {
                        map = wp.a.b(jSONObjectOptJSONObject);
                    }
                    map.toString();
                    m0Var.f87619d.getClass();
                } catch (Throwable th2) {
                    th2.getMessage();
                    m0.a("e99");
                }
            }
            String str3 = (String) jVar.get("u");
            if (!r0.l(str3) && !m0Var.f87616a.getSharedPreferences("singular-licensing-api", 0).getBoolean(str3, false)) {
                SharedPreferences.Editor editorEdit2 = m0Var.f87616a.getSharedPreferences("singular-licensing-api", 0).edit();
                editorEdit2.putBoolean(str3, true);
                editorEdit2.commit();
                int i14 = sp.j.f87595c;
                new Thread(new ab.y(22, this, m0Var, str3)).start();
            }
            return true;
        } catch (JSONException unused2) {
            int i15 = sp.j.f87595c;
            m0.a("e108");
            m0.a("e109");
            return false;
        }
    }

    public int o() {
        return ((AtomicInteger) this.f83189b).get();
    }

    @Override // sg.b
    public void onConnected() {
        ((qg.g) this.f83189b).onConnected();
    }

    @Override // sg.b
    public void onConnectionSuspended(int i5) {
        ((qg.g) this.f83189b).onConnectionSuspended(i5);
    }

    public FileChannel p() throws IOException {
        switch (this.f83188a) {
            case 2:
                return new FileInputStream((File) this.f83189b).getChannel();
            default:
                ParcelFileDescriptor parcelFileDescriptor = (ParcelFileDescriptor) this.f83189b;
                if (parcelFileDescriptor.getStatSize() != -1) {
                    return new ParcelFileDescriptor.AutoCloseInputStream(parcelFileDescriptor).getChannel();
                }
                parcelFileDescriptor.close();
                throw new IllegalArgumentException("Not a file: ".concat(String.valueOf(parcelFileDescriptor)));
        }
    }

    public String r() throws Throwable {
        SQLiteDatabase readableDatabase;
        Cursor cursorQuery;
        Cursor cursor = null;
        String string = null;
        cursor = null;
        cursor = null;
        cursor = null;
        try {
            readableDatabase = ((sp.i0) this.f83189b).getReadableDatabase();
            try {
                try {
                    cursorQuery = readableDatabase.query(DatabaseConstants.EVENT_TABLE_NAME, new String[]{"value"}, "_id = ?", new String[]{String.valueOf(s(readableDatabase))}, null, null, null);
                } catch (SQLException e3) {
                    e = e3;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (SQLException e11) {
            e = e11;
            readableDatabase = null;
        } catch (Throwable th3) {
            th = th3;
            readableDatabase = null;
        }
        try {
            cursorQuery.moveToFirst();
            if (cursorQuery.getCount() != 0) {
                string = cursorQuery.getString(0);
            }
            int i5 = j0.f87597b;
            cursorQuery.close();
            readableDatabase.close();
            return string;
        } catch (SQLException e12) {
            e = e12;
            cursor = cursorQuery;
            m0.a("fe65");
            throw new IOException(e);
        } catch (Throwable th4) {
            th = th4;
            cursor = cursorQuery;
            if (cursor != null) {
                cursor.close();
            }
            if (readableDatabase != null) {
                readableDatabase.close();
            }
            throw th;
        }
    }

    public void t(int i5, String str, String str2) {
        new Thread(new w2(i5, 7, this, str, str2)).start();
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x004a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public long u(String str) throws Throwable {
        SQLiteDatabase writableDatabase;
        Throwable th2;
        SQLException e3;
        ContentValues contentValues = new ContentValues();
        contentValues.put("value", str);
        try {
            writableDatabase = ((sp.i0) this.f83189b).getWritableDatabase();
            try {
                try {
                    long jInsert = writableDatabase.insert(DatabaseConstants.EVENT_TABLE_NAME, null, contentValues);
                    int i5 = j0.f87597b;
                    if (q(writableDatabase) > com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c) {
                        m0.a("e55");
                        A(writableDatabase);
                    }
                    writableDatabase.close();
                    return jInsert;
                } catch (SQLException e11) {
                    e3 = e11;
                    m0.a("fe55");
                    throw new IOException(e3);
                }
            } catch (Throwable th3) {
                th2 = th3;
                if (writableDatabase != null) {
                    writableDatabase.close();
                }
                throw th2;
            }
        } catch (SQLException e12) {
            writableDatabase = null;
            e3 = e12;
        } catch (Throwable th4) {
            writableDatabase = null;
            th2 = th4;
            if (writableDatabase != null) {
            }
            throw th2;
        }
    }

    public void v(int i5, long j11) throws ParserException {
        qe.d dVar = (qe.d) this.f83189b;
        if (i5 == 20529) {
            if (j11 == 0) {
                return;
            }
            throw ParserException.a("ContentEncodingOrder " + j11 + " not supported", null);
        }
        if (i5 == 20530) {
            if (j11 == 1) {
                return;
            }
            throw ParserException.a("ContentEncodingScope " + j11 + " not supported", null);
        }
        int i11 = 3;
        switch (i5) {
            case MRAID_JS_WRITE_FAILED_VALUE:
                dVar.e(i5);
                dVar.f83981u.f83934d = (int) j11;
                return;
            case PRIVACY_URL_ERROR_VALUE:
                dVar.e(i5);
                dVar.f83981u.V = j11 == 1;
                return;
            case 155:
                dVar.I = dVar.k(j11);
                return;
            case 159:
                dVar.e(i5);
                dVar.f83981u.O = (int) j11;
                return;
            case 176:
                dVar.e(i5);
                dVar.f83981u.f83943m = (int) j11;
                return;
            case 179:
                dVar.d(i5);
                dVar.C.a(dVar.k(j11));
                return;
            case 186:
                dVar.e(i5);
                dVar.f83981u.n = (int) j11;
                return;
            case AD_RESPONSE_EMPTY_VALUE:
                dVar.e(i5);
                dVar.f83981u.f83933c = (int) j11;
                return;
            case 231:
                dVar.B = dVar.k(j11);
                return;
            case 238:
                dVar.P = (int) j11;
                return;
            case 241:
                if (dVar.E) {
                    return;
                }
                dVar.d(i5);
                dVar.D.a(j11);
                dVar.E = true;
                return;
            case 251:
                dVar.Q = true;
                return;
            case 16871:
                dVar.e(i5);
                dVar.f83981u.f83937g = (int) j11;
                return;
            case 16980:
                if (j11 == 3) {
                    return;
                }
                throw ParserException.a("ContentCompAlgo " + j11 + " not supported", null);
            case 17029:
                if (j11 < 1 || j11 > 2) {
                    throw ParserException.a("DocTypeReadVersion " + j11 + " not supported", null);
                }
                return;
            case 17143:
                if (j11 == 1) {
                    return;
                }
                throw ParserException.a("EBMLReadVersion " + j11 + " not supported", null);
            case 18401:
                if (j11 == 5) {
                    return;
                }
                throw ParserException.a("ContentEncAlgo " + j11 + " not supported", null);
            case 18408:
                if (j11 == 1) {
                    return;
                }
                throw ParserException.a("AESSettingsCipherMode " + j11 + " not supported", null);
            case 21420:
                dVar.f83984x = j11 + dVar.f83977q;
                return;
            case 21432:
                int i12 = (int) j11;
                dVar.e(i5);
                if (i12 == 0) {
                    dVar.f83981u.f83951w = 0;
                    return;
                }
                if (i12 == 1) {
                    dVar.f83981u.f83951w = 2;
                    return;
                } else if (i12 == 3) {
                    dVar.f83981u.f83951w = 1;
                    return;
                } else {
                    if (i12 != 15) {
                        return;
                    }
                    dVar.f83981u.f83951w = 3;
                    return;
                }
            case 21680:
                dVar.e(i5);
                dVar.f83981u.o = (int) j11;
                return;
            case 21682:
                dVar.e(i5);
                dVar.f83981u.f83945q = (int) j11;
                return;
            case 21690:
                dVar.e(i5);
                dVar.f83981u.f83944p = (int) j11;
                return;
            case 21930:
                dVar.e(i5);
                dVar.f83981u.U = j11 == 1;
                return;
            case 21998:
                dVar.e(i5);
                dVar.f83981u.f83936f = (int) j11;
                return;
            case 22186:
                dVar.e(i5);
                dVar.f83981u.R = j11;
                return;
            case 22203:
                dVar.e(i5);
                dVar.f83981u.S = j11;
                return;
            case 25188:
                dVar.e(i5);
                dVar.f83981u.P = (int) j11;
                return;
            case 30114:
                dVar.R = j11;
                return;
            case 30321:
                dVar.e(i5);
                int i13 = (int) j11;
                if (i13 == 0) {
                    dVar.f83981u.f83946r = 0;
                    return;
                }
                if (i13 == 1) {
                    dVar.f83981u.f83946r = 1;
                    return;
                } else if (i13 == 2) {
                    dVar.f83981u.f83946r = 2;
                    return;
                } else {
                    if (i13 != 3) {
                        return;
                    }
                    dVar.f83981u.f83946r = 3;
                    return;
                }
            case 2352003:
                dVar.e(i5);
                dVar.f83981u.f83935e = (int) j11;
                return;
            case 2807729:
                dVar.f83978r = j11;
                return;
            default:
                switch (i5) {
                    case 21945:
                        dVar.e(i5);
                        int i14 = (int) j11;
                        if (i14 == 1) {
                            dVar.f83981u.A = 2;
                            return;
                        } else {
                            if (i14 != 2) {
                                return;
                            }
                            dVar.f83981u.A = 1;
                            return;
                        }
                    case 21946:
                        dVar.e(i5);
                        int i15 = (int) j11;
                        if (i15 != 1) {
                            if (i15 == 16) {
                                i11 = 6;
                            } else if (i15 == 18) {
                                i11 = 7;
                            } else if (i15 != 6 && i15 != 7) {
                                i11 = -1;
                            }
                        }
                        if (i11 != -1) {
                            dVar.f83981u.f83954z = i11;
                            return;
                        }
                        return;
                    case 21947:
                        dVar.e(i5);
                        dVar.f83981u.f83952x = true;
                        int iA = xf.a.a((int) j11);
                        if (iA != -1) {
                            dVar.f83981u.f83953y = iA;
                            return;
                        }
                        return;
                    case 21948:
                        dVar.e(i5);
                        dVar.f83981u.B = (int) j11;
                        return;
                    case 21949:
                        dVar.e(i5);
                        dVar.f83981u.C = (int) j11;
                        return;
                    default:
                        return;
                }
        }
    }

    public t0.o0 w(KeyEvent keyEvent) {
        t0.o0 o0Var = null;
        if (keyEvent.isShiftPressed() && keyEvent.isCtrlPressed()) {
            long jE = p50.i.e(keyEvent.getKeyCode());
            if (t2.a.a(jE, c1.f87940i)) {
                o0Var = t0.o0.K;
            } else if (t2.a.a(jE, c1.f87941j)) {
                o0Var = t0.o0.L;
            } else if (t2.a.a(jE, c1.f87942k)) {
                o0Var = t0.o0.N;
            } else if (t2.a.a(jE, c1.f87943l)) {
                o0Var = t0.o0.M;
            }
        } else if (keyEvent.isCtrlPressed()) {
            long jE2 = p50.i.e(keyEvent.getKeyCode());
            if (t2.a.a(jE2, c1.f87940i)) {
                o0Var = t0.o0.f88134e;
            } else if (t2.a.a(jE2, c1.f87941j)) {
                o0Var = t0.o0.f88133d;
            } else if (t2.a.a(jE2, c1.f87942k)) {
                o0Var = t0.o0.f88136g;
            } else if (t2.a.a(jE2, c1.f87943l)) {
                o0Var = t0.o0.f88135f;
            } else if (t2.a.a(jE2, c1.f87934c)) {
                o0Var = t0.o0.f88149v;
            } else if (t2.a.a(jE2, c1.f87951v)) {
                o0Var = t0.o0.f88152y;
            } else if (t2.a.a(jE2, c1.f87950u)) {
                o0Var = t0.o0.f88151x;
            } else if (t2.a.a(jE2, c1.f87939h)) {
                o0Var = t0.o0.S;
            }
        } else if (keyEvent.isShiftPressed()) {
            long jE3 = p50.i.e(keyEvent.getKeyCode());
            if (t2.a.a(jE3, c1.f87945p)) {
                o0Var = t0.o0.O;
            } else if (t2.a.a(jE3, c1.f87946q)) {
                o0Var = t0.o0.P;
            }
        } else if (keyEvent.isAltPressed()) {
            long jE4 = p50.i.e(keyEvent.getKeyCode());
            if (t2.a.a(jE4, c1.f87950u)) {
                o0Var = t0.o0.f88153z;
            } else if (t2.a.a(jE4, c1.f87951v)) {
                o0Var = t0.o0.A;
            }
        }
        if (o0Var != null) {
            return o0Var;
        }
        ((p0) this.f83189b).getClass();
        q0 q0Var = q0.f88175d;
        if (((Boolean) q0Var.invoke(new t2.b(keyEvent))).booleanValue() && keyEvent.isShiftPressed()) {
            if (t2.a.a(p50.i.e(keyEvent.getKeyCode()), c1.f87938g)) {
                return t0.o0.W;
            }
        } else if (((Boolean) q0Var.invoke(new t2.b(keyEvent))).booleanValue()) {
            long jE5 = p50.i.e(keyEvent.getKeyCode());
            if (t2.a.a(jE5, c1.f87933b) || t2.a.a(jE5, c1.f87947r)) {
                return t0.o0.f88146s;
            }
            if (t2.a.a(jE5, c1.f87935d)) {
                return t0.o0.f88147t;
            }
            if (t2.a.a(jE5, c1.f87937f)) {
                return t0.o0.f88148u;
            }
            if (t2.a.a(jE5, c1.f87932a)) {
                return t0.o0.B;
            }
            if (t2.a.a(jE5, c1.f87936e)) {
                return t0.o0.W;
            }
            if (t2.a.a(jE5, c1.f87938g)) {
                return t0.o0.V;
            }
        } else if (!keyEvent.isCtrlPressed()) {
            if (keyEvent.isShiftPressed()) {
                long jE6 = p50.i.e(keyEvent.getKeyCode());
                if (t2.a.a(jE6, c1.f87940i)) {
                    return t0.o0.C;
                }
                if (t2.a.a(jE6, c1.f87941j)) {
                    return t0.o0.D;
                }
                if (t2.a.a(jE6, c1.f87942k)) {
                    return t0.o0.E;
                }
                if (t2.a.a(jE6, c1.f87943l)) {
                    return t0.o0.F;
                }
                if (t2.a.a(jE6, c1.n)) {
                    return t0.o0.G;
                }
                if (t2.a.a(jE6, c1.o)) {
                    return t0.o0.H;
                }
                if (t2.a.a(jE6, c1.f87945p)) {
                    return t0.o0.O;
                }
                if (t2.a.a(jE6, c1.f87946q)) {
                    return t0.o0.P;
                }
                if (t2.a.a(jE6, c1.f87947r)) {
                    return t0.o0.f88147t;
                }
            } else {
                long jE7 = p50.i.e(keyEvent.getKeyCode());
                if (t2.a.a(jE7, c1.f87940i)) {
                    return t0.o0.f88131b;
                }
                if (t2.a.a(jE7, c1.f87941j)) {
                    return t0.o0.f88132c;
                }
                if (t2.a.a(jE7, c1.f87942k)) {
                    return t0.o0.f88141l;
                }
                if (t2.a.a(jE7, c1.f87943l)) {
                    return t0.o0.f88142m;
                }
                if (t2.a.a(jE7, c1.f87944m)) {
                    return t0.o0.n;
                }
                if (t2.a.a(jE7, c1.n)) {
                    return t0.o0.o;
                }
                if (t2.a.a(jE7, c1.o)) {
                    return t0.o0.f88143p;
                }
                if (t2.a.a(jE7, c1.f87945p)) {
                    return t0.o0.f88137h;
                }
                if (t2.a.a(jE7, c1.f87946q)) {
                    return t0.o0.f88138i;
                }
                if (t2.a.a(jE7, c1.f87948s) || t2.a.a(jE7, c1.f87949t)) {
                    return t0.o0.T;
                }
                if (t2.a.a(jE7, c1.f87950u)) {
                    return t0.o0.f88149v;
                }
                if (t2.a.a(jE7, c1.f87951v)) {
                    return t0.o0.f88150w;
                }
                if (t2.a.a(jE7, c1.f87952w)) {
                    return t0.o0.f88147t;
                }
                if (t2.a.a(jE7, c1.f87953x)) {
                    return t0.o0.f88148u;
                }
                if (t2.a.a(jE7, c1.f87954y)) {
                    return t0.o0.f88146s;
                }
                if (t2.a.a(jE7, c1.f87955z)) {
                    return t0.o0.U;
                }
            }
        }
        return null;
    }

    public void y() {
        ((rg.p) this.f83189b).f85915m.n.post(new o7.g0(this, 15));
    }

    public void z(String key, qw.j jVar) {
        Intrinsics.g(key, "key");
        synchronized (this) {
            try {
                if (((qw.e) this.f83189b).get(String.valueOf(key.hashCode())) == null) {
                    ((qw.e) this.f83189b).put(String.valueOf(key.hashCode()), jVar);
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public c(le leVar, rg.i iVar) {
        this.f83188a = 18;
        this.f83189b = leVar;
    }

    public /* synthetic */ c(Object obj, int i5) {
        this.f83188a = i5;
        this.f83189b = obj;
    }

    public c(int i5) {
        this.f83188a = i5;
        switch (i5) {
            case 29:
                this.f83189b = new AtomicInteger(0);
                break;
            default:
                this.f83189b = new qw.e(((int) (Runtime.getRuntime().maxMemory() / 1024)) / 8, 0);
                break;
        }
    }

    public c(UUID uuid, int i5, byte[] bArr) {
        this.f83188a = 22;
        this.f83189b = uuid;
    }
}
