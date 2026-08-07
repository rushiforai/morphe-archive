.class public Ll/q8g0$c;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/q8g0;->E(Landroid/app/Activity;Landroid/graphics/Typeface;ILjava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Landroid/app/Activity;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:I

.field public final synthetic e:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/app/Activity;Ljava/lang/String;ILandroid/graphics/Typeface;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/q8g0$c;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/q8g0$c;->b:Landroid/app/Activity;

    .line 4
    .line 5
    iput-object p3, p0, Ll/q8g0$c;->c:Ljava/lang/String;

    .line 6
    .line 7
    iput p4, p0, Ll/q8g0$c;->d:I

    .line 8
    .line 9
    iput-object p5, p0, Ll/q8g0$c;->e:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/q8g0$c;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "\u300a"

    .line 4
    .line 5
    const-string v1, ""

    .line 6
    .line 7
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "\u300b"

    .line 12
    .line 13
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p0, Ll/q8g0$c;->b:Landroid/app/Activity;

    .line 18
    .line 19
    sget-object v1, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 20
    .line 21
    iget-object p0, p0, Ll/q8g0$c;->c:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    invoke-static {v0, p1, p0}, Lcom/p1/mobile/putong/ui/WebViewPreAct;->K0(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-static {v0, p1, p0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    :goto_0
    invoke-virtual {v0, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 1
    .param p1    # Landroid/text/TextPaint;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Ll/q8g0$c;->d:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/q8g0$c;->e:Landroid/graphics/Typeface;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 9
    .line 10
    .line 11
    return-void
.end method
