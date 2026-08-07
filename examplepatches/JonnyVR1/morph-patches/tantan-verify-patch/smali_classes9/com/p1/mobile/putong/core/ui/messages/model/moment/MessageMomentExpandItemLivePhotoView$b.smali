.class public Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ga1;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$b;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$b;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->V(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public d(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V
    .locals 0

    .line 1
    invoke-virtual {p5}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->isHighLevelBusiness()Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    if-nez p4, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 8
    .line 9
    .line 10
    move-result-object p4

    .line 11
    invoke-virtual {p4, p1, p2, p3}, Ll/pb1;->g(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$b;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;

    .line 16
    .line 17
    const/4 p2, 0x1

    .line 18
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->V(Z)V

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$b;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->P(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public success()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$b;->a:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->P(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
