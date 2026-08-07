.class public Ll/sre$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/sre;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

.field public b:Z


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
.method public a()Ll/sre;
    .locals 2

    .line 1
    new-instance v0, Ll/sre;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/sre;-><init>(Ll/sre$a;Ll/tre;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public b(Z)Ll/sre$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/sre$a;->b:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;)Ll/sre$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sre$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

    .line 2
    .line 3
    return-object p0
.end method
