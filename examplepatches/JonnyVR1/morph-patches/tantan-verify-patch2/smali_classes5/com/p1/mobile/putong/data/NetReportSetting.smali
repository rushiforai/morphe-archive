.class public Lcom/p1/mobile/putong/data/NetReportSetting;
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
            "Lcom/p1/mobile/putong/data/NetReportSetting;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/NetReportSetting;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "netreportsetting"


# instance fields
.field public androidErrorRate:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public androidHttpdnsLogRate:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public androidSuccessRate:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public domains:Lcom/p1/mobile/putong/data/NetReportDomains;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public enableAndroidHttpdnsLogReport:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public enableNetReport:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public errorRate:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public reportDomains:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public successRate:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/NetReportSetting$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/NetReportSetting$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/NetReportSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/NetReportSetting$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/NetReportSetting$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/NetReportSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/NetReportSetting;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/NetReportSetting;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/NetReportSetting;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/NetReportSetting;->nullCheck()V

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

    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/NetReportSetting;->clone()Lcom/p1/mobile/putong/data/NetReportSetting;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/NetReportSetting;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/NetReportSetting;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/NetReportSetting;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->enableNetReport:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/NetReportSetting;->enableNetReport:Z

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->successRate:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/data/NetReportSetting;->successRate:I

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->errorRate:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/data/NetReportSetting;->errorRate:I

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->domains:Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/NetReportDomains;->clone()Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/data/NetReportSetting;->domains:Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 27
    .line 28
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->reportDomains:Ljava/util/List;

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    new-instance v2, Ll/pi20;

    .line 33
    .line 34
    invoke-direct {v2}, Ll/pi20;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, v0, Lcom/p1/mobile/putong/data/NetReportSetting;->reportDomains:Ljava/util/List;

    .line 42
    .line 43
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->androidSuccessRate:I

    .line 44
    .line 45
    iput v1, v0, Lcom/p1/mobile/putong/data/NetReportSetting;->androidSuccessRate:I

    .line 46
    .line 47
    iget v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->androidErrorRate:I

    .line 48
    .line 49
    iput v1, v0, Lcom/p1/mobile/putong/data/NetReportSetting;->androidErrorRate:I

    .line 50
    .line 51
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->enableAndroidHttpdnsLogReport:Z

    .line 52
    .line 53
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/NetReportSetting;->enableAndroidHttpdnsLogReport:Z

    .line 54
    .line 55
    iget p0, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->androidHttpdnsLogRate:I

    .line 56
    .line 57
    iput p0, v0, Lcom/p1/mobile/putong/data/NetReportSetting;->androidHttpdnsLogRate:I

    .line 58
    .line 59
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/NetReportSetting;->clone()Lcom/p1/mobile/putong/data/NetReportSetting;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/NetReportSetting;

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
    check-cast p1, Lcom/p1/mobile/putong/data/NetReportSetting;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->enableNetReport:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->enableNetReport:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->successRate:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->successRate:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->errorRate:I

    .line 26
    .line 27
    iget v3, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->errorRate:I

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->domains:Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 32
    .line 33
    iget-object v3, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->domains:Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 34
    .line 35
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->reportDomains:Ljava/util/List;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->reportDomains:Ljava/util/List;

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
    iget v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->androidSuccessRate:I

    .line 52
    .line 53
    iget v3, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->androidSuccessRate:I

    .line 54
    .line 55
    if-ne v1, v3, :cond_2

    .line 56
    .line 57
    iget v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->androidErrorRate:I

    .line 58
    .line 59
    iget v3, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->androidErrorRate:I

    .line 60
    .line 61
    if-ne v1, v3, :cond_2

    .line 62
    .line 63
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->enableAndroidHttpdnsLogReport:Z

    .line 64
    .line 65
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->enableAndroidHttpdnsLogReport:Z

    .line 66
    .line 67
    if-ne v1, v3, :cond_2

    .line 68
    .line 69
    iget p0, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->androidHttpdnsLogRate:I

    .line 70
    .line 71
    iget p1, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->androidHttpdnsLogRate:I

    .line 72
    .line 73
    if-ne p0, p1, :cond_2

    .line 74
    .line 75
    return v0

    .line 76
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "netreportsetting"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_4

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->enableNetReport:Z

    .line 8
    .line 9
    const/16 v2, 0x4d5

    .line 10
    .line 11
    const/16 v3, 0x4cf

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    move v1, v3

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
    iget v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->successRate:I

    .line 22
    .line 23
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->errorRate:I

    .line 27
    .line 28
    add-int/2addr v0, v1

    .line 29
    mul-int/lit8 v0, v0, 0x29

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->domains:Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/NetReportDomains;->hashCode()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    move v1, v4

    .line 42
    :goto_1
    add-int/2addr v0, v1

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->reportDomains:Ljava/util/List;

    .line 46
    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    :cond_2
    add-int/2addr v0, v4

    .line 54
    mul-int/lit8 v0, v0, 0x29

    .line 55
    .line 56
    iget v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->androidSuccessRate:I

    .line 57
    .line 58
    add-int/2addr v0, v1

    .line 59
    mul-int/lit8 v0, v0, 0x29

    .line 60
    .line 61
    iget v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->androidErrorRate:I

    .line 62
    .line 63
    add-int/2addr v0, v1

    .line 64
    mul-int/lit8 v0, v0, 0x29

    .line 65
    .line 66
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->enableAndroidHttpdnsLogReport:Z

    .line 67
    .line 68
    if-eqz v1, :cond_3

    .line 69
    .line 70
    move v2, v3

    .line 71
    :cond_3
    add-int/2addr v0, v2

    .line 72
    mul-int/lit8 v0, v0, 0x29

    .line 73
    .line 74
    iget v1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->androidHttpdnsLogRate:I

    .line 75
    .line 76
    add-int/2addr v0, v1

    .line 77
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 78
    .line 79
    :cond_4
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->domains:Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/data/NetReportDomains;->new_()Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->domains:Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->reportDomains:Ljava/util/List;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->reportDomains:Ljava/util/List;

    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/NetReportSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
