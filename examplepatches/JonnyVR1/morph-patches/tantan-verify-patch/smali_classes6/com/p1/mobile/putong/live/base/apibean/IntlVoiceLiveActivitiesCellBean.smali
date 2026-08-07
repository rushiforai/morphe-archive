.class public Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;
.super Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;
    }
.end annotation


# instance fields
.field private activities:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "activities"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;",
            ">;"
        }
    .end annotation
.end field

.field private updatedTime:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "updatedTime"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getActivities()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;->activities:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUpdatedTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;->updatedTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public setActivities(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;->activities:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setUpdatedTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;->updatedTime:J

    .line 2
    .line 3
    return-void
.end method
