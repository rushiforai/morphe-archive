.class public Lcom/bef/effectsdk/view/BEFView$Color;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Lcom/amazing/annotation/EffectKeep;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bef/effectsdk/view/BEFView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Color"
.end annotation


# instance fields
.field private a:F

.field private b:F

.field private g:F

.field private r:F


# direct methods
.method public constructor <init>()V
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0, v0, v0, v0}, Lcom/bef/effectsdk/view/BEFView$Color;->setColor(FFFF)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 0
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/bef/effectsdk/view/BEFView$Color;->setColor(FFFF)V

    return-void
.end method


# virtual methods
.method public alpha()F
    .locals 0
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    iget p0, p0, Lcom/bef/effectsdk/view/BEFView$Color;->a:F

    .line 2
    .line 3
    return p0
.end method

.method public blue()F
    .locals 0
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    iget p0, p0, Lcom/bef/effectsdk/view/BEFView$Color;->b:F

    .line 2
    .line 3
    return p0
.end method

.method public green()F
    .locals 0
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    iget p0, p0, Lcom/bef/effectsdk/view/BEFView$Color;->g:F

    .line 2
    .line 3
    return p0
.end method

.method public red()F
    .locals 0
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    iget p0, p0, Lcom/bef/effectsdk/view/BEFView$Color;->r:F

    .line 2
    .line 3
    return p0
.end method

.method public setColor(FFFF)V
    .locals 0
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    iput p1, p0, Lcom/bef/effectsdk/view/BEFView$Color;->r:F

    .line 2
    .line 3
    iput p2, p0, Lcom/bef/effectsdk/view/BEFView$Color;->g:F

    .line 4
    .line 5
    iput p3, p0, Lcom/bef/effectsdk/view/BEFView$Color;->b:F

    .line 6
    .line 7
    iput p4, p0, Lcom/bef/effectsdk/view/BEFView$Color;->a:F

    .line 8
    .line 9
    return-void
.end method
