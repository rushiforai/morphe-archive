.class public final synthetic Ll/r2c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r2c;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r2c;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;

    check-cast p1, Ljava/io/File;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->c(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;Ljava/io/File;)V

    return-void
.end method
