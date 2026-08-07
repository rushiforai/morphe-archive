.class public final enum Lcom/immomo/momomediaext/filter/DetectorType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/momomediaext/filter/DetectorType;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0007\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\u0008\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/immomo/momomediaext/filter/DetectorType;",
        "",
        "(Ljava/lang/String;I)V",
        "ANIMOJI_DETECTOR",
        "SEGMENT_DETECTOR",
        "STYLIZE_FACE_DETECTOR",
        "CARTOON_FACE_DETECTOR",
        "BODY_LANDMARK_DETECTOR",
        "momomediaext_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/momomediaext/filter/DetectorType;

.field public static final enum ANIMOJI_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

.field public static final enum BODY_LANDMARK_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

.field public static final enum CARTOON_FACE_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

.field public static final enum SEGMENT_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

.field public static final enum STYLIZE_FACE_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;


# direct methods
.method private static final synthetic $values()[Lcom/immomo/momomediaext/filter/DetectorType;
    .locals 5

    sget-object v0, Lcom/immomo/momomediaext/filter/DetectorType;->ANIMOJI_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    sget-object v1, Lcom/immomo/momomediaext/filter/DetectorType;->SEGMENT_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    sget-object v2, Lcom/immomo/momomediaext/filter/DetectorType;->STYLIZE_FACE_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    sget-object v3, Lcom/immomo/momomediaext/filter/DetectorType;->CARTOON_FACE_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    sget-object v4, Lcom/immomo/momomediaext/filter/DetectorType;->BODY_LANDMARK_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/immomo/momomediaext/filter/DetectorType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/filter/DetectorType;

    .line 2
    .line 3
    const-string v1, "ANIMOJI_DETECTOR"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/immomo/momomediaext/filter/DetectorType;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/immomo/momomediaext/filter/DetectorType;->ANIMOJI_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    .line 10
    .line 11
    new-instance v0, Lcom/immomo/momomediaext/filter/DetectorType;

    .line 12
    .line 13
    const-string v1, "SEGMENT_DETECTOR"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/immomo/momomediaext/filter/DetectorType;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/immomo/momomediaext/filter/DetectorType;->SEGMENT_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    .line 20
    .line 21
    new-instance v0, Lcom/immomo/momomediaext/filter/DetectorType;

    .line 22
    .line 23
    const-string v1, "STYLIZE_FACE_DETECTOR"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/immomo/momomediaext/filter/DetectorType;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/immomo/momomediaext/filter/DetectorType;->STYLIZE_FACE_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    .line 30
    .line 31
    new-instance v0, Lcom/immomo/momomediaext/filter/DetectorType;

    .line 32
    .line 33
    const-string v1, "CARTOON_FACE_DETECTOR"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lcom/immomo/momomediaext/filter/DetectorType;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/immomo/momomediaext/filter/DetectorType;->CARTOON_FACE_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    .line 40
    .line 41
    new-instance v0, Lcom/immomo/momomediaext/filter/DetectorType;

    .line 42
    .line 43
    const-string v1, "BODY_LANDMARK_DETECTOR"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2}, Lcom/immomo/momomediaext/filter/DetectorType;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/immomo/momomediaext/filter/DetectorType;->BODY_LANDMARK_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    .line 50
    .line 51
    invoke-static {}, Lcom/immomo/momomediaext/filter/DetectorType;->$values()[Lcom/immomo/momomediaext/filter/DetectorType;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sput-object v0, Lcom/immomo/momomediaext/filter/DetectorType;->$VALUES:[Lcom/immomo/momomediaext/filter/DetectorType;

    .line 56
    .line 57
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/momomediaext/filter/DetectorType;
    .locals 1

    const-class v0, Lcom/immomo/momomediaext/filter/DetectorType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/immomo/momomediaext/filter/DetectorType;

    return-object p0
.end method

.method public static values()[Lcom/immomo/momomediaext/filter/DetectorType;
    .locals 1

    sget-object v0, Lcom/immomo/momomediaext/filter/DetectorType;->$VALUES:[Lcom/immomo/momomediaext/filter/DetectorType;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/immomo/momomediaext/filter/DetectorType;

    return-object v0
.end method
