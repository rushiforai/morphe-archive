package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class shd extends z46 {
    public final /* synthetic */ int A;

    public /* synthetic */ shd(int i) {
        this.A = i;
    }

    @Override // defpackage.z46, defpackage.sy3
    public void M0(vy3 vy3Var) {
        switch (this.A) {
            case 1:
                StringBuilder sb = new StringBuilder();
                while (true) {
                    if (vy3Var.b()) {
                        char cA = vy3Var.a();
                        vy3Var.d++;
                        f(cA, sb);
                        if (sb.length() % 3 == 0) {
                            z46.w(vy3Var, sb);
                            if (wgf.F(vy3Var.a, vy3Var.d, 3) != 3) {
                                vy3Var.e = 0;
                            }
                        }
                    }
                }
                o(vy3Var, sb);
                break;
            default:
                super.M0(vy3Var);
                break;
        }
    }

    @Override // defpackage.z46
    public final int f(char c, StringBuilder sb) {
        switch (this.A) {
            case 0:
                if (c == ' ') {
                    sb.append((char) 3);
                } else if (c >= '0' && c <= '9') {
                    sb.append((char) (c - ','));
                } else {
                    if (c < 'a' || c > 'z') {
                        if (c < ' ') {
                            sb.append((char) 0);
                            sb.append(c);
                            return 2;
                        }
                        if (c >= '!' && c <= '/') {
                            sb.append((char) 1);
                            sb.append((char) (c - '!'));
                            return 2;
                        }
                        if (c >= ':' && c <= '@') {
                            sb.append((char) 1);
                            sb.append((char) (c - '+'));
                            return 2;
                        }
                        if (c >= '[' && c <= '_') {
                            sb.append((char) 1);
                            sb.append((char) (c - 'E'));
                            return 2;
                        }
                        if (c == '`') {
                            sb.append((char) 2);
                            sb.append((char) (c - '`'));
                            return 2;
                        }
                        if (c >= 'A' && c <= 'Z') {
                            sb.append((char) 2);
                            sb.append((char) (c - '@'));
                            return 2;
                        }
                        if (c < '{' || c > 127) {
                            sb.append("\u0001\u001e");
                            return 2 + f((char) (c - 128), sb);
                        }
                        sb.append((char) 2);
                        sb.append((char) (c - '`'));
                        return 2;
                    }
                    sb.append((char) (c - 'S'));
                }
                return 1;
            default:
                if (c == '\r') {
                    sb.append((char) 0);
                } else if (c == ' ') {
                    sb.append((char) 3);
                } else if (c == '*') {
                    sb.append((char) 1);
                } else if (c == '>') {
                    sb.append((char) 2);
                } else if (c >= '0' && c <= '9') {
                    sb.append((char) (c - ','));
                } else {
                    if (c < 'A' || c > 'Z') {
                        wgf.x(c);
                        throw null;
                    }
                    sb.append((char) (c - '3'));
                }
                return 1;
        }
    }

    @Override // defpackage.z46
    public final int l() {
        switch (this.A) {
            case 0:
                return 2;
            default:
                return 3;
        }
    }

    @Override // defpackage.z46
    public void o(vy3 vy3Var, StringBuilder sb) {
        switch (this.A) {
            case 1:
                StringBuilder sb2 = vy3Var.c;
                vy3Var.c(sb2.length());
                int length = vy3Var.f.b - sb2.length();
                vy3Var.d -= sb.length();
                String str = vy3Var.a;
                if ((str.length() - vy3Var.g) - vy3Var.d > 1 || length > 1 || (str.length() - vy3Var.g) - vy3Var.d != length) {
                    vy3Var.d((char) 254);
                }
                if (vy3Var.e < 0) {
                    vy3Var.e = 0;
                }
                break;
            default:
                super.o(vy3Var, sb);
                break;
        }
    }
}
