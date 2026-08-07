.class public Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivejsdialogitemtype"


# instance fields
.field public actionListener:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public bgColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public btnBgColors:Ljava/util/List;
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

.field public callback:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public checked:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public contentGravity:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public textColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public textSize:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public topMargin:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public withShadow:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->nullCheck()V

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

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->type:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->type:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->title:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->title:Ljava/lang/String;

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->textSize:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->textSize:I

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->textColor:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->textColor:Ljava/lang/String;

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->contentGravity:I

    .line 23
    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->contentGravity:I

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->btnBgColors:Ljava/util/List;

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    new-instance v2, Ll/b22;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/b22;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->btnBgColors:Ljava/util/List;

    .line 40
    .line 41
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->callback:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->callback:Ljava/lang/String;

    .line 44
    .line 45
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->checked:Z

    .line 46
    .line 47
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->checked:Z

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->bgColor:Ljava/lang/String;

    .line 50
    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->bgColor:Ljava/lang/String;

    .line 52
    .line 53
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->topMargin:I

    .line 54
    .line 55
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->topMargin:I

    .line 56
    .line 57
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->withShadow:Z

    .line 58
    .line 59
    iput-boolean p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->withShadow:Z

    .line 60
    .line 61
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->type:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->type:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->title:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->title:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->textSize:I

    .line 34
    .line 35
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->textSize:I

    .line 36
    .line 37
    if-ne v1, v3, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->textColor:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->textColor:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->contentGravity:I

    .line 50
    .line 51
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->contentGravity:I

    .line 52
    .line 53
    if-ne v1, v3, :cond_2

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->btnBgColors:Ljava/util/List;

    .line 56
    .line 57
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->btnBgColors:Ljava/util/List;

    .line 58
    .line 59
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->callback:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->callback:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->checked:Z

    .line 76
    .line 77
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->checked:Z

    .line 78
    .line 79
    if-ne v1, v3, :cond_2

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->bgColor:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->bgColor:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_2

    .line 90
    .line 91
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->topMargin:I

    .line 92
    .line 93
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->topMargin:I

    .line 94
    .line 95
    if-ne v1, v3, :cond_2

    .line 96
    .line 97
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->withShadow:Z

    .line 98
    .line 99
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->withShadow:Z

    .line 100
    .line 101
    if-ne p0, p1, :cond_2

    .line 102
    .line 103
    return v0

    .line 104
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivejsdialogitemtype"

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
    if-nez v0, :cond_8

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->type:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->title:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->textSize:I

    .line 35
    .line 36
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->textColor:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->contentGravity:I

    .line 53
    .line 54
    add-int/2addr v0, v1

    .line 55
    mul-int/lit8 v0, v0, 0x29

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->btnBgColors:Ljava/util/List;

    .line 58
    .line 59
    if-eqz v1, :cond_3

    .line 60
    .line 61
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    goto :goto_3

    .line 66
    :cond_3
    move v1, v2

    .line 67
    :goto_3
    add-int/2addr v0, v1

    .line 68
    mul-int/lit8 v0, v0, 0x29

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->callback:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v1, :cond_4

    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    goto :goto_4

    .line 79
    :cond_4
    move v1, v2

    .line 80
    :goto_4
    add-int/2addr v0, v1

    .line 81
    mul-int/lit8 v0, v0, 0x29

    .line 82
    .line 83
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->checked:Z

    .line 84
    .line 85
    const/16 v3, 0x4d5

    .line 86
    .line 87
    const/16 v4, 0x4cf

    .line 88
    .line 89
    if-eqz v1, :cond_5

    .line 90
    .line 91
    move v1, v4

    .line 92
    goto :goto_5

    .line 93
    :cond_5
    move v1, v3

    .line 94
    :goto_5
    add-int/2addr v0, v1

    .line 95
    mul-int/lit8 v0, v0, 0x29

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->bgColor:Ljava/lang/String;

    .line 98
    .line 99
    if-eqz v1, :cond_6

    .line 100
    .line 101
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    :cond_6
    add-int/2addr v0, v2

    .line 106
    mul-int/lit8 v0, v0, 0x29

    .line 107
    .line 108
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->topMargin:I

    .line 109
    .line 110
    add-int/2addr v0, v1

    .line 111
    mul-int/lit8 v0, v0, 0x29

    .line 112
    .line 113
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->withShadow:Z

    .line 114
    .line 115
    if-eqz v1, :cond_7

    .line 116
    .line 117
    move v3, v4

    .line 118
    :cond_7
    add-int/2addr v0, v3

    .line 119
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 120
    .line 121
    :cond_8
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->type:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->type:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->title:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->title:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->textColor:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->textColor:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->btnBgColors:Ljava/util/List;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->btnBgColors:Ljava/util/List;

    .line 31
    .line 32
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->callback:Ljava/lang/String;

    .line 33
    .line 34
    if-nez v0, :cond_4

    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->callback:Ljava/lang/String;

    .line 37
    .line 38
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->bgColor:Ljava/lang/String;

    .line 39
    .line 40
    if-nez v0, :cond_5

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->bgColor:Ljava/lang/String;

    .line 43
    .line 44
    :cond_5
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
