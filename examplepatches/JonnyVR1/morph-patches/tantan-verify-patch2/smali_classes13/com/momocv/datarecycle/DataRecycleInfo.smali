.class public Lcom/momocv/datarecycle/DataRecycleInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momocv/datarecycle/DataRecycleInfo$DataRecyleType;
    }
.end annotation


# instance fields
.field public datum_buf_:[B

.field public info_:Ljava/lang/String;

.field public score_:F

.field public type_:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momocv/datarecycle/DataRecycleInfo;->type_:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/momocv/datarecycle/DataRecycleInfo;->score_:F

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/momocv/datarecycle/DataRecycleInfo;->datum_buf_:[B

    .line 12
    .line 13
    const-string v0, ""

    .line 14
    .line 15
    iput-object v0, p0, Lcom/momocv/datarecycle/DataRecycleInfo;->info_:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public clone()Lcom/momocv/datarecycle/DataRecycleInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/momocv/datarecycle/DataRecycleInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momocv/datarecycle/DataRecycleInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/momocv/datarecycle/DataRecycleInfo;->copy_from(Lcom/momocv/datarecycle/DataRecycleInfo;)Z

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 10
    invoke-virtual {p0}, Lcom/momocv/datarecycle/DataRecycleInfo;->clone()Lcom/momocv/datarecycle/DataRecycleInfo;

    move-result-object p0

    return-object p0
.end method

.method public copy_from(Lcom/momocv/datarecycle/DataRecycleInfo;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p1, Lcom/momocv/datarecycle/DataRecycleInfo;->info_:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, p0, Lcom/momocv/datarecycle/DataRecycleInfo;->info_:Ljava/lang/String;

    .line 8
    .line 9
    iget v1, p1, Lcom/momocv/datarecycle/DataRecycleInfo;->type_:I

    .line 10
    .line 11
    iput v1, p0, Lcom/momocv/datarecycle/DataRecycleInfo;->type_:I

    .line 12
    .line 13
    iget v1, p1, Lcom/momocv/datarecycle/DataRecycleInfo;->score_:F

    .line 14
    .line 15
    iput v1, p0, Lcom/momocv/datarecycle/DataRecycleInfo;->score_:F

    .line 16
    .line 17
    iget-object p1, p1, Lcom/momocv/datarecycle/DataRecycleInfo;->datum_buf_:[B

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, [B->clone()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, [B

    .line 26
    .line 27
    iput-object p1, p0, Lcom/momocv/datarecycle/DataRecycleInfo;->datum_buf_:[B

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    return v0
.end method
