.class public Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# direct methods
.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip$a;->b(Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;Landroid/view/View;)V

    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;Landroid/view/View;)V
    .locals 1

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;->p(Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;)V

    .line 5
    .line 6
    .line 7
    check-cast p1, Landroid/view/ViewGroup;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lv/VText;

    .line 15
    .line 16
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;->s(Lcom/p1/mobile/putong/core/ui/intl/greet/item/IntlItemGreetingTip;Lv/VText;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
