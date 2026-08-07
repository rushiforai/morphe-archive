.class public Ll/dsi0$a;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/dsi0;->a(Landroid/app/Activity;Lcom/p1/mobile/putong/data/OMSResourceContent;Ljava/lang/String;Ljava/lang/String;)Landroid/text/style/ClickableSpan;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Landroid/app/Activity;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/data/OMSResourceContent;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/app/Activity;Ljava/lang/String;Lcom/p1/mobile/putong/data/OMSResourceContent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dsi0$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/dsi0$a;->b:Landroid/app/Activity;

    .line 4
    .line 5
    iput-object p3, p0, Ll/dsi0$a;->c:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/dsi0$a;->d:Lcom/p1/mobile/putong/data/OMSResourceContent;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 10
    .line 11
    .line 12
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
    iget-object p1, p0, Ll/dsi0$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "http"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/dsi0$a;->b:Landroid/app/Activity;

    .line 12
    .line 13
    iget-object v0, p0, Ll/dsi0$a;->c:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p0, p0, Ll/dsi0$a;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1, v0, p0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p1, p0, Ll/dsi0$a;->a:Ljava/lang/String;

    .line 26
    .line 27
    const-string v0, "tantan"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    iget-object p1, p0, Ll/dsi0$a;->a:Ljava/lang/String;

    .line 36
    .line 37
    const-string v0, "tantanapp"

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-nez p1, :cond_2

    .line 44
    .line 45
    iget-object p1, p0, Ll/dsi0$a;->a:Ljava/lang/String;

    .line 46
    .line 47
    const-string v0, "tantantribe"

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    return-void

    .line 57
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/dsi0$a;->b:Landroid/app/Activity;

    .line 58
    .line 59
    iget-object p0, p0, Ll/dsi0$a;->a:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p1, p0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 1
    .param p1    # Landroid/text/TextPaint;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/dsi0$a;->d:Lcom/p1/mobile/putong/data/OMSResourceContent;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSResourceContent;->color:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/dsi0$a;->d:Lcom/p1/mobile/putong/data/OMSResourceContent;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSResourceContent;->color:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget v0, p1, Landroid/text/TextPaint;->linkColor:I

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 26
    .line 27
    .line 28
    :goto_0
    iget-object p0, p0, Ll/dsi0$a;->d:Lcom/p1/mobile/putong/data/OMSResourceContent;

    .line 29
    .line 30
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->underline:Z

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
