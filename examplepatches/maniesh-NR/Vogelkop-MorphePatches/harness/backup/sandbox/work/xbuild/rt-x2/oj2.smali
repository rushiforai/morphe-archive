.class public final Loj2;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:Lqxh;

.field public final d:Z

.field public final synthetic e:Lpj2;


# direct methods
.method public constructor <init>(Lpj2;ILjava/lang/String;Lqxh;Z)V
    .registers 6

    iput-object p1, p0, Loj2;->e:Lpj2;

    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    iput p2, p0, Loj2;->a:I

    iput-object p3, p0, Loj2;->b:Ljava/lang/String;

    iput-object p4, p0, Loj2;->c:Lqxh;

    iput-boolean p5, p0, Loj2;->d:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object p1, p0, Loj2;->e:Lpj2;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Loj2;->b:Ljava/lang/String;

    iget-object p0, p0, Loj2;->c:Lqxh;

    invoke-static {p1, v0, p0}, Lcom/opera/android/FullscreenWebActivity;->A0(Landroid/content/Context;Ljava/lang/String;Lpxh;)V

    return-void
.end method

.method public final updateDrawState(Landroid/text/TextPaint;)V
    .registers 3

    invoke-super {p0, p1}, Landroid/text/style/ClickableSpan;->updateDrawState(Landroid/text/TextPaint;)V

    iget-boolean v0, p0, Loj2;->d:Z

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    iget p0, p0, Loj2;->a:I

    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method
