.class public Lcom/opera/android/browser/chromium/ChromiumContainerView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static final synthetic i:I


# instance fields
.field public final a:Lckf;

.field public final b:Lzy4;

.field public c:Lqt6;

.field public d:Lyy4;

.field public e:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public f:I

.field public g:I

.field public h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lckf;

    invoke-direct {p1, p0}, Lqxe;-><init>(Landroid/view/ViewGroup;)V

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p1, Lckf;->k:Ljava/util/ArrayList;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p1, Lckf;->l:Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a:Lckf;

    new-instance p1, Lzy4;

    new-instance p2, Llb4;

    const/16 v0, 0xc

    invoke-direct {p2, p0, v0}, Llb4;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, p2}, Lzy4;-><init>(Llb4;)V

    iput-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->b:Lzy4;

    new-instance p1, Ltw2;

    const/16 p2, 0x13

    invoke-direct {p1, p0, p2}, Ltw2;-><init>(Ljava/lang/Object;B)V

    sget-object p2, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p0, p1}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 6

    const/4 v0, 0x0

    if-lez p1, :cond_5

    const/4 v1, 0x1

    goto :goto_6

    :cond_5
    move v1, v0

    :goto_6
    if-nez v1, :cond_c

    iget-boolean v2, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->h:Z

    if-eqz v2, :cond_4d

    :cond_c
    iput-boolean v1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->h:Z

    iget-object v2, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->e:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v2, :cond_4d

    invoke-virtual {v2}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v2

    if-nez v2, :cond_4d

    if-eqz v1, :cond_3e

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    iget-object v1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->e:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget v2, v0, Landroid/graphics/Rect;->left:I

    iget v0, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    invoke-virtual {v1}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v3

    if-nez v3, :cond_4d

    invoke-virtual {v1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    invoke-static {v1, v2, v0, p0, p1}, LJ/N;->MwcFF$jM(Ljava/lang/Object;IIII)V

    return-void

    :cond_3e
    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->e:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result p1

    if-nez p1, :cond_4d

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-static {p0, v0, v0, v0, v0}, LJ/N;->MwcFF$jM(Ljava/lang/Object;IIII)V

    :cond_4d
    return-void
.end method

.method public final b(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 11

    sget-object v0, Loup;->c:Lpza;

    iget-object v1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->c:Lqt6;

    const/4 v2, 0x0

    if-eqz v1, :cond_1f

    iget-object v3, v1, Lqt6;->c:Ljava/lang/Object;

    check-cast v3, Lorg/chromium/content/browser/GestureListenerManagerImpl;

    iget-object v4, v1, Lqt6;->d:Ljava/lang/Object;

    check-cast v4, Ltz4;

    invoke-virtual {v3, v4}, Lorg/chromium/content/browser/GestureListenerManagerImpl;->h(Ljw9;)V

    iput-object v2, v1, Lqt6;->d:Ljava/lang/Object;

    iput-object v2, v1, Lqt6;->c:Ljava/lang/Object;

    iget-object v1, v1, Lqt6;->f:Ljava/lang/Object;

    check-cast v1, Lxr5;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iput-object v2, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->c:Lqt6;

    :cond_1f
    iget-object v1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->e:Lcom/opera/android/browser/chromium/ChromiumContent;

    const-class v3, Lorg/chromium/content/browser/input/ImeAdapterImpl;

    iget-object v4, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->b:Lzy4;

    if-eqz v1, :cond_4b

    iget-object v5, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->d:Lyy4;

    if-eqz v5, :cond_2e

    invoke-virtual {v5, v1}, Lyy4;->M(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    :cond_2e
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->h:Z

    iget-object v1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->e:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v1, v4}, Lcom/opera/android/browser/chromium/ChromiumContent;->y(Liz4;)V

    iget-object v1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->e:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v1}, Lcom/opera/android/browser/WebContentsWrapper;->f()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    if-eqz v1, :cond_4b

    sget-object v5, Lorg/chromium/content/browser/input/ImeAdapterImpl;->E:Landroid/util/LongSparseArray;

    invoke-interface {v1, v3, v0}, Lorg/chromium/content_public/browser/WebContents;->X(Ljava/lang/Class;Lktn;)Lytm;

    move-result-object v1

    check-cast v1, Lorg/chromium/content/browser/input/ImeAdapterImpl;

    iget-object v1, v1, Lorg/chromium/content/browser/input/ImeAdapterImpl;->h:Ljava/util/ArrayList;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_4b
    iput-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->e:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a:Lckf;

    if-nez p1, :cond_55

    invoke-virtual {v1, v2}, Lckf;->c(Lorg/chromium/content_public/browser/WebContents;)V

    return-void

    :cond_55
    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v2

    new-instance v5, Lqt6;

    iget-object v6, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->J:Lxr5;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    iput-object v4, v5, Lqt6;->e:Ljava/lang/Object;

    invoke-static {v2}, Lorg/chromium/content/browser/GestureListenerManagerImpl;->e(Lorg/chromium/content_public/browser/WebContents;)Lorg/chromium/content/browser/GestureListenerManagerImpl;

    move-result-object v7

    iput-object v7, v5, Lqt6;->c:Ljava/lang/Object;

    iput-object v6, v5, Lqt6;->f:Ljava/lang/Object;

    new-instance v7, Lhs8;

    const/4 v8, 0x4

    invoke-direct {v7, v5, v8}, Lhs8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    new-instance v6, Ltz4;

    const/4 v7, 0x3

    invoke-direct {v6, v5, v7}, Ltz4;-><init>(Ljava/lang/Object;B)V

    iput-object v6, v5, Lqt6;->d:Ljava/lang/Object;

    iget-object v7, v5, Lqt6;->c:Ljava/lang/Object;

    check-cast v7, Lorg/chromium/content/browser/GestureListenerManagerImpl;

    const/4 v8, 0x2

    invoke-virtual {v7, v6, v8}, Lorg/chromium/content/browser/GestureListenerManagerImpl;->b(Ljw9;I)V

    iput-object v5, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->c:Lqt6;

    invoke-virtual {v1, v2}, Lckf;->c(Lorg/chromium/content_public/browser/WebContents;)V

    invoke-virtual {p1, v4}, Lcom/opera/android/browser/chromium/ChromiumContent;->k(Liz4;)V

    invoke-interface {v2}, Lorg/chromium/content_public/browser/WebContents;->x0()I

    move-result p0

    invoke-virtual {v4, p0}, Lzy4;->K(I)V

    invoke-virtual {v4}, Lzy4;->Q()I

    move-result p0

    invoke-virtual {p1, p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->A(I)V

    sget-object p0, Lorg/chromium/content/browser/input/ImeAdapterImpl;->E:Landroid/util/LongSparseArray;

    invoke-interface {v2, v3, v0}, Lorg/chromium/content_public/browser/WebContents;->X(Ljava/lang/Class;Lktn;)Lytm;

    move-result-object p0

    check-cast p0, Lorg/chromium/content/browser/input/ImeAdapterImpl;

    iget-object p0, p0, Lorg/chromium/content/browser/input/ImeAdapterImpl;->h:Ljava/util/ArrayList;

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 6

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget v0, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->f:I

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    iget v3, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->g:I

    sub-int/2addr v2, v3

    const/4 v3, 0x0

    invoke-virtual {p1, v3, v0, v1, v2}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public final onFinishInflate()V
    .registers 4

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a:Lckf;

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
