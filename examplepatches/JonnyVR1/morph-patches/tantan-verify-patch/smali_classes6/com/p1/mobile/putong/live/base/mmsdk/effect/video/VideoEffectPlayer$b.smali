.class public Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/velib/player/d$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->setOnErrorListener(Ll/z9m;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/z9m;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/z9m;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$b;->b:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$b;->a:Ll/z9m;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onError(Lcom/immomo/velib/player/d;ILjava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$b;->a:Ll/z9m;

    .line 2
    .line 3
    invoke-interface {p0, p2, p3}, Ll/z9m;->onError(ILjava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
