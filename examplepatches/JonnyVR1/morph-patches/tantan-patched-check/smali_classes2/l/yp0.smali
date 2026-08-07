.class public final Ll/yp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kr0;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u000c\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0017\u0010\n\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000f\u0010\u000c\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\u0008J\u000f\u0010\r\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\r\u0010\u0008J\u000f\u0010\u000e\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u0008J\u000f\u0010\u000f\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u0008R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0012"
    }
    d2 = {
        "Ll/yp0;",
        "Ll/kr0;",
        "Ll/xp0;",
        "animatedDrawableBackend",
        "<init>",
        "(Ll/xp0;)V",
        "",
        "getFrameCount",
        "()I",
        "frameNumber",
        "g",
        "(I)I",
        "getLoopCount",
        "f",
        "width",
        "height",
        "a",
        "Ll/xp0;",
        "animated-base_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Ll/xp0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/xp0;)V
    .locals 0
    .param p1    # Ll/xp0;
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
    iput-object p1, p0, Ll/yp0;->a:Ll/xp0;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public f()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yp0;->a:Ll/xp0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/xp0;->d()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yp0;->a:Ll/xp0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/xp0;->a(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFrameCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yp0;->a:Ll/xp0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/xp0;->getFrameCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getLoopCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yp0;->a:Ll/xp0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/xp0;->getLoopCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public height()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yp0;->a:Ll/xp0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/xp0;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public width()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yp0;->a:Ll/xp0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/xp0;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
