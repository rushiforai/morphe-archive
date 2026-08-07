.class public final synthetic Ll/p420;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r420;


# direct methods
.method public synthetic constructor <init>(Ll/r420;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p420;->a:Ll/r420;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p420;->a:Ll/r420;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    invoke-static {p0, p1}, Ll/r420;->g0(Ll/r420;Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;)V

    return-void
.end method
