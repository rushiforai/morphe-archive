.class public final synthetic Ll/j310;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j310;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j310;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    check-cast p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

    invoke-static {p0, p1}, Ll/s310;->y(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;)V

    return-void
.end method
