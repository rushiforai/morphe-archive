.class public final enum Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/video/HdrUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LumaBitDepth"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;

.field public static final enum Invalid:Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;

.field public static final enum LUMA10BIT:Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;

.field public static final enum LUMA8BIT:Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;


# instance fields
.field private final depth:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;

    .line 2
    .line 3
    const-string v1, "Invalid"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;->Invalid:Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;

    .line 10
    .line 11
    new-instance v1, Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;

    .line 12
    .line 13
    const-string v2, "LUMA8BIT"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;->LUMA8BIT:Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;

    .line 20
    .line 21
    new-instance v2, Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;

    .line 22
    .line 23
    const-string v3, "LUMA10BIT"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;->LUMA10BIT:Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;

    .line 30
    .line 31
    filled-new-array {v0, v1, v2}, [Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;->$VALUES:[Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;

    .line 36
    .line 37
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;->depth:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;
    .locals 1

    .line 1
    const-class v0, Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;
    .locals 1

    .line 1
    sget-object v0, Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;->$VALUES:[Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public depth()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/HdrUtil$LumaBitDepth;->depth:I

    .line 2
    .line 3
    return p0
.end method
