.class public Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/moment/mediautils/cmds/AudioEffects;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private cycle:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "cycle"
    .end annotation
.end field

.field private ratio:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "ratio"
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
.method public a()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;->ratio:F

    .line 2
    .line 3
    return p0
.end method

.method public b(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;->cycle:Z

    .line 2
    .line 3
    return-void
.end method

.method public c(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;->ratio:F

    .line 2
    .line 3
    return-void
.end method
