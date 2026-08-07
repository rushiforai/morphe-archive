.class public final enum Lcom/bef/effectsdk/text/data/BitmapType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation build Lcom/amazing/annotation/EffectKeep;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/bef/effectsdk/text/data/BitmapType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/bef/effectsdk/text/data/BitmapType;

.field public static final enum TEXT_BITMAP_NEON_ALPHA:Lcom/bef/effectsdk/text/data/BitmapType;

.field public static final enum TEXT_BITMAP_NONE:Lcom/bef/effectsdk/text/data/BitmapType;

.field public static final enum TEXT_BITMAP_SHAKE_ALPHA:Lcom/bef/effectsdk/text/data/BitmapType;

.field public static final enum TEXT_BITMAP_SINGLE_CHAR_ALPHA:Lcom/bef/effectsdk/text/data/BitmapType;

.field public static final enum TEXT_BITMAP_TYPE_ALPHA:Lcom/bef/effectsdk/text/data/BitmapType;

.field public static final enum TEXT_BITMAP_TYPE_RGBA8888:Lcom/bef/effectsdk/text/data/BitmapType;


# instance fields
.field public value:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lcom/bef/effectsdk/text/data/BitmapType;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const-string v2, "TEXT_BITMAP_NONE"

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v2, v3, v1}, Lcom/bef/effectsdk/text/data/BitmapType;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/bef/effectsdk/text/data/BitmapType;->TEXT_BITMAP_NONE:Lcom/bef/effectsdk/text/data/BitmapType;

    .line 11
    .line 12
    new-instance v1, Lcom/bef/effectsdk/text/data/BitmapType;

    .line 13
    .line 14
    const-string v2, "TEXT_BITMAP_TYPE_ALPHA"

    .line 15
    .line 16
    const/4 v4, 0x1

    .line 17
    invoke-direct {v1, v2, v4, v3}, Lcom/bef/effectsdk/text/data/BitmapType;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/bef/effectsdk/text/data/BitmapType;->TEXT_BITMAP_TYPE_ALPHA:Lcom/bef/effectsdk/text/data/BitmapType;

    .line 21
    .line 22
    new-instance v2, Lcom/bef/effectsdk/text/data/BitmapType;

    .line 23
    .line 24
    const-string v3, "TEXT_BITMAP_TYPE_RGBA8888"

    .line 25
    .line 26
    const/4 v5, 0x2

    .line 27
    invoke-direct {v2, v3, v5, v4}, Lcom/bef/effectsdk/text/data/BitmapType;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v2, Lcom/bef/effectsdk/text/data/BitmapType;->TEXT_BITMAP_TYPE_RGBA8888:Lcom/bef/effectsdk/text/data/BitmapType;

    .line 31
    .line 32
    new-instance v3, Lcom/bef/effectsdk/text/data/BitmapType;

    .line 33
    .line 34
    const-string v4, "TEXT_BITMAP_NEON_ALPHA"

    .line 35
    .line 36
    const/4 v6, 0x3

    .line 37
    invoke-direct {v3, v4, v6, v5}, Lcom/bef/effectsdk/text/data/BitmapType;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v3, Lcom/bef/effectsdk/text/data/BitmapType;->TEXT_BITMAP_NEON_ALPHA:Lcom/bef/effectsdk/text/data/BitmapType;

    .line 41
    .line 42
    new-instance v4, Lcom/bef/effectsdk/text/data/BitmapType;

    .line 43
    .line 44
    const-string v5, "TEXT_BITMAP_SINGLE_CHAR_ALPHA"

    .line 45
    .line 46
    const/4 v7, 0x4

    .line 47
    invoke-direct {v4, v5, v7, v6}, Lcom/bef/effectsdk/text/data/BitmapType;-><init>(Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    sput-object v4, Lcom/bef/effectsdk/text/data/BitmapType;->TEXT_BITMAP_SINGLE_CHAR_ALPHA:Lcom/bef/effectsdk/text/data/BitmapType;

    .line 51
    .line 52
    new-instance v5, Lcom/bef/effectsdk/text/data/BitmapType;

    .line 53
    .line 54
    const-string v6, "TEXT_BITMAP_SHAKE_ALPHA"

    .line 55
    .line 56
    const/4 v8, 0x5

    .line 57
    invoke-direct {v5, v6, v8, v7}, Lcom/bef/effectsdk/text/data/BitmapType;-><init>(Ljava/lang/String;II)V

    .line 58
    .line 59
    .line 60
    sput-object v5, Lcom/bef/effectsdk/text/data/BitmapType;->TEXT_BITMAP_SHAKE_ALPHA:Lcom/bef/effectsdk/text/data/BitmapType;

    .line 61
    .line 62
    filled-new-array/range {v0 .. v5}, [Lcom/bef/effectsdk/text/data/BitmapType;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sput-object v0, Lcom/bef/effectsdk/text/data/BitmapType;->$VALUES:[Lcom/bef/effectsdk/text/data/BitmapType;

    .line 67
    .line 68
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

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
    iput p3, p0, Lcom/bef/effectsdk/text/data/BitmapType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(I)Lcom/bef/effectsdk/text/data/BitmapType;
    .locals 5
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    invoke-static {}, Lcom/bef/effectsdk/text/data/BitmapType;->values()[Lcom/bef/effectsdk/text/data/BitmapType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    iget v4, v3, Lcom/bef/effectsdk/text/data/BitmapType;->value:I

    .line 12
    .line 13
    if-ne v4, p0, :cond_0

    .line 14
    .line 15
    return-object v3

    .line 16
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    sget-object p0, Lcom/bef/effectsdk/text/data/BitmapType;->TEXT_BITMAP_NONE:Lcom/bef/effectsdk/text/data/BitmapType;

    .line 20
    .line 21
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bef/effectsdk/text/data/BitmapType;
    .locals 1

    .line 22
    const-class v0, Lcom/bef/effectsdk/text/data/BitmapType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/bef/effectsdk/text/data/BitmapType;

    return-object p0
.end method

.method public static values()[Lcom/bef/effectsdk/text/data/BitmapType;
    .locals 1

    .line 1
    sget-object v0, Lcom/bef/effectsdk/text/data/BitmapType;->$VALUES:[Lcom/bef/effectsdk/text/data/BitmapType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/bef/effectsdk/text/data/BitmapType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/bef/effectsdk/text/data/BitmapType;

    .line 8
    .line 9
    return-object v0
.end method
