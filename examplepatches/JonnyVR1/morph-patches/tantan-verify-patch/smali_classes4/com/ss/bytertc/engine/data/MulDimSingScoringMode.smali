.class public final enum Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;

.field public static final enum MUL_DIM_SING_SCORING_MODE_NOTE:Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;

    .line 2
    .line 3
    const-string v1, "MUL_DIM_SING_SCORING_MODE_NOTE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;->MUL_DIM_SING_SCORING_MODE_NOTE:Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;

    .line 10
    .line 11
    filled-new-array {v0}, [Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;->$VALUES:[Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;

    .line 16
    .line 17
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
    iput p3, p0, Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;->$VALUES:[Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;->value:I

    .line 2
    .line 3
    return p0
.end method
