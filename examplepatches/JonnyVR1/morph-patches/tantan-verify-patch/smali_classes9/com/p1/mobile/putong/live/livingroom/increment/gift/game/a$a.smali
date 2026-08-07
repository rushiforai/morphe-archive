.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/game/IXGameView$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->k(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$a;->b(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final synthetic b(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;->b(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onEngineDynamicLinkLibraryDownloadProcess(ID)V
    .locals 0

    return-void
.end method

.method public onRenderSizeChanged(II)V
    .locals 0

    return-void
.end method

.method public onRenderViewCreate(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public onStart(Lcom/momo/xeengine/IXEngine;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;Lcom/momo/xeengine/IXEngine;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onStartFailed(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/ykj;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/ykj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$a;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method
