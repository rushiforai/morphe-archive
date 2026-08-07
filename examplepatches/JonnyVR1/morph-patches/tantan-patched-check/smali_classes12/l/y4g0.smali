.class public Ll/y4g0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field facePositions:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "facePosition"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private gameScore:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "gameScore"
    .end annotation
.end field

.field private soundPitchShift:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "soundPitchShift"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/y4g0;->soundPitchShift:I

    .line 2
    .line 3
    return p0
.end method
