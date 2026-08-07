.class public final enum Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ImageType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

.field public static final enum GIF:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

.field public static final enum JPEG:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

.field public static final enum PNG:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

.field public static final enum PNG_A:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

.field public static final enum RAW:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

.field public static final enum UNKNOWN:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

.field public static final enum WEBP:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

.field public static final enum WEBP_A:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;


# instance fields
.field private final hasAlpha:Z


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->GIF:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->JPEG:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->RAW:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->PNG_A:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->PNG:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 10
    .line 11
    sget-object v5, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->WEBP_A:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 12
    .line 13
    sget-object v6, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->WEBP:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 14
    .line 15
    sget-object v7, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->UNKNOWN:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 16
    .line 17
    filled-new-array/range {v0 .. v7}, [Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 2
    .line 3
    const-string v1, "GIF"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;-><init>(Ljava/lang/String;IZ)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->GIF:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 13
    .line 14
    const-string v1, "JPEG"

    .line 15
    .line 16
    invoke-direct {v0, v1, v3, v2}, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;-><init>(Ljava/lang/String;IZ)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->JPEG:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 22
    .line 23
    const-string v1, "RAW"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v0, v1, v4, v2}, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;-><init>(Ljava/lang/String;IZ)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->RAW:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 32
    .line 33
    const-string v1, "PNG_A"

    .line 34
    .line 35
    const/4 v4, 0x3

    .line 36
    invoke-direct {v0, v1, v4, v3}, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;-><init>(Ljava/lang/String;IZ)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->PNG_A:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 40
    .line 41
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 42
    .line 43
    const-string v1, "PNG"

    .line 44
    .line 45
    const/4 v4, 0x4

    .line 46
    invoke-direct {v0, v1, v4, v2}, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;-><init>(Ljava/lang/String;IZ)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->PNG:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 50
    .line 51
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 52
    .line 53
    const-string v1, "WEBP_A"

    .line 54
    .line 55
    const/4 v4, 0x5

    .line 56
    invoke-direct {v0, v1, v4, v3}, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;-><init>(Ljava/lang/String;IZ)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->WEBP_A:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 60
    .line 61
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 62
    .line 63
    const-string v1, "WEBP"

    .line 64
    .line 65
    const/4 v3, 0x6

    .line 66
    invoke-direct {v0, v1, v3, v2}, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;-><init>(Ljava/lang/String;IZ)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->WEBP:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 70
    .line 71
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 72
    .line 73
    const-string v1, "UNKNOWN"

    .line 74
    .line 75
    const/4 v3, 0x7

    .line 76
    invoke-direct {v0, v1, v3, v2}, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;-><init>(Ljava/lang/String;IZ)V

    .line 77
    .line 78
    .line 79
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->UNKNOWN:Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 80
    .line 81
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->$values()[Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->$VALUES:[Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 86
    .line 87
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->hasAlpha:Z

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->$VALUES:[Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public hasAlpha()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;->hasAlpha:Z

    .line 2
    .line 3
    return p0
.end method
