.class public Ll/u2c;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/nj80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nj80<",
            "Ll/csl;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/pj80;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-direct {v0, v1}, Ll/pj80;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/u2c;->a:Ll/nj80;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()V
    .locals 1

    .line 1
    sget-object v0, Ll/u2c;->a:Ll/nj80;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/nj80;->acquire()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/csl;

    .line 8
    .line 9
    :goto_0
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Ll/u2c;->a:Ll/nj80;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/nj80;->acquire()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/csl;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return-void
.end method

.method public static b(Ll/sh3;)Ll/csl;
    .locals 3

    .line 1
    sget-object v0, Ll/u2c;->a:Ll/nj80;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/nj80;->acquire()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/csl;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-boolean v0, p0, Ll/sh3;->o:Z

    .line 12
    .line 13
    iget-object v1, p0, Ll/sh3;->a:Landroid/content/Context;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    sget v0, Ll/yec0;->D2:I

    .line 19
    .line 20
    invoke-static {v1, v0, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sget v0, Ll/yec0;->q0:I

    .line 28
    .line 29
    invoke-static {v1, v0, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;

    .line 34
    .line 35
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 40
    .line 41
    .line 42
    :goto_1
    invoke-interface {v0, p0}, Ll/csl;->z(Ll/sh3;)V

    .line 43
    .line 44
    .line 45
    return-object v0
.end method

.method public static c(Ll/csl;)V
    .locals 1

    .line 1
    sget-object v0, Ll/u2c;->a:Ll/nj80;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ll/nj80;->release(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ll/csl;->B()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 10
    .line 11
    .line 12
    return-void
.end method
