.class public final Ll/ahv0;
.super Ll/ngv0;
.source "SourceFile"


# instance fields
.field public final a:Ll/dlt0;

.field public final b:Ll/q5u0;

.field public final c:Ll/ndu0;

.field public final d:Ll/ehv0;

.field public final e:Ll/c7w0;

.field public final f:Ll/tcv0;


# direct methods
.method public constructor <init>(Ll/dlt0;Ll/q5u0;Ll/ndu0;Ll/c7w0;Ll/ehv0;Ll/tcv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ngv0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ahv0;->a:Ll/dlt0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ahv0;->b:Ll/q5u0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/ahv0;->c:Ll/ndu0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/ahv0;->e:Ll/c7w0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/ahv0;->d:Ll/ehv0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/ahv0;->f:Ll/tcv0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final c(Ll/o7w0;Landroid/os/Bundle;Ll/q6w0;Ll/b7w0;)Ll/hpr;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ahv0;->b:Ll/q5u0;

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
    iget-object p2, p0, Ll/ahv0;->d:Ll/ehv0;

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
    sget-object p1, Ll/sgs0;->r3:Ll/dgs0;

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
    iget-object p1, p0, Ll/ahv0;->e:Ll/c7w0;

    .line 38
    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    iget-object p2, p0, Ll/ahv0;->b:Ll/q5u0;

    .line 42
    .line 43
    invoke-virtual {p2, p1}, Ll/q5u0;->h(Ll/c7w0;)Ll/q5u0;

    .line 44
    .line 45
    .line 46
    :cond_0
    sget-object p1, Ll/sgs0;->s3:Ll/dgs0;

    .line 47
    .line 48
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Ljava/lang/Boolean;

    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_1

    .line 63
    .line 64
    iget-object p1, p0, Ll/ahv0;->b:Ll/q5u0;

    .line 65
    .line 66
    iget-object p2, p0, Ll/ahv0;->f:Ll/tcv0;

    .line 67
    .line 68
    invoke-virtual {p1, p2}, Ll/q5u0;->d(Ll/tcv0;)Ll/q5u0;

    .line 69
    .line 70
    .line 71
    :cond_1
    iget-object p1, p0, Ll/ahv0;->a:Ll/dlt0;

    .line 72
    .line 73
    iget-object p2, p0, Ll/ahv0;->b:Ll/q5u0;

    .line 74
    .line 75
    invoke-virtual {p1}, Ll/dlt0;->n()Ll/osu0;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p2}, Ll/q5u0;->j()Ll/s5u0;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-interface {p1, p2}, Ll/osu0;->d(Ll/s5u0;)Ll/osu0;

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Ll/ahv0;->c:Ll/ndu0;

    .line 87
    .line 88
    invoke-interface {p1, p0}, Ll/osu0;->a(Ll/ndu0;)Ll/osu0;

    .line 89
    .line 90
    .line 91
    invoke-interface {p1}, Ll/osu0;->zze()Ll/psu0;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Ll/psu0;->zzb()Ll/z0u0;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p0}, Ll/z0u0;->j()Ll/hpr;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p0, p1}, Ll/z0u0;->i(Ll/hpr;)Ll/hpr;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    return-object p0
.end method
