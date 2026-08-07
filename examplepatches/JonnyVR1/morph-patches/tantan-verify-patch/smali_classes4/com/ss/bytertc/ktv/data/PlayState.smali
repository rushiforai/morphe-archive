.class public final enum Lcom/ss/bytertc/ktv/data/PlayState;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/ktv/data/PlayState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/ktv/data/PlayState;

.field public static final enum FAILED:Lcom/ss/bytertc/ktv/data/PlayState;

.field public static final enum FINISHED:Lcom/ss/bytertc/ktv/data/PlayState;

.field public static final enum PAUSED:Lcom/ss/bytertc/ktv/data/PlayState;

.field public static final enum PLAYING:Lcom/ss/bytertc/ktv/data/PlayState;

.field public static final enum STOPPED:Lcom/ss/bytertc/ktv/data/PlayState;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lcom/ss/bytertc/ktv/data/PlayState;

    .line 2
    .line 3
    const-string v1, "PLAYING"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/ktv/data/PlayState;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/ss/bytertc/ktv/data/PlayState;->PLAYING:Lcom/ss/bytertc/ktv/data/PlayState;

    .line 11
    .line 12
    new-instance v1, Lcom/ss/bytertc/ktv/data/PlayState;

    .line 13
    .line 14
    const-string v2, "PAUSED"

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    invoke-direct {v1, v2, v3, v4}, Lcom/ss/bytertc/ktv/data/PlayState;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/ss/bytertc/ktv/data/PlayState;->PAUSED:Lcom/ss/bytertc/ktv/data/PlayState;

    .line 21
    .line 22
    new-instance v2, Lcom/ss/bytertc/ktv/data/PlayState;

    .line 23
    .line 24
    const-string v3, "STOPPED"

    .line 25
    .line 26
    const/4 v5, 0x3

    .line 27
    invoke-direct {v2, v3, v4, v5}, Lcom/ss/bytertc/ktv/data/PlayState;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v2, Lcom/ss/bytertc/ktv/data/PlayState;->STOPPED:Lcom/ss/bytertc/ktv/data/PlayState;

    .line 31
    .line 32
    new-instance v3, Lcom/ss/bytertc/ktv/data/PlayState;

    .line 33
    .line 34
    const-string v4, "FAILED"

    .line 35
    .line 36
    const/4 v6, 0x4

    .line 37
    invoke-direct {v3, v4, v5, v6}, Lcom/ss/bytertc/ktv/data/PlayState;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v3, Lcom/ss/bytertc/ktv/data/PlayState;->FAILED:Lcom/ss/bytertc/ktv/data/PlayState;

    .line 41
    .line 42
    new-instance v4, Lcom/ss/bytertc/ktv/data/PlayState;

    .line 43
    .line 44
    const-string v5, "FINISHED"

    .line 45
    .line 46
    const/4 v7, 0x5

    .line 47
    invoke-direct {v4, v5, v6, v7}, Lcom/ss/bytertc/ktv/data/PlayState;-><init>(Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    sput-object v4, Lcom/ss/bytertc/ktv/data/PlayState;->FINISHED:Lcom/ss/bytertc/ktv/data/PlayState;

    .line 51
    .line 52
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/ss/bytertc/ktv/data/PlayState;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sput-object v0, Lcom/ss/bytertc/ktv/data/PlayState;->$VALUES:[Lcom/ss/bytertc/ktv/data/PlayState;

    .line 57
    .line 58
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
    iput p3, p0, Lcom/ss/bytertc/ktv/data/PlayState;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/ktv/data/PlayState;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/ktv/data/PlayState;->values()[Lcom/ss/bytertc/ktv/data/PlayState;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/ktv/data/PlayState;->value()I

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

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/ktv/data/PlayState;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/ktv/data/PlayState;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/ktv/data/PlayState;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/ktv/data/PlayState;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/ktv/data/PlayState;->$VALUES:[Lcom/ss/bytertc/ktv/data/PlayState;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/ktv/data/PlayState;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/ktv/data/PlayState;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/ktv/data/PlayState$1;->$SwitchMap$com$ss$bytertc$ktv$data$PlayState:[I

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
    const-string p0, "PLAY_STATE_FINISHED"

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_1
    const-string p0, "PLAY_STATE_FAILED"

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_2
    const-string p0, "PLAY_STATE_STOPPED"

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_3
    const-string p0, "PLAY_STATE_PAUSED"

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_4
    const-string p0, "PLAY_STATE_PLAYING"

    .line 40
    .line 41
    return-object p0
.end method

.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/ktv/data/PlayState;->value:I

    .line 2
    .line 3
    return p0
.end method
