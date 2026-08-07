.class public final enum Lcom/tencent/liteav/capturer/a$a;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/capturer/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/tencent/liteav/capturer/a$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum a:Lcom/tencent/liteav/capturer/a$a;

.field public static final enum b:Lcom/tencent/liteav/capturer/a$a;

.field public static final enum c:Lcom/tencent/liteav/capturer/a$a;

.field public static final enum d:Lcom/tencent/liteav/capturer/a$a;

.field public static final enum e:Lcom/tencent/liteav/capturer/a$a;

.field public static final enum f:Lcom/tencent/liteav/capturer/a$a;

.field public static final enum g:Lcom/tencent/liteav/capturer/a$a;

.field public static final enum h:Lcom/tencent/liteav/capturer/a$a;

.field public static final enum i:Lcom/tencent/liteav/capturer/a$a;

.field private static final synthetic j:[Lcom/tencent/liteav/capturer/a$a;


# instance fields
.field private final mHeight:I

.field private final mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 1
    new-instance v0, Lcom/tencent/liteav/capturer/a$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, -0x1

    .line 5
    const-string v3, "RESOLUTION_INVALID"

    .line 6
    .line 7
    invoke-direct {v0, v3, v1, v2, v2}, Lcom/tencent/liteav/capturer/a$a;-><init>(Ljava/lang/String;III)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/tencent/liteav/capturer/a$a;->a:Lcom/tencent/liteav/capturer/a$a;

    .line 11
    .line 12
    new-instance v1, Lcom/tencent/liteav/capturer/a$a;

    .line 13
    .line 14
    const-string v2, "RESOLUTION_180_320"

    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    const/16 v4, 0xb4

    .line 18
    .line 19
    const/16 v5, 0x140

    .line 20
    .line 21
    invoke-direct {v1, v2, v3, v4, v5}, Lcom/tencent/liteav/capturer/a$a;-><init>(Ljava/lang/String;III)V

    .line 22
    .line 23
    .line 24
    sput-object v1, Lcom/tencent/liteav/capturer/a$a;->b:Lcom/tencent/liteav/capturer/a$a;

    .line 25
    .line 26
    new-instance v2, Lcom/tencent/liteav/capturer/a$a;

    .line 27
    .line 28
    const-string v3, "RESOLUTION_270_480"

    .line 29
    .line 30
    const/4 v4, 0x2

    .line 31
    const/16 v6, 0x10e

    .line 32
    .line 33
    const/16 v7, 0x1e0

    .line 34
    .line 35
    invoke-direct {v2, v3, v4, v6, v7}, Lcom/tencent/liteav/capturer/a$a;-><init>(Ljava/lang/String;III)V

    .line 36
    .line 37
    .line 38
    sput-object v2, Lcom/tencent/liteav/capturer/a$a;->c:Lcom/tencent/liteav/capturer/a$a;

    .line 39
    .line 40
    new-instance v3, Lcom/tencent/liteav/capturer/a$a;

    .line 41
    .line 42
    const-string v4, "RESOLUTION_320_480"

    .line 43
    .line 44
    const/4 v6, 0x3

    .line 45
    invoke-direct {v3, v4, v6, v5, v7}, Lcom/tencent/liteav/capturer/a$a;-><init>(Ljava/lang/String;III)V

    .line 46
    .line 47
    .line 48
    sput-object v3, Lcom/tencent/liteav/capturer/a$a;->d:Lcom/tencent/liteav/capturer/a$a;

    .line 49
    .line 50
    new-instance v4, Lcom/tencent/liteav/capturer/a$a;

    .line 51
    .line 52
    const/16 v5, 0x168

    .line 53
    .line 54
    const/16 v6, 0x280

    .line 55
    .line 56
    const-string v7, "RESOLUTION_360_640"

    .line 57
    .line 58
    const/4 v8, 0x4

    .line 59
    invoke-direct {v4, v7, v8, v5, v6}, Lcom/tencent/liteav/capturer/a$a;-><init>(Ljava/lang/String;III)V

    .line 60
    .line 61
    .line 62
    sput-object v4, Lcom/tencent/liteav/capturer/a$a;->e:Lcom/tencent/liteav/capturer/a$a;

    .line 63
    .line 64
    new-instance v5, Lcom/tencent/liteav/capturer/a$a;

    .line 65
    .line 66
    const/16 v6, 0x21c

    .line 67
    .line 68
    const/16 v7, 0x3c0

    .line 69
    .line 70
    const-string v8, "RESOLUTION_540_960"

    .line 71
    .line 72
    const/4 v9, 0x5

    .line 73
    invoke-direct {v5, v8, v9, v6, v7}, Lcom/tencent/liteav/capturer/a$a;-><init>(Ljava/lang/String;III)V

    .line 74
    .line 75
    .line 76
    sput-object v5, Lcom/tencent/liteav/capturer/a$a;->f:Lcom/tencent/liteav/capturer/a$a;

    .line 77
    .line 78
    new-instance v6, Lcom/tencent/liteav/capturer/a$a;

    .line 79
    .line 80
    const/16 v7, 0x2d0

    .line 81
    .line 82
    const/16 v8, 0x500

    .line 83
    .line 84
    const-string v9, "RESOLUTION_720_1280"

    .line 85
    .line 86
    const/4 v10, 0x6

    .line 87
    invoke-direct {v6, v9, v10, v7, v8}, Lcom/tencent/liteav/capturer/a$a;-><init>(Ljava/lang/String;III)V

    .line 88
    .line 89
    .line 90
    sput-object v6, Lcom/tencent/liteav/capturer/a$a;->g:Lcom/tencent/liteav/capturer/a$a;

    .line 91
    .line 92
    new-instance v7, Lcom/tencent/liteav/capturer/a$a;

    .line 93
    .line 94
    const-string v8, "RESOLUTION_1080_1920"

    .line 95
    .line 96
    const/4 v9, 0x7

    .line 97
    const/16 v10, 0x438

    .line 98
    .line 99
    const/16 v11, 0x780

    .line 100
    .line 101
    invoke-direct {v7, v8, v9, v10, v11}, Lcom/tencent/liteav/capturer/a$a;-><init>(Ljava/lang/String;III)V

    .line 102
    .line 103
    .line 104
    sput-object v7, Lcom/tencent/liteav/capturer/a$a;->h:Lcom/tencent/liteav/capturer/a$a;

    .line 105
    .line 106
    new-instance v8, Lcom/tencent/liteav/capturer/a$a;

    .line 107
    .line 108
    const-string v9, "RESOLUTION_HIGHEST"

    .line 109
    .line 110
    const/16 v12, 0x8

    .line 111
    .line 112
    invoke-direct {v8, v9, v12, v10, v11}, Lcom/tencent/liteav/capturer/a$a;-><init>(Ljava/lang/String;III)V

    .line 113
    .line 114
    .line 115
    sput-object v8, Lcom/tencent/liteav/capturer/a$a;->i:Lcom/tencent/liteav/capturer/a$a;

    .line 116
    .line 117
    filled-new-array/range {v0 .. v8}, [Lcom/tencent/liteav/capturer/a$a;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    sput-object v0, Lcom/tencent/liteav/capturer/a$a;->j:[Lcom/tencent/liteav/capturer/a$a;

    .line 122
    .line 123
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;III)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/tencent/liteav/capturer/a$a;->mWidth:I

    .line 5
    .line 6
    iput p4, p0, Lcom/tencent/liteav/capturer/a$a;->mHeight:I

    .line 7
    .line 8
    return-void
.end method

.method private a()I
    .locals 0

    .line 6
    iget p0, p0, Lcom/tencent/liteav/capturer/a$a;->mWidth:I

    return p0
.end method

.method public static synthetic a(Lcom/tencent/liteav/capturer/a$a;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/capturer/a$a;->a()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private b()I
    .locals 0

    .line 6
    iget p0, p0, Lcom/tencent/liteav/capturer/a$a;->mHeight:I

    return p0
.end method

.method public static synthetic b(Lcom/tencent/liteav/capturer/a$a;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/capturer/a$a;->b()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/tencent/liteav/capturer/a$a;
    .locals 1

    .line 1
    const-class v0, Lcom/tencent/liteav/capturer/a$a;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/tencent/liteav/capturer/a$a;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/tencent/liteav/capturer/a$a;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/liteav/capturer/a$a;->j:[Lcom/tencent/liteav/capturer/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/tencent/liteav/capturer/a$a;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/tencent/liteav/capturer/a$a;

    .line 8
    .line 9
    return-object v0
.end method
