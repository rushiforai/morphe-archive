.class public Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem$a;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->g(Ll/g900;Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/g900;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;Ll/g900;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem$a;->c:Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem$a;->a:Ll/g900;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem$a;->b:Lcom/p1/mobile/putong/core/data/Message;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem$a;->c:Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem$a;->a:Ll/g900;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem$a;->b:Lcom/p1/mobile/putong/core/data/Message;

    .line 6
    .line 7
    invoke-static {p1, v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;->c(Lcom/p1/mobile/putong/core/ui/messages/IntrRiskTipItem;Ll/g900;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 0
    .param p1    # Landroid/text/TextPaint;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/text/style/ClickableSpan;->updateDrawState(Landroid/text/TextPaint;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    .line 6
    .line 7
    .line 8
    sget p0, Ll/g9c0;->w:I

    .line 9
    .line 10
    invoke-static {p0}, Ll/k3d0;->a(I)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
