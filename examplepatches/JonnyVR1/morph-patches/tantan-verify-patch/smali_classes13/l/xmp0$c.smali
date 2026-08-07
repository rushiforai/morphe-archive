.class synthetic Ll/xmp0$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xmp0;
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
    invoke-static {}, Lcom/ss/bytertc/engine/type/AudioProfileType;->values()[Lcom/ss/bytertc/engine/type/AudioProfileType;

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
    sput-object v0, Ll/xmp0$c;->b:[I

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    :try_start_0
    sget-object v2, Lcom/ss/bytertc/engine/type/AudioProfileType;->AUDIO_PROFILE_DEFAULT:Lcom/ss/bytertc/engine/type/AudioProfileType;

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
    sget-object v2, Ll/xmp0$c;->b:[I

    .line 21
    .line 22
    sget-object v3, Lcom/ss/bytertc/engine/type/AudioProfileType;->AUDIO_PROFILE_FLUENT:Lcom/ss/bytertc/engine/type/AudioProfileType;

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
    sget-object v2, Ll/xmp0$c;->b:[I

    .line 31
    .line 32
    sget-object v3, Lcom/ss/bytertc/engine/type/AudioProfileType;->AUDIO_PROFILE_STANDARD:Lcom/ss/bytertc/engine/type/AudioProfileType;

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
    :try_start_3
    sget-object v2, Ll/xmp0$c;->b:[I

    .line 42
    .line 43
    sget-object v3, Lcom/ss/bytertc/engine/type/AudioProfileType;->AUDIO_PROFILE_HD:Lcom/ss/bytertc/engine/type/AudioProfileType;

    .line 44
    .line 45
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    const/4 v4, 0x4

    .line 50
    aput v4, v2, v3
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    .line 51
    .line 52
    :catch_3
    :try_start_4
    sget-object v2, Ll/xmp0$c;->b:[I

    .line 53
    .line 54
    sget-object v3, Lcom/ss/bytertc/engine/type/AudioProfileType;->AUDIO_PROFILE_STANDARD_STEREO:Lcom/ss/bytertc/engine/type/AudioProfileType;

    .line 55
    .line 56
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    const/4 v4, 0x5

    .line 61
    aput v4, v2, v3
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    .line 62
    .line 63
    :catch_4
    :try_start_5
    sget-object v2, Ll/xmp0$c;->b:[I

    .line 64
    .line 65
    sget-object v3, Lcom/ss/bytertc/engine/type/AudioProfileType;->AUDIO_PROFILE_HD_MONO:Lcom/ss/bytertc/engine/type/AudioProfileType;

    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    const/4 v4, 0x6

    .line 72
    aput v4, v2, v3
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    .line 73
    .line 74
    :catch_5
    invoke-static {}, Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamState;->values()[Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamState;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    array-length v2, v2

    .line 79
    new-array v2, v2, [I

    .line 80
    .line 81
    sput-object v2, Ll/xmp0$c;->a:[I

    .line 82
    .line 83
    :try_start_6
    sget-object v3, Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamState;->FORWARD_STREAM_STATE_SUCCESS:Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamState;

    .line 84
    .line 85
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    aput v1, v2, v3
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    .line 90
    .line 91
    :catch_6
    :try_start_7
    sget-object v1, Ll/xmp0$c;->a:[I

    .line 92
    .line 93
    sget-object v2, Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamState;->FORWARD_STREAM_STATE_FAILURE:Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamState;

    .line 94
    .line 95
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    aput v0, v1, v2
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    .line 100
    .line 101
    :catch_7
    return-void
.end method
