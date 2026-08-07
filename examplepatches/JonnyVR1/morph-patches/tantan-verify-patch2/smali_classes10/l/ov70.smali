.class public final synthetic Ll/ov70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pv70;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

.field public final synthetic d:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/pv70;ZLcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ov70;->a:Ll/pv70;

    iput-boolean p2, p0, Ll/ov70;->b:Z

    iput-object p3, p0, Ll/ov70;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    iput-object p4, p0, Ll/ov70;->d:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ov70;->a:Ll/pv70;

    iget-boolean v1, p0, Ll/ov70;->b:Z

    iget-object v2, p0, Ll/ov70;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    iget-object p0, p0, Ll/ov70;->d:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    invoke-static {v0, v1, v2, p0, p1}, Ll/pv70;->e0(Ll/pv70;ZLcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V

    return-void
.end method
