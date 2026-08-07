.class public final synthetic Ll/nlq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/game/GameEngine;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/game/GameEngine;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nlq0;->a:Lcom/momo/xeengine/game/GameEngine;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nlq0;->a:Lcom/momo/xeengine/game/GameEngine;

    invoke-virtual {p0}, Lcom/momo/xeengine/game/GameEngine;->requestRender()V

    return-void
.end method
