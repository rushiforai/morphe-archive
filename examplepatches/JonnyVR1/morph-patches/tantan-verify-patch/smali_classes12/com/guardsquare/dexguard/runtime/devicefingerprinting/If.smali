.class final Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;
.super Ljava/lang/Thread;
.source "SourceFile"


# static fields
.field private static ˊ:I = 0x0

.field private static ˎ:I = 0x1

.field private static final ॱ:[B


# instance fields
.field private final ˋ:Ljava/lang/StringBuilder;

.field private final ˏ:Ljava/io/BufferedReader;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;->ॱ:[B

    return-void

    nop

    :array_0
    .array-data 1
        0x71t
        0x45t
        -0x2ft
        -0x4at
    .end array-data
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/io/BufferedReader;

    .line 5
    .line 6
    new-instance v1, Ljava/io/InputStreamReader;

    .line 7
    .line 8
    invoke-direct {v1, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;->ˏ:Ljava/io/BufferedReader;

    .line 15
    .line 16
    new-instance p1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;->ˋ:Ljava/lang/StringBuilder;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;->ˏ:Ljava/io/BufferedReader;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v1, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;->ˋ:Ljava/lang/StringBuilder;

    .line 10
    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;->ॱ:[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    const/4 v3, 0x1

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;->ˎ:I

    .line 25
    .line 26
    xor-int/lit8 v4, v0, 0x1

    .line 27
    .line 28
    and-int/2addr v0, v3

    .line 29
    shl-int/2addr v0, v3

    .line 30
    add-int/2addr v4, v0

    .line 31
    rem-int/lit16 v4, v4, 0x80

    .line 32
    .line 33
    sput v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;->ˊ:I

    .line 34
    .line 35
    const/4 v0, -0x3

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    const/16 v0, 0xa

    .line 38
    .line 39
    :goto_1
    int-to-byte v0, v0

    .line 40
    :try_start_1
    new-array v3, v3, [B

    .line 41
    .line 42
    const/4 v4, 0x0

    .line 43
    aput-byte v0, v3, v4

    .line 44
    .line 45
    new-instance v0, Ljava/lang/String;

    .line 46
    .line 47
    invoke-direct {v0, v3, v4}, Ljava/lang/String;-><init>([BI)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    iget-object p0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;->ˏ:Ljava/io/BufferedReader;

    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/io/Reader;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 68
    .line 69
    .line 70
    sget p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;->ˎ:I

    .line 71
    .line 72
    and-int/lit8 v0, p0, 0x59

    .line 73
    .line 74
    or-int/lit8 p0, p0, 0x59

    .line 75
    .line 76
    add-int/2addr v0, p0

    .line 77
    rem-int/lit16 v0, v0, 0x80

    .line 78
    .line 79
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;->ˊ:I

    .line 80
    .line 81
    :catch_0
    return-void
.end method

.method public final ˎ()Ljava/lang/String;
    .locals 2

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;->ˊ:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x61

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;->ˎ:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    iget-object p0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;->ˋ:Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    const/16 v0, 0x31

    .line 20
    .line 21
    div-int/lit8 v0, v0, 0x0

    .line 22
    .line 23
    :cond_0
    return-object p0
.end method
