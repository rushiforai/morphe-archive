.class public Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivechatrequestconfig"


# instance fields
.field public autoFakeCallResetHours:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public autoFakeCallTimesLimit:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public call:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public dial:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public fakeCallTimeout:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public live:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;
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
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->nullCheck()V

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

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->dial:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->dial:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->live:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->live:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 25
    .line 26
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 35
    .line 36
    :cond_2
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->fakeCallTimeout:I

    .line 37
    .line 38
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->fakeCallTimeout:I

    .line 39
    .line 40
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->autoFakeCallTimesLimit:I

    .line 41
    .line 42
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->autoFakeCallTimesLimit:I

    .line 43
    .line 44
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->autoFakeCallResetHours:I

    .line 45
    .line 46
    iput p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->autoFakeCallResetHours:I

    .line 47
    .line 48
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->dial:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->dial:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->live:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->live:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->fakeCallTimeout:I

    .line 44
    .line 45
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->fakeCallTimeout:I

    .line 46
    .line 47
    if-ne v1, v3, :cond_2

    .line 48
    .line 49
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->autoFakeCallTimesLimit:I

    .line 50
    .line 51
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->autoFakeCallTimesLimit:I

    .line 52
    .line 53
    if-ne v1, v3, :cond_2

    .line 54
    .line 55
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->autoFakeCallResetHours:I

    .line 56
    .line 57
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->autoFakeCallResetHours:I

    .line 58
    .line 59
    if-ne p0, p1, :cond_2

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
    const-string p0, "blivechatrequestconfig"

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->dial:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->live:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    :cond_2
    add-int/2addr v0, v2

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->fakeCallTimeout:I

    .line 46
    .line 47
    add-int/2addr v0, v1

    .line 48
    mul-int/lit8 v0, v0, 0x29

    .line 49
    .line 50
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->autoFakeCallTimesLimit:I

    .line 51
    .line 52
    add-int/2addr v0, v1

    .line 53
    mul-int/lit8 v0, v0, 0x29

    .line 54
    .line 55
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->autoFakeCallResetHours:I

    .line 56
    .line 57
    add-int/2addr v0, v1

    .line 58
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 59
    .line 60
    :cond_3
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->dial:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->dial:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->live:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->live:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 30
    .line 31
    :cond_2
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
