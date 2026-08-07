.class public abstract Ll/t5z0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/s5z0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Ll/b6z0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()Ll/yey0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    throw p0
.end method

.method public b()V
    .locals 1
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/t5z0;->a:Ll/s5z0;

    .line 3
    .line 4
    iput-object v0, p0, Ll/t5z0;->b:Ll/b6z0;

    .line 5
    .line 6
    return-void
.end method

.method public c(Ll/w3y0;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    throw p0
.end method

.method public d()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    throw p0
.end method

.method public abstract e([Ll/afy0;Ll/q2z0;Ll/kzy0;Ll/d0u0;)Ll/u5z0;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation
.end method

.method public abstract f(Ljava/lang/Object;)V
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public final g()Ll/b6z0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t5z0;->b:Ll/b6z0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final h(Ll/s5z0;Ll/b6z0;)V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iput-object p1, p0, Ll/t5z0;->a:Ll/s5z0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/t5z0;->b:Ll/b6z0;

    .line 4
    .line 5
    return-void
.end method

.method public final i()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t5z0;->a:Ll/s5z0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/s5z0;->zzj()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
