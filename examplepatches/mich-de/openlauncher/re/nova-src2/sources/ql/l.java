package ql;

import androidx.recyclerview.widget.u1;
import com.google.crypto.tink.internal.TinkBugException;
import java.math.BigInteger;
import l1.a2;

/* loaded from: classes3.dex */
public abstract class l {

    /* renamed from: a, reason: collision with root package name */
    public static final c f84179a;

    /* renamed from: b, reason: collision with root package name */
    public static final c f84180b;

    /* renamed from: c, reason: collision with root package name */
    public static final c f84181c;

    /* renamed from: d, reason: collision with root package name */
    public static final c f84182d;

    /* renamed from: e, reason: collision with root package name */
    public static final c f84183e;

    /* renamed from: f, reason: collision with root package name */
    public static final c f84184f;

    /* renamed from: g, reason: collision with root package name */
    public static final c f84185g;

    /* renamed from: h, reason: collision with root package name */
    public static final u f84186h;

    /* renamed from: i, reason: collision with root package name */
    public static final u f84187i;

    /* renamed from: j, reason: collision with root package name */
    public static final u f84188j;

    /* renamed from: k, reason: collision with root package name */
    public static final b0 f84189k;

    /* renamed from: l, reason: collision with root package name */
    public static final b0 f84190l;

    static {
        a0 a0Var = a0.f84105b;
        Integer numValueOf = Integer.valueOf(u1.FLAG_APPEARED_IN_PRE_LAYOUT);
        t tVar = t.f84208b;
        s sVar = s.f84204b;
        b bVar = b.f84114g;
        b bVar2 = b.f84110c;
        b bVar3 = b.f84113f;
        b bVar4 = b.f84112e;
        b bVar5 = b.f84115h;
        try {
            a2 a2VarB = c.b();
            a2VarB.f73009c = bVar2;
            a aVar = a.f84100c;
            a2VarB.f73008b = aVar;
            a2VarB.f73007a = bVar;
            a2VarB.f73010d = bVar5;
            f84179a = a2VarB.e();
            try {
                a2 a2VarB2 = c.b();
                a2VarB2.f73009c = bVar4;
                a aVar2 = a.f84101d;
                a2VarB2.f73008b = aVar2;
                a2VarB2.f73007a = bVar;
                a2VarB2.f73010d = bVar5;
                f84180b = a2VarB2.e();
                try {
                    a2 a2VarB3 = c.b();
                    a2VarB3.f73009c = bVar4;
                    a aVar3 = a.f84102e;
                    a2VarB3.f73008b = aVar3;
                    a2VarB3.f73007a = bVar;
                    a2VarB3.f73010d = bVar5;
                    f84181c = a2VarB3.e();
                    try {
                        a2 a2VarB4 = c.b();
                        a2VarB4.f73007a = bVar3;
                        a2VarB4.f73008b = aVar;
                        a2VarB4.f73009c = bVar2;
                        a2VarB4.f73010d = bVar5;
                        f84182d = a2VarB4.e();
                        try {
                            a2 a2VarB5 = c.b();
                            a2VarB5.f73007a = bVar3;
                            a2VarB5.f73008b = aVar2;
                            a2VarB5.f73009c = bVar4;
                            a2VarB5.f73010d = bVar5;
                            f84183e = a2VarB5.e();
                            try {
                                a2 a2VarB6 = c.b();
                                a2VarB6.f73007a = bVar3;
                                a2VarB6.f73008b = aVar;
                                a2VarB6.f73009c = bVar2;
                                a2VarB6.f73010d = b.f84118k;
                                f84184f = a2VarB6.e();
                                try {
                                    a2 a2VarB7 = c.b();
                                    a2VarB7.f73009c = bVar4;
                                    a2VarB7.f73008b = aVar3;
                                    a2VarB7.f73007a = bVar3;
                                    a2VarB7.f73010d = bVar5;
                                    f84185g = a2VarB7.e();
                                    try {
                                        r rVarB = u.b();
                                        rVarB.f84202c = sVar;
                                        rVarB.f84200a = 3072;
                                        BigInteger bigInteger = u.f84213e;
                                        rVarB.f84201b = bigInteger;
                                        rVarB.f84203d = tVar;
                                        f84186h = rVarB.a();
                                        try {
                                            r rVarB2 = u.b();
                                            rVarB2.f84202c = sVar;
                                            rVarB2.f84200a = 3072;
                                            rVarB2.f84201b = bigInteger;
                                            rVarB2.f84203d = t.f84211e;
                                            f84187i = rVarB2.a();
                                            try {
                                                r rVarB3 = u.b();
                                                rVarB3.f84202c = s.f84206d;
                                                rVarB3.f84200a = numValueOf;
                                                rVarB3.f84201b = bigInteger;
                                                rVarB3.f84203d = tVar;
                                                f84188j = rVarB3.a();
                                                try {
                                                    y yVarB = b0.b();
                                                    z zVar = z.f84243b;
                                                    yVarB.f84239c = zVar;
                                                    yVarB.f84240d = zVar;
                                                    yVarB.b(32);
                                                    yVarB.f84237a = 3072;
                                                    BigInteger bigInteger2 = b0.f84121g;
                                                    yVarB.f84238b = bigInteger2;
                                                    yVarB.f84242f = a0Var;
                                                    f84189k = yVarB.a();
                                                    try {
                                                        y yVarB2 = b0.b();
                                                        z zVar2 = z.f84245d;
                                                        yVarB2.f84239c = zVar2;
                                                        yVarB2.f84240d = zVar2;
                                                        yVarB2.b(64);
                                                        yVarB2.f84237a = numValueOf;
                                                        yVarB2.f84238b = bigInteger2;
                                                        yVarB2.f84242f = a0Var;
                                                        f84190l = yVarB2.a();
                                                    } catch (Exception e3) {
                                                        throw new TinkBugException(e3);
                                                    }
                                                } catch (Exception e11) {
                                                    throw new TinkBugException(e11);
                                                }
                                            } catch (Exception e12) {
                                                throw new TinkBugException(e12);
                                            }
                                        } catch (Exception e13) {
                                            throw new TinkBugException(e13);
                                        }
                                    } catch (Exception e14) {
                                        throw new TinkBugException(e14);
                                    }
                                } catch (Exception e15) {
                                    throw new TinkBugException(e15);
                                }
                            } catch (Exception e16) {
                                throw new TinkBugException(e16);
                            }
                        } catch (Exception e17) {
                            throw new TinkBugException(e17);
                        }
                    } catch (Exception e18) {
                        throw new TinkBugException(e18);
                    }
                } catch (Exception e19) {
                    throw new TinkBugException(e19);
                }
            } catch (Exception e21) {
                throw new TinkBugException(e21);
            }
        } catch (Exception e22) {
            throw new TinkBugException(e22);
        }
    }
}
