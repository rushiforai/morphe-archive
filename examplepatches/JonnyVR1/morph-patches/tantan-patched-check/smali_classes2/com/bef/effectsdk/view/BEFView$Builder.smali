.class public final Lcom/bef/effectsdk/view/BEFView$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Lcom/amazing/annotation/EffectKeep;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bef/effectsdk/view/BEFView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bef/effectsdk/view/BEFView$Builder$Params;
    }
.end annotation


# instance fields
.field private mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, p0, v1}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;-><init>(Lcom/bef/effectsdk/view/BEFView$Builder;Lcom/bef/effectsdk/view/BEFView$1;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 11
    .line 12
    return-void
.end method

.method public static obtain()Lcom/bef/effectsdk/view/BEFView$Builder;
    .locals 4
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    new-instance v0, Lcom/bef/effectsdk/view/BEFView$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/bef/effectsdk/view/BEFView$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 7
    .line 8
    const/16 v2, 0x2d0

    .line 9
    .line 10
    invoke-static {v1, v2}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$102(Lcom/bef/effectsdk/view/BEFView$Builder$Params;I)I

    .line 11
    .line 12
    .line 13
    iget-object v1, v0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 14
    .line 15
    const/16 v2, 0x500

    .line 16
    .line 17
    invoke-static {v1, v2}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$202(Lcom/bef/effectsdk/view/BEFView$Builder$Params;I)I

    .line 18
    .line 19
    .line 20
    iget-object v1, v0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 21
    .line 22
    const-wide/high16 v2, 0x403e000000000000L    # 30.0

    .line 23
    .line 24
    invoke-static {v1, v2, v3}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$302(Lcom/bef/effectsdk/view/BEFView$Builder$Params;D)D

    .line 25
    .line 26
    .line 27
    iget-object v1, v0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 28
    .line 29
    sget-object v2, Lcom/bef/effectsdk/view/BEFView$FitMode;->FILL_SCREEN:Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 30
    .line 31
    invoke-static {v1, v2}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$402(Lcom/bef/effectsdk/view/BEFView$Builder$Params;Lcom/bef/effectsdk/view/BEFView$FitMode;)Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 32
    .line 33
    .line 34
    iget-object v1, v0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-static {v1, v2}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$502(Lcom/bef/effectsdk/view/BEFView$Builder$Params;Lcom/bef/effectsdk/ResourceFinder;)Lcom/bef/effectsdk/ResourceFinder;

    .line 38
    .line 39
    .line 40
    iget-object v1, v0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 41
    .line 42
    sget-object v2, Lcom/bef/effectsdk/view/BEFView$BEFViewSceneKey;->SHOOT:Lcom/bef/effectsdk/view/BEFView$BEFViewSceneKey;

    .line 43
    .line 44
    invoke-static {v1, v2}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$602(Lcom/bef/effectsdk/view/BEFView$Builder$Params;Lcom/bef/effectsdk/view/BEFView$BEFViewSceneKey;)Lcom/bef/effectsdk/view/BEFView$BEFViewSceneKey;

    .line 45
    .line 46
    .line 47
    iget-object v1, v0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    invoke-static {v1, v2}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$702(Lcom/bef/effectsdk/view/BEFView$Builder$Params;Z)Z

    .line 51
    .line 52
    .line 53
    iget-object v1, v0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 54
    .line 55
    invoke-static {v1, v2}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$802(Lcom/bef/effectsdk/view/BEFView$Builder$Params;Z)Z

    .line 56
    .line 57
    .line 58
    return-object v0
.end method


# virtual methods
.method public build(Landroid/content/Context;)Lcom/bef/effectsdk/view/BEFView;
    .locals 2
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    new-instance v0, Lcom/bef/effectsdk/view/BEFView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p1, v1}, Lcom/bef/effectsdk/view/BEFView;-><init>(Landroid/content/Context;Lcom/bef/effectsdk/view/BEFView$1;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 8
    .line 9
    invoke-static {v0, p0}, Lcom/bef/effectsdk/view/BEFView;->access$1000(Lcom/bef/effectsdk/view/BEFView;Lcom/bef/effectsdk/view/BEFView$Builder$Params;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public build(Landroid/content/Context;Landroid/util/AttributeSet;)Lcom/bef/effectsdk/view/BEFView;
    .locals 2
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 13
    new-instance v0, Lcom/bef/effectsdk/view/BEFView;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lcom/bef/effectsdk/view/BEFView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/bef/effectsdk/view/BEFView$1;)V

    .line 14
    iget-object p0, p0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    invoke-static {v0, p0}, Lcom/bef/effectsdk/view/BEFView;->access$1000(Lcom/bef/effectsdk/view/BEFView;Lcom/bef/effectsdk/view/BEFView$Builder$Params;)V

    return-object v0
.end method

.method public setFPS(D)Lcom/bef/effectsdk/view/BEFView$Builder;
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 2
    .line 3
    invoke-static {v0, p1, p2}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$302(Lcom/bef/effectsdk/view/BEFView$Builder$Params;D)D

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public setFitMode(Lcom/bef/effectsdk/view/BEFView$FitMode;)Lcom/bef/effectsdk/view/BEFView$Builder;
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$402(Lcom/bef/effectsdk/view/BEFView$Builder$Params;Lcom/bef/effectsdk/view/BEFView$FitMode;)Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public setKeepStatusAtPause(Z)Lcom/bef/effectsdk/view/BEFView$Builder;
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$802(Lcom/bef/effectsdk/view/BEFView$Builder$Params;Z)Z

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public setNeglectTouchEvent(Z)Lcom/bef/effectsdk/view/BEFView$Builder;
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$702(Lcom/bef/effectsdk/view/BEFView$Builder$Params;Z)Z

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public setRenderSize(II)Lcom/bef/effectsdk/view/BEFView$Builder;
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$102(Lcom/bef/effectsdk/view/BEFView$Builder$Params;I)I

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 7
    .line 8
    invoke-static {p1, p2}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$202(Lcom/bef/effectsdk/view/BEFView$Builder$Params;I)I

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setResourceFinder(Lcom/bef/effectsdk/ResourceFinder;)Lcom/bef/effectsdk/view/BEFView$Builder;
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$502(Lcom/bef/effectsdk/view/BEFView$Builder$Params;Lcom/bef/effectsdk/ResourceFinder;)Lcom/bef/effectsdk/ResourceFinder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public setSceneKey(Lcom/bef/effectsdk/view/BEFView$BEFViewSceneKey;)Lcom/bef/effectsdk/view/BEFView$Builder;
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView$Builder;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$602(Lcom/bef/effectsdk/view/BEFView$Builder$Params;Lcom/bef/effectsdk/view/BEFView$BEFViewSceneKey;)Lcom/bef/effectsdk/view/BEFView$BEFViewSceneKey;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
