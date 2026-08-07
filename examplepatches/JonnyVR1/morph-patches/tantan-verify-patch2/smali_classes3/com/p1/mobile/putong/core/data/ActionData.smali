.class public Lcom/p1/mobile/putong/core/data/ActionData;
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
            "Lcom/p1/mobile/putong/core/data/ActionData;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/ActionData;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "actiondata"


# instance fields
.field public dataTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public insertFormat:Lcom/p1/mobile/putong/core/data/ActionInsertFormat;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public pageFormat:Lcom/p1/mobile/putong/core/data/ActionPageFormat;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public toast:Lcom/p1/mobile/putong/core/data/ActionToast;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public traceId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ActionData$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ActionData$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/ActionData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/ActionData$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ActionData$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/ActionData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/ActionData;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ActionData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ActionData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ActionData;->nullCheck()V

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

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ActionData;->clone()Lcom/p1/mobile/putong/core/data/ActionData;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/ActionData;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ActionData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ActionData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toast:Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ActionToast;->clone()Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionData;->toast:Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->pageFormat:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->clone()Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionData;->pageFormat:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 25
    .line 26
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->insertFormat:Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ActionInsertFormat;->clone()Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionData;->insertFormat:Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 35
    .line 36
    :cond_2
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->dataTime:J

    .line 37
    .line 38
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ActionData;->dataTime:J

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 41
    .line 42
    if-eqz v1, :cond_3

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->clone()Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 49
    .line 50
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 51
    .line 52
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 53
    .line 54
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ActionData;->clone()Lcom/p1/mobile/putong/core/data/ActionData;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/ActionData;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/ActionData;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toast:Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ActionData;->toast:Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->pageFormat:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ActionData;->pageFormat:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 26
    .line 27
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->insertFormat:Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ActionData;->insertFormat:Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 36
    .line 37
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ActionData;->dataTime:J

    .line 44
    .line 45
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/ActionData;->dataTime:J

    .line 46
    .line 47
    cmp-long v1, v3, v5

    .line 48
    .line 49
    if-nez v1, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 52
    .line 53
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 54
    .line 55
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 62
    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_2

    .line 70
    .line 71
    return v0

    .line 72
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "actiondata"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 7

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_5

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toast:Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ActionToast;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v2

    .line 18
    :goto_0
    add-int/2addr v0, v1

    .line 19
    mul-int/lit8 v0, v0, 0x29

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->pageFormat:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move v1, v2

    .line 31
    :goto_1
    add-int/2addr v0, v1

    .line 32
    mul-int/lit8 v0, v0, 0x29

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->insertFormat:Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ActionInsertFormat;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    move v1, v2

    .line 44
    :goto_2
    add-int/2addr v0, v1

    .line 45
    mul-int/lit8 v0, v0, 0x29

    .line 46
    .line 47
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ActionData;->dataTime:J

    .line 48
    .line 49
    const/16 v1, 0x20

    .line 50
    .line 51
    ushr-long v5, v3, v1

    .line 52
    .line 53
    xor-long/2addr v3, v5

    .line 54
    long-to-int v1, v3

    .line 55
    add-int/2addr v0, v1

    .line 56
    mul-int/lit8 v0, v0, 0x29

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 59
    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->hashCode()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    goto :goto_3

    .line 67
    :cond_3
    move v1, v2

    .line 68
    :goto_3
    add-int/2addr v0, v1

    .line 69
    mul-int/lit8 v0, v0, 0x29

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 72
    .line 73
    if-eqz v1, :cond_4

    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    :cond_4
    add-int/2addr v0, v2

    .line 80
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 81
    .line 82
    :cond_5
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toast:Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ActionToast;->new_()Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toast:Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->pageFormat:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->new_()Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->pageFormat:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->insertFormat:Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ActionInsertFormat;->new_()Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->insertFormat:Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->new_()Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 40
    .line 41
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 42
    .line 43
    if-nez v0, :cond_4

    .line 44
    .line 45
    const-string v0, ""

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 48
    .line 49
    :cond_4
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ActionData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
