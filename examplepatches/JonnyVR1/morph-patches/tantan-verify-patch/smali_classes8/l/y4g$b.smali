.class public Ll/y4g$b;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/y4g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/y4g;


# direct methods
.method public constructor <init>(Ll/y4g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y4g$b;->a:Ll/y4g;

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
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance p1, Ll/uyf;

    .line 2
    .line 3
    iget-object v0, p0, Ll/y4g$b;->a:Ll/y4g;

    .line 4
    .line 5
    invoke-static {v0}, Ll/y4g;->i(Ll/y4g;)Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p1, v0}, Ll/uyf;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/dkb;->Z7()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object p0, p0, Ll/y4g$b;->a:Ll/y4g;

    .line 21
    .line 22
    invoke-static {p0}, Ll/y4g;->i(Ll/y4g;)Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-virtual {p1, v0, v1, p0}, Ll/uyf;->C(ZZLjava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Ll/uyf;->show()V

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
    invoke-super {p0, p1}, Landroid/text/style/ClickableSpan;->updateDrawState(Landroid/text/TextPaint;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/y4g$b;->a:Ll/y4g;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget v0, Ll/c9c0;->c2:I

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    iput p0, p1, Landroid/text/TextPaint;->bgColor:I

    .line 25
    .line 26
    return-void
.end method
