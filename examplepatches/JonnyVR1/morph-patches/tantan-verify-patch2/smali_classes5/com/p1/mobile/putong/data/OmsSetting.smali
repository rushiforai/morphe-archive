.class public Lcom/p1/mobile/putong/data/OmsSetting;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/ValueObject<",
        "Lcom/p1/mobile/putong/data/OmsSetting;",
        ">;",
        "Ljava/lang/Cloneable;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/data/OmsSetting;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/OmsSetting;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "omssetting"


# instance fields
.field public medalCard:Lcom/p1/mobile/putong/data/MedalCard;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field private parseFieldSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private requestUrl:Ljava/lang/String;

.field public tags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OmsNewTags;",
            ">;"
        }
    .end annotation
.end field

.field public themeView:Lcom/p1/mobile/putong/data/ThemeView;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OmsSetting$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OmsSetting$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/OmsSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/OmsSetting$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OmsSetting$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/OmsSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsSetting;->parseFieldSet:Ljava/util/HashSet;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/OmsNewTags;)Lcom/p1/mobile/putong/data/OmsNewTags;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OmsNewTags;->clone()Lcom/p1/mobile/putong/data/OmsNewTags;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/OmsSetting;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OmsSetting;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OmsSetting;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/OmsSetting;->nullCheck()V

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

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OmsSetting;->clone()Lcom/p1/mobile/putong/data/OmsSetting;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/OmsSetting;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OmsSetting;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OmsSetting;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsSetting;->medalCard:Lcom/p1/mobile/putong/data/MedalCard;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MedalCard;->clone()Lcom/p1/mobile/putong/data/MedalCard;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OmsSetting;->medalCard:Lcom/p1/mobile/putong/data/MedalCard;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ThemeView;->clone()Lcom/p1/mobile/putong/data/ThemeView;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

    .line 25
    .line 26
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OmsSetting;->tags:Ljava/util/List;

    .line 27
    .line 28
    if-eqz p0, :cond_2

    .line 29
    .line 30
    new-instance v1, Ll/vk50;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/vk50;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iput-object p0, v0, Lcom/p1/mobile/putong/data/OmsSetting;->tags:Ljava/util/List;

    .line 40
    .line 41
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

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OmsSetting;->clone()Lcom/p1/mobile/putong/data/OmsSetting;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/OmsSetting;

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
    check-cast p1, Lcom/p1/mobile/putong/data/OmsSetting;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsSetting;->medalCard:Lcom/p1/mobile/putong/data/MedalCard;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OmsSetting;->medalCard:Lcom/p1/mobile/putong/data/MedalCard;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OmsSetting;->tags:Ljava/util/List;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OmsSetting;->tags:Ljava/util/List;

    .line 36
    .line 37
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    return v0

    .line 44
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "omssetting"

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
    if-nez v0, :cond_3

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsSetting;->medalCard:Lcom/p1/mobile/putong/data/MedalCard;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MedalCard;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ThemeView;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsSetting;->tags:Ljava/util/List;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    :cond_2
    add-int/2addr v0, v2

    .line 43
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 44
    .line 45
    :cond_3
    return v0
.end method

.method public isFieldParsed(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OmsSetting;->parseFieldSet:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public mergeData(Lcom/p1/mobile/putong/data/OmsSetting;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/ValueObject;->shouldMergeData()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OmsSetting;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v0, "medalCard"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/OmsSetting;->isFieldParsed(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsSetting;->medalCard:Lcom/p1/mobile/putong/data/MedalCard;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsSetting;->medalCard:Lcom/p1/mobile/putong/data/MedalCard;

    .line 25
    .line 26
    :cond_1
    const-string v0, "themeView"

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/OmsSetting;->isFieldParsed(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

    .line 37
    .line 38
    :cond_2
    const-string v0, "tags"

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/OmsSetting;->isFieldParsed(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_3

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OmsSetting;->tags:Ljava/util/List;

    .line 47
    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OmsSetting;->tags:Ljava/util/List;

    .line 49
    .line 50
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OmsSetting;->parseFieldSet:Ljava/util/HashSet;

    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 53
    .line 54
    .line 55
    :cond_4
    :goto_0
    return-void
.end method

.method public bridge synthetic mergeData(Lcom/tantanapp/common/data/ValueObject;)V
    .locals 0

    .line 56
    check-cast p1, Lcom/p1/mobile/putong/data/OmsSetting;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OmsSetting;->mergeData(Lcom/p1/mobile/putong/data/OmsSetting;)V

    return-void
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OmsSetting;->medalCard:Lcom/p1/mobile/putong/data/MedalCard;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/data/MedalCard;->new_()Lcom/p1/mobile/putong/data/MedalCard;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsSetting;->medalCard:Lcom/p1/mobile/putong/data/MedalCard;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/data/ThemeView;->new_()Lcom/p1/mobile/putong/data/ThemeView;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OmsSetting;->tags:Ljava/util/List;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsSetting;->tags:Ljava/util/List;

    .line 31
    .line 32
    :cond_2
    return-void
.end method

.method public setParsedApiRequest(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OmsSetting;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public subtract(Lcom/p1/mobile/putong/data/OmsSetting;)Lcom/p1/mobile/putong/data/OmsSetting;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OmsSetting;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OmsSetting;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsSetting;->medalCard:Lcom/p1/mobile/putong/data/MedalCard;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-object v2, p1, Lcom/p1/mobile/putong/data/OmsSetting;->medalCard:Lcom/p1/mobile/putong/data/MedalCard;

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/MedalCard;->subtract(Lcom/p1/mobile/putong/data/MedalCard;)Lcom/p1/mobile/putong/data/MedalCard;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OmsSetting;->medalCard:Lcom/p1/mobile/putong/data/MedalCard;

    .line 17
    .line 18
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v2, p1, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/ThemeView;->subtract(Lcom/p1/mobile/putong/data/ThemeView;)Lcom/p1/mobile/putong/data/ThemeView;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

    .line 29
    .line 30
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsSetting;->tags:Ljava/util/List;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OmsSetting;->tags:Ljava/util/List;

    .line 33
    .line 34
    invoke-static {v1, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OmsSetting;->tags:Ljava/util/List;

    .line 41
    .line 42
    iput-object p0, v0, Lcom/p1/mobile/putong/data/OmsSetting;->tags:Ljava/util/List;

    .line 43
    .line 44
    :cond_2
    new-instance p0, Lcom/p1/mobile/putong/data/OmsSetting;

    .line 45
    .line 46
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OmsSetting;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/OmsSetting;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_3

    .line 54
    .line 55
    const/4 p0, 0x0

    .line 56
    return-object p0

    .line 57
    :cond_3
    return-object v0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/OmsSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
