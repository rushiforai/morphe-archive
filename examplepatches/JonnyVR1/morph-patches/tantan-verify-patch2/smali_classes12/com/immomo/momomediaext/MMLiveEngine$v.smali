.class synthetic Lcom/immomo/momomediaext/MMLiveEngine$v;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/MMLiveEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1009
    name = null
.end annotation


# static fields
.field static final synthetic a:[I

.field static final synthetic b:[I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->values()[Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v0, v0

    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    sput-object v0, Lcom/immomo/momomediaext/MMLiveEngine$v;->b:[I

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    :try_start_0
    sget-object v2, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->STOP:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    aput v1, v0, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    :catch_0
    const/4 v0, 0x2

    .line 20
    :try_start_1
    sget-object v2, Lcom/immomo/momomediaext/MMLiveEngine$v;->b:[I

    .line 21
    .line 22
    sget-object v3, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->START:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 23
    .line 24
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    aput v0, v2, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    .line 29
    .line 30
    :catch_1
    :try_start_2
    sget-object v2, Lcom/immomo/momomediaext/MMLiveEngine$v;->b:[I

    .line 31
    .line 32
    sget-object v3, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->WAIT:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 33
    .line 34
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    const/4 v4, 0x3

    .line 39
    aput v4, v2, v3
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    .line 40
    .line 41
    :catch_2
    invoke-static {}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    array-length v2, v2

    .line 46
    new-array v2, v2, [I

    .line 47
    .line 48
    sput-object v2, Lcom/immomo/momomediaext/MMLiveEngine$v;->a:[I

    .line 49
    .line 50
    :try_start_3
    sget-object v3, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfAG:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 51
    .line 52
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    aput v1, v2, v3
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    .line 57
    .line 58
    :catch_3
    :try_start_4
    sget-object v1, Lcom/immomo/momomediaext/MMLiveEngine$v;->a:[I

    .line 59
    .line 60
    sget-object v2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfVolc:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    aput v0, v1, v2
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    .line 67
    .line 68
    :catch_4
    return-void
.end method
