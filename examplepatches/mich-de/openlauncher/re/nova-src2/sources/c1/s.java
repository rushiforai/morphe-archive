package c1;

import android.os.Build;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.Handler;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.inputmethod.BaseInputConnection;
import android.view.inputmethod.CompletionInfo;
import android.view.inputmethod.CorrectionInfo;
import android.view.inputmethod.DeleteGesture;
import android.view.inputmethod.DeleteRangeGesture;
import android.view.inputmethod.ExtractedText;
import android.view.inputmethod.ExtractedTextRequest;
import android.view.inputmethod.HandwritingGesture;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputContentInfo;
import android.view.inputmethod.InsertGesture;
import android.view.inputmethod.JoinOrSplitGesture;
import android.view.inputmethod.PreviewableHandwritingGesture;
import android.view.inputmethod.RemoveSpaceGesture;
import android.view.inputmethod.SelectGesture;
import android.view.inputmethod.SelectRangeGesture;
import b00.p0;
import c3.n3;
import e1.a1;
import e10.z2;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.concurrent.Executor;
import java.util.function.IntConsumer;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.text.Regex;
import m3.j0;
import m3.k0;
import m3.l0;
import m3.o0;
import p10.c0;
import p10.y1;
import r3.w;
import r3.x;
import r3.y;
import r3.z;
import t0.w1;
import t0.y0;

/* loaded from: classes2.dex */
public final class s implements InputConnection {

    /* renamed from: a, reason: collision with root package name */
    public final a5.d f19134a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f19135b;

    /* renamed from: c, reason: collision with root package name */
    public final y0 f19136c;

    /* renamed from: d, reason: collision with root package name */
    public final a1 f19137d;

    /* renamed from: e, reason: collision with root package name */
    public final n3 f19138e;

    /* renamed from: f, reason: collision with root package name */
    public int f19139f;

    /* renamed from: g, reason: collision with root package name */
    public z f19140g;

    /* renamed from: h, reason: collision with root package name */
    public int f19141h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f19142i;

    /* renamed from: j, reason: collision with root package name */
    public final ArrayList f19143j = new ArrayList();

    /* renamed from: k, reason: collision with root package name */
    public boolean f19144k = true;

    public s(z zVar, a5.d dVar, boolean z11, y0 y0Var, a1 a1Var, n3 n3Var) {
        this.f19134a = dVar;
        this.f19135b = z11;
        this.f19136c = y0Var;
        this.f19137d = a1Var;
        this.f19138e = n3Var;
        this.f19140g = zVar;
    }

    public final void a(r3.h hVar) {
        this.f19139f++;
        try {
            this.f19143j.add(hVar);
        } finally {
            b();
        }
    }

