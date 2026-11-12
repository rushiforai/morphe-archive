.class public final synthetic Lu4k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lv4k;


# direct methods
.method public synthetic constructor <init>(Lv4k;B)V
    .registers 3

    iput-byte p2, p0, Lu4k;->a:B

    iput-object p1, p0, Lu4k;->b:Lv4k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Lu4k;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lu4k;->b:Lv4k;

    packed-switch v0, :pswitch_data_82

    check-cast p1, Lavl;

    iget-object v0, p0, Lv4k;->b:Lc5k;

    invoke-virtual {v0}, Lc5k;->l()V

    invoke-virtual {p0}, Lv4k;->b()V

    iget-object p0, v0, Lc5k;->n:Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;

    iget p1, p1, Lavl;->c:I

    iget-object v0, v0, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v2, 0x42800000    # 64.0f

    invoke-static {v2, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    add-int/2addr v0, p1

    iput-boolean v1, p0, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->h:Z

    iget-object v2, p0, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->j:Lg05;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    iput p1, p0, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->e:I

    iput p1, p0, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->n:I

    int-to-float p1, v0

    iput p1, p0, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->t:F

    iput-boolean v1, p0, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->x:Z

    iget-object p0, p0, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->j:Lg05;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_3b
    iget-object p0, p0, Lv4k;->b:Lc5k;

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float p1, p1, v0

    const/4 v0, 0x0

    if-eqz p1, :cond_4b

    move v1, v0

    :cond_4b
    iget-object p1, p0, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipToPadding()Z

    move-result v2

    if-eq v1, v2, :cond_81

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    iget-object p1, p0, Lc5k;->q:Lcv8;

    iget-object p1, p1, Lcv8;->p:Lt5k;

    iget-object p1, p1, Lha2;->c:Laan;

    invoke-virtual {p1}, Lcan;->d()V

    iget-object p0, p0, Lc5k;->A:Lbx8;

    iget-object p0, p0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    :cond_67
    :goto_67
    if-ge v0, p1, :cond_81

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    check-cast v1, Lzw8;

    iget-object v1, v1, Lzw8;->b:Lxw8;

    if-eqz v1, :cond_67

    const-class v2, Lxw8;

    invoke-virtual {v2, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_67

    invoke-virtual {v1}, Lxw8;->l()V

    goto :goto_67

    :cond_81
    return-void

    :pswitch_data_82
    .packed-switch 0x0
        :pswitch_3b
    .end packed-switch
.end method
