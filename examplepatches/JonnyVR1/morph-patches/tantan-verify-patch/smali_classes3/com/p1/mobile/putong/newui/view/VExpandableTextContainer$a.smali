.class public Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$a;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->A(ILandroid/text/TextPaint;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$a;->a:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$a;->a:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->c(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)Ll/x20;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$a;->a:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->c(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)Ll/x20;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ll/x20;->call()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->i(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p1, Ljava/lang/Integer;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$a;->a:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 36
    .line 37
    invoke-static {p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->i(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast p0, Ljava/lang/Integer;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    invoke-static {v0, p1, p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->q(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;II)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$a;->a:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->e(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)I

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
