.class public Ll/wld;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dk0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/wld$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/qa5;

.field public final b:Lcom/google/android/exoplayer2/c0$b;

.field public final c:Lcom/google/android/exoplayer2/c0$d;

.field public final d:Ll/wld$a;

.field public final e:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ll/hk0$a;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/bqr;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bqr<",
            "Ll/hk0;",
            ">;"
        }
    .end annotation
.end field

.field public g:Lcom/google/android/exoplayer2/t;

.field public h:Ll/sxk;

.field public i:Z


# direct methods
.method public constructor <init>(Ll/qa5;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/qa5;

    .line 9
    .line 10
    iput-object v0, p0, Ll/wld;->a:Ll/qa5;

    .line 11
    .line 12
    new-instance v0, Ll/bqr;

    .line 13
    .line 14
    invoke-static {}, Ll/bmk0;->R()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    new-instance v2, Ll/jkd;

    .line 19
    .line 20
    invoke-direct {v2}, Ll/jkd;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-direct {v0, v1, p1, v2}, Ll/bqr;-><init>(Landroid/os/Looper;Ll/qa5;Ll/bqr$b;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/wld;->f:Ll/bqr;

    .line 27
    .line 28
    new-instance p1, Lcom/google/android/exoplayer2/c0$b;

    .line 29
    .line 30
    invoke-direct {p1}, Lcom/google/android/exoplayer2/c0$b;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Ll/wld;->b:Lcom/google/android/exoplayer2/c0$b;

    .line 34
    .line 35
    new-instance v0, Lcom/google/android/exoplayer2/c0$d;

    .line 36
    .line 37
    invoke-direct {v0}, Lcom/google/android/exoplayer2/c0$d;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/wld;->c:Lcom/google/android/exoplayer2/c0$d;

    .line 41
    .line 42
    new-instance v0, Ll/wld$a;

    .line 43
    .line 44
    invoke-direct {v0, p1}, Ll/wld$a;-><init>(Lcom/google/android/exoplayer2/c0$b;)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ll/wld;->d:Ll/wld$a;

    .line 48
    .line 49
    new-instance p1, Landroid/util/SparseArray;

    .line 50
    .line 51
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object p1, p0, Ll/wld;->e:Landroid/util/SparseArray;

    .line 55
    .line 56
    return-void
.end method

.method public static synthetic A0(Ll/hk0$a;ILl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->n0(Ll/hk0$a;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A1(Ll/hk0$a;Ljava/lang/String;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->t(Ll/hk0$a;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic B0(Ll/hk0;Ll/zri;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic B1(Ll/hk0$a;ILcom/google/android/exoplayer2/t$e;Lcom/google/android/exoplayer2/t$e;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p4, p0, p1}, Ll/hk0;->c(Ll/hk0$a;I)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p4, p0, p2, p3, p1}, Ll/hk0;->b0(Ll/hk0$a;Lcom/google/android/exoplayer2/t$e;Lcom/google/android/exoplayer2/t$e;I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic C0(Ll/hk0$a;Lcom/google/android/exoplayer2/PlaybackException;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->o0(Ll/hk0$a;Lcom/google/android/exoplayer2/PlaybackException;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic C1(Ll/hk0$a;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/hk0;->m(Ll/hk0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D0(Ll/hk0$a;Ll/jid;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->r(Ll/hk0$a;Ll/jid;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D1(Ll/hk0$a;Ljava/lang/String;JJLl/hk0;)V
    .locals 3

    .line 1
    invoke-interface {p6, p0, p1, p2, p3}, Ll/hk0;->k0(Ll/hk0$a;Ljava/lang/String;J)V

    .line 2
    .line 3
    .line 4
    move-object v0, p1

    .line 5
    move-object p1, p0

    .line 6
    move-object p0, p6

    .line 7
    move-wide v1, p2

    .line 8
    move-object p2, v0

    .line 9
    move-wide p3, p4

    .line 10
    move-wide p5, v1

    .line 11
    invoke-interface/range {p0 .. p6}, Ll/hk0;->N(Ll/hk0$a;Ljava/lang/String;JJ)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic E0(Ll/hk0$a;Lcom/google/android/exoplayer2/o;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->p(Ll/hk0$a;Lcom/google/android/exoplayer2/o;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic E1(Ll/hk0$a;Ljava/lang/String;JJLl/hk0;)V
    .locals 3

    .line 1
    invoke-interface {p6, p0, p1, p2, p3}, Ll/hk0;->h0(Ll/hk0$a;Ljava/lang/String;J)V

    .line 2
    .line 3
    .line 4
    move-object v0, p1

    .line 5
    move-object p1, p0

    .line 6
    move-object p0, p6

    .line 7
    move-wide v1, p2

    .line 8
    move-object p2, v0

    .line 9
    move-wide p3, p4

    .line 10
    move-wide p5, v1

    .line 11
    invoke-interface/range {p0 .. p6}, Ll/hk0;->w0(Ll/hk0$a;Ljava/lang/String;JJ)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic F0(Ll/hk0$a;ZILl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p3, p0, p1, p2}, Ll/hk0;->l0(Ll/hk0$a;ZI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic F1(Ll/hk0$a;Lcom/google/android/exoplayer2/PlaybackException;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->S(Ll/hk0$a;Lcom/google/android/exoplayer2/PlaybackException;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic G0(Ll/hk0$a;ILl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->W(Ll/hk0$a;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic G1(Ll/hk0$a;IJJLl/hk0;)V
    .locals 1

    .line 1
    move v0, p1

    .line 2
    move-object p1, p0

    .line 3
    move-object p0, p6

    .line 4
    move-wide p5, p4

    .line 5
    move-wide p3, p2

    .line 6
    move p2, v0

    .line 7
    invoke-interface/range {p0 .. p6}, Ll/hk0;->n(Ll/hk0$a;IJJ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic H0(Ll/hk0$a;Ll/jid;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->B(Ll/hk0$a;Ll/jid;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic I0(Ll/hk0$a;Ll/ktx;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->w(Ll/hk0$a;Ll/ktx;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J0(Ll/hk0$a;ILl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->T(Ll/hk0$a;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K0(Ll/hk0$a;Ll/mtv;Ll/ktx;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p3, p0, p1, p2}, Ll/hk0;->p0(Ll/hk0$a;Ll/mtv;Ll/ktx;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic L0(Ll/hk0$a;Ll/mtv;Ll/ktx;Ljava/io/IOException;ZLl/hk0;)V
    .locals 1

    .line 1
    move-object v0, p1

    .line 2
    move-object p1, p0

    .line 3
    move-object p0, p5

    .line 4
    move p5, p4

    .line 5
    move-object p4, p3

    .line 6
    move-object p3, p2

    .line 7
    move-object p2, v0

    .line 8
    invoke-interface/range {p0 .. p5}, Ll/hk0;->L(Ll/hk0$a;Ll/mtv;Ll/ktx;Ljava/io/IOException;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic M0(Ll/hk0$a;Ljava/lang/Exception;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->q0(Ll/hk0$a;Ljava/lang/Exception;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic N0(Ll/hk0$a;FLl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->O(Ll/hk0$a;F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O0(Ll/hk0$a;ZLl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->s0(Ll/hk0$a;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic P0(Ll/hk0$a;Lcom/google/android/exoplayer2/h;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->v0(Ll/hk0$a;Lcom/google/android/exoplayer2/h;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q0(Ll/hk0$a;Ll/mtv;Ll/ktx;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p3, p0, p1, p2}, Ll/hk0;->u(Ll/hk0$a;Ll/mtv;Ll/ktx;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R0(Ll/hk0$a;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/hk0;->d0(Ll/hk0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S0(Ll/hk0$a;ILl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0}, Ll/hk0;->k(Ll/hk0$a;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p2, p0, p1}, Ll/hk0;->j0(Ll/hk0$a;I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic T0(Ll/hk0$a;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/hk0;->A(Ll/hk0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic U0(Ll/hk0$a;Lcom/google/android/exoplayer2/t$b;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->x0(Ll/hk0$a;Lcom/google/android/exoplayer2/t$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V0(Ll/hk0$a;Ll/ktx;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->g(Ll/hk0$a;Ll/ktx;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W0(Ll/hk0$a;Ll/zjl0;Ll/hk0;)V
    .locals 6

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->j(Ll/hk0$a;Ll/zjl0;)V

    .line 2
    .line 3
    .line 4
    iget v2, p1, Ll/zjl0;->a:I

    .line 5
    .line 6
    iget v3, p1, Ll/zjl0;->b:I

    .line 7
    .line 8
    iget v4, p1, Ll/zjl0;->c:I

    .line 9
    .line 10
    iget v5, p1, Ll/zjl0;->d:F

    .line 11
    .line 12
    move-object v1, p0

    .line 13
    move-object v0, p2

    .line 14
    invoke-interface/range {v0 .. v5}, Ll/hk0;->e0(Ll/hk0$a;IIIF)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic X0(Ll/hk0$a;ZLl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->l(Ll/hk0$a;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y0(Ll/hk0$a;JLl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p3, p0, p1, p2}, Ll/hk0;->F(Ll/hk0$a;J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z0(Ll/hk0$a;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/hk0;->s(Ll/hk0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a1(Ll/hk0$a;Lcom/google/android/exoplayer2/n;ILl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p3, p0, p1, p2}, Ll/hk0;->b(Ll/hk0$a;Lcom/google/android/exoplayer2/n;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b1(Ll/hk0$a;IILl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p3, p0, p1, p2}, Ll/hk0;->U(Ll/hk0$a;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c1(Ll/hk0$a;ZLl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->f0(Ll/hk0$a;Z)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p2, p0, p1}, Ll/hk0;->K(Ll/hk0$a;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic d1(Ll/hk0$a;ILl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->i0(Ll/hk0$a;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e1(Ll/hk0$a;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/hk0;->R(Ll/hk0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f1(Ll/hk0$a;Ljava/lang/Object;JLl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p4, p0, p1, p2, p3}, Ll/hk0;->f(Ll/hk0$a;Ljava/lang/Object;J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g1(Ll/hk0$a;IJLl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p4, p0, p1, p2, p3}, Ll/hk0;->v(Ll/hk0$a;IJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h1(Ll/hk0$a;ZILl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p3, p0, p1, p2}, Ll/hk0;->P(Ll/hk0$a;ZI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i1(Ll/hk0$a;Lcom/google/android/exoplayer2/d0;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->e(Ll/hk0$a;Lcom/google/android/exoplayer2/d0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j1(Ll/hk0$a;ILl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->g0(Ll/hk0$a;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k1(Ll/hk0$a;Lcom/google/android/exoplayer2/audio/a;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->Z(Ll/hk0$a;Lcom/google/android/exoplayer2/audio/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l1(Ll/wld;Lcom/google/android/exoplayer2/t;Ll/hk0;Ll/zri;)V
    .locals 1

    .line 1
    new-instance v0, Ll/hk0$b;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wld;->e:Landroid/util/SparseArray;

    .line 4
    .line 5
    invoke-direct {v0, p3, p0}, Ll/hk0$b;-><init>(Ll/zri;Landroid/util/SparseArray;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p2, p1, v0}, Ll/hk0;->q(Lcom/google/android/exoplayer2/t;Ll/hk0$b;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic m1(Ll/hk0$a;Lcom/google/android/exoplayer2/metadata/Metadata;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->H(Ll/hk0$a;Lcom/google/android/exoplayer2/metadata/Metadata;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n1(Ll/hk0$a;Ljava/lang/Exception;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->y(Ll/hk0$a;Ljava/lang/Exception;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o1(Ll/hk0$a;Lcom/google/android/exoplayer2/s;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->i(Ll/hk0$a;Lcom/google/android/exoplayer2/s;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p1(Ll/hk0$a;Ll/jid;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->m0(Ll/hk0$a;Ll/jid;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q1(Ll/hk0$a;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/hk0;->a(Ll/hk0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r1(Ll/hk0$a;Lcom/google/android/exoplayer2/o;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->h(Ll/hk0$a;Lcom/google/android/exoplayer2/o;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s0(Ll/hk0$a;IJJLl/hk0;)V
    .locals 1

    .line 1
    move v0, p1

    .line 2
    move-object p1, p0

    .line 3
    move-object p0, p6

    .line 4
    move-wide p5, p4

    .line 5
    move-wide p3, p2

    .line 6
    move p2, v0

    .line 7
    invoke-interface/range {p0 .. p6}, Ll/hk0;->u0(Ll/hk0$a;IJJ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic s1(Ll/hk0$a;Ljava/lang/Exception;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->I(Ll/hk0$a;Ljava/lang/Exception;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t0(Ll/hk0$a;Ljava/lang/String;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->E(Ll/hk0$a;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t1(Ll/hk0$a;Ll/qyb;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->D(Ll/hk0$a;Ll/qyb;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u1(Ll/hk0$a;IZLl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p3, p0, p1, p2}, Ll/hk0;->J(Ll/hk0$a;IZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v0(Ll/hk0$a;Ll/jid;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->o(Ll/hk0$a;Ll/jid;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v1(Ll/hk0$a;Lcom/google/android/exoplayer2/k;Ll/nid;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p3, p0, p1}, Ll/hk0;->a0(Ll/hk0$a;Lcom/google/android/exoplayer2/k;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p3, p0, p1, p2}, Ll/hk0;->c0(Ll/hk0$a;Lcom/google/android/exoplayer2/k;Ll/nid;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic w0(Ll/hk0$a;ZLl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->Y(Ll/hk0$a;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic w1(Ll/hk0$a;Lcom/google/android/exoplayer2/k;Ll/nid;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p3, p0, p1}, Ll/hk0;->t0(Ll/hk0$a;Lcom/google/android/exoplayer2/k;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p3, p0, p1, p2}, Ll/hk0;->G(Ll/hk0$a;Lcom/google/android/exoplayer2/k;Ll/nid;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic x0(Ll/hk0$a;JILl/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p4, p0, p1, p2, p3}, Ll/hk0;->C(Ll/hk0$a;JI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x1(Ll/hk0$a;Ljava/util/List;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->X(Ll/hk0$a;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y0(Ll/hk0$a;Ljava/lang/Exception;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->r0(Ll/hk0$a;Ljava/lang/Exception;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y1(Ll/hk0$a;Ll/agj0;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/hk0;->Q(Ll/hk0$a;Ll/agj0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic z0(Ll/hk0$a;Ll/mtv;Ll/ktx;Ll/hk0;)V
    .locals 0

    .line 1
    invoke-interface {p3, p0, p1, p2}, Ll/hk0;->z(Ll/hk0$a;Ll/mtv;Ll/ktx;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic z1(Ll/wld;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wld;->P1()V

    return-void
.end method


# virtual methods
.method public A(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public final B(ILcom/google/android/exoplayer2/source/i$b;Ll/mtv;Ll/ktx;)V
    .locals 0
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wld;->L1(ILcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ll/sld;

    .line 6
    .line 7
    invoke-direct {p2, p1, p3, p4}, Ll/sld;-><init>(Ll/hk0$a;Ll/mtv;Ll/ktx;)V

    .line 8
    .line 9
    .line 10
    const/16 p3, 0x3ea

    .line 11
    .line 12
    invoke-virtual {p0, p1, p3, p2}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final C(Lcom/google/android/exoplayer2/c0;I)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/wld;->d:Ll/wld$a;

    .line 2
    .line 3
    iget-object v0, p0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 4
    .line 5
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/google/android/exoplayer2/t;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ll/wld$a;->l(Lcom/google/android/exoplayer2/t;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Ll/dld;

    .line 19
    .line 20
    invoke-direct {v0, p1, p2}, Ll/dld;-><init>(Ll/hk0$a;I)V

    .line 21
    .line 22
    .line 23
    const/4 p2, 0x0

    .line 24
    invoke-virtual {p0, p1, p2, v0}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final D(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ujd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/ujd;-><init>(Ll/hk0$a;I)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x15

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public E(Lcom/google/android/exoplayer2/o;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/njd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/njd;-><init>(Ll/hk0$a;Lcom/google/android/exoplayer2/o;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0xe

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final F(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ljd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/ljd;-><init>(Ll/hk0$a;Z)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x9

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public G(Lcom/google/android/exoplayer2/t;Landroid/os/Looper;)V
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/wld;->d:Ll/wld$a;

    .line 6
    .line 7
    invoke-static {v0}, Ll/wld$a;->a(Ll/wld$a;)Lcom/google/common/collect/ImmutableList;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 21
    :goto_1
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/google/android/exoplayer2/t;

    .line 29
    .line 30
    iput-object v0, p0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 31
    .line 32
    iget-object v0, p0, Ll/wld;->a:Ll/qa5;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-interface {v0, p2, v1}, Ll/qa5;->c(Landroid/os/Looper;Landroid/os/Handler$Callback;)Ll/sxk;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Ll/wld;->h:Ll/sxk;

    .line 40
    .line 41
    iget-object v0, p0, Ll/wld;->f:Ll/bqr;

    .line 42
    .line 43
    new-instance v1, Ll/vjd;

    .line 44
    .line 45
    invoke-direct {v1, p0, p1}, Ll/vjd;-><init>(Ll/wld;Lcom/google/android/exoplayer2/t;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, p2, v1}, Ll/bqr;->e(Landroid/os/Looper;Ll/bqr$b;)Ll/bqr;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Ll/wld;->f:Ll/bqr;

    .line 53
    .line 54
    return-void
.end method

.method public H(IZ)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/hld;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1, p2}, Ll/hld;-><init>(Ll/hk0$a;IZ)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x1e

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final H1()Ll/hk0$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wld;->d:Ll/wld$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wld$a;->d()Lcom/google/android/exoplayer2/source/i$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/wld;->J1(Lcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public I(Lcom/google/android/exoplayer2/PlaybackException;)V
    .locals 2
    .param p1    # Lcom/google/android/exoplayer2/PlaybackException;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1}, Ll/wld;->O1(Lcom/google/android/exoplayer2/PlaybackException;)Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ukd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/ukd;-><init>(Ll/hk0$a;Lcom/google/android/exoplayer2/PlaybackException;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0xa

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final I1(Lcom/google/android/exoplayer2/c0;ILcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;
    .locals 16
    .param p3    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "player"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v3, p1

    .line 4
    .line 5
    move/from16 v4, p2

    .line 6
    .line 7
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    move-object v5, v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move-object/from16 v5, p3

    .line 17
    .line 18
    :goto_0
    iget-object v1, v0, Ll/wld;->a:Ll/qa5;

    .line 19
    .line 20
    invoke-interface {v1}, Ll/qa5;->elapsedRealtime()J

    .line 21
    .line 22
    .line 23
    move-result-wide v1

    .line 24
    iget-object v6, v0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 25
    .line 26
    invoke-interface {v6}, Lcom/google/android/exoplayer2/t;->getCurrentTimeline()Lcom/google/android/exoplayer2/c0;

    .line 27
    .line 28
    .line 29
    move-result-object v6

    .line 30
    invoke-virtual {v3, v6}, Lcom/google/android/exoplayer2/c0;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    if-eqz v6, :cond_1

    .line 35
    .line 36
    iget-object v6, v0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 37
    .line 38
    invoke-interface {v6}, Lcom/google/android/exoplayer2/t;->getCurrentMediaItemIndex()I

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    if-ne v4, v6, :cond_1

    .line 43
    .line 44
    const/4 v6, 0x1

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    const/4 v6, 0x0

    .line 47
    :goto_1
    const-wide/16 v7, 0x0

    .line 48
    .line 49
    if-eqz v5, :cond_3

    .line 50
    .line 51
    invoke-virtual {v5}, Ll/fyx;->b()Z

    .line 52
    .line 53
    .line 54
    move-result v9

    .line 55
    if-eqz v9, :cond_3

    .line 56
    .line 57
    if-eqz v6, :cond_2

    .line 58
    .line 59
    iget-object v6, v0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 60
    .line 61
    invoke-interface {v6}, Lcom/google/android/exoplayer2/t;->getCurrentAdGroupIndex()I

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    iget v9, v5, Ll/fyx;->b:I

    .line 66
    .line 67
    if-ne v6, v9, :cond_2

    .line 68
    .line 69
    iget-object v6, v0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 70
    .line 71
    invoke-interface {v6}, Lcom/google/android/exoplayer2/t;->getCurrentAdIndexInAdGroup()I

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    iget v9, v5, Ll/fyx;->c:I

    .line 76
    .line 77
    if-ne v6, v9, :cond_2

    .line 78
    .line 79
    iget-object v6, v0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 80
    .line 81
    invoke-interface {v6}, Lcom/google/android/exoplayer2/t;->getCurrentPosition()J

    .line 82
    .line 83
    .line 84
    move-result-wide v7

    .line 85
    :cond_2
    :goto_2
    move-wide v6, v7

    .line 86
    goto :goto_3

    .line 87
    :cond_3
    if-eqz v6, :cond_4

    .line 88
    .line 89
    iget-object v6, v0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 90
    .line 91
    invoke-interface {v6}, Lcom/google/android/exoplayer2/t;->getContentPosition()J

    .line 92
    .line 93
    .line 94
    move-result-wide v7

    .line 95
    goto :goto_2

    .line 96
    :cond_4
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 97
    .line 98
    .line 99
    move-result v6

    .line 100
    if-eqz v6, :cond_5

    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_5
    iget-object v6, v0, Ll/wld;->c:Lcom/google/android/exoplayer2/c0$d;

    .line 104
    .line 105
    invoke-virtual {v3, v4, v6}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 106
    .line 107
    .line 108
    move-result-object v6

    .line 109
    invoke-virtual {v6}, Lcom/google/android/exoplayer2/c0$d;->d()J

    .line 110
    .line 111
    .line 112
    move-result-wide v7

    .line 113
    goto :goto_2

    .line 114
    :goto_3
    iget-object v8, v0, Ll/wld;->d:Ll/wld$a;

    .line 115
    .line 116
    invoke-virtual {v8}, Ll/wld$a;->d()Lcom/google/android/exoplayer2/source/i$b;

    .line 117
    .line 118
    .line 119
    move-result-object v10

    .line 120
    new-instance v8, Ll/hk0$a;

    .line 121
    .line 122
    iget-object v9, v0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 123
    .line 124
    invoke-interface {v9}, Lcom/google/android/exoplayer2/t;->getCurrentTimeline()Lcom/google/android/exoplayer2/c0;

    .line 125
    .line 126
    .line 127
    move-result-object v9

    .line 128
    iget-object v11, v0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 129
    .line 130
    invoke-interface {v11}, Lcom/google/android/exoplayer2/t;->getCurrentMediaItemIndex()I

    .line 131
    .line 132
    .line 133
    move-result v11

    .line 134
    iget-object v12, v0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 135
    .line 136
    invoke-interface {v12}, Lcom/google/android/exoplayer2/t;->getCurrentPosition()J

    .line 137
    .line 138
    .line 139
    move-result-wide v12

    .line 140
    iget-object v0, v0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 141
    .line 142
    invoke-interface {v0}, Lcom/google/android/exoplayer2/t;->getTotalBufferedDuration()J

    .line 143
    .line 144
    .line 145
    move-result-wide v14

    .line 146
    move-object v0, v8

    .line 147
    move-object v8, v9

    .line 148
    move v9, v11

    .line 149
    move-wide v11, v12

    .line 150
    move-wide v13, v14

    .line 151
    invoke-direct/range {v0 .. v14}, Ll/hk0$a;-><init>(JLcom/google/android/exoplayer2/c0;ILcom/google/android/exoplayer2/source/i$b;JLcom/google/android/exoplayer2/c0;ILcom/google/android/exoplayer2/source/i$b;JJ)V

    .line 152
    .line 153
    .line 154
    return-object v0
.end method

.method public final J(Lcom/google/android/exoplayer2/PlaybackException;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/wld;->O1(Lcom/google/android/exoplayer2/PlaybackException;)Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/akd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/akd;-><init>(Ll/hk0$a;Lcom/google/android/exoplayer2/PlaybackException;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0xa

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final J1(Lcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;
    .locals 3
    .param p1    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    move-object v1, v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v1, p0, Ll/wld;->d:Ll/wld$a;

    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ll/wld$a;->f(Lcom/google/android/exoplayer2/source/i$b;)Lcom/google/android/exoplayer2/c0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    :goto_0
    if-eqz p1, :cond_2

    .line 18
    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    iget-object v0, p1, Ll/fyx;->a:Ljava/lang/Object;

    .line 23
    .line 24
    iget-object v2, p0, Ll/wld;->b:Lcom/google/android/exoplayer2/c0$b;

    .line 25
    .line 26
    invoke-virtual {v1, v0, v2}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget v0, v0, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 31
    .line 32
    invoke-virtual {p0, v1, v0, p1}, Ll/wld;->I1(Lcom/google/android/exoplayer2/c0;ILcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_2
    :goto_1
    iget-object p1, p0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 38
    .line 39
    invoke-interface {p1}, Lcom/google/android/exoplayer2/t;->getCurrentMediaItemIndex()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iget-object v1, p0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 44
    .line 45
    invoke-interface {v1}, Lcom/google/android/exoplayer2/t;->getCurrentTimeline()Lcom/google/android/exoplayer2/c0;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/c0;->t()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-ge p1, v2, :cond_3

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_3
    sget-object v1, Lcom/google/android/exoplayer2/c0;->a:Lcom/google/android/exoplayer2/c0;

    .line 57
    .line 58
    :goto_2
    invoke-virtual {p0, v1, p1, v0}, Ll/wld;->I1(Lcom/google/android/exoplayer2/c0;ILcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public K(Ll/agj0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/kkd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/kkd;-><init>(Ll/hk0$a;Ll/agj0;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x13

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final K1()Ll/hk0$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wld;->d:Ll/wld$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wld$a;->e()Lcom/google/android/exoplayer2/source/i$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/wld;->J1(Lcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final L(ILcom/google/android/exoplayer2/source/i$b;Ll/mtv;Ll/ktx;)V
    .locals 0
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wld;->L1(ILcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ll/ald;

    .line 6
    .line 7
    invoke-direct {p2, p1, p3, p4}, Ll/ald;-><init>(Ll/hk0$a;Ll/mtv;Ll/ktx;)V

    .line 8
    .line 9
    .line 10
    const/16 p3, 0x3e8

    .line 11
    .line 12
    invoke-virtual {p0, p1, p3, p2}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final L1(ILcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Ll/wld;->d:Ll/wld$a;

    .line 9
    .line 10
    invoke-virtual {v0, p2}, Ll/wld$a;->f(Lcom/google/android/exoplayer2/source/i$b;)Lcom/google/android/exoplayer2/c0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ll/wld;->J1(Lcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    sget-object v0, Lcom/google/android/exoplayer2/c0;->a:Lcom/google/android/exoplayer2/c0;

    .line 22
    .line 23
    invoke-virtual {p0, v0, p1, p2}, Ll/wld;->I1(Lcom/google/android/exoplayer2/c0;ILcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_1
    iget-object p2, p0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 29
    .line 30
    invoke-interface {p2}, Lcom/google/android/exoplayer2/t;->getCurrentTimeline()Lcom/google/android/exoplayer2/c0;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/c0;->t()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-ge p1, v0, :cond_2

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    sget-object p2, Lcom/google/android/exoplayer2/c0;->a:Lcom/google/android/exoplayer2/c0;

    .line 42
    .line 43
    :goto_0
    const/4 v0, 0x0

    .line 44
    invoke-virtual {p0, p2, p1, v0}, Ll/wld;->I1(Lcom/google/android/exoplayer2/c0;ILcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public final M(Lcom/google/android/exoplayer2/audio/a;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/vld;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/vld;-><init>(Ll/hk0$a;Lcom/google/android/exoplayer2/audio/a;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x14

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final M1()Ll/hk0$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wld;->d:Ll/wld$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wld$a;->g()Lcom/google/android/exoplayer2/source/i$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/wld;->J1(Lcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final N(ILcom/google/android/exoplayer2/source/i$b;)V
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wld;->L1(ILcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ll/qld;

    .line 6
    .line 7
    invoke-direct {p2, p1}, Ll/qld;-><init>(Ll/hk0$a;)V

    .line 8
    .line 9
    .line 10
    const/16 v0, 0x3ff

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0, p2}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final N1()Ll/hk0$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wld;->d:Ll/wld$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wld$a;->h()Lcom/google/android/exoplayer2/source/i$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/wld;->J1(Lcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final O(ZI)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/tjd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1, p2}, Ll/tjd;-><init>(Ll/hk0$a;ZI)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x5

    .line 11
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final O1(Lcom/google/android/exoplayer2/PlaybackException;)Ll/hk0$a;
    .locals 1
    .param p1    # Lcom/google/android/exoplayer2/PlaybackException;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    instance-of v0, p1, Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/google/android/exoplayer2/ExoPlaybackException;->mediaPeriodId:Ll/fyx;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    new-instance v0, Lcom/google/android/exoplayer2/source/i$b;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Lcom/google/android/exoplayer2/source/i$b;-><init>(Ll/fyx;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/wld;->J1(Lcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final P(ILcom/google/android/exoplayer2/source/i$b;I)V
    .locals 0
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wld;->L1(ILcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ll/eld;

    .line 6
    .line 7
    invoke-direct {p2, p1, p3}, Ll/eld;-><init>(Ll/hk0$a;I)V

    .line 8
    .line 9
    .line 10
    const/16 p3, 0x3fe

    .line 11
    .line 12
    invoke-virtual {p0, p1, p3, p2}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final P1()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/pld;

    .line 6
    .line 7
    invoke-direct {v1, v0}, Ll/pld;-><init>(Ll/hk0$a;)V

    .line 8
    .line 9
    .line 10
    const/16 v2, 0x404

    .line 11
    .line 12
    invoke-virtual {p0, v0, v2, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/wld;->f:Ll/bqr;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/bqr;->i()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final Q(ILcom/google/android/exoplayer2/source/i$b;)V
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wld;->L1(ILcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ll/rld;

    .line 6
    .line 7
    invoke-direct {p2, p1}, Ll/rld;-><init>(Ll/hk0$a;)V

    .line 8
    .line 9
    .line 10
    const/16 v0, 0x401

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0, p2}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final Q1(Ll/hk0$a;ILl/bqr$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hk0$a;",
            "I",
            "Ll/bqr$a<",
            "Ll/hk0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wld;->e:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p2, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/wld;->f:Ll/bqr;

    .line 7
    .line 8
    invoke-virtual {p0, p2, p3}, Ll/bqr;->k(ILl/bqr$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public R(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/uld;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/uld;-><init>(Ll/hk0$a;Z)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x7

    .line 11
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final S(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/vkd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/vkd;-><init>(Ll/hk0$a;I)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x6

    .line 11
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public T(Lcom/google/android/exoplayer2/t$b;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/dkd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/dkd;-><init>(Ll/hk0$a;Lcom/google/android/exoplayer2/t$b;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0xd

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final U(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/hkd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/hkd;-><init>(Ll/hk0$a;I)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x4

    .line 11
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final V(ILcom/google/android/exoplayer2/source/i$b;Ll/ktx;)V
    .locals 0
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wld;->L1(ILcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ll/ykd;

    .line 6
    .line 7
    invoke-direct {p2, p1, p3}, Ll/ykd;-><init>(Ll/hk0$a;Ll/ktx;)V

    .line 8
    .line 9
    .line 10
    const/16 p3, 0x3ed

    .line 11
    .line 12
    invoke-virtual {p0, p1, p3, p2}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public W(Lcom/google/android/exoplayer2/h;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/gld;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/gld;-><init>(Ll/hk0$a;Lcom/google/android/exoplayer2/h;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x1d

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final X()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/wld;->i:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, p0, Ll/wld;->i:Z

    .line 11
    .line 12
    new-instance v1, Ll/sjd;

    .line 13
    .line 14
    invoke-direct {v1, v0}, Ll/sjd;-><init>(Ll/hk0$a;)V

    .line 15
    .line 16
    .line 17
    const/4 v2, -0x1

    .line 18
    invoke-virtual {p0, v0, v2, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final Y(ILcom/google/android/exoplayer2/source/i$b;Ll/mtv;Ll/ktx;)V
    .locals 0
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wld;->L1(ILcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ll/qjd;

    .line 6
    .line 7
    invoke-direct {p2, p1, p3, p4}, Ll/qjd;-><init>(Ll/hk0$a;Ll/mtv;Ll/ktx;)V

    .line 8
    .line 9
    .line 10
    const/16 p3, 0x3e9

    .line 11
    .line 12
    invoke-virtual {p0, p1, p3, p2}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final Z(ILcom/google/android/exoplayer2/source/i$b;Ll/mtv;Ll/ktx;Ljava/io/IOException;Z)V
    .locals 0
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wld;->L1(ILcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    new-instance p1, Ll/zjd;

    .line 6
    .line 7
    invoke-direct/range {p1 .. p6}, Ll/zjd;-><init>(Ll/hk0$a;Ll/mtv;Ll/ktx;Ljava/io/IOException;Z)V

    .line 8
    .line 9
    .line 10
    const/16 p3, 0x3eb

    .line 11
    .line 12
    invoke-virtual {p0, p2, p3, p1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final a(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/tld;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/tld;-><init>(Ll/hk0$a;Z)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x17

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final a0(ILcom/google/android/exoplayer2/source/i$b;)V
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wld;->L1(ILcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ll/kld;

    .line 6
    .line 7
    invoke-direct {p2, p1}, Ll/kld;-><init>(Ll/hk0$a;)V

    .line 8
    .line 9
    .line 10
    const/16 v0, 0x402

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0, p2}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final b(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/wkd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/wkd;-><init>(Ll/hk0$a;Ljava/lang/Exception;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x3f6

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public b0()V
    .locals 0

    .line 1
    return-void
.end method

.method public final c(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/jld;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/jld;-><init>(Ll/hk0$a;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x3fb

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public d(Ll/qyb;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ckd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/ckd;-><init>(Ll/hk0$a;Ll/qyb;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x1b

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public d0(Ll/hk0;)V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/wld;->f:Ll/bqr;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/bqr;->c(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final e(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/mkd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/mkd;-><init>(Ll/hk0$a;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x3f4

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public e0(Ll/hk0;)V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wld;->f:Ll/bqr;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bqr;->j(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f(Ljava/lang/String;JJ)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    new-instance v0, Ll/ijd;

    .line 6
    .line 7
    move-object v2, p1

    .line 8
    move-wide v5, p2

    .line 9
    move-wide v3, p4

    .line 10
    invoke-direct/range {v0 .. v6}, Ll/ijd;-><init>(Ll/hk0$a;Ljava/lang/String;JJ)V

    .line 11
    .line 12
    .line 13
    const/16 p1, 0x3f0

    .line 14
    .line 15
    invoke-virtual {p0, v1, p1, v0}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final f0(II)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/yjd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1, p2}, Ll/yjd;-><init>(Ll/hk0$a;II)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x18

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final g(Lcom/google/android/exoplayer2/k;Ll/nid;)V
    .locals 2
    .param p2    # Ll/nid;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/mjd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1, p2}, Ll/mjd;-><init>(Ll/hk0$a;Lcom/google/android/exoplayer2/k;Ll/nid;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x3f1

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public g0(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public final h(Lcom/google/android/exoplayer2/k;Ll/nid;)V
    .locals 2
    .param p2    # Ll/nid;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/fkd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1, p2}, Ll/fkd;-><init>(Ll/hk0$a;Lcom/google/android/exoplayer2/k;Ll/nid;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x3f9

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public h0(Lcom/google/android/exoplayer2/d0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/skd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/skd;-><init>(Ll/hk0$a;Lcom/google/android/exoplayer2/d0;)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x2

    .line 11
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final i(IJ)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->M1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/tkd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1, p2, p3}, Ll/tkd;-><init>(Ll/hk0$a;IJ)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x3fa

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final i0(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/lld;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/lld;-><init>(Ll/hk0$a;Z)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x3

    .line 11
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final j(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/kjd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/kjd;-><init>(Ll/hk0$a;Ljava/lang/Exception;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x405

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final j0(ILcom/google/android/exoplayer2/source/i$b;Ljava/lang/Exception;)V
    .locals 0
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wld;->L1(ILcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ll/zkd;

    .line 6
    .line 7
    invoke-direct {p2, p1, p3}, Ll/zkd;-><init>(Ll/hk0$a;Ljava/lang/Exception;)V

    .line 8
    .line 9
    .line 10
    const/16 p3, 0x400

    .line 11
    .line 12
    invoke-virtual {p0, p1, p3, p2}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final k(JI)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->M1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/xkd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1, p2, p3}, Ll/xkd;-><init>(Ll/hk0$a;JI)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x3fd

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final k0(F)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/fld;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/fld;-><init>(Ll/hk0$a;F)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x16

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final l(Ljava/lang/String;JJ)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    new-instance v0, Ll/ikd;

    .line 6
    .line 7
    move-object v2, p1

    .line 8
    move-wide v5, p2

    .line 9
    move-wide v3, p4

    .line 10
    invoke-direct/range {v0 .. v6}, Ll/ikd;-><init>(Ll/hk0$a;Ljava/lang/String;JJ)V

    .line 11
    .line 12
    .line 13
    const/16 p1, 0x3f8

    .line 14
    .line 15
    invoke-virtual {p0, v1, p1, v0}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public l0(Lcom/google/android/exoplayer2/t;Lcom/google/android/exoplayer2/t$c;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final m(Ll/jid;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/gkd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/gkd;-><init>(Ll/hk0$a;Ll/jid;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x3f7

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final m0(Ljava/util/List;Lcom/google/android/exoplayer2/source/i$b;)V
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/i$b;",
            ">;",
            "Lcom/google/android/exoplayer2/source/i$b;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wld;->d:Ll/wld$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 4
    .line 5
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/google/android/exoplayer2/t;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2, p0}, Ll/wld$a;->k(Ljava/util/List;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/t;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final n(Lcom/google/android/exoplayer2/metadata/Metadata;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ild;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/ild;-><init>(Ll/hk0$a;Lcom/google/android/exoplayer2/metadata/Metadata;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x1c

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final n0(ZI)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/rjd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1, p2}, Ll/rjd;-><init>(Ll/hk0$a;ZI)V

    .line 8
    .line 9
    .line 10
    const/4 p1, -0x1

    .line 11
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final o(Ll/jid;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->M1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/pkd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/pkd;-><init>(Ll/hk0$a;Ll/jid;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x3fc

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final o0(Lcom/google/android/exoplayer2/n;I)V
    .locals 2
    .param p1    # Lcom/google/android/exoplayer2/n;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/bkd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1, p2}, Ll/bkd;-><init>(Ll/hk0$a;Lcom/google/android/exoplayer2/n;I)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public p(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/myb;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/rkd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/rkd;-><init>(Ll/hk0$a;Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x1b

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final p0(ILcom/google/android/exoplayer2/source/i$b;Ll/ktx;)V
    .locals 0
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wld;->L1(ILcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ll/wjd;

    .line 6
    .line 7
    invoke-direct {p2, p1, p3}, Ll/wjd;-><init>(Ll/hk0$a;Ll/ktx;)V

    .line 8
    .line 9
    .line 10
    const/16 p3, 0x3ec

    .line 11
    .line 12
    invoke-virtual {p0, p1, p3, p2}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final q(J)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/okd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1, p2}, Ll/okd;-><init>(Ll/hk0$a;J)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x3f2

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final q0(ILcom/google/android/exoplayer2/source/i$b;)V
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wld;->L1(ILcom/google/android/exoplayer2/source/i$b;)Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ll/qkd;

    .line 6
    .line 7
    invoke-direct {p2, p1}, Ll/qkd;-><init>(Ll/hk0$a;)V

    .line 8
    .line 9
    .line 10
    const/16 v0, 0x403

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0, p2}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final r(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/jjd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/jjd;-><init>(Ll/hk0$a;Ljava/lang/Exception;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x406

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public r0(Lcom/google/android/exoplayer2/o;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/xjd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/xjd;-><init>(Ll/hk0$a;Lcom/google/android/exoplayer2/o;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0xf

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public release()V
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wld;->h:Ll/sxk;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/sxk;

    .line 8
    .line 9
    new-instance v1, Ll/ojd;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/ojd;-><init>(Ll/wld;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {v0, v1}, Ll/sxk;->i(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final s(Lcom/google/android/exoplayer2/s;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/pjd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/pjd;-><init>(Ll/hk0$a;Lcom/google/android/exoplayer2/s;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0xc

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final t(Ll/jid;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/cld;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/cld;-><init>(Ll/hk0$a;Ll/jid;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x3ef

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final u(IJJ)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/wld;->K1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    new-instance v0, Ll/ekd;

    .line 6
    .line 7
    move v2, p1

    .line 8
    move-wide v3, p2

    .line 9
    move-wide v5, p4

    .line 10
    invoke-direct/range {v0 .. v6}, Ll/ekd;-><init>(Ll/hk0$a;IJJ)V

    .line 11
    .line 12
    .line 13
    const/16 p1, 0x3ee

    .line 14
    .line 15
    invoke-virtual {p0, v1, p1, v0}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final u0(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/nkd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/nkd;-><init>(Ll/hk0$a;I)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x8

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final v(Ll/jid;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->M1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/lkd;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/lkd;-><init>(Ll/hk0$a;Ll/jid;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x3f5

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final w(Ljava/lang/Object;J)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/nld;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1, p2, p3}, Ll/nld;-><init>(Ll/hk0$a;Ljava/lang/Object;J)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x1a

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final x(Ll/zjl0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/mld;

    .line 6
    .line 7
    invoke-direct {v1, v0, p1}, Ll/mld;-><init>(Ll/hk0$a;Ll/zjl0;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x19

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final y(IJJ)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/wld;->N1()Ll/hk0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    new-instance v0, Ll/old;

    .line 6
    .line 7
    move v2, p1

    .line 8
    move-wide v3, p2

    .line 9
    move-wide v5, p4

    .line 10
    invoke-direct/range {v0 .. v6}, Ll/old;-><init>(Ll/hk0$a;IJJ)V

    .line 11
    .line 12
    .line 13
    const/16 p1, 0x3f3

    .line 14
    .line 15
    invoke-virtual {p0, v1, p1, v0}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final z(Lcom/google/android/exoplayer2/t$e;Lcom/google/android/exoplayer2/t$e;I)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p3, v0, :cond_0

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/wld;->i:Z

    .line 6
    .line 7
    :cond_0
    iget-object v0, p0, Ll/wld;->d:Ll/wld$a;

    .line 8
    .line 9
    iget-object v1, p0, Ll/wld;->g:Lcom/google/android/exoplayer2/t;

    .line 10
    .line 11
    invoke-static {v1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/google/android/exoplayer2/t;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/wld$a;->j(Lcom/google/android/exoplayer2/t;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/wld;->H1()Ll/hk0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/bld;

    .line 25
    .line 26
    invoke-direct {v1, v0, p3, p1, p2}, Ll/bld;-><init>(Ll/hk0$a;ILcom/google/android/exoplayer2/t$e;Lcom/google/android/exoplayer2/t$e;)V

    .line 27
    .line 28
    .line 29
    const/16 p1, 0xb

    .line 30
    .line 31
    invoke-virtual {p0, v0, p1, v1}, Ll/wld;->Q1(Ll/hk0$a;ILl/bqr$a;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
