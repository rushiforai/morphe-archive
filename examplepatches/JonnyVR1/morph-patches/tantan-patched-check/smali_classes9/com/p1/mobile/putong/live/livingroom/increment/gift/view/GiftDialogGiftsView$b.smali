.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->y0(Ljava/util/List;IIZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView$b;->b()V

    return-void
.end method

.method private synthetic b()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->Y0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->q0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->q0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->g:Lcom/google/android/material/tabs/TabLayout;

    .line 9
    .line 10
    new-instance v0, Ll/lqj;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/lqj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView$b;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->s0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;Lcom/google/android/material/tabs/TabLayout$Tab;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->n0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;)Ljava/util/Set;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    return-void
.end method
