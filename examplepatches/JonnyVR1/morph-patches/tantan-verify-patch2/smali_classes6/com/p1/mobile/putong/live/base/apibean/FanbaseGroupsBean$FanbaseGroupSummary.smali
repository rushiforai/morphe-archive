.class public Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FanbaseGroupSummary;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FanbaseGroupSummary"
.end annotation


# instance fields
.field private maxGroupCount:I

.field final synthetic this$0:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FanbaseGroupSummary;->this$0:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getMaxGroupCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FanbaseGroupSummary;->maxGroupCount:I

    .line 2
    .line 3
    return p0
.end method

.method public setMaxGroupCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FanbaseGroupSummary;->maxGroupCount:I

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
    const-string v1, "FanbaseGroupSummary{maxGroupCount="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget p0, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FanbaseGroupSummary;->maxGroupCount:I

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const/16 p0, 0x7d

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method
