.class public Lcom/p1/mobile/putong/core/data/ProfileGoodc;
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
            "Lcom/p1/mobile/putong/core/data/ProfileGoodc;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/ProfileGoodc;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "profilegoodc"


# instance fields
.field public enabled:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public info_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcInfoBadge;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public name_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcNameBadge;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public photo_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoBadge;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ProfileGoodc$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ProfileGoodc$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/ProfileGoodc;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ProfileGoodc;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->nullCheck()V

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

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->clone()Lcom/p1/mobile/putong/core/data/ProfileGoodc;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/ProfileGoodc;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ProfileGoodc;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->enabled:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->enabled:Z

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->name_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcNameBadge;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ProfileGoodcNameBadge;->clone()Lcom/p1/mobile/putong/core/data/ProfileGoodcNameBadge;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->name_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcNameBadge;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->info_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcInfoBadge;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ProfileGoodcInfoBadge;->clone()Lcom/p1/mobile/putong/core/data/ProfileGoodcInfoBadge;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->info_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcInfoBadge;

    .line 29
    .line 30
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->photo_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoBadge;

    .line 31
    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoBadge;->clone()Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoBadge;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->photo_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoBadge;

    .line 39
    .line 40
    :cond_2
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->clone()Lcom/p1/mobile/putong/core/data/ProfileGoodc;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/ProfileGoodc;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProfileGoodc;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->enabled:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->enabled:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->name_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcNameBadge;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->name_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcNameBadge;

    .line 22
    .line 23
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->info_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcInfoBadge;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->info_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcInfoBadge;

    .line 32
    .line 33
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->photo_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoBadge;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->photo_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoBadge;

    .line 42
    .line 43
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_2

    .line 48
    .line 49
    return v0

    .line 50
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "profilegoodc"

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
    if-nez v0, :cond_4

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->enabled:Z

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/16 v1, 0x4cf

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/16 v1, 0x4d5

    .line 15
    .line 16
    :goto_0
    add-int/2addr v0, v1

    .line 17
    mul-int/lit8 v0, v0, 0x29

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->name_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcNameBadge;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ProfileGoodcNameBadge;->hashCode()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    move v1, v2

    .line 30
    :goto_1
    add-int/2addr v0, v1

    .line 31
    mul-int/lit8 v0, v0, 0x29

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->info_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcInfoBadge;

    .line 34
    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ProfileGoodcInfoBadge;->hashCode()I

    .line 38
    .line 39
    .line 40
    move-result v1

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->photo_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoBadge;

    .line 47
    .line 48
    if-eqz v1, :cond_3

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoBadge;->hashCode()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    :cond_3
    add-int/2addr v0, v2

    .line 55
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 56
    .line 57
    :cond_4
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->name_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcNameBadge;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileGoodcNameBadge;->new_()Lcom/p1/mobile/putong/core/data/ProfileGoodcNameBadge;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->name_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcNameBadge;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->info_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcInfoBadge;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileGoodcInfoBadge;->new_()Lcom/p1/mobile/putong/core/data/ProfileGoodcInfoBadge;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->info_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcInfoBadge;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->photo_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoBadge;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoBadge;->new_()Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoBadge;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->photo_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoBadge;

    .line 30
    .line 31
    :cond_2
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
