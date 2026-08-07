.class public Lcom/immomo/velib/anim/model/MixSetting;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private ratio:[F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "a_v"
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
.method public getRatio()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/MixSetting;->ratio:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public setRatio([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/MixSetting;->ratio:[F

    .line 2
    .line 3
    return-void
.end method
