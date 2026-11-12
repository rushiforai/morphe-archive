.class public final Ltld;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llig;


# instance fields
.field public final synthetic a:Lcom/opera/android/media/MediaPlayerMini;


# direct methods
.method public constructor <init>(Lcom/opera/android/media/MediaPlayerMini;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltld;->a:Lcom/opera/android/media/MediaPlayerMini;

    return-void
.end method


# virtual methods
.method public final b(J)V
    .registers 3

    iget-object p0, p0, Ltld;->a:Lcom/opera/android/media/MediaPlayerMini;

    iget-object p0, p0, Lcom/opera/android/media/MediaPlayerMini;->a:Lei;

    iget-object p0, p0, Lei;->g:Landroid/view/View;

    check-cast p0, Lcom/google/android/material/progressindicator/LinearProgressIndicator;

    long-to-int p1, p1

    invoke-virtual {p0, p1}, Landroid/widget/ProgressBar;->setMax(I)V

    return-void
.end method

.method public final d(ZZ)V
    .registers 5

    iget-object p0, p0, Ltld;->a:Lcom/opera/android/media/MediaPlayerMini;

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerMini;->a:Lei;

    iget-object v0, v0, Lei;->d:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p1, :cond_e

    const v1, 0x7f0805af

    goto :goto_11

    :cond_e
    const v1, 0x7f0805b8

    :goto_11
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerMini;->a:Lei;

    iget-object v0, v0, Lei;->d:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p2}, Landroid/view/View;->setEnabled(Z)V

    iget-object p0, p0, Lcom/opera/android/media/MediaPlayerMini;->a:Lei;

    iget-object p0, p0, Lei;->d:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p1, :cond_29

    const p1, 0x7f1412ad

    goto :goto_2c

    :cond_29
    const p1, 0x7f1412ae

    :goto_2c
    const/4 p2, 0x0

    invoke-static {p0, p1, p2}, Ln1h;->n(Landroid/view/View;II)V

    return-void
.end method

.method public final e(J)V
    .registers 3

    iget-object p0, p0, Ltld;->a:Lcom/opera/android/media/MediaPlayerMini;

    iget-object p0, p0, Lcom/opera/android/media/MediaPlayerMini;->a:Lei;

    iget-object p0, p0, Lei;->g:Landroid/view/View;

    check-cast p0, Lcom/google/android/material/progressindicator/LinearProgressIndicator;

    long-to-int p1, p1

    invoke-virtual {p0, p1}, Lo83;->setProgress(I)V

    return-void
.end method

.method public final i(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .registers 4

    iget-object p0, p0, Ltld;->a:Lcom/opera/android/media/MediaPlayerMini;

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerMini;->a:Lei;

    iget-object v0, v0, Lei;->i:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_42

    iget-object p1, p0, Lcom/opera/android/media/MediaPlayerMini;->c:Lmig;

    invoke-virtual {p1}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->g()Lqjd;

    move-result-object v0

    if-eqz v0, :cond_2c

    iget-object p1, p1, Lmig;->d:Ltjg;

    iget-object p1, p1, Ltjg;->k:Lokg;

    iget-object p1, p1, Lokg;->e:Ljava/util/HashMap;

    iget-object v0, v0, Lqjd;->a:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Legd;

    goto :goto_2d

    :cond_2c
    const/4 p1, 0x0

    :goto_2d
    if-eqz p1, :cond_42

    invoke-virtual {p1}, Legd;->b()Lo29;

    move-result-object p1

    sget-object v0, Lo29;->b:Lo29;

    if-ne p1, v0, :cond_42

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f14131a

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    :cond_42
    iget-object p1, p0, Lcom/opera/android/media/MediaPlayerMini;->a:Lei;

    iget-object p1, p1, Lei;->h:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lcom/opera/android/media/MediaPlayerMini;->a:Lei;

    iget-object p0, p0, Lei;->h:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_5a

    const/16 p1, 0x8

    goto :goto_5b

    :cond_5a
    const/4 p1, 0x0

    :goto_5b
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
