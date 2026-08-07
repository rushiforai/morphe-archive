.class public final synthetic Ll/q2c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;

.field public final synthetic b:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q2c;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;

    iput-object p2, p0, Ll/q2c;->b:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q2c;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;

    iget-object p0, p0, Ll/q2c;->b:Ljava/io/File;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->b(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;Ljava/io/File;)V

    return-void
.end method
