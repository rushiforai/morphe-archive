package defpackage;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.ClipDescription;
import android.content.ComponentName;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.os.RemoteException;
import android.text.Editable;
import android.text.Selection;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.android.installreferrer.api.InstallReferrerClient;
import com.android.installreferrer.api.InstallReferrerStateListener;
import com.android.installreferrer.api.ReferrerDetails;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.facebook.FacebookException;
import com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.common.post.pre.ParagraphEditPreLayout;
import com.medium.proto.event.AppInstall;
import com.medium.proto.model.CodeBlockMetadata;
import com.medium.proto.model.SelectionPb;
import com.medium.proto.model.SelectionPoint;
import com.medium.proto.obv.post.SyntaxHighlightMode;
import j$.util.DesugarCollections;
import j$.util.concurrent.ConcurrentHashMap;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.ref.WeakReference;
import java.lang.reflect.Type;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.zip.Adler32;
import javax.net.ssl.HttpsURLConnection;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ku3 implements b6d, xjc, dpe, q26, InstallReferrerStateListener, z1a {
    public final /* synthetic */ int a;
    public final Object b;
    public Object c;
    public Object d;

    public ku3(Collection collection) throws IOException {
        this.a = 15;
        String string = UUID.randomUUID().toString();
        string.getClass();
        SecureRandom secureRandom = new SecureRandom();
        int iNextInt = secureRandom.nextInt(86) + 43;
        ArrayList arrayListR0 = bu1.R0(bu1.R0(bu1.R0(bu1.R0(bu1.Q0(new rk1('0', '9'), bu1.O0(new rk1('a', 'z'), new rk1('A', 'Z'))), '-'), '.'), '_'), '~');
        ArrayList arrayList = new ArrayList(iNextInt);
        for (int i = 0; i < iNextInt; i++) {
            Character ch = (Character) arrayListR0.get(secureRandom.nextInt(arrayListR0.size()));
            ch.getClass();
            arrayList.add(ch);
        }
        String strF0 = bu1.F0(arrayList, "", null, null, null, 62);
        if (!(string.length() != 0 ? !(muc.Y(string, ' ', 0, 6) >= 0) : false) || !ek7.J(strF0)) {
            ay0.e("Failed requirement.");
            throw null;
        }
        HashSet hashSet = collection != null ? new HashSet(collection) : new HashSet();
        hashSet.add("openid");
        Set setUnmodifiableSet = DesugarCollections.unmodifiableSet(hashSet);
        setUnmodifiableSet.getClass();
        this.b = setUnmodifiableSet;
        this.c = string;
        this.d = strF0;
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x0045, code lost:
    
        if (java.lang.Character.isHighSurrogate(r5) != false) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x0082, code lost:
    
        if (java.lang.Character.isLowSurrogate(r5) != false) goto L58;
     */
    /* JADX WARN: Removed duplicated region for block: B:46:0x006c A[EDGE_INSN: B:92:0x006c->B:46:0x006c BREAK  A[LOOP:2: B:47:0x006e->B:58:0x0085], EDGE_INSN: B:93:0x006c->B:46:0x006c BREAK  A[LOOP:2: B:47:0x006e->B:58:0x0085, LOOP_LABEL: LOOP:2: B:47:0x006e->B:58:0x0085]] */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00a2 A[ADDED_TO_REGION] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static boolean A(defpackage.fx3 r7, android.text.Editable r8, int r9, int r10, boolean r11) {
        /*
            Method dump skipped, instruction units count: 240
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ku3.A(fx3, android.text.Editable, int, int, boolean):boolean");
    }

    public static String o(String str, HashMap map) {
        StringBuilder sb = new StringBuilder();
        Iterator it2 = map.entrySet().iterator();
        Map.Entry entry = (Map.Entry) it2.next();
        sb.append((String) entry.getKey());
        sb.append("=");
        sb.append(entry.getValue() != null ? URLEncoder.encode((String) entry.getValue(), "UTF-8") : "");
        while (it2.hasNext()) {
            Map.Entry entry2 = (Map.Entry) it2.next();
            sb.append("&");
            sb.append((String) entry2.getKey());
            sb.append("=");
            sb.append(entry2.getValue() != null ? URLEncoder.encode((String) entry2.getValue(), "UTF-8") : "");
        }
        String string = sb.toString();
        if (string.isEmpty()) {
            return str;
        }
        if (!str.contains("?")) {
            return ev6.x(str, "?", string);
        }
        if (!str.endsWith("&")) {
            string = "&".concat(string);
        }
        return str.concat(string);
    }

    public static boolean p(Editable editable, KeyEvent keyEvent, boolean z) {
        cyd[] cydVarArr;
        if (KeyEvent.metaStateHasNoModifiers(keyEvent.getMetaState())) {
            int selectionStart = Selection.getSelectionStart(editable);
            int selectionEnd = Selection.getSelectionEnd(editable);
            if (selectionStart != -1 && selectionEnd != -1 && selectionStart == selectionEnd && (cydVarArr = (cyd[]) editable.getSpans(selectionStart, selectionEnd, cyd.class)) != null && cydVarArr.length > 0) {
                for (cyd cydVar : cydVarArr) {
                    int spanStart = editable.getSpanStart(cydVar);
                    int spanEnd = editable.getSpanEnd(cydVar);
                    if ((z && spanStart == selectionStart) || ((!z && spanEnd == selectionStart) || (selectionStart > spanStart && selectionStart < spanEnd))) {
                        editable.delete(spanStart, spanEnd);
                        return true;
                    }
                }
            }
        }
        return false;
    }

    @Override // defpackage.dpe
    public void B(FacebookException facebookException) {
        qc5 qc5Var = (qc5) this.c;
        p87 p87VarD = qc5Var.d();
        m87 m87Var = qc5Var.d().g;
        String message = facebookException != null ? facebookException.getMessage() : null;
        ArrayList arrayList = new ArrayList();
        arrayList.add("Caught exception");
        if (message != null) {
            arrayList.add(message);
        }
        p87VarD.c(new o87(m87Var, n87.ERROR, null, TextUtils.join(": ", arrayList), null));
    }

    public boolean C(CharSequence charSequence, int i, int i2, byd bydVar) {
        if ((bydVar.c & 3) == 0) {
            cz2 cz2Var = (cz2) this.d;
            uz7 uz7VarB = bydVar.b();
            int iA = uz7VarB.a(8);
            if (iA != 0) {
                ((ByteBuffer) uz7VarB.d).getShort(iA + uz7VarB.a);
            }
            cz2Var.getClass();
            ThreadLocal threadLocal = cz2.b;
            if (threadLocal.get() == null) {
                threadLocal.set(new StringBuilder());
            }
            StringBuilder sb = (StringBuilder) threadLocal.get();
            sb.setLength(0);
            while (i < i2) {
                sb.append(charSequence.charAt(i));
                i++;
            }
            boolean zHasGlyph = cz2Var.a.hasGlyph(sb.toString());
            int i3 = bydVar.c & 4;
            bydVar.c = zHasGlyph ? i3 | 2 : i3 | 1;
        }
        return (bydVar.c & 3) == 2;
    }

    public void D(String str, String str2) {
        ((HashMap) this.d).put(str, str2);
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object E(java.lang.String r11, defpackage.p92 r12) {
        /*
            r10 = this;
            boolean r0 = r12 instanceof defpackage.bz9
            if (r0 == 0) goto L13
            r0 = r12
            bz9 r0 = (defpackage.bz9) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            bz9 r0 = new bz9
            r0.<init>(r10, r12)
        L18:
            java.lang.Object r12 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            r4 = 2
            c1e r5 = defpackage.c1e.a
            r6 = 0
            r7 = 1
            if (r2 == 0) goto L40
            if (r2 == r7) goto L3a
            if (r2 != r4) goto L34
            java.lang.String r10 = r0.b
            defpackage.br7.v(r12)
            bjb r12 = (defpackage.bjb) r12
            java.lang.Object r11 = r12.a
            goto L8e
        L34:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            return r3
        L3a:
            java.lang.String r11 = r0.b
            defpackage.br7.v(r12)
            goto L5f
        L40:
            defpackage.br7.v(r12)
            java.lang.Object r12 = r10.b
            dm4 r12 = (defpackage.dm4) r12
            nl4 r2 = defpackage.nl4.ENABLE_POSTS_PREFETCH
            boolean r12 = r12.b(r2)
            if (r12 != 0) goto L50
            goto Lb7
        L50:
            java.lang.Object r12 = r10.c
            hx4 r12 = (defpackage.hx4) r12
            r0.b = r11
            r0.e = r7
            java.lang.Object r12 = r12.Y0(r0)
            if (r12 != r1) goto L5f
            goto L8a
        L5f:
            rj2 r12 = (defpackage.rj2) r12
            if (r12 == 0) goto Lb7
            zw7 r12 = r12.i
            if (r12 == 0) goto Lb7
            boolean r12 = r12.isMember()
            if (r12 != r7) goto Lb7
            java.lang.String r12 = "Prefetching post "
            java.lang.String r12 = defpackage.ka1.r(r12, r11)
            uld r2 = defpackage.wld.a
            java.lang.Object[] r8 = new java.lang.Object[r6]
            defpackage.km4.I(r2, r3, r12, r8, r12)
            java.lang.Object r10 = r10.d
            rd4 r10 = (defpackage.rd4) r10
            yd4 r12 = defpackage.yd4.NetworkOnly
            r0.b = r11
            r0.e = r4
            java.lang.Object r10 = r10.a(r11, r12, r7, r0)
            if (r10 != r1) goto L8b
        L8a:
            return r1
        L8b:
            r9 = r11
            r11 = r10
            r10 = r9
        L8e:
            boolean r12 = r11 instanceof defpackage.ajb
            java.lang.String r0 = "Prefetch post "
            if (r12 != 0) goto La4
            r12 = r11
            com.medium.android.graphql.fragment.FullPostData r12 = (com.medium.android.graphql.fragment.FullPostData) r12
            java.lang.String r12 = " successful"
            java.lang.String r12 = defpackage.ev6.x(r0, r10, r12)
            uld r1 = defpackage.wld.a
            java.lang.Object[] r2 = new java.lang.Object[r6]
            defpackage.km4.I(r1, r3, r12, r2, r12)
        La4:
            java.lang.Throwable r11 = defpackage.bjb.b(r11)
            if (r11 == 0) goto Lb7
            java.lang.String r12 = " failed"
            java.lang.String r10 = defpackage.ev6.x(r0, r10, r12)
            uld r12 = defpackage.wld.a
            java.lang.Object[] r0 = new java.lang.Object[r6]
            r12.e(r11, r10, r0)
        Lb7:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ku3.E(java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object F(java.lang.String r23, java.lang.String r24, gen.model.SourceParameter r25, java.lang.String r26, boolean r27, defpackage.p92 r28) {
        /*
            Method dump skipped, instruction units count: 223
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ku3.F(java.lang.String, java.lang.String, gen.model.SourceParameter, java.lang.String, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object G(java.util.ArrayList r13, java.util.ArrayList r14, java.lang.String r15, java.lang.String r16, defpackage.p92 r17) {
        /*
            r12 = this;
            r0 = r17
            boolean r1 = r0 instanceof defpackage.qs4
            if (r1 == 0) goto L15
            r1 = r0
            qs4 r1 = (defpackage.qs4) r1
            int r2 = r1.d
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L15
            int r2 = r2 - r3
            r1.d = r2
            goto L1a
        L15:
            qs4 r1 = new qs4
            r1.<init>(r12, r0)
        L1a:
            java.lang.Object r0 = r1.b
            tb2 r10 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r1.d
            r11 = 1
            if (r2 == 0) goto L30
            if (r2 != r11) goto L29
            defpackage.br7.v(r0)     // Catch: java.lang.Throwable -> L4c
            goto L49
        L29:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            r0 = 0
            return r0
        L30:
            defpackage.br7.v(r0)
            nz r2 = new nz     // Catch: java.lang.Throwable -> L4c
            r8 = 0
            r9 = 6
            r5 = r12
            r3 = r13
            r4 = r14
            r6 = r15
            r7 = r16
            r2.<init>(r3, r4, r5, r6, r7, r8, r9)     // Catch: java.lang.Throwable -> L4c
            r1.d = r11     // Catch: java.lang.Throwable -> L4c
            java.lang.Object r0 = defpackage.o7f.s(r2, r1)     // Catch: java.lang.Throwable -> L4c
            if (r0 != r10) goto L49
            return r10
        L49:
            c1e r0 = defpackage.c1e.a     // Catch: java.lang.Throwable -> L4c
            return r0
        L4c:
            r0 = move-exception
            ajb r1 = new ajb
            r1.<init>(r0)
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ku3.G(java.util.ArrayList, java.util.ArrayList, java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    public Object H(CharSequence charSequence, int i, int i2, int i3, boolean z, jx3 jx3Var) {
        int i4;
        char c;
        lx3 lx3Var = new lx3((xz7) ((n0c) this.c).d);
        int iCodePointAt = Character.codePointAt(charSequence, i);
        int i5 = 0;
        boolean zI = true;
        int iCharCount = i;
        loop0: while (true) {
            i4 = iCharCount;
            while (iCharCount < i2 && i5 < i3 && zI) {
                xz7 xz7Var = (xz7) lx3Var.c.a.get(iCodePointAt);
                if (lx3Var.a == 2) {
                    if (xz7Var != null) {
                        lx3Var.c = xz7Var;
                        lx3Var.f++;
                    } else {
                        if (iCodePointAt == 65038) {
                            lx3Var.a();
                        } else if (iCodePointAt != 65039) {
                            xz7 xz7Var2 = lx3Var.c;
                            if (xz7Var2.b != null) {
                                if (lx3Var.f != 1) {
                                    lx3Var.d = xz7Var2;
                                    lx3Var.a();
                                } else if (lx3Var.b()) {
                                    lx3Var.d = lx3Var.c;
                                    lx3Var.a();
                                } else {
                                    lx3Var.a();
                                }
                                c = 3;
                            } else {
                                lx3Var.a();
                            }
                        }
                        c = 1;
                    }
                    c = 2;
                } else if (xz7Var == null) {
                    lx3Var.a();
                    c = 1;
                } else {
                    lx3Var.a = 2;
                    lx3Var.c = xz7Var;
                    lx3Var.f = 1;
                    c = 2;
                }
                lx3Var.e = iCodePointAt;
                if (c == 1) {
                    iCharCount = Character.charCount(Character.codePointAt(charSequence, i4)) + i4;
                    if (iCharCount < i2) {
                        iCodePointAt = Character.codePointAt(charSequence, iCharCount);
                    }
                } else if (c == 2) {
                    int iCharCount2 = Character.charCount(iCodePointAt) + iCharCount;
                    if (iCharCount2 < i2) {
                        iCodePointAt = Character.codePointAt(charSequence, iCharCount2);
                    }
                    iCharCount = iCharCount2;
                } else if (c == 3) {
                    if (z || !C(charSequence, i4, iCharCount, lx3Var.d.b)) {
                        zI = jx3Var.i(charSequence, i4, iCharCount, lx3Var.d.b);
                        i5++;
                    }
                }
            }
            break loop0;
        }
        if (lx3Var.a == 2 && lx3Var.c.b != null && ((lx3Var.f > 1 || lx3Var.b()) && i5 < i3 && zI && (z || !C(charSequence, i4, iCharCount, lx3Var.c.b)))) {
            jx3Var.i(charSequence, i4, iCharCount, lx3Var.c.b);
        }
        return jx3Var.d();
    }

    public void I(kk0 kk0Var, int i, boolean z) {
        char c;
        ck0 ck0Var = (ck0) this.d;
        Context context = (Context) this.b;
        ComponentName componentName = new ComponentName(context, (Class<?>) JobInfoSchedulerService.class);
        JobScheduler jobScheduler = (JobScheduler) context.getSystemService("jobscheduler");
        Adler32 adler32 = new Adler32();
        adler32.update(context.getPackageName().getBytes(Charset.forName("UTF-8")));
        String str = kk0Var.a;
        adler32.update(str.getBytes(Charset.forName("UTF-8")));
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(4);
        z0a z0aVar = kk0Var.c;
        adler32.update(byteBufferAllocate.putInt(c1a.a(z0aVar)).array());
        byte[] bArr = kk0Var.b;
        if (bArr != null) {
            adler32.update(bArr);
        }
        int value = (int) adler32.getValue();
        if (!z) {
            Iterator<JobInfo> it2 = jobScheduler.getAllPendingJobs().iterator();
            while (true) {
                if (!it2.hasNext()) {
                    break;
                }
                JobInfo next = it2.next();
                int i2 = next.getExtras().getInt("attemptNumber");
                if (next.getId() == value) {
                    if (i2 >= i) {
                        n01.T(kk0Var, "JobInfoScheduler", "Upload for context %s is already scheduled. Returning...");
                        return;
                    }
                }
            }
        }
        Cursor cursorRawQuery = ((fnb) this.c).f().rawQuery("SELECT next_request_ms FROM transport_contexts WHERE backend_name = ? and priority = ?", new String[]{str, String.valueOf(c1a.a(z0aVar))});
        try {
            Long lValueOf = cursorRawQuery.moveToNext() ? Long.valueOf(cursorRawQuery.getLong(0)) : 0L;
            cursorRawQuery.close();
            long jLongValue = lValueOf.longValue();
            JobInfo.Builder builder = new JobInfo.Builder(value, componentName);
            builder.setMinimumLatency(ck0Var.a(z0aVar, jLongValue, i));
            Set set = ((dk0) ck0Var.b.get(z0aVar)).c;
            Long l = lValueOf;
            if (set.contains(qqb.NETWORK_UNMETERED)) {
                builder.setRequiredNetworkType(2);
            } else {
                builder.setRequiredNetworkType(1);
            }
            if (set.contains(qqb.DEVICE_CHARGING)) {
                builder.setRequiresCharging(true);
            }
            if (set.contains(qqb.DEVICE_IDLE)) {
                builder.setRequiresDeviceIdle(true);
            }
            PersistableBundle persistableBundle = new PersistableBundle();
            persistableBundle.putInt("attemptNumber", i);
            persistableBundle.putString("backendName", str);
            persistableBundle.putInt("priority", c1a.a(z0aVar));
            if (bArr != null) {
                c = 0;
                persistableBundle.putString("extras", Base64.encodeToString(bArr, 0));
            } else {
                c = 0;
            }
            builder.setExtras(persistableBundle);
            Integer numValueOf = Integer.valueOf(value);
            Long lValueOf2 = Long.valueOf(ck0Var.a(z0aVar, jLongValue, i));
            Integer numValueOf2 = Integer.valueOf(i);
            Object[] objArr = new Object[5];
            objArr[c] = kk0Var;
            objArr[1] = numValueOf;
            objArr[2] = lValueOf2;
            objArr[3] = l;
            objArr[4] = numValueOf2;
            String strZ = n01.Z("JobInfoScheduler");
            if (Log.isLoggable(strZ, 3)) {
                Log.d(strZ, String.format("Scheduling upload for context %s with jobId=%d in %dms(Backend next call timestamp %d). Attempt %d", objArr));
            }
            jobScheduler.schedule(builder.build());
        } catch (Throwable th) {
            cursorRawQuery.close();
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0030  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.o3e J(defpackage.j0b r8, defpackage.v96 r9, boolean r10) throws java.lang.Throwable {
        /*
            r7 = this;
            java.lang.Object r0 = r7.b
            n0c r0 = (defpackage.n0c) r0
            java.lang.Object r1 = r0.b
            k96 r1 = (defpackage.k96) r1
            boolean r9 = r9.d
            d1b r2 = r8.b
            boolean r3 = r2 instanceof defpackage.b1b
            r4 = 0
            if (r3 == 0) goto L15
            r3 = r2
            b1b r3 = (defpackage.b1b) r3
            goto L16
        L15:
            r3 = r4
        L16:
            if (r3 == 0) goto L30
            java.lang.Class r3 = r3.a
            java.lang.Class r5 = java.lang.Void.TYPE
            boolean r5 = r3.equals(r5)
            if (r5 == 0) goto L23
            goto L30
        L23:
            java.lang.String r3 = r3.getName()
            pf6 r3 = defpackage.pf6.get(r3)
            x0a r3 = r3.getPrimitiveType()
            goto L31
        L30:
            r3 = r4
        L31:
            as6 r5 = new as6
            r6 = 1
            r5.<init>(r0, r8, r6)
            if (r3 == 0) goto L67
            c38 r7 = r1.h
            vm6 r7 = r7.e
            hec r7 = r7.q(r3)
            ny r8 = new ny
            ly r10 = r7.getAnnotations()
            r0 = 2
            ly[] r0 = new defpackage.ly[r0]
            r1 = 0
            r0[r1] = r10
            r0[r6] = r5
            r8.<init>(r0)
            mn6 r7 = defpackage.ok7.I(r7, r8)
            r7.getClass()
            hec r7 = (defpackage.hec) r7
            if (r9 == 0) goto L5e
            return r7
        L5e:
            hec r8 = r7.n0(r6)
            o3e r7 = defpackage.pwd.K(r7, r8)
            return r7
        L67:
            lxd r8 = defpackage.lxd.COMMON
            r0 = 6
            v96 r8 = defpackage.gx1.e0(r8, r9, r4, r0)
            mn6 r7 = r7.K(r2, r8)
            if (r9 == 0) goto L84
            if (r10 == 0) goto L79
            pqe r8 = defpackage.pqe.OUT_VARIANCE
            goto L7b
        L79:
            pqe r8 = defpackage.pqe.INVARIANT
        L7b:
            c38 r9 = r1.h
            vm6 r9 = r9.e
            hec r7 = r9.i(r8, r7, r5)
            return r7
        L84:
            c38 r8 = r1.h
            vm6 r8 = r8.e
            pqe r9 = defpackage.pqe.INVARIANT
            hec r8 = r8.i(r9, r7, r5)
            c38 r9 = r1.h
            vm6 r9 = r9.e
            pqe r10 = defpackage.pqe.OUT_VARIANCE
            hec r7 = r9.i(r10, r7, r5)
            hec r7 = r7.n0(r6)
            o3e r7 = defpackage.pwd.K(r8, r7)
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ku3.J(j0b, v96, boolean):o3e");
    }

    public mn6 K(d1b d1bVar, v96 v96Var) throws Throwable {
        k96 k96Var = (k96) ((n0c) this.b).b;
        if (d1bVar instanceof b1b) {
            Class cls = ((b1b) d1bVar).a;
            x0a primitiveType = cls.equals(Void.TYPE) ? null : pf6.get(cls.getName()).getPrimitiveType();
            return primitiveType != null ? k96Var.h.e.s(primitiveType) : k96Var.h.e.w();
        }
        boolean z = false;
        if (!(d1bVar instanceof s0b)) {
            if (d1bVar instanceof j0b) {
                return J((j0b) d1bVar, v96Var, false);
            }
            if (d1bVar instanceof g1b) {
                d1b d1bVarC = ((g1b) d1bVar).c();
                return d1bVarC != null ? K(d1bVarC, v96Var) : k96Var.h.e.o();
            }
            if (d1bVar == null) {
                return k96Var.h.e.o();
            }
            ywb.i("Unsupported type: ", d1bVar);
            return null;
        }
        s0b s0bVar = (s0b) d1bVar;
        Type type = s0bVar.a;
        if (!v96Var.d && v96Var.a != lxd.SUPERTYPE) {
            z = true;
        }
        boolean zD = s0bVar.d();
        if (!zD && !z) {
            hec hecVarN = n(s0bVar, v96Var, null);
            return hecVarN != null ? hecVarN : l24.c(k24.UNRESOLVED_JAVA_CLASS, type.toString());
        }
        hec hecVarN2 = n(s0bVar, v96Var.b(w96.FLEXIBLE_LOWER_BOUND), null);
        if (hecVarN2 == null) {
            return l24.c(k24.UNRESOLVED_JAVA_CLASS, type.toString());
        }
        hec hecVarN3 = n(s0bVar, v96Var.b(w96.FLEXIBLE_UPPER_BOUND), hecVarN2);
        if (hecVarN3 == null) {
            return l24.c(k24.UNRESOLVED_JAVA_CLASS, type.toString());
        }
        if (!zD) {
            return pwd.K(hecVarN2, hecVarN3);
        }
        wsa wsaVar = new wsa(hecVarN2, hecVarN3);
        on6.a.b(hecVarN2, hecVarN3);
        return wsaVar;
    }

    @Override // defpackage.b6d
    public void a(int i) {
    }

    @Override // defpackage.q26
    public Uri b() {
        return (Uri) this.b;
    }

    @Override // defpackage.q26
    public void c() {
    }

    @Override // defpackage.xjc
    public void cancel() {
        ((b44) ((zf3) this.d).e).cancel();
    }

    @Override // defpackage.xjc
    public ikc d() {
        return (z34) this.c;
    }

    @Override // defpackage.z1a
    public void e() {
    }

    @Override // defpackage.z1a
    public void f() {
        Context context = (Context) ((WeakReference) this.d).get();
        if (context == null || m7f.e() == null) {
            return;
        }
        String str = (String) this.b;
        f66 f66Var = (f66) this.c;
        str.getClass();
        f66Var.getClass();
        try {
            m7f m7fVarF = m7f.f(context);
            m7fVarF.getClass();
            m7fVarF.a("DatadogBackgroundUpload/".concat(str));
        } catch (IllegalStateException e) {
            f49.L(f66Var, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), b18.s, e, 48);
        }
    }

    @Override // defpackage.q26
    public Uri g() {
        return (Uri) this.d;
    }

    @Override // defpackage.q26
    public ClipDescription getDescription() {
        return (ClipDescription) this.c;
    }

    @Override // defpackage.b6d
    public boolean h(KeyEvent keyEvent) {
        ParagraphEditPreLayout paragraphEditPreLayout = (ParagraphEditPreLayout) ((my6) this.b).a;
        List list = paragraphEditPreLayout.e;
        ArrayList<hv3> arrayList = new ArrayList();
        for (Object obj : list) {
            if (obj instanceof hv3) {
                arrayList.add(obj);
            }
        }
        for (hv3 hv3Var : arrayList) {
            SelectionPb selectionPb = paragraphEditPreLayout.i;
            SelectionPoint selectionPoint = selectionPb.start;
            if (hv3Var.c(selectionPoint.paragraph_index, selectionPoint.offset, selectionPb.end.offset, keyEvent)) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.b6d
    public void i(String str, long j, y5d y5dVar) {
        y5dVar.getClass();
        ParagraphEditPreLayout paragraphEditPreLayout = (ParagraphEditPreLayout) ((my6) this.b).a;
        paragraphEditPreLayout.h.k(str);
        fi9 fi9Var = paragraphEditPreLayout.d;
        if (fi9Var == null) {
            ay0.e("PostMorpher cannot be null");
            return;
        }
        int iD = ((EditPostBodyView) fi9Var).d(paragraphEditPreLayout);
        SelectionPb selectionPb = rxb.a;
        int i = bkd.c;
        paragraphEditPreLayout.i = rxb.d(iD, (int) (j >> 32), (int) (j & 4294967295L));
        l29 l29Var = paragraphEditPreLayout.h;
        CodeBlockMetadata codeBlockMetadata = l29Var.a.code_block_metadata;
        if ((codeBlockMetadata != null ? codeBlockMetadata.mode : null) == SyntaxHighlightMode.AUTO) {
            l29Var.j(y5dVar);
        }
        ((l78) this.c).setValue(str);
        ((l78) this.d).setValue(y5dVar);
    }

    @Override // defpackage.z1a
    public void j() {
    }

    @Override // defpackage.q26
    public Object k() {
        return null;
    }

    @Override // defpackage.z1a
    public void l() {
        Context context = (Context) ((WeakReference) this.d).get();
        if (context == null || m7f.e() == null) {
            return;
        }
        qk7.A(context, (String) this.b, (f66) this.c);
    }

    @Override // defpackage.dpe
    public void m(JSONObject jSONObject) {
        String string;
        Bundle bundle = (Bundle) this.b;
        qc5 qc5Var = (qc5) this.c;
        if (jSONObject != null) {
            try {
                string = jSONObject.getString("id");
            } catch (JSONException e) {
                p87 p87VarD = qc5Var.d();
                m87 m87Var = qc5Var.d().g;
                String message = e.getMessage();
                ArrayList arrayList = new ArrayList();
                arrayList.add("Caught exception");
                if (message != null) {
                    arrayList.add(message);
                }
                p87VarD.c(new o87(m87Var, n87.ERROR, null, TextUtils.join(": ", arrayList), null));
                return;
            }
        } else {
            string = null;
        }
        bundle.putString("com.facebook.platform.extra.USER_ID", string);
        qc5Var.l((m87) this.d, bundle);
    }

    /* JADX WARN: Code restructure failed: missing block: B:62:0x0153, code lost:
    
        if (r9 != null) goto L74;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:101:0x01f2  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0134  */
    /* JADX WARN: Type inference failed for: r11v3, types: [boolean] */
    /* JADX WARN: Type inference failed for: r14v0 */
    /* JADX WARN: Type inference failed for: r14v1 */
    /* JADX WARN: Type inference failed for: r14v8 */
    /* JADX WARN: Type inference failed for: r17v0 */
    /* JADX WARN: Type inference failed for: r17v19 */
    /* JADX WARN: Type inference failed for: r17v2, types: [hec] */
    /* JADX WARN: Type inference failed for: r17v20 */
    /* JADX WARN: Type inference failed for: r17v4 */
    /* JADX WARN: Type inference failed for: r17v5 */
    /* JADX WARN: Type inference failed for: r17v9 */
    /* JADX WARN: Type inference failed for: r3v1 */
    /* JADX WARN: Type inference failed for: r3v2, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r3v28 */
    /* JADX WARN: Type inference failed for: r4v8, types: [zvd] */
    /* JADX WARN: Type inference failed for: r6v1 */
    /* JADX WARN: Type inference failed for: r6v2, types: [boolean] */
    /* JADX WARN: Type inference failed for: r6v3 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.hec n(defpackage.s0b r21, defpackage.v96 r22, defpackage.hec r23) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 989
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ku3.n(s0b, v96, hec):hec");
    }

    @Override // com.android.installreferrer.api.InstallReferrerStateListener
    public void onInstallReferrerServiceDisconnected() {
        wld.a.n(null, "Install referrer service disconnected", new Object[0]);
    }

    @Override // com.android.installreferrer.api.InstallReferrerStateListener
    public void onInstallReferrerSetupFinished(int i) {
        ReferrerDetails installReferrer;
        qn7 qn7Var = (qn7) this.d;
        InstallReferrerClient installReferrerClient = (InstallReferrerClient) this.b;
        if (i != 0) {
            if (i == 1) {
                wld.a.n(null, "Install referrer service unavailable", new Object[0]);
                qn7Var.z(ek6.INSTALL_REFERRER_CALLED, true);
                installReferrerClient.endConnection();
                return;
            } else {
                if (i != 2) {
                    return;
                }
                wld.a.n(null, "Install referrer API not supported", new Object[0]);
                qn7Var.z(ek6.INSTALL_REFERRER_CALLED, true);
                installReferrerClient.endConnection();
                return;
            }
        }
        try {
            if (installReferrerClient != null) {
                try {
                    try {
                        InstallReferrerClient installReferrerClient2 = installReferrerClient.isReady() ? installReferrerClient : null;
                        if (installReferrerClient2 != null && (installReferrer = installReferrerClient2.getInstallReferrer()) != null) {
                            String installReferrer2 = installReferrer.getInstallReferrer();
                            long referrerClickTimestampSeconds = installReferrer.getReferrerClickTimestampSeconds();
                            Long lValueOf = Long.valueOf(referrerClickTimestampSeconds);
                            if (referrerClickTimestampSeconds <= 0) {
                                lValueOf = null;
                            }
                            Long lValueOf2 = lValueOf != null ? Long.valueOf(lValueOf.longValue() * 1000) : null;
                            long installBeginTimestampSeconds = installReferrer.getInstallBeginTimestampSeconds();
                            Long lValueOf3 = Long.valueOf(installBeginTimestampSeconds);
                            if (installBeginTimestampSeconds <= 0) {
                                lValueOf3 = null;
                            }
                            rqd.a(((ko2) ((v16) this.c)).x(), new AppInstall(null, installReferrer2, lValueOf2, lValueOf3 != null ? Long.valueOf(lValueOf3.longValue() * 1000) : null, installReferrer.getInstallVersion(), null, 33, null), "install", null, false, null, null, 60);
                            qn7Var.z(ek6.INSTALL_REFERRER_CALLED, true);
                            wld.a.f("Install referrer tracked successfully", new Object[0]);
                            ak4.a().b("Install referrer tracked successfully");
                            installReferrerClient.endConnection();
                        }
                    } catch (IllegalStateException e) {
                        wld.a.e(e, "Install referrer might not be ready", new Object[0]);
                        installReferrerClient.endConnection();
                    }
                } catch (RemoteException e2) {
                    wld.a.e(e2, "Error getting install referrer details", new Object[0]);
                    installReferrerClient.endConnection();
                }
            }
        } finally {
            installReferrerClient.endConnection();
        }
    }

    @Override // defpackage.xjc
    public bfc q() {
        return (y34) this.b;
    }

    public kt5 r() throws Throwable {
        HttpsURLConnection httpsURLConnection;
        m50.p();
        InputStream inputStream = null;
        String string = null;
        inputStream = null;
        try {
            String strO = o((String) this.b, (HashMap) this.c);
            String strConcat = "GET Request URL: ".concat(strO);
            if (Log.isLoggable("FirebaseCrashlytics", 2)) {
                Log.v("FirebaseCrashlytics", strConcat, null);
            }
            httpsURLConnection = (HttpsURLConnection) new URL(strO).openConnection();
            try {
                httpsURLConnection.setReadTimeout(PhotoshopDirectory.TAG_PRINT_FLAGS_INFO);
                httpsURLConnection.setConnectTimeout(PhotoshopDirectory.TAG_PRINT_FLAGS_INFO);
                httpsURLConnection.setRequestMethod("GET");
                for (Map.Entry entry : ((HashMap) this.d).entrySet()) {
                    httpsURLConnection.addRequestProperty((String) entry.getKey(), (String) entry.getValue());
                }
                httpsURLConnection.connect();
                int responseCode = httpsURLConnection.getResponseCode();
                InputStream inputStream2 = httpsURLConnection.getInputStream();
                if (inputStream2 != null) {
                    try {
                        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream2, "UTF-8"));
                        char[] cArr = new char[8192];
                        StringBuilder sb = new StringBuilder();
                        while (true) {
                            int i = bufferedReader.read(cArr);
                            if (i == -1) {
                                break;
                            }
                            sb.append(cArr, 0, i);
                        }
                        string = sb.toString();
                    } catch (Throwable th) {
                        th = th;
                        inputStream = inputStream2;
                        if (inputStream != null) {
                            inputStream.close();
                        }
                        if (httpsURLConnection != null) {
                            httpsURLConnection.disconnect();
                        }
                        throw th;
                    }
                }
                if (inputStream2 != null) {
                    inputStream2.close();
                }
                httpsURLConnection.disconnect();
                kt5 kt5Var = new kt5();
                kt5Var.b = responseCode;
                kt5Var.a = string;
                return kt5Var;
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (Throwable th3) {
            th = th3;
            httpsURLConnection = null;
        }
    }

    public int s() {
        if (v().a.isEmpty()) {
            return -1;
        }
        long j = ((long) ((el7) bu1.x0(v().a)).a) - ((long) v().h);
        if (j < 0) {
            j = 0;
        }
        return (int) j;
    }

    public boolean t() {
        return !v().a.isEmpty();
    }

    public int u() {
        if (v().a.isEmpty()) {
            return -1;
        }
        long j = ((long) ((el7) bu1.H0(v().a)).a) + ((long) v().h);
        long jY = ((long) y()) - 1;
        if (j > jY) {
            j = jY;
        }
        return (int) j;
    }

    public yy8 v() {
        yy8 yy8Var = (yy8) this.c;
        if (yy8Var != null) {
            return yy8Var;
        }
        g76.g0("layoutInfo");
        throw null;
    }

    public int w() {
        if (v().a.isEmpty()) {
            return 0;
        }
        return Math.abs(((((el7) bu1.H0(v().a)).j + v().b) + v().c) - v().g);
    }

    public int x() {
        if (v().a.isEmpty()) {
            return 0;
        }
        int i = ((el7) bu1.x0(v().a)).j + (-v().f);
        return Math.abs(i <= 0 ? i : 0);
    }

    public int y() {
        return ((Number) ((wx4) this.b).invoke()).intValue();
    }

    public Enum z(fj6 fj6Var, Object obj) {
        fj6Var.getClass();
        return (Enum) ((i04) ((g04) this.d)).get(((o56) ((zl4) this.c).d(((Number) ((ai6) this.b).get(obj)).intValue())).getNumber());
    }

    public String toString() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 14:
                return "JsonConfiguration(encodeDefaults=false, ignoreUnknownKeys=false, isLenient=false, allowStructuredMapKeys=false, prettyPrint=false, explicitNulls=true, prettyPrintIndent='" + ((String) obj) + "', coerceInputValues=false, useArrayPolymorphism=false, classDiscriminator='" + ((String) this.c) + CspinKvYN.XfePsTPWJY + ((in1) this.d) + ')';
            case 22:
                String str = (String) this.d;
                String str2 = (String) this.c;
                StringBuilder sb = new StringBuilder("NavDeepLinkRequest{");
                Uri uri = (Uri) obj;
                if (uri != null) {
                    sb.append(" uri=");
                    sb.append(String.valueOf(uri));
                }
                if (str2 != null) {
                    sb.append(" action=");
                    sb.append(str2);
                }
                if (str != null) {
                    sb.append(" mimetype=");
                    sb.append(str);
                }
                sb.append(" }");
                return sb.toString();
            default:
                return super.toString();
        }
    }

    public ku3(yad yadVar, pu7 pu7Var, ax2 ax2Var) {
        this.a = 6;
        pu7Var.getClass();
        this.b = yadVar;
        this.c = pu7Var;
        this.d = ax2Var;
    }

    public ku3(dm4 dm4Var, hx4 hx4Var, rd4 rd4Var) {
        this.a = 28;
        dm4Var.getClass();
        this.b = dm4Var;
        this.c = hx4Var;
        this.d = rd4Var;
    }

    public ku3(ai6 ai6Var, zl4 zl4Var, g04 g04Var, ArrayList arrayList) {
        this.a = 2;
        g04Var.getClass();
        this.b = ai6Var;
        this.c = zl4Var;
        this.d = g04Var;
    }

    public ku3(List list) {
        this.a = 18;
        this.d = list;
        this.b = new ArrayList(list.size());
        this.c = new ArrayList(list.size());
        for (int i = 0; i < list.size(); i++) {
            ((ArrayList) this.b).add(new a4c((List) ((aj7) list.get(i)).b.b));
            ((ArrayList) this.c).add(((aj7) list.get(i)).c.w());
        }
    }

    public ku3(w93 w93Var, zm7 zm7Var) {
        this.a = 24;
        this.b = w93Var;
        this.c = zm7Var;
        this.d = new ConcurrentHashMap();
    }

    public ku3(Context context, String str, f66 f66Var) {
        this.a = 29;
        context.getClass();
        str.getClass();
        f66Var.getClass();
        this.b = str;
        this.c = f66Var;
        this.d = new WeakReference(context);
    }

    public ku3(nwa nwaVar) {
        this.a = 23;
        this.b = new x90(0);
        this.c = new iq1(5);
        this.d = new ps5(this, 17, nwaVar);
    }

    public /* synthetic */ ku3(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }

    public ku3(String str, HashMap map) {
        this.a = 8;
        this.b = str;
        this.c = map;
        this.d = new HashMap();
    }

    public ku3(n0c n0cVar, vwd vwdVar) {
        this.a = 12;
        vwdVar.getClass();
        this.b = n0cVar;
        this.c = vwdVar;
        this.d = new mya(new rz5(22));
    }

    public ku3(int i) {
        this.a = i;
        switch (i) {
            case 21:
                String string = UUID.randomUUID().toString();
                string.getClass();
                h21 h21Var = h21.d;
                this.b = dq1.o(string);
                this.c = a68.f;
                this.d = new ArrayList();
                break;
            case 27:
                long[] jArr = hqb.a;
                this.b = new f78();
                break;
            default:
                in1 in1Var = in1.POLYMORPHIC;
                in1Var.getClass();
                this.b = "    ";
                this.c = "type";
                this.d = in1Var;
                break;
        }
    }

    public ku3(mj7 mj7Var, View view) {
        Object nj7Var;
        this.a = 19;
        int i = Build.VERSION.SDK_INT;
        if (i >= 34) {
            nj7Var = new pj7();
        } else {
            nj7Var = i >= 33 ? new nj7() : null;
        }
        this.b = nj7Var;
        this.c = mj7Var;
        this.d = view;
    }

    public ku3(View view) {
        this.a = 10;
        this.b = view;
        this.c = vx0.d0(yw6.NONE, new ir(18, this));
        hha hhaVar = new hha();
        if (Build.VERSION.SDK_INT >= 30) {
            ckc ckcVar = new ckc(view);
            ckcVar.b = view;
            hhaVar.a = ckcVar;
        } else {
            hhaVar.a = new qlb(view);
        }
        this.d = hhaVar;
    }

    public ku3(wx4 wx4Var) {
        this.a = 25;
        this.b = wx4Var;
    }

    public ku3(do1 do1Var, List list, ku3 ku3Var) {
        this.a = 26;
        do1Var.getClass();
        list.getClass();
        this.b = do1Var;
        this.c = list;
        this.d = ku3Var;
    }

    public ku3(n0c n0cVar, no3 no3Var, cz2 cz2Var, Set set) {
        this.a = 1;
        this.b = no3Var;
        this.c = n0cVar;
        this.d = cz2Var;
        if (set.isEmpty()) {
            return;
        }
        Iterator it2 = set.iterator();
        while (it2.hasNext()) {
            int[] iArr = (int[]) it2.next();
            String str = new String(iArr, 0, iArr.length);
            H(str, 0, str.length(), 1, true, new zwf(str, 4));
        }
    }

    public ku3(zf3 zf3Var) {
        this.a = 3;
        this.d = zf3Var;
        b44 b44Var = (b44) zf3Var.e;
        this.b = new y34(zf3Var, b44Var.i().q(), -1L, true);
        this.c = new z34(zf3Var, b44Var.i().d(), -1L, true);
    }
}
