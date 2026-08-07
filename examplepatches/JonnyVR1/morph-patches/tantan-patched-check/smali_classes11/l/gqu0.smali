.class public final Ll/gqu0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/concurrent/Executor;

.field public final b:Ll/rvt0;

.field public final c:Ll/agu0;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Ll/rvt0;Ll/agu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gqu0;->a:Ljava/util/concurrent/Executor;

    .line 5
    .line 6
    iput-object p3, p0, Ll/gqu0;->c:Ll/agu0;

    .line 7
    .line 8
    iput-object p2, p0, Ll/gqu0;->b:Ll/rvt0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Ll/wit0;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/gqu0;->c:Ll/agu0;

    .line 5
    .line 6
    invoke-interface {p1}, Ll/wit0;->zzF()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ll/agu0;->w0(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/gqu0;->c:Ll/agu0;

    .line 14
    .line 15
    new-instance v1, Ll/cqu0;

    .line 16
    .line 17
    invoke-direct {v1, p1}, Ll/cqu0;-><init>(Ll/wit0;)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Ll/gqu0;->a:Ljava/util/concurrent/Executor;

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Ll/kdu0;->q0(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/gqu0;->c:Ll/agu0;

    .line 26
    .line 27
    new-instance v1, Ll/dqu0;

    .line 28
    .line 29
    invoke-direct {v1, p1}, Ll/dqu0;-><init>(Ll/wit0;)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Ll/gqu0;->a:Ljava/util/concurrent/Executor;

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Ll/kdu0;->q0(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/gqu0;->c:Ll/agu0;

    .line 38
    .line 39
    iget-object v1, p0, Ll/gqu0;->b:Ll/rvt0;

    .line 40
    .line 41
    iget-object v2, p0, Ll/gqu0;->a:Ljava/util/concurrent/Executor;

    .line 42
    .line 43
    invoke-virtual {v0, v1, v2}, Ll/kdu0;->q0(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/gqu0;->b:Ll/rvt0;

    .line 47
    .line 48
    invoke-virtual {v0, p1}, Ll/rvt0;->u(Ll/wit0;)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Ll/equ0;

    .line 52
    .line 53
    invoke-direct {v0, p0}, Ll/equ0;-><init>(Ll/gqu0;)V

    .line 54
    .line 55
    .line 56
    const-string v1, "/trackActiveViewUnit"

    .line 57
    .line 58
    invoke-interface {p1, v1, v0}, Ll/wit0;->j0(Ljava/lang/String;Ll/bqs0;)V

    .line 59
    .line 60
    .line 61
    new-instance v0, Ll/fqu0;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Ll/fqu0;-><init>(Ll/gqu0;)V

    .line 64
    .line 65
    .line 66
    const-string p0, "/untrackActiveViewUnit"

    .line 67
    .line 68
    invoke-interface {p1, p0, v0}, Ll/wit0;->j0(Ljava/lang/String;Ll/bqs0;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final synthetic b(Ll/wit0;Ljava/util/Map;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gqu0;->b:Ll/rvt0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rvt0;->i()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic c(Ll/wit0;Ljava/util/Map;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gqu0;->b:Ll/rvt0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rvt0;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
