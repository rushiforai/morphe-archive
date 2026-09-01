package defpackage;

import android.R;
import android.animation.Animator;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Shader;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ClipDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RoundRectShape;
import android.text.method.KeyListener;
import android.text.method.NumberKeyListener;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.animation.Animation;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputMethodManager;
import android.widget.AbsSeekBar;
import android.widget.EditText;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.addressbook.ui.findfriends.FindFriendsFragment;
import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import com.medium.proto.event.UserFollowed;
import com.medium.proto.event.UserPresented;
import gen.model.SourceParameter;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Type;
import java.nio.channels.FileChannel;
import java.nio.channels.FileLock;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class s26 implements rx, cy, rfd, bnb, x31, cs1, obe {
    public static final int[] d = {R.attr.indeterminateDrawable, R.attr.progressDrawable};
    public static final fa4 e = new fa4(19);
    public final /* synthetic */ int a;
    public final Object b;
    public Object c;

    public s26(EditText editText, int i) {
        this.a = i;
        switch (i) {
            case 21:
                this.b = editText;
                qx3 qx3Var = new qx3(editText);
                this.c = qx3Var;
                editText.addTextChangedListener(qx3Var);
                if (dx3.b == null) {
                    synchronized (dx3.a) {
                        try {
                            if (dx3.b == null) {
                                dx3 dx3Var = new dx3();
                                try {
                                    dx3.c = Class.forName("android.text.DynamicLayout$ChangeWatcher", false, dx3.class.getClassLoader());
                                    break;
                                } catch (Throwable unused) {
                                }
                                dx3.b = dx3Var;
                            }
                        } finally {
                        }
                        break;
                    }
                }
                editText.setEditableFactory(dx3.b);
                return;
            default:
                this.b = editText;
                this.c = new rz2(editText);
                return;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0046 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0041 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.s26 Y(android.content.Context r5) {
        /*
            java.lang.String r0 = "generatefid.lock"
            r1 = 0
            java.io.File r2 = new java.io.File     // Catch: java.nio.channels.OverlappingFileLockException -> L30 java.lang.Error -> L34 java.io.IOException -> L36
            java.io.File r5 = r5.getFilesDir()     // Catch: java.nio.channels.OverlappingFileLockException -> L30 java.lang.Error -> L34 java.io.IOException -> L36
            r2.<init>(r5, r0)     // Catch: java.nio.channels.OverlappingFileLockException -> L30 java.lang.Error -> L34 java.io.IOException -> L36
            java.io.RandomAccessFile r5 = new java.io.RandomAccessFile     // Catch: java.nio.channels.OverlappingFileLockException -> L30 java.lang.Error -> L34 java.io.IOException -> L36
            java.lang.String r0 = "rw"
            r5.<init>(r2, r0)     // Catch: java.nio.channels.OverlappingFileLockException -> L30 java.lang.Error -> L34 java.io.IOException -> L36
            java.nio.channels.FileChannel r5 = r5.getChannel()     // Catch: java.nio.channels.OverlappingFileLockException -> L30 java.lang.Error -> L34 java.io.IOException -> L36
            java.nio.channels.FileLock r0 = r5.lock()     // Catch: java.nio.channels.OverlappingFileLockException -> L29 java.lang.Error -> L2c java.io.IOException -> L2e
            s26 r2 = new s26     // Catch: java.nio.channels.OverlappingFileLockException -> L23 java.lang.Error -> L25 java.io.IOException -> L27
            r3 = 16
            r2.<init>(r5, r3, r0)     // Catch: java.nio.channels.OverlappingFileLockException -> L23 java.lang.Error -> L25 java.io.IOException -> L27
            return r2
        L23:
            r2 = move-exception
            goto L38
        L25:
            r2 = move-exception
            goto L38
        L27:
            r2 = move-exception
            goto L38
        L29:
            r2 = move-exception
        L2a:
            r0 = r1
            goto L38
        L2c:
            r2 = move-exception
            goto L2a
        L2e:
            r2 = move-exception
            goto L2a
        L30:
            r2 = move-exception
        L31:
            r5 = r1
            r0 = r5
            goto L38
        L34:
            r2 = move-exception
            goto L31
        L36:
            r2 = move-exception
            goto L31
        L38:
            java.lang.String r3 = "CrossProcessLock"
            java.lang.String r4 = "encountered error while creating and acquiring the lock, ignoring"
            android.util.Log.e(r3, r4, r2)
            if (r0 == 0) goto L44
            r0.release()     // Catch: java.io.IOException -> L44
        L44:
            if (r5 == 0) goto L49
            r5.close()     // Catch: java.io.IOException -> L49
        L49:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.s26.Y(android.content.Context):s26");
    }

    @Override // defpackage.cs1
    public void A(SourceParameter sourceParameter, String str, boolean z) {
        switch (this.a) {
            case 22:
                throw ho2.J(sourceParameter, str, "Mute a publication is not supported in Explore screen");
            case 23:
            default:
                throw ho2.J(sourceParameter, str, "Mute a user is not supported.");
            case 24:
                throw ho2.J(sourceParameter, str, "Mute a user is not supported.");
        }
    }

    public void A0(int i, h30 h30Var) throws IOException {
        Iterator it2 = (Iterator) this.b;
        while (true) {
            Map.Entry entry = (Map.Entry) this.c;
            if (entry == null || ((m75) entry.getKey()).a >= i) {
                return;
            }
            m75 m75Var = (m75) ((Map.Entry) this.c).getKey();
            Object value = ((Map.Entry) this.c).getValue();
            zf4 zf4Var = zf4.c;
            k6f k6fVar = m75Var.b;
            int i2 = m75Var.a;
            if (m75Var.c) {
                for (Object obj : (List) value) {
                    if (k6fVar == k6f.GROUP) {
                        h30Var.N(i2, 3);
                        ((q1) obj).d(h30Var);
                        h30Var.N(i2, 4);
                    } else {
                        h30Var.N(i2, k6fVar.getWireType());
                        zf4.k(h30Var, k6fVar, obj);
                    }
                }
            } else if (k6fVar == k6f.GROUP) {
                h30Var.N(i2, 3);
                ((q1) value).d(h30Var);
                h30Var.N(i2, 4);
            } else {
                h30Var.N(i2, k6fVar.getWireType());
                zf4.k(h30Var, k6fVar, value);
            }
            if (it2.hasNext()) {
                this.c = (Map.Entry) it2.next();
            } else {
                this.c = null;
            }
        }
    }

    @Override // defpackage.cs1
    public void B(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        f74 f74Var = (f74) this.c;
        n92 n92Var = null;
        if (z) {
            vx0.c0(f76.F(f74Var), null, null, new y64(f74Var, str, sourceParameter, n92Var, 1), 3);
        } else {
            vx0.c0(f76.F(f74Var), null, null, new y64(f74Var, str, sourceParameter, n92Var, 5), 3);
        }
    }

    @Override // defpackage.cy
    public List C(j7a j7aVar, q1 q1Var, hx hxVar) {
        hxVar.getClass();
        if (!(q1Var instanceof a6a)) {
            if (!(q1Var instanceof i6a)) {
                ik4.m("Unknown message: ", q1Var);
                return null;
            }
            int i = y.a[hxVar.ordinal()];
            if (i != 1 && i != 2 && i != 3) {
                ik4.m("Unsupported callable kind with property proto for receiver annotations: ", hxVar);
                return null;
            }
        }
        return new ArrayList(cu1.k0(ey3.a, 10));
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x004e A[Catch: all -> 0x00a4, TRY_LEAVE, TryCatch #3 {all -> 0x00a4, blocks: (B:20:0x004a, B:22:0x004e, B:25:0x005f, B:29:0x0066, B:31:0x0073, B:33:0x007e, B:32:0x0079, B:27:0x0063, B:28:0x0065, B:45:0x009c, B:46:0x00a3, B:24:0x005a), top: B:73:0x004a, outer: #5, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x009c A[Catch: all -> 0x00a4, TRY_ENTER, TryCatch #3 {all -> 0x00a4, blocks: (B:20:0x004a, B:22:0x004e, B:25:0x005f, B:29:0x0066, B:31:0x0073, B:33:0x007e, B:32:0x0079, B:27:0x0063, B:28:0x0065, B:45:0x009c, B:46:0x00a3, B:24:0x005a), top: B:73:0x004a, outer: #5, inners: #0 }] */
    @Override // defpackage.bnb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.anb D(java.lang.String r8) {
        /*
            Method dump skipped, instruction units count: 220
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.s26.D(java.lang.String):anb");
    }

    @Override // defpackage.cy
    public List F(j7a j7aVar, i6a i6aVar) {
        return new ArrayList(cu1.k0(ey3.a, 10));
    }

    @Override // defpackage.rfd
    public void I(ew5 ew5Var) {
        g90 g90Var = (g90) this.c;
        g90Var.m(new d90(ew5Var != null ? sgg.z(ew5Var, ((rx5) this.b).a, g90Var.p) : null));
    }

    @Override // defpackage.jt4
    public void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        switch (this.a) {
            case 24:
                ho2.P(sourceParameter, str, str2, str3);
                fj4 fj4Var = (fj4) this.c;
                vx0.c0(f76.F(fj4Var), null, null, new ej4(fj4Var, str3, str, str2, sourceParameter, null, 1), 3);
                break;
            default:
                ho2.P(sourceParameter, str, str2, str3);
                sy4 sy4Var = (sy4) this.c;
                vx0.c0(f76.F(sy4Var), null, null, new ry4(sy4Var, str3, str, str2, sourceParameter, null, 1), 3);
                break;
        }
    }

    @Override // defpackage.jt4
    public void M(String str, SourceParameter sourceParameter) {
        int i = this.a;
        sourceParameter.getClass();
        switch (i) {
            case 24:
                fj4 fj4Var = (fj4) this.c;
                fj4Var.g.e(sourceParameter, str, fj4Var.b, fj4Var.y);
                break;
            default:
                sy4 sy4Var = (sy4) this.c;
                sy4Var.e.e(sourceParameter, str, sy4Var.c, sy4Var.j);
                break;
        }
    }

    @Override // defpackage.jt4
    public void N(SourceParameter sourceParameter, String str, String str2) {
        switch (this.a) {
            case 24:
                str2.getClass();
                sourceParameter.getClass();
                fj4 fj4Var = (fj4) this.c;
                vx0.c0(f76.F(fj4Var), null, null, new bj4(fj4Var, str, str2, sourceParameter, null, 1), 3);
                break;
            default:
                str2.getClass();
                sourceParameter.getClass();
                sy4 sy4Var = (sy4) this.c;
                vx0.c0(f76.F(sy4Var), null, null, new py4(sy4Var, str, str2, sourceParameter, null, 1), 3);
                break;
        }
    }

    @Override // defpackage.jt4
    public void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        switch (this.a) {
            case 24:
                ho2.O(sourceParameter, str, str2);
                fj4 fj4Var = (fj4) this.c;
                vx0.c0(f76.F(fj4Var), null, null, new ej4(fj4Var, str3, str, str2, sourceParameter, null, 0), 3);
                break;
            default:
                ho2.O(sourceParameter, str, str2);
                sy4 sy4Var = (sy4) this.c;
                vx0.c0(f76.F(sy4Var), null, null, new ry4(sy4Var, str3, str, str2, sourceParameter, null, 0), 3);
                break;
        }
    }

    @Override // defpackage.obe
    public /* bridge */ void P(String str, SourceParameter sourceParameter) {
        switch (this.a) {
            case 24:
                wgd.c(str, sourceParameter);
                break;
            default:
                wgd.c(str, sourceParameter);
                break;
        }
    }

    @Override // defpackage.cy
    public ArrayList Q(h7a h7aVar) {
        h7aVar.getClass();
        Iterable iterable = (List) h7aVar.d.i(((r01) this.b).c);
        if (iterable == null) {
            iterable = ey3.a;
        }
        ArrayList arrayList = new ArrayList(cu1.k0(iterable, 10));
        Iterator it2 = iterable.iterator();
        while (it2.hasNext()) {
            arrayList.add(n0((h5a) it2.next(), h7aVar.a));
        }
        return arrayList;
    }

    @Override // defpackage.jt4
    public void S(SourceParameter sourceParameter, String str, String str2) {
        switch (this.a) {
            case 24:
                str2.getClass();
                sourceParameter.getClass();
                fj4 fj4Var = (fj4) this.c;
                vx0.c0(f76.F(fj4Var), null, null, new bj4(fj4Var, str, str2, sourceParameter, null, 0), 3);
                break;
            default:
                str2.getClass();
                sourceParameter.getClass();
                sy4 sy4Var = (sy4) this.c;
                vx0.c0(f76.F(sy4Var), null, null, new py4(sy4Var, str, str2, sourceParameter, null, 0), 3);
                break;
        }
    }

    @Override // defpackage.jt4
    public void U(String str, SourceParameter sourceParameter) {
        switch (this.a) {
            case 24:
                str.getClass();
                sourceParameter.getClass();
                fj4 fj4Var = (fj4) this.c;
                vx0.c0(f76.F(fj4Var), null, null, new ku2(fj4Var, str, sourceParameter, null, 18), 3);
                break;
            default:
                str.getClass();
                sourceParameter.getClass();
                sy4 sy4Var = (sy4) this.c;
                vx0.c0(f76.F(sy4Var), null, null, new ku2(sy4Var, str, sourceParameter, null, 26), 3);
                break;
        }
    }

    @Override // defpackage.bnb
    public boolean W() {
        return ((bnb) this.b).W();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object Z(android.graphics.Bitmap r7, defpackage.p92 r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.hp
            if (r0 == 0) goto L13
            r0 = r8
            hp r0 = (defpackage.hp) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            hp r0 = new hp
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r8)     // Catch: java.lang.Throwable -> L47
            goto L44
        L28:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r4
        L2e:
            defpackage.br7.v(r8)
            java.lang.Object r8 = r6.c     // Catch: java.lang.Throwable -> L47
            kb2 r8 = (defpackage.kb2) r8     // Catch: java.lang.Throwable -> L47
            ip r2 = new ip     // Catch: java.lang.Throwable -> L47
            r5 = 0
            r2.<init>(r6, r7, r4, r5)     // Catch: java.lang.Throwable -> L47
            r0.d = r3     // Catch: java.lang.Throwable -> L47
            java.lang.Object r8 = defpackage.vx0.m0(r8, r2, r0)     // Catch: java.lang.Throwable -> L47
            if (r8 != r1) goto L44
            return r1
        L44:
            android.net.Uri r8 = (android.net.Uri) r8     // Catch: java.lang.Throwable -> L47
            return r8
        L47:
            r6 = move-exception
            ajb r7 = new ajb
            r7.<init>(r6)
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.s26.Z(android.graphics.Bitmap, p92):java.lang.Object");
    }

    public boolean a0() {
        synchronized (this) {
            if (((AtomicBoolean) this.c).get()) {
                return false;
            }
            ((AtomicInteger) this.b).incrementAndGet();
            return true;
        }
    }

    @Override // defpackage.rfd
    public void b(ew5 ew5Var) {
    }

    @Override // defpackage.rx
    public Object d(j7a j7aVar, i6a i6aVar, mn6 mn6Var) {
        return null;
    }

    @Override // defpackage.cy
    public List f(j7a j7aVar, i6a i6aVar) {
        return new ArrayList(cu1.k0(ey3.a, 10));
    }

    public void h0() {
        String str = (String) this.b;
        try {
            new File((File) ((bh4) this.c).c, str).createNewFile();
        } catch (IOException e2) {
            Log.e("FirebaseCrashlytics", "Error creating marker: ".concat(str), e2);
        }
    }

    @Override // defpackage.cy
    public ArrayList i(s6a s6aVar, p98 p98Var) {
        s6aVar.getClass();
        p98Var.getClass();
        Iterable iterable = (List) s6aVar.i(((r01) this.b).k);
        if (iterable == null) {
            iterable = ey3.a;
        }
        ArrayList arrayList = new ArrayList(cu1.k0(iterable, 10));
        Iterator it2 = iterable.iterator();
        while (it2.hasNext()) {
            arrayList.add(n0((h5a) it2.next(), p98Var));
        }
        return arrayList;
    }

    public InputMethodManager i0() {
        return (InputMethodManager) ((vq6) this.c).getValue();
    }

    public KeyListener k0(KeyListener keyListener) {
        if ((keyListener instanceof NumberKeyListener) || (keyListener instanceof ix3)) {
            return keyListener;
        }
        if (keyListener == null) {
            return null;
        }
        return keyListener instanceof NumberKeyListener ? keyListener : new ix3(keyListener);
    }

    public to4 m0(String str) {
        str.getClass();
        return ((o2b) this.c).p(new ku2(this, str, null, 28));
    }

    @Override // defpackage.rfd
    public void n(ew5 ew5Var) {
    }

    public zx n0(h5a h5aVar, p98 p98Var) {
        h5aVar.getClass();
        p98Var.getClass();
        return ((lig) this.c).s(h5aVar, p98Var);
    }

    @Override // defpackage.cy
    public List o(j7a j7aVar, q1 q1Var, hx hxVar, int i, a7a a7aVar) {
        hxVar.getClass();
        List listW = a7aVar != null ? w(j7aVar, q1Var, hxVar, i, a7aVar) : null;
        return listW == null ? ey3.a : listW;
    }

    public void o0(AttributeSet attributeSet, int i) {
        int i2 = this.a;
        boolean z = true;
        Object obj = this.b;
        switch (i2) {
            case 1:
                AbsSeekBar absSeekBar = (AbsSeekBar) obj;
                vwa vwaVarX = vwa.x(absSeekBar.getContext(), attributeSet, d, i);
                Drawable drawableR = vwaVarX.r(0);
                if (drawableR != null) {
                    if (drawableR instanceof AnimationDrawable) {
                        AnimationDrawable animationDrawable = (AnimationDrawable) drawableR;
                        int numberOfFrames = animationDrawable.getNumberOfFrames();
                        AnimationDrawable animationDrawable2 = new AnimationDrawable();
                        animationDrawable2.setOneShot(animationDrawable.isOneShot());
                        for (int i3 = 0; i3 < numberOfFrames; i3++) {
                            Drawable drawableW0 = w0(animationDrawable.getFrame(i3), true);
                            drawableW0.setLevel(PhotoshopDirectory.TAG_PRINT_FLAGS_INFO);
                            animationDrawable2.addFrame(drawableW0, animationDrawable.getDuration(i3));
                        }
                        animationDrawable2.setLevel(PhotoshopDirectory.TAG_PRINT_FLAGS_INFO);
                        drawableR = animationDrawable2;
                    }
                    absSeekBar.setIndeterminateDrawable(drawableR);
                }
                Drawable drawableR2 = vwaVarX.r(1);
                if (drawableR2 != null) {
                    absSeekBar.setProgressDrawable(w0(drawableR2, false));
                }
                vwaVarX.C();
                return;
            default:
                TypedArray typedArrayObtainStyledAttributes = ((EditText) obj).getContext().obtainStyledAttributes(attributeSet, esa.i, i, 0);
                try {
                    if (typedArrayObtainStyledAttributes.hasValue(14)) {
                        z = typedArrayObtainStyledAttributes.getBoolean(14, true);
                        break;
                    }
                    typedArrayObtainStyledAttributes.recycle();
                    v0(z);
                    return;
                } catch (Throwable th) {
                    typedArrayObtainStyledAttributes.recycle();
                    throw th;
                }
        }
    }

    @Override // defpackage.cs1
    public void p(String str, SourceParameter sourceParameter) {
        int i = this.a;
        Object obj = this.b;
        str.getClass();
        switch (i) {
            case 22:
                ((b64) obj).a(str, sourceParameter);
                break;
            case 23:
            default:
                String strU = gp7.u(sourceParameter);
                ay4 ay4Var = (ay4) ((olb) obj).b;
                ay4Var.getClass();
                ay4Var.a.b(str, strU);
                break;
            case 24:
                String strU2 = gp7.u(sourceParameter);
                FindFriendsFragment findFriendsFragment = (FindFriendsFragment) ((rz2) obj).b;
                ((p13) findFriendsFragment.Z()).Q(findFriendsFragment.S(), str, strU2);
                break;
        }
    }

    public fx3 p0(InputConnection inputConnection, EditorInfo editorInfo) {
        InputConnection inputConnection2;
        rz2 rz2Var = (rz2) this.c;
        if (inputConnection == null) {
            inputConnection2 = null;
        } else {
            s26 s26Var = (s26) rz2Var.b;
            if (!(inputConnection instanceof fx3)) {
                inputConnection = new fx3((EditText) s26Var.b, inputConnection, editorInfo);
            }
            inputConnection2 = inputConnection;
        }
        return (fx3) inputConnection2;
    }

    @Override // defpackage.rx
    public Object r(j7a j7aVar, i6a i6aVar, mn6 mn6Var) {
        e5a e5aVar = (e5a) il7.z(i6aVar, ((r01) this.b).i);
        if (e5aVar == null) {
            return null;
        }
        return ((lig) this.c).m0(mn6Var, e5aVar, j7aVar.a);
    }

    @Override // defpackage.x31
    public Type s() {
        return (Type) this.b;
    }

    public void s0(qz4 qz4Var) {
        gq gqVar = (gq) this.c;
        qlb qlbVar = (qlb) this.b;
        int i = qz4Var.b;
        if (i != 0) {
            gqVar.execute(new u41(i, 0, qlbVar));
        } else {
            gqVar.execute(new p0g(qlbVar, 5, qz4Var.a));
        }
    }

    public Object t0(p4d p4dVar) {
        Object objC = ((o2b) this.c).C(p4dVar);
        return objC == tb2.COROUTINE_SUSPENDED ? objC : c1e.a;
    }

    @Override // defpackage.x31
    public Object u(sp8 sp8Var) {
        Executor executor = (Executor) this.c;
        return executor == null ? sp8Var : new kn7(executor, sp8Var);
    }

    public void u0() {
        try {
            ((FileLock) this.c).release();
            ((FileChannel) this.b).close();
        } catch (IOException e2) {
            Log.e("CrossProcessLock", "encountered error while releasing, ignoring", e2);
        }
    }

    public void v0(boolean z) {
        qx3 qx3Var = (qx3) ((s26) ((rz2) this.c).b).c;
        if (qx3Var.c != z) {
            if (qx3Var.b != null) {
                yw3 yw3VarA = yw3.a();
                px3 px3Var = qx3Var.b;
                yw3VarA.getClass();
                jq7.h("initCallback cannot be null", px3Var);
                ReentrantReadWriteLock reentrantReadWriteLock = yw3VarA.a;
                reentrantReadWriteLock.writeLock().lock();
                try {
                    yw3VarA.b.remove(px3Var);
                } finally {
                    reentrantReadWriteLock.writeLock().unlock();
                }
            }
            qx3Var.c = z;
            if (z) {
                qx3.a(qx3Var.a, yw3.a().c());
            }
        }
    }

    @Override // defpackage.cy
    public List w(j7a j7aVar, q1 q1Var, hx hxVar, int i, a7a a7aVar) {
        hxVar.getClass();
        a7aVar.getClass();
        Iterable iterable = (List) a7aVar.i(((r01) this.b).j);
        if (iterable == null) {
            iterable = ey3.a;
        }
        ArrayList arrayList = new ArrayList(cu1.k0(iterable, 10));
        Iterator it2 = iterable.iterator();
        while (it2.hasNext()) {
            arrayList.add(n0((h5a) it2.next(), j7aVar.a));
        }
        return arrayList;
    }

    public Drawable w0(Drawable drawable, boolean z) {
        if (!(drawable instanceof LayerDrawable)) {
            if (!(drawable instanceof BitmapDrawable)) {
                return drawable;
            }
            BitmapDrawable bitmapDrawable = (BitmapDrawable) drawable;
            Bitmap bitmap = bitmapDrawable.getBitmap();
            if (((Bitmap) this.c) == null) {
                this.c = bitmap;
            }
            ShapeDrawable shapeDrawable = new ShapeDrawable(new RoundRectShape(new float[]{5.0f, 5.0f, 5.0f, 5.0f, 5.0f, 5.0f, 5.0f, 5.0f}, null, null));
            shapeDrawable.getPaint().setShader(new BitmapShader(bitmap, Shader.TileMode.REPEAT, Shader.TileMode.CLAMP));
            shapeDrawable.getPaint().setColorFilter(bitmapDrawable.getPaint().getColorFilter());
            return z ? new ClipDrawable(shapeDrawable, 3, 1) : shapeDrawable;
        }
        LayerDrawable layerDrawable = (LayerDrawable) drawable;
        int numberOfLayers = layerDrawable.getNumberOfLayers();
        Drawable[] drawableArr = new Drawable[numberOfLayers];
        for (int i = 0; i < numberOfLayers; i++) {
            int id = layerDrawable.getId(i);
            drawableArr[i] = w0(layerDrawable.getDrawable(i), id == 16908301 || id == 16908303);
        }
        LayerDrawable layerDrawable2 = new LayerDrawable(drawableArr);
        for (int i2 = 0; i2 < numberOfLayers; i2++) {
            layerDrawable2.setId(i2, layerDrawable.getId(i2));
            layerDrawable2.setLayerGravity(i2, layerDrawable.getLayerGravity(i2));
            layerDrawable2.setLayerWidth(i2, layerDrawable.getLayerWidth(i2));
            layerDrawable2.setLayerHeight(i2, layerDrawable.getLayerHeight(i2));
            layerDrawable2.setLayerInsetLeft(i2, layerDrawable.getLayerInsetLeft(i2));
            layerDrawable2.setLayerInsetRight(i2, layerDrawable.getLayerInsetRight(i2));
            layerDrawable2.setLayerInsetTop(i2, layerDrawable.getLayerInsetTop(i2));
            layerDrawable2.setLayerInsetBottom(i2, layerDrawable.getLayerInsetBottom(i2));
            layerDrawable2.setLayerInsetStart(i2, layerDrawable.getLayerInsetStart(i2));
            layerDrawable2.setLayerInsetEnd(i2, layerDrawable.getLayerInsetEnd(i2));
        }
        return layerDrawable2;
    }

    @Override // defpackage.cy
    public ArrayList x(x6a x6aVar, p98 p98Var) {
        x6aVar.getClass();
        p98Var.getClass();
        Iterable iterable = (List) x6aVar.i(((r01) this.b).l);
        if (iterable == null) {
            iterable = ey3.a;
        }
        ArrayList arrayList = new ArrayList(cu1.k0(iterable, 10));
        Iterator it2 = iterable.iterator();
        while (it2.hasNext()) {
            arrayList.add(n0((h5a) it2.next(), p98Var));
        }
        return arrayList;
    }

    public void x0(String str, String str2, String str3, String str4) {
        b09.I(str, str2, str4);
        rqd.a((rqd) this.b, new UserPresented(null, Boolean.TRUE, str, null, null, null, 57, null), str2, str3, false, null, str4, 24);
    }

    @Override // defpackage.cs1
    public void y(String str, SourceParameter sourceParameter) {
        int i = this.a;
        str.getClass();
        switch (i) {
            case 22:
                f74 f74Var = (f74) this.c;
                if (f74Var.w.add(str)) {
                    f74Var.h.g(str, f74Var.b, gp7.u(sourceParameter), f74Var.o);
                }
                break;
            case 23:
            default:
                sy4 sy4Var = (sy4) this.c;
                if (sy4Var.i.add(str)) {
                    sy4Var.f.x0(str, sy4Var.c, gp7.u(sourceParameter), sy4Var.j);
                }
                break;
            case 24:
                fj4 fj4Var = (fj4) this.c;
                if (fj4Var.D.add(str)) {
                    fj4Var.h.x0(str, fj4Var.b, gp7.u(sourceParameter), fj4Var.y);
                }
                break;
        }
    }

    public void y0(String str, String str2, String str3, String str4) {
        b09.I(str, str2, str4);
        rqd.a((rqd) this.b, new UserFollowed(null, str, str3, Boolean.TRUE, null, 17, null), str2, str3, false, null, str4, 24);
    }

    @Override // defpackage.cy
    public List z(j7a j7aVar, v5a v5aVar) {
        j7aVar.getClass();
        Iterable iterable = (List) v5aVar.i(((r01) this.b).h);
        if (iterable == null) {
            iterable = ey3.a;
        }
        ArrayList arrayList = new ArrayList(cu1.k0(iterable, 10));
        Iterator it2 = iterable.iterator();
        while (it2.hasNext()) {
            arrayList.add(n0((h5a) it2.next(), j7aVar.a));
        }
        return arrayList;
    }

    public void z0() {
        synchronized (this) {
            ((AtomicInteger) this.b).decrementAndGet();
            if (((AtomicInteger) this.b).get() < 0) {
                throw new IllegalStateException("Unbalanced call to unblock() detected.");
            }
        }
    }

    @Override // defpackage.cy
    public List J(j7a j7aVar, q1 q1Var, hx hxVar) {
        List list;
        r01 r01Var = (r01) this.b;
        hxVar.getClass();
        if (q1Var instanceof n5a) {
            list = (List) ((n5a) q1Var).i(r01Var.b);
        } else if (q1Var instanceof a6a) {
            list = (List) ((a6a) q1Var).i(r01Var.d);
        } else {
            if (!(q1Var instanceof i6a)) {
                ik4.m(ziYqbdHrAXvj.QoknaXFaZfetx, q1Var);
                return null;
            }
            int i = y.a[hxVar.ordinal()];
            if (i == 1) {
                list = (List) ((i6a) q1Var).i(r01Var.e);
            } else if (i == 2) {
                list = (List) ((i6a) q1Var).i(r01Var.f);
            } else {
                if (i != 3) {
                    ygf.f("Unsupported callable kind with property proto");
                    return null;
                }
                list = (List) ((i6a) q1Var).i(r01Var.g);
            }
        }
        if (list == null) {
            list = ey3.a;
        }
        ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            arrayList.add(n0((h5a) it2.next(), j7aVar.a));
        }
        return arrayList;
    }

    public s26(String str, f49 f49Var, u3b u3bVar) {
        this.a = 7;
        this.c = str;
        this.b = f49Var;
    }

    public s26(yad yadVar, int i) {
        this.a = i;
        switch (i) {
            case 29:
                this.b = yadVar;
                this.c = new o2b(0);
                break;
            default:
                this.b = yadVar;
                this.c = new my6(26, false);
                break;
        }
    }

    public s26(b38 b38Var, n0c n0cVar, r01 r01Var) {
        this.a = 6;
        b38Var.getClass();
        r01Var.getClass();
        this.b = r01Var;
        this.c = new lig(b38Var, n0cVar);
    }

    public s26() {
        this.a = 20;
        this.b = new tre();
        this.c = new tre();
    }

    public s26(bh4 bh4Var) {
        this.a = 2;
        this.b = bh4Var;
        this.c = e;
    }

    public s26(xib xibVar) {
        this.a = 13;
        this.b = new AtomicInteger(0);
        this.c = new AtomicBoolean(false);
    }

    public s26(AbsSeekBar absSeekBar) {
        this.a = 1;
        this.b = absSeekBar;
    }

    public /* synthetic */ s26(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    public s26(View view) {
        this.a = 0;
        this.b = view;
        this.c = vx0.d0(yw6.NONE, new em4(11, this));
    }

    public s26(w73 w73Var, bnb bnbVar) {
        this.a = 10;
        bnbVar.getClass();
        this.c = w73Var;
        this.b = bnbVar;
    }

    public s26(Animation animation) {
        this.a = 26;
        this.b = animation;
        this.c = null;
    }

    public s26(Animator animator) {
        this.a = 26;
        this.b = null;
        this.c = animator;
    }

    public s26(l75 l75Var) {
        this.a = 27;
        zf4 zf4Var = l75Var.a;
        zf4Var.getClass();
        Iterator it2 = ((s70) zf4Var.a.entrySet()).iterator();
        this.b = it2;
        if (it2.hasNext()) {
            this.c = (Map.Entry) it2.next();
        }
    }
}
