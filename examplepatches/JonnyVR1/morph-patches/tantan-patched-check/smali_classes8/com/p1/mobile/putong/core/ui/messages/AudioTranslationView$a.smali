.class public Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# direct methods
.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView$a;->b(Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;Landroid/view/View;)V

    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;Landroid/view/View;)V
    .locals 2

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    check-cast v1, Landroid/view/ViewGroup;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lv/VText;

    .line 15
    .line 16
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;->b(Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;Lv/VText;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Landroid/view/ViewGroup;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Landroid/widget/ProgressBar;

    .line 31
    .line 32
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;->a(Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;Landroid/widget/ProgressBar;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
