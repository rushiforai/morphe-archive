.class public final Lwb;
.super Lcb;
.source "SourceFile"

# interfaces
.implements Lywk;
.implements Lp5j;


# instance fields
.field public final a:Lc4;


# direct methods
.method public constructor <init>(Lc4;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwb;->a:Lc4;

    return-void
.end method


# virtual methods
.method public final B()V
    .registers 1

    invoke-virtual {p0}, Lwb;->h()V

    return-void
.end method

.method public final G(I)V
    .registers 2

    invoke-virtual {p0}, Lwb;->h()V

    return-void
.end method

.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "enable_sync"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_9

    return-void

    :cond_9
    invoke-virtual {p0}, Lwb;->h()V

    return-void
.end method

.method public final a()V
    .registers 1

    invoke-virtual {p0}, Lwb;->h()V

    return-void
.end method

.method public final b()V
    .registers 1

    invoke-virtual {p0}, Lwb;->h()V

    return-void
.end method

.method public final c()V
    .registers 1

    invoke-virtual {p0}, Lwb;->h()V

    return-void
.end method

.method public final d(Z)V
    .registers 2

    invoke-virtual {p0}, Lwb;->h()V

    return-void
.end method

.method public final e(Z)V
    .registers 2

    return-void
.end method

.method public final f()V
    .registers 1

    invoke-virtual {p0}, Lwb;->h()V

    return-void
.end method

.method public final g()V
    .registers 1

    return-void
.end method

.method public final h()V
    .registers 1

    iget-object p0, p0, Lwb;->a:Lc4;

    invoke-virtual {p0}, Lc4;->run()V

    return-void
.end method
