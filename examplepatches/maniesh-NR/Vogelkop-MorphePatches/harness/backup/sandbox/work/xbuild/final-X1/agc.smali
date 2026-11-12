.class public abstract Lagc;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"

# interfaces
.implements Lcom/opera/android/text/ThemeDependentSpan;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008&\u0018\u00002\u00020\u00012\u00020\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lagc;",
        "Landroid/text/style/ClickableSpan;",
        "Lcom/opera/android/text/ThemeDependentSpan;",
        "text"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public a:Z

.field public b:I

.field public c:I

.field public d:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    invoke-virtual {p0, p1}, Lagc;->c(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .registers 2

    invoke-virtual {p0, p1}, Lagc;->c(Landroid/content/Context;)V

    return-void
.end method

.method public final c(Landroid/content/Context;)V
    .registers 6

    const v0, 0x101009b

    const v1, 0x7f06063b

    invoke-static {v0, p1, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lagc;->b:I

    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v1

    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    move-result v2

    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    const/16 v3, 0x44

    invoke-static {v3, v1, v2, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    iput v0, p0, Lagc;->c:I

    const v0, 0x7f040a52

    invoke-static {v0, p1}, Lf03;->V(ILandroid/content/Context;)Z

    move-result p1

    iput-boolean p1, p0, Lagc;->d:Z

    return-void
.end method

.method public final updateDrawState(Landroid/text/TextPaint;)V
    .registers 3

    iget-boolean v0, p0, Lagc;->a:Z

    if-eqz v0, :cond_7

    iget v0, p0, Lagc;->c:I

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    :goto_8
    iput v0, p1, Landroid/text/TextPaint;->bgColor:I

    iget v0, p0, Lagc;->b:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget-boolean p0, p0, Lagc;->d:Z

    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    return-void
.end method
