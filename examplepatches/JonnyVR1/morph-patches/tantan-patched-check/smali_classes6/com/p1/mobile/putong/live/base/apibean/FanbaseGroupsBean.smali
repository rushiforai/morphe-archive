.class public Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;
.super Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FanbaseGroupSummary;,
        Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$TagItemBean;,
        Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$CategoryBean;,
        Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;
    }
.end annotation


# instance fields
.field private fanbaseGroupSummary:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FanbaseGroupSummary;

.field private fanbaseGroups:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;",
            ">;"
        }
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
.method public getFanbaseGroupSummary()Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FanbaseGroupSummary;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;->fanbaseGroupSummary:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FanbaseGroupSummary;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFanbaseGroups()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;->fanbaseGroups:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public setFanbaseGroupSummary(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FanbaseGroupSummary;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;->fanbaseGroupSummary:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FanbaseGroupSummary;

    .line 2
    .line 3
    return-void
.end method

.method public setFanbaseGroups(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;->fanbaseGroups:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "FanbaseGroupsBean{fanbaseGroupSummary="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;->fanbaseGroupSummary:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FanbaseGroupSummary;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", fanbaseGroups="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;->fanbaseGroups:Ljava/util/List;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const/16 p0, 0x7d

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
