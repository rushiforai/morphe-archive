.class public Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/velib/player/d$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->setCompletionListener(Ll/y9m;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/y9m;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/y9m;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$a;->b:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$a;->a:Ll/y9m;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onCompletion()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$a;->a:Ll/y9m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/y9m;->onCompletion()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
