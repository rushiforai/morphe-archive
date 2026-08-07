.class public Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;
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
            "Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "messageredesignbreakiceguide"


# instance fields
.field public breakIceGuide:Lcom/p1/mobile/putong/core/data/MessageBreakIce;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public directlyToPicLikeDialog:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public exchangeAnswerSwitch:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public mainSwitch:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->nullCheck()V

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

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->clone()Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->exchangeAnswerSwitch:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->exchangeAnswerSwitch:Z

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->breakIceGuide:Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageBreakIce;->clone()Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->breakIceGuide:Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageIntegration;->clone()Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 29
    .line 30
    :cond_1
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->mainSwitch:Z

    .line 31
    .line 32
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->mainSwitch:Z

    .line 33
    .line 34
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->directlyToPicLikeDialog:Z

    .line 35
    .line 36
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->directlyToPicLikeDialog:Z

    .line 37
    .line 38
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->clone()Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->exchangeAnswerSwitch:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->exchangeAnswerSwitch:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->breakIceGuide:Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->breakIceGuide:Lcom/p1/mobile/putong/core/data/MessageBreakIce;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->mainSwitch:Z

    .line 40
    .line 41
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->mainSwitch:Z

    .line 42
    .line 43
    if-ne v1, v3, :cond_2

    .line 44
    .line 45
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->directlyToPicLikeDialog:Z

    .line 46
    .line 47
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->directlyToPicLikeDialog:Z

    .line 48
    .line 49
    if-ne p0, p1, :cond_2

    .line 50
    .line 51
    return v0

    .line 52
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "messageredesignbreakiceguide"

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
    if-nez v0, :cond_5

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->exchangeAnswerSwitch:Z

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->breakIceGuide:Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageBreakIce;->hashCode()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move v1, v4

    .line 32
    :goto_1
    add-int/2addr v0, v1

    .line 33
    mul-int/lit8 v0, v0, 0x29

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 36
    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageIntegration;->hashCode()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    :cond_2
    add-int/2addr v0, v4

    .line 44
    mul-int/lit8 v0, v0, 0x29

    .line 45
    .line 46
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->mainSwitch:Z

    .line 47
    .line 48
    if-eqz v1, :cond_3

    .line 49
    .line 50
    move v1, v3

    .line 51
    goto :goto_2

    .line 52
    :cond_3
    move v1, v2

    .line 53
    :goto_2
    add-int/2addr v0, v1

    .line 54
    mul-int/lit8 v0, v0, 0x29

    .line 55
    .line 56
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->directlyToPicLikeDialog:Z

    .line 57
    .line 58
    if-eqz v1, :cond_4

    .line 59
    .line 60
    move v2, v3

    .line 61
    :cond_4
    add-int/2addr v0, v2

    .line 62
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 63
    .line 64
    :cond_5
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->breakIceGuide:Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageBreakIce;->new_()Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->breakIceGuide:Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageIntegration;->new_()Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
