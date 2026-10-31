package l1;

import androidx.compose.ui.node.LayoutNode;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.Map;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes.dex */
public abstract class g9 {

    /* renamed from: a, reason: collision with root package name */
    public static final p1.m0 f73360a = new p1.m0(e1.f73233p);

    public static final void a(m3.p0 p0Var, Function2 function2, p1.o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        tVar.d0(-460300127);
        int i11 = (tVar.f(p0Var) ? 4 : 2) | i5;
        if ((i5 & 48) == 0) {
            i11 |= tVar.h(function2) ? 32 : 16;
        }
        if ((i11 & 19) == 18 && tVar.E()) {
            tVar.V();
        } else {
            p1.m0 m0Var = f73360a;
            p1.a0.a(m0Var.a(((m3.p0) tVar.j(m0Var)).d(p0Var)), function2, tVar, (i11 & 112) | 8);
        }
        p1.t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new c7(p0Var, function2, i5);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:105:0x0140  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x0145  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x0161  */
    /* JADX WARN: Removed duplicated region for block: B:118:0x0168  */
    /* JADX WARN: Removed duplicated region for block: B:128:0x0187  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x018c  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x01a5  */
    /* JADX WARN: Removed duplicated region for block: B:140:0x01a8  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x01c7  */
    /* JADX WARN: Removed duplicated region for block: B:151:0x01ce  */
    /* JADX WARN: Removed duplicated region for block: B:159:0x01e7  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x01ec  */
    /* JADX WARN: Removed duplicated region for block: B:169:0x0201  */
    /* JADX WARN: Removed duplicated region for block: B:175:0x0212  */
    /* JADX WARN: Removed duplicated region for block: B:178:0x021e  */
    /* JADX WARN: Removed duplicated region for block: B:184:0x0251  */
    /* JADX WARN: Removed duplicated region for block: B:194:0x0283  */
    /* JADX WARN: Removed duplicated region for block: B:195:0x0285  */
    /* JADX WARN: Removed duplicated region for block: B:196:0x0288  */
    /* JADX WARN: Removed duplicated region for block: B:198:0x028c  */
    /* JADX WARN: Removed duplicated region for block: B:199:0x028f  */
    /* JADX WARN: Removed duplicated region for block: B:201:0x0293  */
    /* JADX WARN: Removed duplicated region for block: B:204:0x0298  */
    /* JADX WARN: Removed duplicated region for block: B:206:0x029b  */
    /* JADX WARN: Removed duplicated region for block: B:208:0x029e  */
    /* JADX WARN: Removed duplicated region for block: B:210:0x02a1  */
    /* JADX WARN: Removed duplicated region for block: B:211:0x02a4  */
    /* JADX WARN: Removed duplicated region for block: B:213:0x02a8  */
    /* JADX WARN: Removed duplicated region for block: B:214:0x02aa  */
    /* JADX WARN: Removed duplicated region for block: B:216:0x02ae  */
    /* JADX WARN: Removed duplicated region for block: B:217:0x02b0  */
    /* JADX WARN: Removed duplicated region for block: B:219:0x02b4  */
    /* JADX WARN: Removed duplicated region for block: B:220:0x02b7  */
    /* JADX WARN: Removed duplicated region for block: B:223:0x02bd  */
    /* JADX WARN: Removed duplicated region for block: B:224:0x02c0  */
    /* JADX WARN: Removed duplicated region for block: B:226:0x02c4  */
    /* JADX WARN: Removed duplicated region for block: B:228:0x02c8  */
    /* JADX WARN: Removed duplicated region for block: B:229:0x02cc  */
    /* JADX WARN: Removed duplicated region for block: B:232:0x02d1  */
    /* JADX WARN: Removed duplicated region for block: B:235:0x02d6  */
    /* JADX WARN: Removed duplicated region for block: B:238:0x02dc  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0043  */
    /* JADX WARN: Removed duplicated region for block: B:241:0x02f8  */
    /* JADX WARN: Removed duplicated region for block: B:242:0x02fb  */
    /* JADX WARN: Removed duplicated region for block: B:249:0x031e  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0048  */
    /* JADX WARN: Removed duplicated region for block: B:250:0x0321  */
    /* JADX WARN: Removed duplicated region for block: B:254:0x0393  */
    /* JADX WARN: Removed duplicated region for block: B:256:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0088  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00c7  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00cc  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x00e5  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00ea  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0102  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0107  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0120  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x0127  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void b(String str, b2.t tVar, long j11, long j12, q3.v vVar, q3.b0 b0Var, q3.p pVar, long j13, x3.l lVar, x3.k kVar, long j14, int i5, boolean z11, int i11, int i12, Function1 function1, m3.p0 p0Var, p1.o oVar, int i13, int i14, int i15) {
        int i16;
        int i17;
        int i18;
        long j15;
        int i19;
        q3.v vVar2;
        int i21;
        q3.b0 b0Var2;
        int i22;
        q3.p pVar2;
        int i23;
        int i24;
        int i25;
        int i26;
        int i27;
        int i28;
        int i29;
        int i31;
        int i32;
        boolean z12;
        int i33;
        int i34;
        int i35;
        int i36;
        int i37;
        b2.t tVar2;
        long j16;
        long j17;
        x3.l lVar2;
        x3.k kVar2;
        long j18;
        int i38;
        int i39;
        int i40;
        Function1 function12;
        m3.p0 p0Var2;
        long jB;
        p1.t tVar3;
        b2.t tVar4;
        m3.p0 p0Var3;
        q3.v vVar3;
        q3.p pVar3;
        int i41;
        int i42;
        long j19;
        boolean z13;
        Function1 function13;
        q3.b0 b0Var3;
        x3.k kVar3;
        x3.l lVar3;
        long j21;
        long j22;
        long j23;
        int i43;
        p1.t1 t1VarU;
        p1.t tVar5 = (p1.t) oVar;
        tVar5.d0(-2055108902);
        if ((i13 & 6) == 0) {
            i16 = (tVar5.f(str) ? 4 : 2) | i13;
        } else {
            i16 = i13;
        }
        int i44 = i15 & 2;
        if (i44 != 0) {
            i16 |= 48;
        } else {
            if ((i13 & 48) == 0) {
                i16 |= tVar5.f(tVar) ? 32 : 16;
            }
            i17 = i15 & 4;
            if (i17 == 0) {
                i16 |= 384;
            } else if ((i13 & 384) == 0) {
                i16 |= tVar5.e(j11) ? 256 : 128;
            }
            i18 = i15 & 8;
            if (i18 == 0) {
                i16 |= 3072;
                j15 = j12;
            } else {
                j15 = j12;
                if ((i13 & 3072) == 0) {
                    i16 |= tVar5.e(j15) ? 2048 : 1024;
                }
            }
            i19 = i15 & 16;
            int i45 = UserMetadata.MAX_INTERNAL_KEY_SIZE;
            if (i19 == 0) {
                i16 |= 24576;
            } else {
                if ((i13 & 24576) == 0) {
                    vVar2 = vVar;
                    i16 |= tVar5.f(vVar2) ? 16384 : 8192;
                }
                i21 = i15 & 32;
                int i46 = SQLiteDatabase.OPEN_SHAREDCACHE;
                if (i21 != 0) {
                    i16 |= 196608;
                    b0Var2 = b0Var;
                } else {
                    b0Var2 = b0Var;
                    if ((i13 & 196608) == 0) {
                        i16 |= tVar5.f(b0Var2) ? 131072 : 65536;
                    }
                }
                i22 = i15 & 64;
                int i47 = 524288;
                if (i22 != 0) {
                    i16 |= 1572864;
                    pVar2 = pVar;
                } else {
                    pVar2 = pVar;
                    if ((i13 & 1572864) == 0) {
                        i16 |= tVar5.f(pVar2) ? 1048576 : 524288;
                    }
                }
                i23 = i15 & 128;
                if (i23 != 0) {
                    i16 |= 12582912;
                } else if ((i13 & 12582912) == 0) {
                    i16 |= tVar5.e(j13) ? 8388608 : 4194304;
                }
                i24 = i15 & 256;
                if (i24 != 0) {
                    i16 |= 100663296;
                } else if ((i13 & 100663296) == 0) {
                    i16 |= tVar5.f(lVar) ? 67108864 : 33554432;
                }
                i25 = i15 & EventBridgeChannel.QUEUE_CAPACITY;
                if (i25 != 0) {
                    i16 |= 805306368;
                } else {
                    if ((i13 & 805306368) == 0) {
                        i26 = i25;
                        i16 |= tVar5.f(kVar) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456;
                    }
                    i27 = i15 & 1024;
                    if (i27 == 0) {
                        i28 = i14 | 6;
                    } else if ((i14 & 6) == 0) {
                        i28 = i14 | (tVar5.e(j14) ? 4 : 2);
                    } else {
                        i28 = i14;
                    }
                    i29 = i15 & 2048;
                    if (i29 == 0) {
                        i28 |= 48;
                        i31 = i29;
                    } else if ((i14 & 48) == 0) {
                        i31 = i29;
                        i28 |= tVar5.d(i5) ? 32 : 16;
                    } else {
                        i31 = i29;
                    }
                    int i48 = i28;
                    i32 = i15 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                    if (i32 == 0) {
                        i48 |= 384;
                    } else {
                        if ((i14 & 384) == 0) {
                            z12 = z11;
                            i48 |= tVar5.g(z12) ? 256 : 128;
                        }
                        i33 = i15 & UserMetadata.MAX_INTERNAL_KEY_SIZE;
                        if (i33 != 0) {
                            i34 = i48 | 3072;
                        } else {
                            int i49 = i48;
                            if ((i14 & 3072) == 0) {
                                i34 = i49 | (tVar5.d(i11) ? 2048 : 1024);
                            } else {
                                i34 = i49;
                            }
                        }
                        i35 = i15 & ReaderJsonLexerKt.BATCH_SIZE;
                        if (i35 == 0) {
                            i36 = i34;
                            if ((i14 & 24576) == 0) {
                                if (tVar5.d(i12)) {
                                    i45 = 16384;
                                }
                                i36 |= i45;
                            }
                            i37 = i15 & SQLiteDatabase.OPEN_NOMUTEX;
                            if (i37 == 0) {
                                i36 |= 196608;
                            } else if ((i14 & 196608) == 0) {
                                if (!tVar5.h(function1)) {
                                    i46 = 65536;
                                }
                                i36 |= i46;
                            }
                            if ((i14 & 1572864) == 0) {
                                if ((i15 & SQLiteDatabase.OPEN_FULLMUTEX) == 0 && tVar5.f(p0Var)) {
                                    i47 = 1048576;
                                }
                                i36 |= i47;
                            }
                            if ((i16 & 306783379) != 306783378 && (i36 & 599187) == 599186 && tVar5.E()) {
                                tVar5.V();
                                tVar4 = tVar;
                                lVar3 = lVar;
                                i43 = i5;
                                i41 = i11;
                                i42 = i12;
                                function13 = function1;
                                p0Var3 = p0Var;
                                tVar3 = tVar5;
                                z13 = z12;
                                vVar3 = vVar2;
                                j21 = j15;
                                b0Var3 = b0Var2;
                                pVar3 = pVar2;
                                j19 = j11;
                                j22 = j13;
                                kVar3 = kVar;
                                j23 = j14;
                            } else {
                                tVar5.X();
                                if ((i13 & 1) != 0 || tVar5.B()) {
                                    tVar2 = i44 == 0 ? b2.r.f17024a : tVar;
                                    j16 = i17 == 0 ? i2.s.f61147m : j11;
                                    if (i18 != 0) {
                                        j15 = y3.p.f96617c;
                                    }
                                    if (i19 != 0) {
                                        vVar2 = null;
                                    }
                                    if (i21 != 0) {
                                        b0Var2 = null;
                                    }
                                    if (i22 != 0) {
                                        pVar2 = null;
                                    }
                                    j17 = i23 == 0 ? y3.p.f96617c : j13;
                                    lVar2 = i24 == 0 ? null : lVar;
                                    kVar2 = i26 == 0 ? null : kVar;
                                    j18 = i27 == 0 ? y3.p.f96617c : j14;
                                    i38 = i31 == 0 ? 1 : i5;
                                    if (i32 != 0) {
                                        z12 = true;
                                    }
                                    i39 = i33 == 0 ? LayoutNode.NotPlacedPlaceOrder : i11;
                                    i40 = i35 == 0 ? i12 : 1;
                                    function12 = i37 == 0 ? function1 : null;
                                    if ((i15 & SQLiteDatabase.OPEN_FULLMUTEX) == 0) {
                                        p0Var2 = (m3.p0) tVar5.j(f73360a);
                                        i36 &= -3670017;
                                    }
                                    tVar5.q();
                                    tVar5.b0(-1827892941);
                                    b2.t tVar6 = tVar2;
                                    if (j16 != 16) {
                                        jB = j16;
                                    } else {
                                        tVar5.b0(-1827892168);
                                        jB = p0Var2.b();
                                        if (jB == 16) {
                                            jB = ((i2.s) tVar5.j(s1.f73932a)).f61148a;
                                        }
                                        tVar5.p(false);
                                    }
                                    tVar5.p(false);
                                    int i51 = i36 << 9;
                                    t0.t0.d(str, tVar6, m3.p0.e(p0Var2, jB, j15, b0Var2, vVar2, pVar2, j17, lVar2, kVar2 != null ? kVar2.f95019a : Integer.MIN_VALUE, j18, 16609104), function12, i38, z12, i39, i40, tVar5, (i16 & Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE) | ((i36 >> 6) & 7168) | (57344 & i51) | (458752 & i51) | (3670016 & i51) | (i51 & 29360128));
                                    tVar3 = tVar5;
                                    tVar4 = tVar6;
                                    p0Var3 = p0Var2;
                                    vVar3 = vVar2;
                                    pVar3 = pVar2;
                                    i41 = i39;
                                    i42 = i40;
                                    j19 = j16;
                                    z13 = z12;
                                    function13 = function12;
                                    b0Var3 = b0Var2;
                                    kVar3 = kVar2;
                                    lVar3 = lVar2;
                                    j21 = j15;
                                    j22 = j17;
                                    j23 = j18;
                                    i43 = i38;
                                } else {
                                    tVar5.V();
                                    if ((i15 & SQLiteDatabase.OPEN_FULLMUTEX) != 0) {
                                        i36 &= -3670017;
                                    }
                                    tVar2 = tVar;
                                    j16 = j11;
                                    j17 = j13;
                                    lVar2 = lVar;
                                    kVar2 = kVar;
                                    j18 = j14;
                                    i38 = i5;
                                    i39 = i11;
                                    i40 = i12;
                                    function12 = function1;
                                }
                                p0Var2 = p0Var;
                                tVar5.q();
                                tVar5.b0(-1827892941);
                                b2.t tVar62 = tVar2;
                                if (j16 != 16) {
                                }
                                tVar5.p(false);
                                int i512 = i36 << 9;
                                t0.t0.d(str, tVar62, m3.p0.e(p0Var2, jB, j15, b0Var2, vVar2, pVar2, j17, lVar2, kVar2 != null ? kVar2.f95019a : Integer.MIN_VALUE, j18, 16609104), function12, i38, z12, i39, i40, tVar5, (i16 & Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE) | ((i36 >> 6) & 7168) | (57344 & i512) | (458752 & i512) | (3670016 & i512) | (i512 & 29360128));
                                tVar3 = tVar5;
                                tVar4 = tVar62;
                                p0Var3 = p0Var2;
                                vVar3 = vVar2;
                                pVar3 = pVar2;
                                i41 = i39;
                                i42 = i40;
                                j19 = j16;
                                z13 = z12;
                                function13 = function12;
                                b0Var3 = b0Var2;
                                kVar3 = kVar2;
                                lVar3 = lVar2;
                                j21 = j15;
                                j22 = j17;
                                j23 = j18;
                                i43 = i38;
                            }
                            t1VarU = tVar3.u();
                            if (t1VarU == null) {
                                t1VarU.f81583d = new d9(str, tVar4, j19, j21, vVar3, b0Var3, pVar3, j22, lVar3, kVar3, j23, i43, z13, i41, i42, function13, p0Var3, i13, i14, i15);
                                return;
                            }
                            return;
                        }
                        i36 = i34 | 24576;
                        i37 = i15 & SQLiteDatabase.OPEN_NOMUTEX;
                        if (i37 == 0) {
                        }
                        if ((i14 & 1572864) == 0) {
                        }
                        if ((i16 & 306783379) != 306783378) {
                            tVar5.X();
                            if ((i13 & 1) != 0) {
                                if (i44 == 0) {
                                }
                                if (i17 == 0) {
                                }
                                if (i18 != 0) {
                                }
                                if (i19 != 0) {
                                }
                                if (i21 != 0) {
                                }
                                if (i22 != 0) {
                                }
                                if (i23 == 0) {
                                }
                                if (i24 == 0) {
                                }
                                if (i26 == 0) {
                                }
                                if (i27 == 0) {
                                }
                                if (i31 == 0) {
                                }
                                if (i32 != 0) {
                                }
                                if (i33 == 0) {
                                }
                                if (i35 == 0) {
                                }
                                if (i37 == 0) {
                                }
                                if ((i15 & SQLiteDatabase.OPEN_FULLMUTEX) == 0) {
                                    p0Var2 = p0Var;
                                }
                                tVar5.q();
                                tVar5.b0(-1827892941);
                                b2.t tVar622 = tVar2;
                                if (j16 != 16) {
                                }
                                tVar5.p(false);
                                int i5122 = i36 << 9;
                                t0.t0.d(str, tVar622, m3.p0.e(p0Var2, jB, j15, b0Var2, vVar2, pVar2, j17, lVar2, kVar2 != null ? kVar2.f95019a : Integer.MIN_VALUE, j18, 16609104), function12, i38, z12, i39, i40, tVar5, (i16 & Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE) | ((i36 >> 6) & 7168) | (57344 & i5122) | (458752 & i5122) | (3670016 & i5122) | (i5122 & 29360128));
                                tVar3 = tVar5;
                                tVar4 = tVar622;
                                p0Var3 = p0Var2;
                                vVar3 = vVar2;
                                pVar3 = pVar2;
                                i41 = i39;
                                i42 = i40;
                                j19 = j16;
                                z13 = z12;
                                function13 = function12;
                                b0Var3 = b0Var2;
                                kVar3 = kVar2;
                                lVar3 = lVar2;
                                j21 = j15;
                                j22 = j17;
                                j23 = j18;
                                i43 = i38;
                            }
                        }
                        t1VarU = tVar3.u();
                        if (t1VarU == null) {
                        }
                    }
                    z12 = z11;
                    i33 = i15 & UserMetadata.MAX_INTERNAL_KEY_SIZE;
                    if (i33 != 0) {
                    }
                    i35 = i15 & ReaderJsonLexerKt.BATCH_SIZE;
                    if (i35 == 0) {
                    }
                    i37 = i15 & SQLiteDatabase.OPEN_NOMUTEX;
                    if (i37 == 0) {
                    }
                    if ((i14 & 1572864) == 0) {
                    }
                    if ((i16 & 306783379) != 306783378) {
                    }
                    t1VarU = tVar3.u();
                    if (t1VarU == null) {
                    }
                }
                i26 = i25;
                i27 = i15 & 1024;
                if (i27 == 0) {
                }
                i29 = i15 & 2048;
                if (i29 == 0) {
                }
                int i482 = i28;
                i32 = i15 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                if (i32 == 0) {
                }
                z12 = z11;
                i33 = i15 & UserMetadata.MAX_INTERNAL_KEY_SIZE;
                if (i33 != 0) {
                }
                i35 = i15 & ReaderJsonLexerKt.BATCH_SIZE;
                if (i35 == 0) {
                }
                i37 = i15 & SQLiteDatabase.OPEN_NOMUTEX;
                if (i37 == 0) {
                }
                if ((i14 & 1572864) == 0) {
                }
                if ((i16 & 306783379) != 306783378) {
                }
                t1VarU = tVar3.u();
                if (t1VarU == null) {
                }
            }
            vVar2 = vVar;
            i21 = i15 & 32;
            int i462 = SQLiteDatabase.OPEN_SHAREDCACHE;
            if (i21 != 0) {
            }
            i22 = i15 & 64;
            int i472 = 524288;
            if (i22 != 0) {
            }
            i23 = i15 & 128;
            if (i23 != 0) {
            }
            i24 = i15 & 256;
            if (i24 != 0) {
            }
            i25 = i15 & EventBridgeChannel.QUEUE_CAPACITY;
            if (i25 != 0) {
            }
            i26 = i25;
            i27 = i15 & 1024;
            if (i27 == 0) {
            }
            i29 = i15 & 2048;
            if (i29 == 0) {
            }
            int i4822 = i28;
            i32 = i15 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
            if (i32 == 0) {
            }
            z12 = z11;
            i33 = i15 & UserMetadata.MAX_INTERNAL_KEY_SIZE;
            if (i33 != 0) {
            }
            i35 = i15 & ReaderJsonLexerKt.BATCH_SIZE;
            if (i35 == 0) {
            }
            i37 = i15 & SQLiteDatabase.OPEN_NOMUTEX;
            if (i37 == 0) {
            }
            if ((i14 & 1572864) == 0) {
            }
            if ((i16 & 306783379) != 306783378) {
            }
            t1VarU = tVar3.u();
            if (t1VarU == null) {
            }
        }
        i17 = i15 & 4;
        if (i17 == 0) {
        }
        i18 = i15 & 8;
        if (i18 == 0) {
        }
        i19 = i15 & 16;
        int i452 = UserMetadata.MAX_INTERNAL_KEY_SIZE;
        if (i19 == 0) {
        }
        vVar2 = vVar;
        i21 = i15 & 32;
        int i4622 = SQLiteDatabase.OPEN_SHAREDCACHE;
        if (i21 != 0) {
        }
        i22 = i15 & 64;
        int i4722 = 524288;
        if (i22 != 0) {
        }
        i23 = i15 & 128;
        if (i23 != 0) {
        }
        i24 = i15 & 256;
        if (i24 != 0) {
        }
        i25 = i15 & EventBridgeChannel.QUEUE_CAPACITY;
        if (i25 != 0) {
        }
        i26 = i25;
        i27 = i15 & 1024;
        if (i27 == 0) {
        }
        i29 = i15 & 2048;
        if (i29 == 0) {
        }
        int i48222 = i28;
        i32 = i15 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
        if (i32 == 0) {
        }
        z12 = z11;
        i33 = i15 & UserMetadata.MAX_INTERNAL_KEY_SIZE;
        if (i33 != 0) {
        }
        i35 = i15 & ReaderJsonLexerKt.BATCH_SIZE;
        if (i35 == 0) {
        }
        i37 = i15 & SQLiteDatabase.OPEN_NOMUTEX;
        if (i37 == 0) {
        }
        if ((i14 & 1572864) == 0) {
        }
        if ((i16 & 306783379) != 306783378) {
        }
        t1VarU = tVar3.u();
        if (t1VarU == null) {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0037  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x003c  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x004e  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0053  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00ac  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00d6  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0105  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0107  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x010a  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x010d  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0110  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0116  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x011b  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0128  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x013a  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0155  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x015d  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01fc  */
    /* JADX WARN: Removed duplicated region for block: B:98:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void c(m3.g gVar, b2.t tVar, long j11, long j12, long j13, long j14, int i5, boolean z11, int i11, int i12, Map map, Function1 function1, m3.p0 p0Var, p1.o oVar, int i13, int i14) {
        b2.t tVar2;
        int i15;
        long j15;
        int i16;
        int i17;
        long j16;
        int i18;
        int i19;
        Map map2;
        int i21;
        b2.t tVar3;
        long j17;
        long j18;
        long j19;
        int i22;
        int i23;
        int i24;
        boolean z12;
        m3.p0 p0Var2;
        int i25;
        Function1 function12;
        int i26;
        long j21;
        long jB;
        boolean z13;
        int i27;
        boolean z14;
        p1.t tVar4;
        Function1 function13;
        int i28;
        m3.p0 p0Var3;
        int i29;
        Map map3;
        boolean z15;
        int i31;
        b2.t tVar5;
        long j22;
        long j23;
        long j24;
        long j25;
        p1.t1 t1VarU;
        p1.t tVar6 = (p1.t) oVar;
        tVar6.d0(2027001676);
        int i32 = (tVar6.f(gVar) ? 4 : 2) | i13;
        int i33 = i14 & 2;
        if (i33 != 0) {
            i32 |= 48;
        } else {
            if ((i13 & 48) == 0) {
                tVar2 = tVar;
                i32 |= tVar6.f(tVar2) ? 32 : 16;
            }
            i15 = i14 & 4;
            if (i15 == 0) {
                i16 = i32 | 384;
                j15 = j11;
            } else {
                j15 = j11;
                i16 = i32 | (tVar6.e(j15) ? 256 : 128);
            }
            i17 = i14 & 8;
            if (i17 != 0) {
                if ((i13 & 3072) == 0) {
                    j16 = j12;
                    i16 |= tVar6.e(j16) ? 2048 : 1024;
                }
                i18 = i16 | 920346624;
                i19 = i14 & SQLiteDatabase.OPEN_NOMUTEX;
                if (i19 != 0) {
                    i21 = 224694;
                    map2 = map;
                } else {
                    map2 = map;
                    i21 = 28086 | (tVar6.h(map2) ? 131072 : SQLiteDatabase.OPEN_FULLMUTEX);
                }
                int i34 = i21 | 1572864 | (((i14 & SQLiteDatabase.OPEN_SHAREDCACHE) == 0 && tVar6.f(p0Var)) ? 8388608 : 4194304);
                if ((i18 & 306783379) == 306783378 && (4793491 & i34) == 4793490 && tVar6.E()) {
                    tVar6.V();
                    z15 = z11;
                    function13 = function1;
                    tVar4 = tVar6;
                    tVar5 = tVar2;
                    j22 = j15;
                    j23 = j16;
                    p0Var3 = p0Var;
                    map3 = map2;
                    j24 = j13;
                    j25 = j14;
                    i29 = i5;
                    i28 = i11;
                    i31 = i12;
                } else {
                    tVar6.X();
                    if ((i13 & 1) != 0 || tVar6.B()) {
                        tVar3 = i33 == 0 ? b2.r.f17024a : tVar2;
                        j17 = i15 == 0 ? i2.s.f61147m : j15;
                        j18 = i17 == 0 ? y3.p.f96617c : j16;
                        j19 = y3.p.f96617c;
                        if (i19 != 0) {
                            map2 = b70.h.f17594a;
                        }
                        x xVar = x.f74203t;
                        i22 = i14 & SQLiteDatabase.OPEN_SHAREDCACHE;
                        i23 = 1;
                        i24 = LayoutNode.NotPlacedPlaceOrder;
                        if (i22 == 0) {
                            p0Var2 = (m3.p0) tVar6.j(f73360a);
                            z12 = true;
                            i26 = 1;
                            i25 = i34 & (-29360129);
                            function12 = xVar;
                        } else {
                            z12 = true;
                            p0Var2 = p0Var;
                            i25 = i34;
                            function12 = xVar;
                            i26 = 1;
                        }
                        j21 = j19;
                    } else {
                        tVar6.V();
                        if ((i14 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0) {
                            i34 &= -29360129;
                        }
                        i23 = i5;
                        z12 = z11;
                        i24 = i11;
                        tVar3 = tVar2;
                        j17 = j15;
                        j18 = j16;
                        p0Var2 = p0Var;
                        i25 = i34;
                        j19 = j13;
                        j21 = j14;
                        i26 = i12;
                        function12 = function1;
                    }
                    tVar6.q();
                    b2.t tVar7 = tVar3;
                    tVar6.b0(-1827697581);
                    if (j17 == 16) {
                        z13 = z12;
                        i27 = i18;
                        jB = j17;
                        z14 = false;
                    } else {
                        tVar6.b0(-1827696808);
                        jB = p0Var2.b();
                        if (jB != 16) {
                            z13 = z12;
                            i27 = i18;
                        } else {
                            z13 = z12;
                            i27 = i18;
                            jB = ((i2.s) tVar6.j(s1.f73932a)).f61148a;
                        }
                        z14 = false;
                        tVar6.p(false);
                    }
                    tVar6.p(z14);
                    long j26 = j21;
                    m3.p0 p0Var4 = p0Var2;
                    int i35 = i26;
                    Function1 function14 = function12;
                    boolean z16 = z13;
                    t0.t0.c(gVar, tVar7, m3.p0.e(p0Var4, jB, j18, null, null, null, j19, null, Integer.MIN_VALUE, j26, 16609104), function14, i23, z16, i24, i35, map2, tVar6, (i27 & Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE) | 14380032 | ((i25 << 9) & 234881024));
                    tVar4 = tVar6;
                    int i36 = i24;
                    function13 = function14;
                    i28 = i36;
                    p0Var3 = p0Var4;
                    i29 = i23;
                    map3 = map2;
                    z15 = z13;
                    i31 = i35;
                    tVar5 = tVar7;
                    j22 = j17;
                    j23 = j18;
                    j24 = j19;
                    j25 = j26;
                }
                t1VarU = tVar4.u();
                if (t1VarU != null) {
                    t1VarU.f81583d = new f9(gVar, tVar5, j22, j23, j24, j25, i29, z15, i28, i31, map3, function13, p0Var3, i13, i14);
                    return;
                }
                return;
            }
            i16 |= 3072;
            j16 = j12;
            i18 = i16 | 920346624;
            i19 = i14 & SQLiteDatabase.OPEN_NOMUTEX;
            if (i19 != 0) {
            }
            int i342 = i21 | 1572864 | (((i14 & SQLiteDatabase.OPEN_SHAREDCACHE) == 0 && tVar6.f(p0Var)) ? 8388608 : 4194304);
            if ((i18 & 306783379) == 306783378) {
                tVar6.X();
                if ((i13 & 1) != 0) {
                    if (i33 == 0) {
                    }
                    if (i15 == 0) {
                    }
                    if (i17 == 0) {
                    }
                    j19 = y3.p.f96617c;
                    if (i19 != 0) {
                    }
                    x xVar2 = x.f74203t;
                    i22 = i14 & SQLiteDatabase.OPEN_SHAREDCACHE;
                    i23 = 1;
                    i24 = LayoutNode.NotPlacedPlaceOrder;
                    if (i22 == 0) {
                    }
                    j21 = j19;
                    tVar6.q();
                    b2.t tVar72 = tVar3;
                    tVar6.b0(-1827697581);
                    if (j17 == 16) {
                    }
                    tVar6.p(z14);
                    long j262 = j21;
                    m3.p0 p0Var42 = p0Var2;
                    int i352 = i26;
                    Function1 function142 = function12;
                    boolean z162 = z13;
                    t0.t0.c(gVar, tVar72, m3.p0.e(p0Var42, jB, j18, null, null, null, j19, null, Integer.MIN_VALUE, j262, 16609104), function142, i23, z162, i24, i352, map2, tVar6, (i27 & Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE) | 14380032 | ((i25 << 9) & 234881024));
                    tVar4 = tVar6;
                    int i362 = i24;
                    function13 = function142;
                    i28 = i362;
                    p0Var3 = p0Var42;
                    i29 = i23;
                    map3 = map2;
                    z15 = z13;
                    i31 = i352;
                    tVar5 = tVar72;
                    j22 = j17;
                    j23 = j18;
                    j24 = j19;
                    j25 = j262;
                }
            }
            t1VarU = tVar4.u();
            if (t1VarU != null) {
            }
        }
        tVar2 = tVar;
        i15 = i14 & 4;
        if (i15 == 0) {
        }
        i17 = i14 & 8;
        if (i17 != 0) {
        }
        j16 = j12;
        i18 = i16 | 920346624;
        i19 = i14 & SQLiteDatabase.OPEN_NOMUTEX;
        if (i19 != 0) {
        }
        int i3422 = i21 | 1572864 | (((i14 & SQLiteDatabase.OPEN_SHAREDCACHE) == 0 && tVar6.f(p0Var)) ? 8388608 : 4194304);
        if ((i18 & 306783379) == 306783378) {
        }
        t1VarU = tVar4.u();
        if (t1VarU != null) {
        }
    }

    public static final void d(String str, b2.t tVar, long j11, long j12, q3.p pVar, long j13, long j14, int i5, boolean z11, int i11, Function1 function1, m3.p0 p0Var, p1.o oVar, int i12) {
        long j15;
        long j16;
        Function1 function12;
        m3.p0 p0Var2;
        long j17;
        int i13;
        boolean z12;
        int i14;
        long j18;
        p1.t tVar2;
        long j19;
        long j21;
        long j22;
        int i15;
        boolean z13;
        int i16;
        Function1 function13;
        m3.p0 p0Var3;
        long j23;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(1968784669);
        int i17 = i12 | (tVar3.f(str) ? 4 : 2) | (tVar3.f(tVar) ? 32 : 16) | 224640 | (tVar3.f(pVar) ? 1048576 : 524288) | 918552576;
        if ((306783379 & i17) == 306783378 && tVar3.E()) {
            tVar3.V();
            j23 = j11;
            j19 = j12;
            j21 = j13;
            j22 = j14;
            i15 = i5;
            z13 = z11;
            i16 = i11;
            function13 = function1;
            p0Var3 = p0Var;
            tVar2 = tVar3;
        } else {
            tVar3.X();
            if ((i12 & 1) == 0 || tVar3.B()) {
                j15 = i2.s.f61147m;
                j16 = y3.p.f96617c;
                function12 = q7.f73849l;
                p0Var2 = (m3.p0) tVar3.j(f73360a);
                j17 = j16;
                i13 = 1;
                z12 = true;
                i14 = Integer.MAX_VALUE;
                j18 = j17;
            } else {
                tVar3.V();
                j15 = j11;
                j16 = j12;
                j18 = j13;
                j17 = j14;
                i13 = i5;
                z12 = z11;
                i14 = i11;
                function12 = function1;
                p0Var2 = p0Var;
            }
            tVar3.q();
            long j24 = j15;
            long j25 = j16;
            long j26 = j18;
            tVar2 = tVar3;
            b(str, tVar, j24, j25, null, null, pVar, j26, null, null, j17, i13, z12, i14, 1, function12, p0Var2, tVar2, i17 & 2147483646, 224694, 0);
            j19 = j25;
            j21 = j26;
            j22 = j17;
            i15 = i13;
            z13 = z12;
            i16 = i14;
            function13 = function12;
            p0Var3 = p0Var2;
            j23 = j24;
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new e9(str, tVar, j23, j19, pVar, j21, j22, i15, z13, i16, function13, p0Var3, i12);
        }
    }
}
