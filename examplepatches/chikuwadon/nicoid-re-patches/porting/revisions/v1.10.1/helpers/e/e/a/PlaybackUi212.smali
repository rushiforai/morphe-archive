.class public final Le/e/a/PlaybackUi212;
.super Ljava/lang/Object;
.source "PlaybackUi212.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static text(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .registers 2

    if-eqz p0, :cond_5

    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_5
    return-void
.end method
