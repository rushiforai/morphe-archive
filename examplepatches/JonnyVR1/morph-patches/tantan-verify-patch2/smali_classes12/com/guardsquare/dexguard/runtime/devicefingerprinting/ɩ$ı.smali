.class Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "\u0131"
.end annotation


# static fields
.field private static ˏ:I = 0x0

.field private static ॱ:I = 0x1


# instance fields
.field private ˊ:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/guardsquare/dexguard/runtime/devicefingerprinting/\u0269$\u0269;",
            ">;"
        }
    .end annotation
.end field

.field private ˋ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ˊ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ˋ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 7
    .line 8
    const-class v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 9
    .line 10
    invoke-static {v0}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ˊ:Ljava/util/Set;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic ˏ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/util/Set;
    .locals 2

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ॱ:I

    .line 2
    .line 3
    xor-int/lit8 v1, v0, 0x4d

    .line 4
    .line 5
    and-int/lit8 v0, v0, 0x4d

    .line 6
    .line 7
    shl-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    add-int/2addr v1, v0

    .line 10
    rem-int/lit16 v1, v1, 0x80

    .line 11
    .line 12
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ˏ:I

    .line 13
    .line 14
    iget-object p0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ˊ:Ljava/util/Set;

    .line 15
    .line 16
    xor-int/lit8 v0, v1, 0x3

    .line 17
    .line 18
    and-int/lit8 v1, v1, 0x3

    .line 19
    .line 20
    shl-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    add-int/2addr v0, v1

    .line 23
    rem-int/lit16 v0, v0, 0x80

    .line 24
    .line 25
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ॱ:I

    .line 26
    .line 27
    return-object p0
.end method


# virtual methods
.method public ˋ(Z)V
    .locals 4

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ˏ:I

    .line 2
    .line 3
    or-int/lit8 v1, v0, 0x61

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    shl-int/2addr v1, v2

    .line 7
    xor-int/lit8 v0, v0, 0x61

    .line 8
    .line 9
    sub-int/2addr v1, v0

    .line 10
    rem-int/lit16 v1, v1, 0x80

    .line 11
    .line 12
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ॱ:I

    .line 13
    .line 14
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$2;->ˊ:[I

    .line 15
    .line 16
    iget-object v1, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ˋ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    aget v0, v0, v1

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    const/4 v3, 0x2

    .line 26
    if-eq v0, v2, :cond_0

    .line 27
    .line 28
    if-eq v0, v3, :cond_0

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_0
    if-eqz p1, :cond_2

    .line 32
    .line 33
    sget p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ˏ:I

    .line 34
    .line 35
    add-int/lit8 p1, p1, 0x4f

    .line 36
    .line 37
    rem-int/lit16 v0, p1, 0x80

    .line 38
    .line 39
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ॱ:I

    .line 40
    .line 41
    rem-int/2addr p1, v3

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    sget-object p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ॱ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    sget-object p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ˊ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 48
    .line 49
    throw v1

    .line 50
    :cond_2
    sget-object p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ˋ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 51
    .line 52
    :goto_0
    iput-object p1, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ˋ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 53
    .line 54
    :goto_1
    sget p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ˏ:I

    .line 55
    .line 56
    add-int/lit8 p0, p0, 0x77

    .line 57
    .line 58
    rem-int/lit16 p1, p0, 0x80

    .line 59
    .line 60
    sput p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ॱ:I

    .line 61
    .line 62
    rem-int/2addr p0, v3

    .line 63
    if-eqz p0, :cond_3

    .line 64
    .line 65
    return-void

    .line 66
    :cond_3
    throw v1
.end method
