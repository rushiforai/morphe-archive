.class public final synthetic Ll/vkj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/game/GameEngine;

.field public final synthetic b:Lcom/momo/xeengine/audio/IXAudioPlayer;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/game/GameEngine;Lcom/momo/xeengine/audio/IXAudioPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vkj;->a:Lcom/momo/xeengine/game/GameEngine;

    iput-object p2, p0, Ll/vkj;->b:Lcom/momo/xeengine/audio/IXAudioPlayer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vkj;->a:Lcom/momo/xeengine/game/GameEngine;

    iget-object p0, p0, Ll/vkj;->b:Lcom/momo/xeengine/audio/IXAudioPlayer;

    invoke-static {v0, p0}, Lcom/momo/xeengine/game/GameEngine;->d(Lcom/momo/xeengine/game/GameEngine;Lcom/momo/xeengine/audio/IXAudioPlayer;)V

    return-void
.end method
