.class public final synthetic Ll/gtu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/stu;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;


# direct methods
.method public synthetic constructor <init>(Ll/stu;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gtu;->a:Ll/stu;

    iput-object p2, p0, Ll/gtu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gtu;->a:Ll/stu;

    iget-object p0, p0, Ll/gtu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Ll/stu;->a3(Ll/stu;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;Ljava/lang/Long;)V

    return-void
.end method
