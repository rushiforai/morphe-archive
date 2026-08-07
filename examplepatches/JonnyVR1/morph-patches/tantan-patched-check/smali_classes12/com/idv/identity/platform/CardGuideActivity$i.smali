.class Lcom/idv/identity/platform/CardGuideActivity$i;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/platform/CardGuideActivity;->V0(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/platform/CardGuideActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/platform/CardGuideActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/CardGuideActivity$i;->a:Lcom/idv/identity/platform/CardGuideActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/CardGuideActivity$i;->a:Lcom/idv/identity/platform/CardGuideActivity;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/idv/identity/platform/CardGuideActivity;->X0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 1
    .param p1    # Landroid/text/TextPaint;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/text/style/ClickableSpan;->updateDrawState(Landroid/text/TextPaint;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/idv/identity/platform/CardGuideActivity$i;->a:Lcom/idv/identity/platform/CardGuideActivity;

    .line 5
    .line 6
    sget v0, Ll/y8c0;->f:I

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
