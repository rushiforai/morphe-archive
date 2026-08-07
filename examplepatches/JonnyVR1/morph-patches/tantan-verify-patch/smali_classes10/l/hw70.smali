.class public final synthetic Ll/hw70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/jw70;


# direct methods
.method public synthetic constructor <init>(Ll/jw70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hw70;->a:Ll/jw70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hw70;->a:Ll/jw70;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    invoke-static {p0, p1, p2}, Ll/jw70;->P3(Ll/jw70;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V

    return-void
.end method
