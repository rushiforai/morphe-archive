.class public final Ll/qgv0;
.super Ll/ngv0;
.source "SourceFile"


# instance fields
.field public final a:Ll/dlt0;

.field public final b:Ll/q5u0;

.field public final c:Ll/ujv0;

.field public final d:Ll/ndu0;

.field public final e:Ll/lju0;

.field public final f:Ll/r9u0;

.field public final g:Landroid/view/ViewGroup;

.field public final h:Ll/lcu0;

.field public final i:Ll/ehv0;

.field public final j:Ll/tcv0;


# direct methods
.method public constructor <init>(Ll/dlt0;Ll/q5u0;Ll/ujv0;Ll/ndu0;Ll/lju0;Ll/r9u0;Landroid/view/ViewGroup;Ll/lcu0;Ll/ehv0;Ll/tcv0;)V
    .locals 0
    .param p7    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Ll/lcu0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/ngv0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qgv0;->a:Ll/dlt0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/qgv0;->b:Ll/q5u0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/qgv0;->c:Ll/ujv0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/qgv0;->d:Ll/ndu0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/qgv0;->e:Ll/lju0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/qgv0;->f:Ll/r9u0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/qgv0;->g:Landroid/view/ViewGroup;

    .line 17
    .line 18
    iput-object p8, p0, Ll/qgv0;->h:Ll/lcu0;

    .line 19
    .line 20
    iput-object p9, p0, Ll/qgv0;->i:Ll/ehv0;

    .line 21
    .line 22
    iput-object p10, p0, Ll/qgv0;->j:Ll/tcv0;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final c(Ll/o7w0;Landroid/os/Bundle;Ll/q6w0;Ll/b7w0;)Ll/hpr;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qgv0;->b:Ll/q5u0;

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
    iget-object p2, p0, Ll/qgv0;->i:Ll/ehv0;

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
    iget-object p1, p0, Ll/qgv0;->b:Ll/q5u0;

    .line 38
    .line 39
    iget-object p2, p0, Ll/qgv0;->j:Ll/tcv0;

    .line 40
    .line 41
    invoke-virtual {p1, p2}, Ll/q5u0;->d(Ll/tcv0;)Ll/q5u0;

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Ll/qgv0;->a:Ll/dlt0;

    .line 45
    .line 46
    iget-object p2, p0, Ll/qgv0;->b:Ll/q5u0;

    .line 47
    .line 48
    invoke-virtual {p1}, Ll/dlt0;->j()Ll/yxt0;

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
    invoke-interface {p1, p2}, Ll/yxt0;->o(Ll/s5u0;)Ll/yxt0;

    .line 57
    .line 58
    .line 59
    iget-object p2, p0, Ll/qgv0;->d:Ll/ndu0;

    .line 60
    .line 61
    invoke-interface {p1, p2}, Ll/yxt0;->g(Ll/ndu0;)Ll/yxt0;

    .line 62
    .line 63
    .line 64
    iget-object p2, p0, Ll/qgv0;->c:Ll/ujv0;

    .line 65
    .line 66
    invoke-interface {p1, p2}, Ll/yxt0;->p(Ll/ujv0;)Ll/yxt0;

    .line 67
    .line 68
    .line 69
    iget-object p2, p0, Ll/qgv0;->e:Ll/lju0;

    .line 70
    .line 71
    invoke-interface {p1, p2}, Ll/yxt0;->c(Ll/lju0;)Ll/yxt0;

    .line 72
    .line 73
    .line 74
    iget-object p2, p0, Ll/qgv0;->f:Ll/r9u0;

    .line 75
    .line 76
    iget-object p3, p0, Ll/qgv0;->h:Ll/lcu0;

    .line 77
    .line 78
    new-instance p4, Ll/vyt0;

    .line 79
    .line 80
    invoke-direct {p4, p2, p3}, Ll/vyt0;-><init>(Ll/r9u0;Ll/lcu0;)V

    .line 81
    .line 82
    .line 83
    invoke-interface {p1, p4}, Ll/yxt0;->e(Ll/vyt0;)Ll/yxt0;

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Ll/qgv0;->g:Landroid/view/ViewGroup;

    .line 87
    .line 88
    new-instance p2, Ll/rwt0;

    .line 89
    .line 90
    invoke-direct {p2, p0}, Ll/rwt0;-><init>(Landroid/view/ViewGroup;)V

    .line 91
    .line 92
    .line 93
    invoke-interface {p1, p2}, Ll/yxt0;->b(Ll/rwt0;)Ll/yxt0;

    .line 94
    .line 95
    .line 96
    invoke-interface {p1}, Ll/yxt0;->zzk()Ll/zxt0;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0}, Ll/zxt0;->d()Ll/z0u0;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p0}, Ll/z0u0;->j()Ll/hpr;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p0, p1}, Ll/z0u0;->i(Ll/hpr;)Ll/hpr;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0
.end method
