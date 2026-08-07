.class public Lcom/p1/mobile/putong/data/BannerAction;
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
            "Lcom/p1/mobile/putong/data/BannerAction;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/BannerAction;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "banneraction"


# instance fields
.field public frequency:Lcom/p1/mobile/putong/data/BannerFrequency;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public red_dot:Lcom/p1/mobile/putong/data/BannerRedDot;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public scroll:Lcom/p1/mobile/putong/data/BannerScroll;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public swipe_count:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/BannerAction$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/BannerAction$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/BannerAction;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/BannerAction$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/BannerAction$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/BannerAction;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/BannerAction;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/BannerAction;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/BannerAction;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/BannerAction;->nullCheck()V

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

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/BannerAction;->clone()Lcom/p1/mobile/putong/data/BannerAction;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/BannerAction;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/BannerAction;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/BannerAction;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/BannerAction;->frequency:Lcom/p1/mobile/putong/data/BannerFrequency;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/BannerFrequency;->clone()Lcom/p1/mobile/putong/data/BannerFrequency;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/BannerAction;->frequency:Lcom/p1/mobile/putong/data/BannerFrequency;

    .line 15
    .line 16
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/data/BannerAction;->swipe_count:I

    .line 17
    .line 18
    iput v1, v0, Lcom/p1/mobile/putong/data/BannerAction;->swipe_count:I

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/data/BannerAction;->red_dot:Lcom/p1/mobile/putong/data/BannerRedDot;

    .line 21
    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/BannerAction;->red_dot:Lcom/p1/mobile/putong/data/BannerRedDot;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BannerAction;->scroll:Lcom/p1/mobile/putong/data/BannerScroll;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/BannerScroll;->clone()Lcom/p1/mobile/putong/data/BannerScroll;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iput-object p0, v0, Lcom/p1/mobile/putong/data/BannerAction;->scroll:Lcom/p1/mobile/putong/data/BannerScroll;

    .line 33
    .line 34
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

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/BannerAction;->clone()Lcom/p1/mobile/putong/data/BannerAction;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/BannerAction;

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
    check-cast p1, Lcom/p1/mobile/putong/data/BannerAction;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/BannerAction;->frequency:Lcom/p1/mobile/putong/data/BannerFrequency;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/BannerAction;->frequency:Lcom/p1/mobile/putong/data/BannerFrequency;

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
    iget v1, p0, Lcom/p1/mobile/putong/data/BannerAction;->swipe_count:I

    .line 24
    .line 25
    iget v3, p1, Lcom/p1/mobile/putong/data/BannerAction;->swipe_count:I

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/data/BannerAction;->red_dot:Lcom/p1/mobile/putong/data/BannerRedDot;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/data/BannerAction;->red_dot:Lcom/p1/mobile/putong/data/BannerRedDot;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BannerAction;->scroll:Lcom/p1/mobile/putong/data/BannerScroll;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BannerAction;->scroll:Lcom/p1/mobile/putong/data/BannerScroll;

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
    const-string p0, "banneraction"

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/BannerAction;->frequency:Lcom/p1/mobile/putong/data/BannerFrequency;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/BannerFrequency;->hashCode()I

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
    iget v1, p0, Lcom/p1/mobile/putong/data/BannerAction;->swipe_count:I

    .line 22
    .line 23
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/data/BannerAction;->red_dot:Lcom/p1/mobile/putong/data/BannerRedDot;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move v1, v2

    .line 36
    :goto_1
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/data/BannerAction;->scroll:Lcom/p1/mobile/putong/data/BannerScroll;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/BannerScroll;->hashCode()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    :cond_2
    add-int/2addr v0, v2

    .line 48
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 49
    .line 50
    :cond_3
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/BannerAction;->frequency:Lcom/p1/mobile/putong/data/BannerFrequency;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/data/BannerFrequency;->new_()Lcom/p1/mobile/putong/data/BannerFrequency;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/data/BannerAction;->frequency:Lcom/p1/mobile/putong/data/BannerFrequency;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/BannerAction;->red_dot:Lcom/p1/mobile/putong/data/BannerRedDot;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/data/BannerRedDot;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/data/BannerRedDot;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/data/BannerAction;->red_dot:Lcom/p1/mobile/putong/data/BannerRedDot;

    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/BannerAction;->scroll:Lcom/p1/mobile/putong/data/BannerScroll;

    .line 26
    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/data/BannerScroll;->new_()Lcom/p1/mobile/putong/data/BannerScroll;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/data/BannerAction;->scroll:Lcom/p1/mobile/putong/data/BannerScroll;

    .line 34
    .line 35
    :cond_2
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/BannerAction;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
