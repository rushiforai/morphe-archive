.class public Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;
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
            "Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "summarizedprivilegeprice"


# instance fields
.field public business:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public coinSign:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public diamondSign:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public num:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public originalPrice:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public price:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public promotionPrivilegePrices:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;",
            ">;"
        }
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public unitPrice:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;)Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;->clone()Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->nullCheck()V

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

    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->clone()Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->type:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->type:Ljava/lang/String;

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->unitPrice:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->unitPrice:I

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->coinSign:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->coinSign:Ljava/lang/String;

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->price:I

    .line 23
    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->price:I

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->num:I

    .line 27
    .line 28
    iput v1, v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->num:I

    .line 29
    .line 30
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->originalPrice:I

    .line 31
    .line 32
    iput v1, v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->originalPrice:I

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 35
    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    new-instance v2, Ll/o3h0;

    .line 39
    .line 40
    invoke-direct {v2}, Ll/o3h0;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 48
    .line 49
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->business:Ljava/lang/String;

    .line 50
    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->business:Ljava/lang/String;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->diamondSign:Ljava/lang/String;

    .line 54
    .line 55
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->diamondSign:Ljava/lang/String;

    .line 56
    .line 57
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->clone()Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->type:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->type:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->unitPrice:I

    .line 34
    .line 35
    iget v3, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->unitPrice:I

    .line 36
    .line 37
    if-ne v1, v3, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->coinSign:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->coinSign:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->price:I

    .line 50
    .line 51
    iget v3, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->price:I

    .line 52
    .line 53
    if-ne v1, v3, :cond_2

    .line 54
    .line 55
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->num:I

    .line 56
    .line 57
    iget v3, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->num:I

    .line 58
    .line 59
    if-ne v1, v3, :cond_2

    .line 60
    .line 61
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->originalPrice:I

    .line 62
    .line 63
    iget v3, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->originalPrice:I

    .line 64
    .line 65
    if-ne v1, v3, :cond_2

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 68
    .line 69
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 70
    .line 71
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->business:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->business:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_2

    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->diamondSign:Ljava/lang/String;

    .line 88
    .line 89
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->diamondSign:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-eqz p0, :cond_2

    .line 96
    .line 97
    return v0

    .line 98
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "summarizedprivilegeprice"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_6

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->type:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->unitPrice:I

    .line 35
    .line 36
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->coinSign:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    goto :goto_2

    .line 48
    :cond_2
    move v1, v2

    .line 49
    :goto_2
    add-int/2addr v0, v1

    .line 50
    mul-int/lit8 v0, v0, 0x29

    .line 51
    .line 52
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->price:I

    .line 53
    .line 54
    add-int/2addr v0, v1

    .line 55
    mul-int/lit8 v0, v0, 0x29

    .line 56
    .line 57
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->num:I

    .line 58
    .line 59
    add-int/2addr v0, v1

    .line 60
    mul-int/lit8 v0, v0, 0x29

    .line 61
    .line 62
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->originalPrice:I

    .line 63
    .line 64
    add-int/2addr v0, v1

    .line 65
    mul-int/lit8 v0, v0, 0x29

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 68
    .line 69
    if-eqz v1, :cond_3

    .line 70
    .line 71
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    goto :goto_3

    .line 76
    :cond_3
    move v1, v2

    .line 77
    :goto_3
    add-int/2addr v0, v1

    .line 78
    mul-int/lit8 v0, v0, 0x29

    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->business:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz v1, :cond_4

    .line 83
    .line 84
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    goto :goto_4

    .line 89
    :cond_4
    move v1, v2

    .line 90
    :goto_4
    add-int/2addr v0, v1

    .line 91
    mul-int/lit8 v0, v0, 0x29

    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->diamondSign:Ljava/lang/String;

    .line 94
    .line 95
    if-eqz v1, :cond_5

    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    :cond_5
    add-int/2addr v0, v2

    .line 102
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 103
    .line 104
    :cond_6
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->type:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, ""

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->type:Ljava/lang/String;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->coinSign:Ljava/lang/String;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->coinSign:Ljava/lang/String;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    new-instance v0, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 39
    .line 40
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->business:Ljava/lang/String;

    .line 41
    .line 42
    if-nez v0, :cond_4

    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->business:Ljava/lang/String;

    .line 45
    .line 46
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->diamondSign:Ljava/lang/String;

    .line 47
    .line 48
    if-nez v0, :cond_5

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->diamondSign:Ljava/lang/String;

    .line 51
    .line 52
    :cond_5
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
