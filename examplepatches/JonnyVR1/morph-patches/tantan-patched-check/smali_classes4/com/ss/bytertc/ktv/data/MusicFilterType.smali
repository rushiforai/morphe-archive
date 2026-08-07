.class public final enum Lcom/ss/bytertc/ktv/data/MusicFilterType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/ktv/data/MusicFilterType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/ktv/data/MusicFilterType;

.field public static final enum NONE:Lcom/ss/bytertc/ktv/data/MusicFilterType;

.field public static final enum UNSUPPORTED_ACCOMPANY:Lcom/ss/bytertc/ktv/data/MusicFilterType;

.field public static final enum UNSUPPORTED_CLIMAX:Lcom/ss/bytertc/ktv/data/MusicFilterType;

.field public static final enum UNSUPPORTED_SCORE:Lcom/ss/bytertc/ktv/data/MusicFilterType;

.field public static final enum WITHOUT_LYRIC:Lcom/ss/bytertc/ktv/data/MusicFilterType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lcom/ss/bytertc/ktv/data/MusicFilterType;

    .line 2
    .line 3
    const-string v1, "NONE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/ktv/data/MusicFilterType;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/ktv/data/MusicFilterType;->NONE:Lcom/ss/bytertc/ktv/data/MusicFilterType;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/ktv/data/MusicFilterType;

    .line 12
    .line 13
    const-string v2, "WITHOUT_LYRIC"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/ss/bytertc/ktv/data/MusicFilterType;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/ss/bytertc/ktv/data/MusicFilterType;->WITHOUT_LYRIC:Lcom/ss/bytertc/ktv/data/MusicFilterType;

    .line 20
    .line 21
    new-instance v2, Lcom/ss/bytertc/ktv/data/MusicFilterType;

    .line 22
    .line 23
    const-string v3, "UNSUPPORTED_SCORE"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/ss/bytertc/ktv/data/MusicFilterType;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/ss/bytertc/ktv/data/MusicFilterType;->UNSUPPORTED_SCORE:Lcom/ss/bytertc/ktv/data/MusicFilterType;

    .line 30
    .line 31
    new-instance v3, Lcom/ss/bytertc/ktv/data/MusicFilterType;

    .line 32
    .line 33
    const-string v4, "UNSUPPORTED_ACCOMPANY"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    const/4 v6, 0x4

    .line 37
    invoke-direct {v3, v4, v5, v6}, Lcom/ss/bytertc/ktv/data/MusicFilterType;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v3, Lcom/ss/bytertc/ktv/data/MusicFilterType;->UNSUPPORTED_ACCOMPANY:Lcom/ss/bytertc/ktv/data/MusicFilterType;

    .line 41
    .line 42
    new-instance v4, Lcom/ss/bytertc/ktv/data/MusicFilterType;

    .line 43
    .line 44
    const-string v5, "UNSUPPORTED_CLIMAX"

    .line 45
    .line 46
    const/16 v7, 0x8

    .line 47
    .line 48
    invoke-direct {v4, v5, v6, v7}, Lcom/ss/bytertc/ktv/data/MusicFilterType;-><init>(Ljava/lang/String;II)V

    .line 49
    .line 50
    .line 51
    sput-object v4, Lcom/ss/bytertc/ktv/data/MusicFilterType;->UNSUPPORTED_CLIMAX:Lcom/ss/bytertc/ktv/data/MusicFilterType;

    .line 52
    .line 53
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/ss/bytertc/ktv/data/MusicFilterType;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    sput-object v0, Lcom/ss/bytertc/ktv/data/MusicFilterType;->$VALUES:[Lcom/ss/bytertc/ktv/data/MusicFilterType;

    .line 58
    .line 59
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
    iput p3, p0, Lcom/ss/bytertc/ktv/data/MusicFilterType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/ktv/data/MusicFilterType;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/ktv/data/MusicFilterType;->values()[Lcom/ss/bytertc/ktv/data/MusicFilterType;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/ktv/data/MusicFilterType;->value()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-ne v4, p0, :cond_0

    .line 16
    .line 17
    return-object v3

    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/ktv/data/MusicFilterType;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/ktv/data/MusicFilterType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/ktv/data/MusicFilterType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/ktv/data/MusicFilterType;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/ktv/data/MusicFilterType;->$VALUES:[Lcom/ss/bytertc/ktv/data/MusicFilterType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/ktv/data/MusicFilterType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/ktv/data/MusicFilterType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/ktv/data/MusicFilterType$1;->$SwitchMap$com$ss$bytertc$ktv$data$MusicFilterType:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_4

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_3

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_2

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x5

    .line 22
    if-eq p0, v0, :cond_0

    .line 23
    .line 24
    const-string p0, ""

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    const-string p0, "MUSIC_FILTER_TYPE_UNSUPPORTED_CLIMAX"

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_1
    const-string p0, "MUSIC_FILTER_TYPE_UNSUPPORTED_ACCOMPANY"

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_2
    const-string p0, "MUSIC_FILTER_TYPE_UNSUPPORTED_SCORE"

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_3
    const-string p0, "MUSIC_FILTER_TYPE_WITHOUT_LYRIC"

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_4
    const-string p0, "MUSIC_FILTER_TYPE_NONE"

    .line 40
    .line 41
    return-object p0
.end method

.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/ktv/data/MusicFilterType;->value:I

    .line 2
    .line 3
    return p0
.end method
