.class public final synthetic Ll/g3c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

.field public final synthetic b:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g3c;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    iput-object p2, p0, Ll/g3c;->b:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g3c;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    iget-object p0, p0, Ll/g3c;->b:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->b(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;)V

    return-void
.end method
