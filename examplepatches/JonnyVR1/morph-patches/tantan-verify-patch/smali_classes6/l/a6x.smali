.class public final Ll/a6x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wol;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/a6x$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u0000 \u001e2\u00020\u0001:\u0001\u0011B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0017\u0010\t\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000c\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0017\u0010\u000f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\rJ\u000f\u0010\u0012\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\rJ\u000f\u0010\u0013\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\rR\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0011\u0010\u0014\u001a\u0004\u0008\u0015\u0010\u0016R\u0018\u0010\u001a\u001a\u0004\u0018\u00010\u00178\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010\u0019R\u0018\u0010\u001d\u001a\u0004\u0018\u00010\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010\u001c\u00a8\u0006\u001f"
    }
    d2 = {
        "Ll/a6x;",
        "Ll/wol;",
        "Ll/ap0;",
        "player",
        "<init>",
        "(Ll/ap0;)V",
        "Ll/jo0;",
        "config",
        "",
        "e",
        "(Ll/jo0;)I",
        "",
        "f",
        "()V",
        "frameIndex",
        "d",
        "(I)V",
        "a",
        "onDestroy",
        "g",
        "Ll/ap0;",
        "h",
        "()Ll/ap0;",
        "Lcom/tencent/qgame/animplayer/mask/MaskRender;",
        "b",
        "Lcom/tencent/qgame/animplayer/mask/MaskRender;",
        "maskRender",
        "c",
        "Ll/jo0;",
        "animConfig",
        "Companion",
        "base_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final Companion:Ll/a6x$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ll/ap0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Lcom/tencent/qgame/animplayer/mask/MaskRender;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public c:Ll/jo0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/a6x$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/a6x$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/a6x;->Companion:Ll/a6x$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ll/ap0;)V
    .locals 0
    .param p1    # Ll/ap0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/a6x;->a:Ll/ap0;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/a6x;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge b(Landroid/view/MotionEvent;)Z
    .locals 0
    .param p1    # Landroid/view/MotionEvent;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/wol;->b(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge c(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/wol;->c(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(I)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/a6x;->a:Ll/ap0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/ap0;->k()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/a6x;->a:Ll/ap0;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/ap0;->e()Ll/ko0;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ll/ko0;->b()Ll/jo0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Ll/a6x;->a:Ll/ap0;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/ap0;->e()Ll/ko0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ll/ko0;->b()Ll/jo0;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Ll/a6x;->c:Ll/jo0;

    .line 32
    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Ll/a6x;->b:Lcom/tencent/qgame/animplayer/mask/MaskRender;

    .line 36
    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/tencent/qgame/animplayer/mask/MaskRender;->renderFrame(Ll/jo0;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public e(Ll/jo0;)I
    .locals 0
    .param p1    # Ll/jo0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    return p0
.end method

.method public f()V
    .locals 3

    .line 1
    sget-object v0, Ll/z0;->INSTANCE:Ll/z0;

    .line 2
    .line 3
    const-string v1, "AnimPlayer.MaskAnimPlugin"

    .line 4
    .line 5
    const-string v2, "mask render init"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/z0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/a6x;->a:Ll/ap0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/ap0;->k()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    new-instance v0, Lcom/tencent/qgame/animplayer/mask/MaskRender;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lcom/tencent/qgame/animplayer/mask/MaskRender;-><init>(Ll/a6x;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/a6x;->b:Lcom/tencent/qgame/animplayer/mask/MaskRender;

    .line 24
    .line 25
    iget-object p0, p0, Ll/a6x;->a:Ll/ap0;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ap0;->h()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    invoke-virtual {v0, p0}, Lcom/tencent/qgame/animplayer/mask/MaskRender;->initMaskShader(Z)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final g()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a6x;->c:Ll/jo0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jo0;->f()Ll/c6x;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/c6x;->e()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final h()Ll/ap0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/a6x;->a:Ll/ap0;

    .line 2
    .line 3
    return-object p0
.end method

.method public onDestroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/a6x;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
