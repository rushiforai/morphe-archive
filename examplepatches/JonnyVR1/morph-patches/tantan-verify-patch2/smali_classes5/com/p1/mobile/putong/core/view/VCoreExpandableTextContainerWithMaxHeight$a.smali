.class public Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight$a;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->w(ILandroid/text/TextPaint;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight$a;->a:Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;

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
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight$a;->a:Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->c(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight$a;->a:Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->i(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Ljava/lang/Integer;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight$a;->a:Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->i(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p0, Ljava/lang/Integer;

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-static {p1, v0, p0}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->p(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;II)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight$a;->a:Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->d(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
