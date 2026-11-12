.class public final Lcp3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpvk;


# instance fields
.field public final a:Lpvk;

.field public final synthetic b:Ldp3;


# direct methods
.method public constructor <init>(Ldp3;Lpvk;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcp3;->b:Ldp3;

    iput-object p2, p0, Lcp3;->a:Lpvk;

    return-void
.end method


# virtual methods
.method public final a(I)Z
    .registers 3

    iget-object v0, p0, Lcp3;->b:Ldp3;

    invoke-virtual {v0}, Ldp3;->b()Z

    move-result v0

    if-nez v0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    iget-object p0, p0, Lcp3;->a:Lpvk;

    invoke-interface {p0, p1}, Lpvk;->a(I)Z

    move-result p0

    return p0
.end method

.method public final b(IIIIII)V
    .registers 7

    iget-object p0, p0, Lcp3;->a:Lpvk;

    invoke-interface/range {p0 .. p6}, Lpvk;->b(IIIIII)V

    return-void
.end method

.method public final c(IIIIII)V
    .registers 7

    iget-object p0, p0, Lcp3;->a:Lpvk;

    invoke-interface/range {p0 .. p6}, Lpvk;->c(IIIIII)V

    return-void
.end method

.method public final d()V
    .registers 1

    iget-object p0, p0, Lcp3;->a:Lpvk;

    invoke-interface {p0}, Lpvk;->d()V

    return-void
.end method

.method public final e(III)V
    .registers 4

    iget-object p0, p0, Lcp3;->a:Lpvk;

    invoke-interface {p0, p1, p2, p3}, Lpvk;->e(III)V

    return-void
.end method
