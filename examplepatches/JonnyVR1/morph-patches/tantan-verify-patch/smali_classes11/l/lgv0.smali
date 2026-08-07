.class public final Ll/lgv0;
.super Ll/ngv0;
.source "SourceFile"


# instance fields
.field public final a:Ll/dlt0;

.field public final b:Ll/lju0;

.field public final c:Ll/q5u0;

.field public final d:Ll/ndu0;

.field public final e:Ll/ehv0;

.field public final f:Ll/tcv0;


# direct methods
.method public constructor <init>(Ll/dlt0;Ll/lju0;Ll/q5u0;Ll/ndu0;Ll/ehv0;Ll/tcv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ngv0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lgv0;->a:Ll/dlt0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/lgv0;->b:Ll/lju0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/lgv0;->c:Ll/q5u0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/lgv0;->d:Ll/ndu0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/lgv0;->e:Ll/ehv0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/lgv0;->f:Ll/tcv0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final c(Ll/o7w0;Landroid/os/Bundle;Ll/q6w0;Ll/b7w0;)Ll/hpr;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lgv0;->c:Ll/q5u0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/q5u0;->i(Ll/o7w0;)Ll/q5u0;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p2}, Ll/q5u0;->f(Landroid/os/Bundle;)Ll/q5u0;

    .line 7
    .line 8
    .line 9
    new-instance p1, Ll/z3u0;

    .line 10
    .line 11
    iget-object p2, p0, Ll/lgv0;->e:Ll/ehv0;

    .line 12
    .line 13
    invoke-direct {p1, p4, p3, p2}, Ll/z3u0;-><init>(Ll/b7w0;Ll/q6w0;Ll/ehv0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ll/q5u0;->g(Ll/z3u0;)Ll/q5u0;

    .line 17
    .line 18
    .line 19
    sget-object p1, Ll/sgs0;->s3:Ll/dgs0;

    .line 20
    .line 21
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    iget-object p1, p0, Ll/lgv0;->c:Ll/q5u0;

    .line 38
    .line 39
    iget-object p2, p0, Ll/lgv0;->f:Ll/tcv0;

    .line 40
    .line 41
    invoke-virtual {p1, p2}, Ll/q5u0;->d(Ll/tcv0;)Ll/q5u0;

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Ll/lgv0;->a:Ll/dlt0;

    .line 45
    .line 46
    iget-object p2, p0, Ll/lgv0;->c:Ll/q5u0;

    .line 47
    .line 48
    invoke-virtual {p1}, Ll/dlt0;->m()Ll/pju0;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p2}, Ll/q5u0;->j()Ll/s5u0;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-interface {p1, p2}, Ll/pju0;->l(Ll/s5u0;)Ll/pju0;

    .line 57
    .line 58
    .line 59
    iget-object p2, p0, Ll/lgv0;->d:Ll/ndu0;

    .line 60
    .line 61
    invoke-interface {p1, p2}, Ll/pju0;->h(Ll/ndu0;)Ll/pju0;

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ll/lgv0;->b:Ll/lju0;

    .line 65
    .line 66
    invoke-interface {p1, p0}, Ll/pju0;->c(Ll/lju0;)Ll/pju0;

    .line 67
    .line 68
    .line 69
    new-instance p0, Ll/rwt0;

    .line 70
    .line 71
    const/4 p2, 0x0

    .line 72
    invoke-direct {p0, p2}, Ll/rwt0;-><init>(Landroid/view/ViewGroup;)V

    .line 73
    .line 74
    .line 75
    invoke-interface {p1, p0}, Ll/pju0;->b(Ll/rwt0;)Ll/pju0;

    .line 76
    .line 77
    .line 78
    invoke-interface {p1}, Ll/pju0;->zzg()Ll/qju0;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Ll/qju0;->a()Ll/z0u0;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Ll/z0u0;->j()Ll/hpr;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p0, p1}, Ll/z0u0;->i(Ll/hpr;)Ll/hpr;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0
.end method
