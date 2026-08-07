.class public Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;
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
            "Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "verifypremiumisolationconfig"


# instance fields
.field public non_verified_matches_limit:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public non_verified_received_likes_limit:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public restrict_banner_button:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public restrict_banner_texts:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public restrict_non_verified_common:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public restrict_non_verified_matches:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public restrict_non_verified_matches_backend:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public restrict_non_verified_received_likes:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->nullCheck()V

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

    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->clone()Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_received_likes:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_received_likes:Z

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->non_verified_received_likes_limit:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->non_verified_received_likes_limit:I

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_matches_backend:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_matches_backend:Z

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_matches:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_matches:Z

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->non_verified_matches_limit:I

    .line 23
    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->non_verified_matches_limit:I

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_texts:Ljava/util/List;

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    new-instance v2, Ll/l9l0;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/l9l0;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_texts:Ljava/util/List;

    .line 40
    .line 41
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_button:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_button:Ljava/lang/String;

    .line 44
    .line 45
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_common:Z

    .line 46
    .line 47
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_common:Z

    .line 48
    .line 49
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->clone()Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_received_likes:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_received_likes:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->non_verified_received_likes_limit:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->non_verified_received_likes_limit:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_matches_backend:Z

    .line 26
    .line 27
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_matches_backend:Z

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_matches:Z

    .line 32
    .line 33
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_matches:Z

    .line 34
    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->non_verified_matches_limit:I

    .line 38
    .line 39
    iget v3, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->non_verified_matches_limit:I

    .line 40
    .line 41
    if-ne v1, v3, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_texts:Ljava/util/List;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_texts:Ljava/util/List;

    .line 46
    .line 47
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_button:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_button:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_common:Z

    .line 64
    .line 65
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_common:Z

    .line 66
    .line 67
    if-ne p0, p1, :cond_2

    .line 68
    .line 69
    return v0

    .line 70
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "verifypremiumisolationconfig"

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
    if-nez v0, :cond_6

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_received_likes:Z

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->non_verified_received_likes_limit:I

    .line 22
    .line 23
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_matches_backend:Z

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    move v1, v3

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    move v1, v2

    .line 33
    :goto_1
    add-int/2addr v0, v1

    .line 34
    mul-int/lit8 v0, v0, 0x29

    .line 35
    .line 36
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_matches:Z

    .line 37
    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    move v1, v3

    .line 41
    goto :goto_2

    .line 42
    :cond_2
    move v1, v2

    .line 43
    :goto_2
    add-int/2addr v0, v1

    .line 44
    mul-int/lit8 v0, v0, 0x29

    .line 45
    .line 46
    iget v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->non_verified_matches_limit:I

    .line 47
    .line 48
    add-int/2addr v0, v1

    .line 49
    mul-int/lit8 v0, v0, 0x29

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_texts:Ljava/util/List;

    .line 52
    .line 53
    const/4 v4, 0x0

    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    goto :goto_3

    .line 61
    :cond_3
    move v1, v4

    .line 62
    :goto_3
    add-int/2addr v0, v1

    .line 63
    mul-int/lit8 v0, v0, 0x29

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_button:Ljava/lang/String;

    .line 66
    .line 67
    if-eqz v1, :cond_4

    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    :cond_4
    add-int/2addr v0, v4

    .line 74
    mul-int/lit8 v0, v0, 0x29

    .line 75
    .line 76
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_non_verified_common:Z

    .line 77
    .line 78
    if-eqz v1, :cond_5

    .line 79
    .line 80
    move v2, v3

    .line 81
    :cond_5
    add-int/2addr v0, v2

    .line 82
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 83
    .line 84
    :cond_6
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_texts:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_texts:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_button:Ljava/lang/String;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    const-string v0, ""

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->restrict_banner_button:Ljava/lang/String;

    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/VerifyPremiumIsolationConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
