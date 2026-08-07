.class public Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "intlflashstickeroptiondata"


# instance fields
.field public active:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public dialog_ui:Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public duration:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public option_data:Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public remain:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public type:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->clone()Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->type:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->type:I

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->active:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->active:Z

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->remain:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->remain:J

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->duration:J

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->duration:J

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->dialog_ui:Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;->clone()Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->dialog_ui:Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 31
    .line 32
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->option_data:Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 33
    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;->clone()Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->option_data:Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 41
    .line 42
    :cond_1
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->clone()Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->type:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->type:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->active:Z

    .line 20
    .line 21
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->active:Z

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->remain:J

    .line 26
    .line 27
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->remain:J

    .line 28
    .line 29
    cmp-long v1, v3, v5

    .line 30
    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->duration:J

    .line 34
    .line 35
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->duration:J

    .line 36
    .line 37
    cmp-long v1, v3, v5

    .line 38
    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->dialog_ui:Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->dialog_ui:Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 44
    .line 45
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->option_data:Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->option_data:Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 54
    .line 55
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_2

    .line 60
    .line 61
    return v0

    .line 62
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "intlflashstickeroptiondata"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 6

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->type:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->active:Z

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    const/16 v1, 0x4cf

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/16 v1, 0x4d5

    .line 20
    .line 21
    :goto_0
    add-int/2addr v0, v1

    .line 22
    mul-int/lit8 v0, v0, 0x29

    .line 23
    .line 24
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->remain:J

    .line 25
    .line 26
    const/16 v3, 0x20

    .line 27
    .line 28
    ushr-long v4, v1, v3

    .line 29
    .line 30
    xor-long/2addr v1, v4

    .line 31
    long-to-int v1, v1

    .line 32
    add-int/2addr v0, v1

    .line 33
    mul-int/lit8 v0, v0, 0x29

    .line 34
    .line 35
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->duration:J

    .line 36
    .line 37
    ushr-long v3, v1, v3

    .line 38
    .line 39
    xor-long/2addr v1, v3

    .line 40
    long-to-int v1, v1

    .line 41
    add-int/2addr v0, v1

    .line 42
    mul-int/lit8 v0, v0, 0x29

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->dialog_ui:Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;->hashCode()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    goto :goto_1

    .line 54
    :cond_1
    move v1, v2

    .line 55
    :goto_1
    add-int/2addr v0, v1

    .line 56
    mul-int/lit8 v0, v0, 0x29

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->option_data:Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 59
    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;->hashCode()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    :cond_2
    add-int/2addr v0, v2

    .line 67
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 68
    .line 69
    :cond_3
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->dialog_ui:Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;->new_()Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->dialog_ui:Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->option_data:Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;->new_()Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->option_data:Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