    public final boolean b() {
        int i5 = this.f19139f - 1;
        this.f19139f = i5;
        if (i5 == 0) {
            ArrayList arrayList = this.f19143j;
            if (!arrayList.isEmpty()) {
                ((r) this.f19134a.f267b).f19123c.invoke(b70.g.K1(arrayList));
                arrayList.clear();
            }
        }
        return this.f19139f > 0;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean beginBatchEdit() {
        boolean z11 = this.f19144k;
        if (!z11) {
            return z11;
        }
        this.f19139f++;
        return true;
    }

    public final void c(int i5) {
        sendKeyEvent(new KeyEvent(0, i5));
        sendKeyEvent(new KeyEvent(1, i5));
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean clearMetaKeyStates(int i5) {
        boolean z11 = this.f19144k;
        if (z11) {
            return false;
        }
        return z11;
    }

    @Override // android.view.inputmethod.InputConnection
    public final void closeConnection() {
        this.f19143j.clear();
        this.f19139f = 0;
        this.f19144k = false;
        ArrayList arrayList = ((r) this.f19134a.f267b).f19130j;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            if (Intrinsics.b(((WeakReference) arrayList.get(i5)).get(), this)) {
                arrayList.remove(i5);
                return;
            }
        }
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean commitCompletion(CompletionInfo completionInfo) {
        boolean z11 = this.f19144k;
        if (z11) {
            return false;
        }
        return z11;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean commitContent(InputContentInfo inputContentInfo, int i5, Bundle bundle) {
        boolean z11 = this.f19144k;
        if (z11) {
            return false;
        }
        return z11;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean commitCorrection(CorrectionInfo correctionInfo) {
        boolean z11 = this.f19144k;
        return z11 ? this.f19135b : z11;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean commitText(CharSequence charSequence, int i5) {
        boolean z11 = this.f19144k;
        if (z11) {
            a(new r3.a(String.valueOf(charSequence), i5));
        }
        return z11;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean deleteSurroundingText(int i5, int i11) {
        boolean z11 = this.f19144k;
        if (!z11) {
            return z11;
        }
        a(new r3.f(i5, i11));
        return true;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean deleteSurroundingTextInCodePoints(int i5, int i11) {
        boolean z11 = this.f19144k;
        if (!z11) {
            return z11;
        }
        a(new r3.g(i5, i11));
        return true;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean endBatchEdit() {
        return b();
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean finishComposingText() {
        boolean z11 = this.f19144k;
        if (!z11) {
            return z11;
        }
        a(new r3.k());
        return true;
    }

    @Override // android.view.inputmethod.InputConnection
    public final int getCursorCapsMode(int i5) {
        z zVar = this.f19140g;
        return TextUtils.getCapsMode(zVar.f85471a.f75880b, o0.f(zVar.f85472b), i5);
    }

    @Override // android.view.inputmethod.InputConnection
    public final ExtractedText getExtractedText(ExtractedTextRequest extractedTextRequest, int i5) {
        boolean z11 = (i5 & 1) != 0;
        this.f19142i = z11;
        if (z11) {
            this.f19141h = extractedTextRequest != null ? extractedTextRequest.token : 0;
        }
        return c0.r(this.f19140g);
    }

    @Override // android.view.inputmethod.InputConnection
    public final Handler getHandler() {
        return null;
    }

    @Override // android.view.inputmethod.InputConnection
    public final CharSequence getSelectedText(int i5) {
        if (o0.c(this.f19140g.f85472b)) {
            return null;
        }
        return y1.Q(this.f19140g).f75880b;
    }

    @Override // android.view.inputmethod.InputConnection
    public final CharSequence getTextAfterCursor(int i5, int i11) {
        return y1.T(this.f19140g, i5).f75880b;
    }

    @Override // android.view.inputmethod.InputConnection
    public final CharSequence getTextBeforeCursor(int i5, int i11) {
        return y1.U(this.f19140g, i5).f75880b;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean performContextMenuAction(int i5) {
        boolean z11 = this.f19144k;
        if (z11) {
            z11 = false;
            switch (i5) {
                case 16908319:
                    a(new y(0, this.f19140g.f85471a.f75880b.length()));
                    break;
                case 16908320:
                    c(277);
                    return false;
                case 16908321:
                    c(278);
                    return false;
                case 16908322:
                    c(279);
                    return false;
                default:
                    return false;
            }
        }
        return z11;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean performEditorAction(int i5) {
        int i11;
        boolean z11 = this.f19144k;
        if (z11) {
            z11 = true;
            if (i5 != 0) {
                switch (i5) {
                    case 2:
                        i11 = 2;
                        break;
                    case 3:
                        i11 = 3;
                        break;
                    case 4:
                        i11 = 4;
                        break;
                    case 5:
                        i11 = 6;
                        break;
                    case 6:
                        i11 = 7;
                        break;
                    case 7:
                        i11 = 5;
                        break;
                    default:
                        Log.w("RecordingIC", "IME sends unsupported Editor Action: " + i5);
                        i11 = 1;
                        break;
                }
                ((r) this.f19134a.f267b).f19124d.invoke(new r3.l(i11));
            } else {
                i11 = 1;
                ((r) this.f19134a.f267b).f19124d.invoke(new r3.l(i11));
            }
        }
        return z11;
    }

    /* JADX WARN: Removed duplicated region for block: B:129:0x02c9  */
    @Override // android.view.inputmethod.InputConnection
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void performHandwritingGesture(HandwritingGesture handwritingGesture, Executor executor, IntConsumer intConsumer) {
        m3.g gVar;
        long jH;
        int i5;
        int iL;
        w1 w1VarD;
        int iL2;
        w1 w1VarD2;
        k0 k0Var;
        if (Build.VERSION.SDK_INT >= 34) {
            a1.e eVar = new a1.e(this, 11);
            y0 y0Var = this.f19136c;
            int iA = 3;
            if (y0Var != null && (gVar = y0Var.f88288j) != null) {
                w1 w1VarD3 = y0Var.d();
                if (gVar.equals((w1VarD3 == null || (k0Var = w1VarD3.f88262a.f75927a) == null) ? null : k0Var.f75914a)) {
                    boolean zV = ab.j.v(handwritingGesture);
                    a1 a1Var = this.f19137d;
                    if (zV) {
                        SelectGesture selectGestureQ = i.q(handwritingGesture);
                        long jE = jk.b.E(y0Var, g90.k.o0(selectGestureQ.getSelectionArea()), selectGestureQ.getGranularity() == 1 ? 1 : 0);
                        if (o0.c(jE)) {
                            iA = k.a(i.o(selectGestureQ), eVar);
                        } else {
                            eVar.invoke(new y((int) (jE >> 32), (int) (jE & 4294967295L)));
                            if (a1Var != null) {
                                a1Var.j(true);
                            }
                            iA = 1;
                        }
                    } else if (i.y(handwritingGesture)) {
                        DeleteGesture deleteGestureM = i.m(handwritingGesture);
                        int i11 = deleteGestureM.getGranularity() != 1 ? 0 : 1;
                        long jE2 = jk.b.E(y0Var, g90.k.o0(deleteGestureM.getDeletionArea()), i11);
                        if (o0.c(jE2)) {
                            iA = k.a(i.o(deleteGestureM), eVar);
                        } else {
                            k.b(jE2, gVar, i11 == 1, eVar);
                            iA = 1;
                        }
                    } else if (i.C(handwritingGesture)) {
                        SelectRangeGesture selectRangeGestureR = i.r(handwritingGesture);
                        long jM = jk.b.m(y0Var, g90.k.o0(selectRangeGestureR.getSelectionStartArea()), g90.k.o0(selectRangeGestureR.getSelectionEndArea()), selectRangeGestureR.getGranularity() == 1 ? 1 : 0);
                        if (o0.c(jM)) {
                            iA = k.a(i.o(selectRangeGestureR), eVar);
                        } else {
                            eVar.invoke(new y((int) (jM >> 32), (int) (jM & 4294967295L)));
                            if (a1Var != null) {
                                a1Var.j(true);
                            }
                            iA = 1;
                        }
                    } else if (i.D(handwritingGesture)) {
                        DeleteRangeGesture deleteRangeGestureN = i.n(handwritingGesture);
                        int i12 = deleteRangeGestureN.getGranularity() != 1 ? 0 : 1;
                        long jM2 = jk.b.m(y0Var, g90.k.o0(deleteRangeGestureN.getDeletionStartArea()), g90.k.o0(deleteRangeGestureN.getDeletionEndArea()), i12);
                        if (o0.c(jM2)) {
                            iA = k.a(i.o(deleteRangeGestureN), eVar);
                        } else {
                            k.b(jM2, gVar, i12 == 1, eVar);
                            iA = 1;
                        }
                    } else {
                        boolean z11 = ab.j.z(handwritingGesture);
                        n3 n3Var = this.f19138e;
                        if (z11) {
                            JoinOrSplitGesture joinOrSplitGestureP = i.p(handwritingGesture);
                            if (n3Var == null || (iL2 = jk.b.l(y0Var, jk.b.o(joinOrSplitGestureP.getJoinOrSplitPoint()), n3Var)) == -1 || ((w1VarD2 = y0Var.d()) != null && jk.b.n(w1VarD2.f88262a, iL2))) {
                                iA = k.a(i.o(joinOrSplitGestureP), eVar);
                            } else {
                                int iCharCount = iL2;
                                while (iCharCount > 0) {
                                    int iCodePointBefore = Character.codePointBefore(gVar, iCharCount);
                                    if (!jk.b.M(iCodePointBefore)) {
                                        break;
                                    } else {
                                        iCharCount -= Character.charCount(iCodePointBefore);
                                    }
                                }
                                while (iL2 < gVar.f75880b.length()) {
                                    int iCodePointAt = Character.codePointAt(gVar, iL2);
                                    if (!jk.b.M(iCodePointAt)) {
                                        break;
                                    } else {
                                        iL2 += Character.charCount(iCodePointAt);
                                    }
                                }
                                long jU = z2.u(iCharCount, iL2);
                                if (o0.c(jU)) {
                                    int i13 = (int) (jU >> 32);
                                    eVar.invoke(new l(new r3.h[]{new y(i13, i13), new r3.a(" ", 1)}));
                                } else {
                                    k.b(jU, gVar, false, eVar);
                                }
                                iA = 1;
                            }
                        } else if (ab.j.s(handwritingGesture)) {
                            InsertGesture insertGestureK = ab.j.k(handwritingGesture);
                            if (n3Var == null || (iL = jk.b.l(y0Var, jk.b.o(insertGestureK.getInsertionPoint()), n3Var)) == -1 || ((w1VarD = y0Var.d()) != null && jk.b.n(w1VarD.f88262a, iL))) {
                                iA = k.a(i.o(insertGestureK), eVar);
                            } else {
                                eVar.invoke(new l(new r3.h[]{new y(iL, iL), new r3.a(insertGestureK.getTextToInsert(), 1)}));
                                iA = 1;
                            }
                        } else if (ab.j.x(handwritingGesture)) {
                            RemoveSpaceGesture removeSpaceGestureL = ab.j.l(handwritingGesture);
                            w1 w1VarD4 = y0Var.d();
                            l0 l0Var = w1VarD4 != null ? w1VarD4.f88262a : null;
                            long jO = jk.b.o(removeSpaceGestureL.getStartPoint());
                            long jO2 = jk.b.o(removeSpaceGestureL.getEndPoint());
                            z2.y yVarC = y0Var.c();
                            if (l0Var != null) {
                                m3.p pVar = l0Var.f75928b;
                                if (yVarC == null) {
                                    jH = o0.f75944b;
                                } else {
                                    long jMo108screenToLocalMKHz9U = yVarC.mo108screenToLocalMKHz9U(jO);
                                    long jMo108screenToLocalMKHz9U2 = yVarC.mo108screenToLocalMKHz9U(jO2);
                                    int iD = jk.b.D(pVar, jMo108screenToLocalMKHz9U, n3Var);
                                    int iD2 = jk.b.D(pVar, jMo108screenToLocalMKHz9U2, n3Var);
                                    if (iD != -1) {
                                        if (iD2 != -1) {
                                            iD = Math.min(iD, iD2);
                                        }
                                        iD2 = iD;
                                    } else if (iD2 == -1) {
                                        jH = o0.f75944b;
                                    }
                                    float fB = (pVar.b(iD2) + pVar.f(iD2)) / 2;
                                    int i14 = (int) (jMo108screenToLocalMKHz9U >> 32);
                                    int i15 = (int) (jMo108screenToLocalMKHz9U2 >> 32);
                                    jH = pVar.h(new h2.c(Math.min(Float.intBitsToFloat(i14), Float.intBitsToFloat(i15)), fB - 0.1f, Math.max(Float.intBitsToFloat(i14), Float.intBitsToFloat(i15)), fB + 0.1f), 0, j0.f75912a);
                                }
                                if (o0.c(jH)) {
                                    iA = k.a(i.o(removeSpaceGestureL), eVar);
                                } else {
                                    Ref.IntRef intRef = new Ref.IntRef();
                                    intRef.f71861a = -1;
                                    Ref.IntRef intRef2 = new Ref.IntRef();
                                    intRef2.f71861a = -1;
                                    String strG = new Regex("\\s+").g(gVar.subSequence(o0.f(jH), o0.e(jH)).f75880b, new p0(8, intRef, intRef2));
                                    int i16 = intRef.f71861a;
                                    if (i16 == -1 || (i5 = intRef2.f71861a) == -1) {
                                        iA = k.a(i.o(removeSpaceGestureL), eVar);
                                    } else {
                                        int i17 = (int) (jH >> 32);
                                        String strSubstring = strG.substring(i16, strG.length() - (o0.d(jH) - intRef2.f71861a));
                                        Intrinsics.f(strSubstring, "substring(...)");
                                        eVar.invoke(new l(new r3.h[]{new y(i17 + i16, i17 + i5), new r3.a(strSubstring, 1)}));
                                        iA = 1;
                                    }
                                }
                            }
                        } else {
                            iA = 2;
                        }
                    }
                }
            }
            if (intConsumer == null) {
                return;
            }
            if (executor != null) {
                executor.execute(new ab.k(intConsumer, iA, 2));
            } else {
                intConsumer.accept(iA);
            }
        }
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean performPrivateCommand(String str, Bundle bundle) {
        boolean z11 = this.f19144k;
        if (z11) {
            return true;
        }
        return z11;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean previewHandwritingGesture(PreviewableHandwritingGesture previewableHandwritingGesture, CancellationSignal cancellationSignal) {
        y0 y0Var;
        m3.g gVar;
        k0 k0Var;
        if (Build.VERSION.SDK_INT >= 34 && (y0Var = this.f19136c) != null && (gVar = y0Var.f88288j) != null) {
            w1 w1VarD = y0Var.d();
            if (gVar.equals((w1VarD == null || (k0Var = w1VarD.f88262a.f75927a) == null) ? null : k0Var.f75914a)) {
                boolean zV = ab.j.v(previewableHandwritingGesture);
                a1 a1Var = this.f19137d;
                if (zV) {
                    SelectGesture selectGestureQ = i.q(previewableHandwritingGesture);
                    if (a1Var != null) {
                        long jE = jk.b.E(y0Var, g90.k.o0(selectGestureQ.getSelectionArea()), selectGestureQ.getGranularity() != 1 ? 0 : 1);
                        y0 y0Var2 = a1Var.f51232d;
                        if (y0Var2 != null) {
                            y0Var2.f(jE);
                        }
                        y0 y0Var3 = a1Var.f51232d;
                        if (y0Var3 != null) {
                            y0Var3.e(o0.f75944b);
                        }
                        if (!o0.c(jE)) {
                            a1Var.u(false);
                            a1Var.r(t0.k0.f88058a);
                        }
                    }
                } else if (i.y(previewableHandwritingGesture)) {
                    DeleteGesture deleteGestureM = i.m(previewableHandwritingGesture);
                    if (a1Var != null) {
                        long jE2 = jk.b.E(y0Var, g90.k.o0(deleteGestureM.getDeletionArea()), deleteGestureM.getGranularity() != 1 ? 0 : 1);
                        y0 y0Var4 = a1Var.f51232d;
                        if (y0Var4 != null) {
                            y0Var4.e(jE2);
                        }
                        y0 y0Var5 = a1Var.f51232d;
                        if (y0Var5 != null) {
                            y0Var5.f(o0.f75944b);
                        }
                        if (!o0.c(jE2)) {
                            a1Var.u(false);
                            a1Var.r(t0.k0.f88058a);
                        }
                    }
                } else if (i.C(previewableHandwritingGesture)) {
                    SelectRangeGesture selectRangeGestureR = i.r(previewableHandwritingGesture);
                    if (a1Var != null) {
                        long jM = jk.b.m(y0Var, g90.k.o0(selectRangeGestureR.getSelectionStartArea()), g90.k.o0(selectRangeGestureR.getSelectionEndArea()), selectRangeGestureR.getGranularity() != 1 ? 0 : 1);
                        y0 y0Var6 = a1Var.f51232d;
                        if (y0Var6 != null) {
                            y0Var6.f(jM);
                        }
                        y0 y0Var7 = a1Var.f51232d;
                        if (y0Var7 != null) {
                            y0Var7.e(o0.f75944b);
                        }
                        if (!o0.c(jM)) {
                            a1Var.u(false);
                            a1Var.r(t0.k0.f88058a);
                        }
                    }
                } else if (i.D(previewableHandwritingGesture)) {
                    DeleteRangeGesture deleteRangeGestureN = i.n(previewableHandwritingGesture);
                    if (a1Var != null) {
                        long jM2 = jk.b.m(y0Var, g90.k.o0(deleteRangeGestureN.getDeletionStartArea()), g90.k.o0(deleteRangeGestureN.getDeletionEndArea()), deleteRangeGestureN.getGranularity() != 1 ? 0 : 1);
                        y0 y0Var8 = a1Var.f51232d;
                        if (y0Var8 != null) {
                            y0Var8.e(jM2);
                        }
                        y0 y0Var9 = a1Var.f51232d;
                        if (y0Var9 != null) {
                            y0Var9.f(o0.f75944b);
                        }
                        if (!o0.c(jM2)) {
                            a1Var.u(false);
                            a1Var.r(t0.k0.f88058a);
                        }
                    }
                }
                if (cancellationSignal != null) {
                    cancellationSignal.setOnCancelListener(new j(a1Var, 0));
                }
                return true;
            }
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean reportFullscreenMode(boolean z11) {
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:57:0x005b A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // android.view.inputmethod.InputConnection
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean requestCursorUpdates(int i5) {
        boolean z11;
        boolean z12;
        boolean z13;
        o oVar;
        boolean z14 = this.f19144k;
        if (!z14) {
            return z14;
        }
        boolean z15 = false;
        boolean z16 = (i5 & 1) != 0;
        boolean z17 = (i5 & 2) != 0;
        int i11 = Build.VERSION.SDK_INT;
        if (i11 >= 33) {
            z12 = (i5 & 16) != 0;
            z13 = (i5 & 8) != 0;
            boolean z18 = (i5 & 4) != 0;
            if (i11 >= 34 && (i5 & 32) != 0) {
                z15 = true;
            }
            if (z12 || z13 || z18 || z15) {
                z11 = z15;
                z15 = z18;
                oVar = ((r) this.f19134a.f267b).f19133m;
                synchronized (oVar.f19106c) {
                    try {
                        oVar.f19109f = z12;
                        oVar.f19110g = z13;
                        oVar.f19111h = z15;
                        oVar.f19112i = z11;
                        if (z16) {
                            oVar.f19108e = true;
                            if (oVar.f19113j != null) {
                                oVar.a();
                            }
                        }
                        oVar.f19107d = z17;
                        Unit unit = Unit.f71706a;
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return true;
            }
            if (i11 >= 34) {
                z11 = true;
                z15 = true;
            } else {
                z11 = z15;
                z15 = true;
            }
            z12 = z15;
        } else {
            z11 = false;
            z12 = true;
        }
        z13 = z12;
        oVar = ((r) this.f19134a.f267b).f19133m;
        synchronized (oVar.f19106c) {
        }
    }

    /* JADX WARN: Type inference failed for: r0v4, types: [java.lang.Object, kotlin.Lazy] */
    @Override // android.view.inputmethod.InputConnection
    public final boolean sendKeyEvent(KeyEvent keyEvent) {
        boolean z11 = this.f19144k;
        if (!z11) {
            return z11;
        }
        ((BaseInputConnection) ((r) this.f19134a.f267b).f19131k.getValue()).sendKeyEvent(keyEvent);
        return true;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean setComposingRegion(int i5, int i11) {
        boolean z11 = this.f19144k;
        if (z11) {
            a(new w(i5, i11));
        }
        return z11;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean setComposingText(CharSequence charSequence, int i5) {
        boolean z11 = this.f19144k;
        if (z11) {
            a(new x(String.valueOf(charSequence), i5));
        }
        return z11;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean setSelection(int i5, int i11) {
        boolean z11 = this.f19144k;
        if (!z11) {
            return z11;
        }
        a(new y(i5, i11));
        return true;
    }
}
