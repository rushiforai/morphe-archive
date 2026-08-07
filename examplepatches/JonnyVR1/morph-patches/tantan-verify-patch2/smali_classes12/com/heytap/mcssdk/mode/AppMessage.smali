.class public Lcom/heytap/mcssdk/mode/AppMessage;
.super Lcom/heytap/mcssdk/mode/Message;


# instance fields
.field private mBalanceTime:I

.field private mContent:Ljava/lang/String;

.field private mDistinctBycontent:I

.field private mEndDate:J

.field private mForcedDelivery:I

.field private mRule:Ljava/lang/String;

.field private mStartDate:J

.field private mTimeRanges:Ljava/lang/String;

.field private mTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/heytap/mcssdk/mode/Message;-><init>()V

    const-string v0, "08:00-22:00"

    iput-object v0, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mTimeRanges:Ljava/lang/String;

    const/4 v0, 0x0

    iput v0, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mForcedDelivery:I

    iput v0, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mDistinctBycontent:I

    return-void
.end method


# virtual methods
.method public getBalanceTime()I
    .locals 0

    iget p0, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mBalanceTime:I

    return p0
.end method

.method public getContent()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mContent:Ljava/lang/String;

    return-object p0
.end method

.method public getDistinctBycontent()I
    .locals 0

    iget p0, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mDistinctBycontent:I

    return p0
.end method

.method public getEndDate()J
    .locals 2

    iget-wide v0, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mEndDate:J

    return-wide v0
.end method

.method public getForcedDelivery()I
    .locals 0

    iget p0, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mForcedDelivery:I

    return p0
.end method

.method public getRule()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mRule:Ljava/lang/String;

    return-object p0
.end method

.method public getStartDate()J
    .locals 2

    iget-wide v0, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mStartDate:J

    return-wide v0
.end method

.method public getTimeRanges()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mTimeRanges:Ljava/lang/String;

    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mTitle:Ljava/lang/String;

    return-object p0
.end method

.method public getType()I
    .locals 0

    const/16 p0, 0x1002

    return p0
.end method

.method public setBalanceTime(I)V
    .locals 0

    iput p1, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mBalanceTime:I

    return-void
.end method

.method public setContent(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mContent:Ljava/lang/String;

    return-void
.end method

.method public setDistinctBycontent(I)V
    .locals 0

    iput p1, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mDistinctBycontent:I

    return-void
.end method

.method public setEndDate(J)V
    .locals 0

    iput-wide p1, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mEndDate:J

    return-void
.end method

.method public setForcedDelivery(I)V
    .locals 0

    iput p1, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mForcedDelivery:I

    return-void
.end method

.method public setRule(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mRule:Ljava/lang/String;

    return-void
.end method

.method public setStartDate(J)V
    .locals 0

    iput-wide p1, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mStartDate:J

    return-void
.end method

.method public setTimeRanges(Ljava/lang/String;)V
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iput-object p1, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mTimeRanges:Ljava/lang/String;

    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mTitle:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AppMessage{mTitle=\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mContent=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mContent:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mStartDate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mStartDate:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mEndDate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mEndDate:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mBalanceTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mBalanceTime:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mTimeRanges=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mTimeRanges:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mRule=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mRule:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mForcedDelivery="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mForcedDelivery:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mDistinctBycontent="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lcom/heytap/mcssdk/mode/AppMessage;->mDistinctBycontent:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
