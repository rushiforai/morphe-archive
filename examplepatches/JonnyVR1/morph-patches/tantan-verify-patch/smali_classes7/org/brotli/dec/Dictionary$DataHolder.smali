.class Lorg/brotli/dec/Dictionary$DataHolder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/brotli/dec/Dictionary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DataHolder"
.end annotation


# static fields
.field static final DATA:[B


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    const v0, 0x1dfa0

    .line 2
    .line 3
    .line 4
    new-array v0, v0, [B

    .line 5
    .line 6
    sput-object v0, Lorg/brotli/dec/Dictionary$DataHolder;->DATA:[B

    .line 7
    .line 8
    invoke-static {}, Lorg/brotli/dec/Dictionary$DataHolder0;->getData()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {}, Lorg/brotli/dec/Dictionary$DataHolder1;->getData()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {}, Lorg/brotli/dec/Dictionary$DataHolder2;->getData()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x0

    .line 25
    move v2, v1

    .line 26
    move v3, v2

    .line 27
    :goto_0
    const/4 v4, 0x3

    .line 28
    if-ge v2, v4, :cond_0

    .line 29
    .line 30
    aget-object v4, v0, v2

    .line 31
    .line 32
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    add-int/2addr v3, v4

    .line 37
    add-int/lit8 v2, v2, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    sget-object v2, Lorg/brotli/dec/Dictionary$DataHolder;->DATA:[B

    .line 41
    .line 42
    array-length v2, v2

    .line 43
    if-ne v3, v2, :cond_3

    .line 44
    .line 45
    move v2, v1

    .line 46
    move v3, v2

    .line 47
    :goto_1
    if-ge v2, v4, :cond_2

    .line 48
    .line 49
    aget-object v5, v0, v2

    .line 50
    .line 51
    move v6, v1

    .line 52
    :goto_2
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 53
    .line 54
    .line 55
    move-result v7

    .line 56
    if-ge v6, v7, :cond_1

    .line 57
    .line 58
    sget-object v7, Lorg/brotli/dec/Dictionary$DataHolder;->DATA:[B

    .line 59
    .line 60
    add-int/lit8 v8, v3, 0x1

    .line 61
    .line 62
    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    .line 63
    .line 64
    .line 65
    move-result v9

    .line 66
    int-to-byte v9, v9

    .line 67
    aput-byte v9, v7, v3

    .line 68
    .line 69
    add-int/lit8 v6, v6, 0x1

    .line 70
    .line 71
    move v3, v8

    .line 72
    goto :goto_2

    .line 73
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_2
    return-void

    .line 77
    :cond_3
    const-string v0, "Corrupted brotli dictionary"

    .line 78
    .line 79
    invoke-static {v0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
