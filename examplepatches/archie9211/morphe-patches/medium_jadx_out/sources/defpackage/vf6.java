package defpackage;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;
import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vf6 {
    public final /* synthetic */ int a;

    static {
        int i = q74.b;
    }

    public /* synthetic */ vf6(int i) {
        this.a = i;
    }

    public static void a(q1 q1Var) throws InvalidProtocolBufferException {
        if (q1Var == null || q1Var.isInitialized()) {
            return;
        }
        InvalidProtocolBufferException invalidProtocolBufferException = new InvalidProtocolBufferException(new UninitializedMessageException().getMessage());
        invalidProtocolBufferException.a = q1Var;
        throw invalidProtocolBufferException;
    }

    public final q1 b(ByteArrayInputStream byteArrayInputStream, q74 q74Var) throws InvalidProtocolBufferException {
        q1 q1Var;
        try {
            int i = byteArrayInputStream.read();
            if (i == -1) {
                q1Var = null;
            } else {
                if ((i & 128) != 0) {
                    i &= 127;
                    int i2 = 7;
                    while (true) {
                        if (i2 >= 32) {
                            while (i2 < 64) {
                                int i3 = byteArrayInputStream.read();
                                if (i3 == -1) {
                                    throw InvalidProtocolBufferException.a();
                                }
                                if ((i3 & 128) != 0) {
                                    i2 += 7;
                                }
                            }
                            throw new InvalidProtocolBufferException("CodedInputStream encountered a malformed varint.");
                        }
                        int i4 = byteArrayInputStream.read();
                        if (i4 == -1) {
                            throw InvalidProtocolBufferException.a();
                        }
                        i |= (i4 & 127) << i2;
                        if ((i4 & 128) == 0) {
                            break;
                        }
                        i2 += 7;
                    }
                }
                tp1 tp1Var = new tp1(new o1(byteArrayInputStream, i, 0));
                q1Var = (q1) c(tp1Var, q74Var);
                try {
                    tp1Var.a(0);
                } catch (InvalidProtocolBufferException e) {
                    e.a = q1Var;
                    throw e;
                }
            }
            a(q1Var);
            return q1Var;
        } catch (IOException e2) {
            throw new InvalidProtocolBufferException(e2.getMessage());
        }
    }

    public final Object c(tp1 tp1Var, q74 q74Var) {
        switch (this.a) {
            case 0:
                return new xf6(tp1Var);
            case 1:
                return new yf6(tp1Var);
            case 2:
                return new ag6(tp1Var, q74Var);
            case 3:
                return new fg6(tp1Var, q74Var);
            case 4:
                return new eg6(tp1Var);
            case 5:
                return new h5a(tp1Var, q74Var);
            case 6:
                return new f5a(tp1Var, q74Var);
            case 7:
                return new e5a(tp1Var, q74Var);
            case 8:
                return new k5a(tp1Var, q74Var);
            case 9:
                return new l5a(tp1Var);
            case 10:
                return new n5a(tp1Var, q74Var);
            case 11:
                return new p5a(tp1Var, q74Var);
            case 12:
                return new t5a(tp1Var, q74Var);
            case 13:
                return new v5a(tp1Var, q74Var);
            case 14:
                return new y5a(tp1Var, q74Var);
            case 15:
                return new a6a(tp1Var, q74Var);
            case 16:
                return new e6a(tp1Var, q74Var);
            case 17:
                return new g6a(tp1Var, q74Var);
            case 18:
                return new i6a(tp1Var, q74Var);
            case 19:
                return new m6a(tp1Var, q74Var);
            case 20:
                return new l6a(tp1Var);
            case 21:
                return new n6a(tp1Var);
            case 22:
                return new s6a(tp1Var, q74Var);
            case 23:
                return new q6a(tp1Var, q74Var);
            case 24:
                return new u6a(tp1Var, q74Var);
            case 25:
                return new x6a(tp1Var, q74Var);
            case 26:
                return new y6a(tp1Var, q74Var);
            case 27:
                return new a7a(tp1Var, q74Var);
            case 28:
                return new e7a(tp1Var);
            default:
                return new f7a(tp1Var, q74Var);
        }
    }
}
