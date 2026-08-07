.class public final enum Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/svgaplayer/corner/BitmapFillet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Corner"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0011\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u001a\u0010\u0005\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\"\u0004\u0008\u0008\u0010\tj\u0002\u0008\nj\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\rj\u0002\u0008\u000ej\u0002\u0008\u000fj\u0002\u0008\u0010j\u0002\u0008\u0011j\u0002\u0008\u0012j\u0002\u0008\u0013\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;",
        "",
        "corner",
        "",
        "(Ljava/lang/String;II)V",
        "bitmapFilletCorner",
        "getBitmapFilletCorner",
        "()I",
        "setBitmapFilletCorner",
        "(I)V",
        "CORNER_NONE",
        "CORNER_TOP_LEFT",
        "CORNER_TOP_RIGHT",
        "CORNER_BOTTOM_LEFT",
        "CORNER_BOTTOM_RIGHT",
        "CORNER_ALL",
        "CORNER_TOP",
        "CORNER_BOTTOM",
        "CORNER_LEFT",
        "CORNER_RIGHT",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

.field public static final enum CORNER_ALL:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

.field public static final enum CORNER_BOTTOM:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

.field public static final enum CORNER_BOTTOM_LEFT:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

.field public static final enum CORNER_BOTTOM_RIGHT:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

.field public static final enum CORNER_LEFT:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

.field public static final enum CORNER_NONE:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

.field public static final enum CORNER_RIGHT:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

.field public static final enum CORNER_TOP:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

.field public static final enum CORNER_TOP_LEFT:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

.field public static final enum CORNER_TOP_RIGHT:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;


# instance fields
.field private bitmapFilletCorner:I


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 1
    new-instance v0, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 2
    .line 3
    const-string v1, "CORNER_NONE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->CORNER_NONE:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 10
    .line 11
    new-instance v1, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 12
    .line 13
    const-string v2, "CORNER_TOP_LEFT"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->CORNER_TOP_LEFT:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 20
    .line 21
    new-instance v2, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 22
    .line 23
    const-string v3, "CORNER_TOP_RIGHT"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->CORNER_TOP_RIGHT:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 30
    .line 31
    new-instance v3, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 32
    .line 33
    const-string v4, "CORNER_BOTTOM_LEFT"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    const/4 v6, 0x4

    .line 37
    invoke-direct {v3, v4, v5, v6}, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v3, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->CORNER_BOTTOM_LEFT:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 41
    .line 42
    new-instance v4, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 43
    .line 44
    const-string v7, "CORNER_BOTTOM_RIGHT"

    .line 45
    .line 46
    const/16 v8, 0x8

    .line 47
    .line 48
    invoke-direct {v4, v7, v6, v8}, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;-><init>(Ljava/lang/String;II)V

    .line 49
    .line 50
    .line 51
    sput-object v4, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->CORNER_BOTTOM_RIGHT:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 52
    .line 53
    move v6, v5

    .line 54
    new-instance v5, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 55
    .line 56
    const/16 v7, 0xf

    .line 57
    .line 58
    const-string v9, "CORNER_ALL"

    .line 59
    .line 60
    const/4 v10, 0x5

    .line 61
    invoke-direct {v5, v9, v10, v7}, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;-><init>(Ljava/lang/String;II)V

    .line 62
    .line 63
    .line 64
    sput-object v5, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->CORNER_ALL:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 65
    .line 66
    move v7, v6

    .line 67
    new-instance v6, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 68
    .line 69
    const-string v9, "CORNER_TOP"

    .line 70
    .line 71
    const/4 v11, 0x6

    .line 72
    invoke-direct {v6, v9, v11, v7}, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;-><init>(Ljava/lang/String;II)V

    .line 73
    .line 74
    .line 75
    sput-object v6, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->CORNER_TOP:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 76
    .line 77
    new-instance v7, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 78
    .line 79
    const/4 v9, 0x7

    .line 80
    const/16 v11, 0xc

    .line 81
    .line 82
    const-string v12, "CORNER_BOTTOM"

    .line 83
    .line 84
    invoke-direct {v7, v12, v9, v11}, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;-><init>(Ljava/lang/String;II)V

    .line 85
    .line 86
    .line 87
    sput-object v7, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->CORNER_BOTTOM:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 88
    .line 89
    move v9, v8

    .line 90
    new-instance v8, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 91
    .line 92
    const-string v11, "CORNER_LEFT"

    .line 93
    .line 94
    invoke-direct {v8, v11, v9, v10}, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;-><init>(Ljava/lang/String;II)V

    .line 95
    .line 96
    .line 97
    sput-object v8, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->CORNER_LEFT:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 98
    .line 99
    new-instance v9, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 100
    .line 101
    const/16 v10, 0x9

    .line 102
    .line 103
    const/16 v11, 0xa

    .line 104
    .line 105
    const-string v12, "CORNER_RIGHT"

    .line 106
    .line 107
    invoke-direct {v9, v12, v10, v11}, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;-><init>(Ljava/lang/String;II)V

    .line 108
    .line 109
    .line 110
    sput-object v9, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->CORNER_RIGHT:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 111
    .line 112
    filled-new-array/range {v0 .. v9}, [Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    sput-object v0, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->$VALUES:[Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 117
    .line 118
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
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
    iput p3, p0, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->bitmapFilletCorner:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;
    .locals 1

    const-class v0, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    return-object p0
.end method

.method public static values()[Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;
    .locals 1

    sget-object v0, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->$VALUES:[Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    invoke-virtual {v0}, [Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    return-object v0
.end method


# virtual methods
.method public final getBitmapFilletCorner()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->bitmapFilletCorner:I

    .line 2
    .line 3
    return p0
.end method

.method public final setBitmapFilletCorner(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->bitmapFilletCorner:I

    .line 2
    .line 3
    return-void
.end method
