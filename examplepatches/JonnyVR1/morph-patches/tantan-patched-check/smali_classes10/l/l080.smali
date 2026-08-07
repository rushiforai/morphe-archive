.class public final synthetic Ll/l080;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b180;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;


# direct methods
.method public synthetic constructor <init>(Ll/b180;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l080;->a:Ll/b180;

    iput-object p2, p0, Ll/l080;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l080;->a:Ll/b180;

    iget-object p0, p0, Ll/l080;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;

    invoke-static {v0, p0, p1}, Ll/b180;->J3(Ll/b180;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method
