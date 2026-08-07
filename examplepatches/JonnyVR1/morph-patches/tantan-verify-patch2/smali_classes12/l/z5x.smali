.class public Ll/z5x;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private folder:Ljava/lang/String;

.field private hiddenTriggerType:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "hidingTriggerType"
    .end annotation
.end field

.field public landmarks:[F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "landmarks"
    .end annotation
.end field

.field private strength:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "strength"
    .end annotation
.end field

.field private strengthB:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "strengthB"
    .end annotation
.end field

.field public swapFacialMask:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "swapFacialMask"
    .end annotation
.end field

.field private texturePath:Ljava/lang/String;

.field private triggerType:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "triggerType"
    .end annotation
.end field

.field private type:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "type"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/z5x;->triggerType:I

    .line 6
    .line 7
    iput v0, p0, Ll/z5x;->hiddenTriggerType:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Ll/z5x;->strength:F

    .line 11
    .line 12
    iput v0, p0, Ll/z5x;->strengthB:F

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z5x;->folder:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/z5x;->hiddenTriggerType:I

    .line 2
    .line 3
    return p0
.end method

.method public c()F
    .locals 0

    .line 1
    iget p0, p0, Ll/z5x;->strength:F

    .line 2
    .line 3
    return p0
.end method

.method public d()F
    .locals 0

    .line 1
    iget p0, p0, Ll/z5x;->strengthB:F

    .line 2
    .line 3
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/z5x;->triggerType:I

    .line 2
    .line 3
    return p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z5x;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z5x;->texturePath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
