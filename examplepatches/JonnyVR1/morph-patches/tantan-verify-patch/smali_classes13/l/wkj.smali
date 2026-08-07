.class public final synthetic Ll/wkj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/game/GameEngine;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/game/GameEngine;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wkj;->a:Lcom/momo/xeengine/game/GameEngine;

    iput-object p2, p0, Ll/wkj;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wkj;->a:Lcom/momo/xeengine/game/GameEngine;

    iget-object p0, p0, Ll/wkj;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/momo/xeengine/game/GameEngine;->e(Lcom/momo/xeengine/game/GameEngine;Ljava/lang/String;)V

    return-void
.end method
