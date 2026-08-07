.class public Lcom/p1/mobile/putong/core/ui/pricerecall/MarginBottomSubscriptSpan;
.super Landroid/text/style/SubscriptSpan;
.source "SourceFile"


# instance fields
.field private marginBottom:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/text/style/SubscriptSpan;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/MarginBottomSubscriptSpan;->marginBottom:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Landroid/text/TextPaint;)V
    .locals 1

    .line 1
    iget v0, p1, Landroid/text/TextPaint;->baselineShift:I

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/MarginBottomSubscriptSpan;->marginBottom:I

    .line 4
    .line 5
    add-int/2addr v0, p0

    .line 6
    iput v0, p1, Landroid/text/TextPaint;->baselineShift:I

    .line 7
    .line 8
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/pricerecall/MarginBottomSubscriptSpan;->a(Landroid/text/TextPaint;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public updateMeasureState(Landroid/text/TextPaint;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/pricerecall/MarginBottomSubscriptSpan;->a(Landroid/text/TextPaint;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
