.class public Ll/a5l$a;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/a5l;->a(Lv/VText;Ljava/lang/CharSequence;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/newui/view/HighlightData;

.field public final synthetic b:Ll/a5l;


# direct methods
.method public constructor <init>(Ll/a5l;Lcom/p1/mobile/putong/newui/view/HighlightData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a5l$a;->b:Ll/a5l;

    .line 2
    .line 3
    iput-object p2, p0, Ll/a5l$a;->a:Lcom/p1/mobile/putong/newui/view/HighlightData;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 6
    .line 7
    .line 8
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
    iget-object p1, p0, Ll/a5l$a;->a:Lcom/p1/mobile/putong/newui/view/HighlightData;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/view/HighlightData;->getClickListener()Ll/x20;

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
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/a5l$a;->a:Lcom/p1/mobile/putong/newui/view/HighlightData;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/HighlightData;->getClickListener()Ll/x20;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ll/x20;->call()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 0
    .param p1    # Landroid/text/TextPaint;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget p0, p1, Landroid/text/TextPaint;->linkColor:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
