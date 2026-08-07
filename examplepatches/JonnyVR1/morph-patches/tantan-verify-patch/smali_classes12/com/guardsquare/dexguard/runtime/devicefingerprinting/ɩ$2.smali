.class final synthetic Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$2;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1009
    name = null
.end annotation


# static fields
.field static final synthetic ˊ:[I

.field private static ˎ:I = 0x0

.field private static ˏ:I = 0x1

.field static final synthetic ॱ:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->values()[Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

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
    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$2;->ॱ:[I

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    :try_start_0
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ˏ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

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
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$2;->ˎ:I

    .line 20
    .line 21
    and-int/lit8 v2, v0, 0x67

    .line 22
    .line 23
    or-int/lit8 v0, v0, 0x67

    .line 24
    .line 25
    add-int/2addr v2, v0

    .line 26
    rem-int/lit16 v2, v2, 0x80

    .line 27
    .line 28
    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$2;->ˏ:I

    .line 29
    .line 30
    :catch_0
    invoke-static {}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->values()[Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    array-length v0, v0

    .line 35
    new-array v0, v0, [I

    .line 36
    .line 37
    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$2;->ˊ:[I

    .line 38
    .line 39
    :try_start_1
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ˊ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    aput v1, v0, v2
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    .line 46
    .line 47
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$2;->ˏ:I

    .line 48
    .line 49
    and-int/lit8 v1, v0, 0x15

    .line 50
    .line 51
    or-int/lit8 v0, v0, 0x15

    .line 52
    .line 53
    add-int/2addr v1, v0

    .line 54
    rem-int/lit16 v1, v1, 0x80

    .line 55
    .line 56
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$2;->ˎ:I

    .line 57
    .line 58
    :catch_1
    const/4 v0, 0x2

    .line 59
    :try_start_2
    sget-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$2;->ˊ:[I

    .line 60
    .line 61
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ॱ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 62
    .line 63
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    aput v0, v1, v2
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    .line 68
    .line 69
    :catch_2
    :try_start_3
    sget-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$2;->ˊ:[I

    .line 70
    .line 71
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ˋ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 72
    .line 73
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    const/4 v3, 0x3

    .line 78
    aput v3, v1, v2
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    .line 79
    .line 80
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$2;->ˎ:I

    .line 81
    .line 82
    add-int/lit8 v1, v1, 0x57

    .line 83
    .line 84
    rem-int/lit16 v2, v1, 0x80

    .line 85
    .line 86
    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$2;->ˏ:I

    .line 87
    .line 88
    rem-int/2addr v1, v0

    .line 89
    if-eqz v1, :cond_0

    .line 90
    .line 91
    return-void

    .line 92
    :cond_0
    const/4 v0, 0x0

    .line 93
    throw v0

    .line 94
    :catch_3
    return-void
.end method
