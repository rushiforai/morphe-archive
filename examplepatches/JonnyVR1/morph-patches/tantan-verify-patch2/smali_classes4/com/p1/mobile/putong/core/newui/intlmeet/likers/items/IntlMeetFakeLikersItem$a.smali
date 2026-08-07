.class public Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem$a;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem$a;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->n:Lv/VText_NoTopPadding;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem$a;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->n:Lv/VText_NoTopPadding;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x1

    .line 21
    if-lez v0, :cond_0

    .line 22
    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem$a;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;

    .line 24
    .line 25
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->q:Landroid/view/View;

    .line 26
    .line 27
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem$a;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->q:Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem$a;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->q:Landroid/view/View;

    .line 43
    .line 44
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return v1
.end method
