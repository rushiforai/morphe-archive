.class public abstract Ll/cgj0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/cgj0$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public a:Ll/cgj0$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Ll/md2;
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
.method public final a()Ll/md2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cgj0;->b:Ll/md2;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/md2;

    .line 8
    .line 9
    return-object p0
.end method

.method public c()Ll/agj0;
    .locals 0

    .line 1
    sget-object p0, Ll/agj0;->A:Ll/agj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Lcom/google/android/exoplayer2/y$a;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public e(Ll/cgj0$a;Ll/md2;)V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iput-object p1, p0, Ll/cgj0;->a:Ll/cgj0$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/cgj0;->b:Ll/md2;

    .line 4
    .line 5
    return-void
.end method

.method public final f()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cgj0;->a:Ll/cgj0$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/cgj0$a;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final g(Lcom/google/android/exoplayer2/x;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cgj0;->a:Ll/cgj0$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/cgj0$a;->b(Lcom/google/android/exoplayer2/x;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public h()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public abstract i(Ljava/lang/Object;)V
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public j()V
    .locals 1
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/cgj0;->a:Ll/cgj0$a;

    .line 3
    .line 4
    iput-object v0, p0, Ll/cgj0;->b:Ll/md2;

    .line 5
    .line 6
    return-void
.end method

.method public abstract k([Lcom/google/android/exoplayer2/y;Ll/ffj0;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0;)Ll/dgj0;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation
.end method

.method public l(Lcom/google/android/exoplayer2/audio/a;)V
    .locals 0

    .line 1
    return-void
.end method

.method public m(Ll/agj0;)V
    .locals 0

    .line 1
    return-void
.end method
