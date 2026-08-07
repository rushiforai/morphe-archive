.class public final Ll/z8t0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/google/android/gms/common/util/Clock;

.field public final b:Ll/grw0;

.field public final c:Ll/s9t0;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/util/Clock;Ll/grw0;Ll/s9t0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/z8t0;->a:Lcom/google/android/gms/common/util/Clock;

    .line 5
    .line 6
    iput-object p2, p0, Ll/z8t0;->b:Ll/grw0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/z8t0;->c:Ll/s9t0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(IJ)V
    .locals 4

    .line 1
    sget-object v0, Ll/sgs0;->p0:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v0, p0, Ll/z8t0;->b:Ll/grw0;

    .line 21
    .line 22
    invoke-interface {v0}, Ll/grw0;->zzf()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    sub-long v0, p2, v0

    .line 27
    .line 28
    const-wide/16 v2, 0x0

    .line 29
    .line 30
    cmp-long v0, v0, v2

    .line 31
    .line 32
    if-gez v0, :cond_1

    .line 33
    .line 34
    const-string p0, "Receiving npa decision in the past, ignoring."

    .line 35
    .line 36
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    sget-object v0, Ll/sgs0;->q0:Ll/dgs0;

    .line 41
    .line 42
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Ljava/lang/Boolean;

    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iget-object v1, p0, Ll/z8t0;->b:Ll/grw0;

    .line 57
    .line 58
    if-nez v0, :cond_2

    .line 59
    .line 60
    const/4 p1, -0x1

    .line 61
    invoke-interface {v1, p1}, Ll/grw0;->e(I)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ll/z8t0;->b:Ll/grw0;

    .line 65
    .line 66
    invoke-interface {p0, p2, p3}, Ll/grw0;->l(J)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    invoke-interface {v1, p1}, Ll/grw0;->e(I)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Ll/z8t0;->b:Ll/grw0;

    .line 74
    .line 75
    invoke-interface {p0, p2, p3}, Ll/grw0;->l(J)V

    .line 76
    .line 77
    .line 78
    return-void
.end method
