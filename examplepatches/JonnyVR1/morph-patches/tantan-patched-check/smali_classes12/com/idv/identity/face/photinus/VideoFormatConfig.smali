.class public final enum Lcom/idv/identity/face/photinus/VideoFormatConfig;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/idv/identity/face/photinus/VideoFormatConfig;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/idv/identity/face/photinus/VideoFormatConfig;

.field public static final enum L:Lcom/idv/identity/face/photinus/VideoFormatConfig;

.field public static final enum M:Lcom/idv/identity/face/photinus/VideoFormatConfig;

.field public static final enum S:Lcom/idv/identity/face/photinus/VideoFormatConfig;


# instance fields
.field private bitRate:I

.field private frameRate:I


# direct methods
.method private static synthetic $values()[Lcom/idv/identity/face/photinus/VideoFormatConfig;
    .locals 3

    .line 1
    sget-object v0, Lcom/idv/identity/face/photinus/VideoFormatConfig;->S:Lcom/idv/identity/face/photinus/VideoFormatConfig;

    .line 2
    .line 3
    sget-object v1, Lcom/idv/identity/face/photinus/VideoFormatConfig;->M:Lcom/idv/identity/face/photinus/VideoFormatConfig;

    .line 4
    .line 5
    sget-object v2, Lcom/idv/identity/face/photinus/VideoFormatConfig;->L:Lcom/idv/identity/face/photinus/VideoFormatConfig;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/idv/identity/face/photinus/VideoFormatConfig;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/idv/identity/face/photinus/VideoFormatConfig;

    .line 2
    .line 3
    const/16 v1, 0x32

    .line 4
    .line 5
    const v2, 0xf4240

    .line 6
    .line 7
    .line 8
    const-string v3, "S"

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/idv/identity/face/photinus/VideoFormatConfig;-><init>(Ljava/lang/String;III)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/idv/identity/face/photinus/VideoFormatConfig;->S:Lcom/idv/identity/face/photinus/VideoFormatConfig;

    .line 15
    .line 16
    new-instance v0, Lcom/idv/identity/face/photinus/VideoFormatConfig;

    .line 17
    .line 18
    const/16 v1, 0x28

    .line 19
    .line 20
    const v2, 0x1e8480

    .line 21
    .line 22
    .line 23
    const-string v3, "M"

    .line 24
    .line 25
    const/4 v4, 0x1

    .line 26
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/idv/identity/face/photinus/VideoFormatConfig;-><init>(Ljava/lang/String;III)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/idv/identity/face/photinus/VideoFormatConfig;->M:Lcom/idv/identity/face/photinus/VideoFormatConfig;

    .line 30
    .line 31
    new-instance v0, Lcom/idv/identity/face/photinus/VideoFormatConfig;

    .line 32
    .line 33
    const/16 v1, 0x1e

    .line 34
    .line 35
    const v2, 0x2dc6c0

    .line 36
    .line 37
    .line 38
    const-string v3, "L"

    .line 39
    .line 40
    const/4 v4, 0x2

    .line 41
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/idv/identity/face/photinus/VideoFormatConfig;-><init>(Ljava/lang/String;III)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lcom/idv/identity/face/photinus/VideoFormatConfig;->L:Lcom/idv/identity/face/photinus/VideoFormatConfig;

    .line 45
    .line 46
    invoke-static {}, Lcom/idv/identity/face/photinus/VideoFormatConfig;->$values()[Lcom/idv/identity/face/photinus/VideoFormatConfig;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sput-object v0, Lcom/idv/identity/face/photinus/VideoFormatConfig;->$VALUES:[Lcom/idv/identity/face/photinus/VideoFormatConfig;

    .line 51
    .line 52
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
    iput p3, p0, Lcom/idv/identity/face/photinus/VideoFormatConfig;->frameRate:I

    .line 5
    .line 6
    iput p4, p0, Lcom/idv/identity/face/photinus/VideoFormatConfig;->bitRate:I

    .line 7
    .line 8
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/idv/identity/face/photinus/VideoFormatConfig;
    .locals 1

    .line 1
    const-class v0, Lcom/idv/identity/face/photinus/VideoFormatConfig;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/idv/identity/face/photinus/VideoFormatConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/idv/identity/face/photinus/VideoFormatConfig;
    .locals 1

    .line 1
    sget-object v0, Lcom/idv/identity/face/photinus/VideoFormatConfig;->$VALUES:[Lcom/idv/identity/face/photinus/VideoFormatConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/idv/identity/face/photinus/VideoFormatConfig;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/idv/identity/face/photinus/VideoFormatConfig;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getBitRate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/photinus/VideoFormatConfig;->bitRate:I

    .line 2
    .line 3
    return p0
.end method

.method public getFrameRate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/photinus/VideoFormatConfig;->frameRate:I

    .line 2
    .line 3
    return p0
.end method
