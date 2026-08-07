.class public final synthetic Ll/ev40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gv40;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;


# direct methods
.method public synthetic constructor <init>(Ll/gv40;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ev40;->a:Ll/gv40;

    iput-object p2, p0, Ll/ev40;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ev40;->a:Ll/gv40;

    iget-object p0, p0, Ll/ev40;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListFixItem;

    invoke-static {v0, p0, p1}, Ll/gv40;->b(Ll/gv40;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuListFixItem;)V

    return-void
.end method
