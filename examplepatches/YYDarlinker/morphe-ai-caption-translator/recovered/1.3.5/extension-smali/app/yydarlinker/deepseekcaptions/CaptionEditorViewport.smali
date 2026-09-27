.class final Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;
.super Ljava/lang/Object;
.source "CaptionEditorViewport.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$WindowLease;
    }
.end annotation


# static fields
.field private static final windows:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$WindowLease;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private appliedBottom:I

.field private final editor:Landroid/widget/EditText;

.field private lastBottom:I

.field private lastHeight:I

.field private list:Landroid/widget/ListView;

.field private originalBottom:I

.field private queued:Z

.field private root:Landroid/view/View;

.field private visibleBottom:I


# direct methods
.method public static synthetic $r8$lambda$O4f1kbUpcyhbefu-m4x4tunW404(Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;)V
    .registers 1

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->lambda$reveal$0()V

    return-void
.end method

.method static constructor <clinit>()V
    .registers 1

    .line 13
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->windows:Ljava/util/WeakHashMap;

    return-void
.end method

.method constructor <init>(Landroid/widget/EditText;)V
    .registers 3

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 24
    iput v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->lastBottom:I

    iput v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->lastHeight:I

    .line 27
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    return-void
.end method

.method private static adjust(Landroid/view/View;I)Z
    .registers 5

    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v0, v0, Landroid/view/WindowManager$LayoutParams;

    const/4 v1, 0x0

    if-nez v0, :cond_a

    return v1

    .line 49
    :cond_a
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v0}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {v0, v2}, Landroid/view/WindowManager$LayoutParams;->copyFrom(Landroid/view/WindowManager$LayoutParams;)I

    .line 50
    iget v2, v0, Landroid/view/WindowManager$LayoutParams;->softInputMode:I

    and-int/lit16 v2, v2, -0xf1

    or-int/2addr p1, v2

    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->softInputMode:I

    .line 52
    :try_start_1f
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v2, "window"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    invoke-interface {p1, p0, v0}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_2e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1f .. :try_end_2e} :catch_30
    .catch Ljava/lang/IllegalStateException; {:try_start_1f .. :try_end_2e} :catch_30

    const/4 p0, 0x1

    return p0

    :catch_30
    return v1
.end method

.method private synthetic lambda$reveal$0()V
    .registers 10

    const/4 v0, 0x0

    .line 105
    iput-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->queued:Z

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->hasFocus()Z

    move-result v1

    if-eqz v1, :cond_ca

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->isAttachedToWindow()Z

    move-result v1

    if-nez v1, :cond_15

    goto/16 :goto_ca

    .line 106
    :cond_15
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 107
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->bringPointIntoView(I)Z

    .line 109
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getLayout()Landroid/text/Layout;

    move-result-object v2

    if-eqz v2, :cond_41

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getLayout()Landroid/text/Layout;

    move-result-object v2

    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getLayout()Landroid/text/Layout;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/text/Layout;->getLineForOffset(I)I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/text/Layout;->getLineTop(I)I

    move-result v1

    goto :goto_42

    :cond_41
    move v1, v0

    .line 110
    :goto_42
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getTotalPaddingTop()I

    move-result v2

    add-int/2addr v1, v2

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getScrollY()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 111
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v2

    const/high16 v3, 0x41400000    # 12.0f

    invoke-static {v2, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v2

    const/4 v3, 0x2

    .line 113
    new-array v4, v3, [I

    iget-object v5, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v5, v4}, Landroid/widget/EditText;->getLocationOnScreen([I)V

    .line 114
    iget-object v5, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getLineHeight()I

    move-result v5

    add-int/2addr v5, v1

    add-int/2addr v5, v2

    .line 115
    iget-object v6, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->list:Landroid/widget/ListView;

    const/4 v7, 0x1

    if-eqz v6, :cond_9b

    iget v8, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->visibleBottom:I

    if-lez v8, :cond_9b

    .line 116
    new-array v3, v3, [I

    invoke-virtual {v6, v3}, Landroid/widget/ListView;->getLocationOnScreen([I)V

    .line 117
    iget v6, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->visibleBottom:I

    aget v3, v3, v7

    sub-int/2addr v6, v3

    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->list:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getPaddingTop()I

    move-result v3

    sub-int/2addr v6, v3

    sub-int/2addr v6, v2

    .line 118
    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getHeight()I

    move-result v3

    if-gt v3, v6, :cond_9b

    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getHeight()I

    move-result v3

    add-int v5, v3, v2

    .line 120
    :cond_9b
    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    new-instance v6, Landroid/graphics/Rect;

    sub-int/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getWidth()I

    move-result v2

    invoke-direct {v6, v0, v1, v2, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v3, v6, v7}, Landroid/widget/EditText;->requestRectangleOnScreen(Landroid/graphics/Rect;Z)Z

    .line 122
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->list:Landroid/widget/ListView;

    if-eqz v0, :cond_ca

    iget v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->visibleBottom:I

    if-lez v0, :cond_ca

    .line 123
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v0, v4}, Landroid/widget/EditText;->getLocationOnScreen([I)V

    .line 124
    aget v0, v4, v7

    add-int/2addr v0, v5

    iget v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->visibleBottom:I

    sub-int/2addr v0, v1

    if-lez v0, :cond_ca

    .line 125
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->list:Landroid/widget/ListView;

    invoke-virtual {p0, v0}, Landroid/widget/ListView;->scrollListBy(I)V

    :cond_ca
    :goto_ca
    return-void
.end method

.method private restorePadding()V
    .registers 6

    .line 130
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->list:Landroid/widget/ListView;

    if-eqz v0, :cond_23

    invoke-virtual {v0}, Landroid/widget/ListView;->getPaddingBottom()I

    move-result v0

    iget v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->appliedBottom:I

    if-ne v0, v1, :cond_23

    .line 131
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->list:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->list:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getPaddingTop()I

    move-result v2

    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->list:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getPaddingRight()I

    move-result v3

    iget v4, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->originalBottom:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/ListView;->setPadding(IIII)V

    :cond_23
    const/4 v0, 0x0

    .line 132
    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->list:Landroid/widget/ListView;

    const/4 v0, -0x1

    iput v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->lastBottom:I

    iput v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->lastHeight:I

    const/4 v0, 0x0

    iput v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->visibleBottom:I

    return-void
.end method


# virtual methods
.method attach()V
    .registers 5

    .line 30
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getRootView()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    if-nez v0, :cond_b

    return-void

    .line 33
    :cond_b
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->windows:Ljava/util/WeakHashMap;

    invoke-virtual {v1, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$WindowLease;

    const/4 v2, 0x1

    if-nez v0, :cond_4c

    .line 35
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$WindowLease;

    const/4 v3, 0x0

    invoke-direct {v0, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$WindowLease;-><init>(Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport-IA;)V

    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    invoke-virtual {v1, v3, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    instance-of v1, v1, Landroid/view/WindowManager$LayoutParams;

    if-eqz v1, :cond_4c

    .line 37
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager$LayoutParams;

    .line 38
    iget v1, v1, Landroid/view/WindowManager$LayoutParams;->softInputMode:I

    and-int/lit16 v1, v1, 0xf0

    iput v1, v0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$WindowLease;->originalAdjustment:I

    .line 39
    iget v1, v0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$WindowLease;->originalAdjustment:I

    const/16 v3, 0x10

    if-eq v1, v3, :cond_49

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    .line 40
    invoke-static {v1, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->adjust(Landroid/view/View;I)Z

    move-result v1

    if-eqz v1, :cond_49

    move v1, v2

    goto :goto_4a

    :cond_49
    const/4 v1, 0x0

    :goto_4a
    iput-boolean v1, v0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$WindowLease;->changed:Z

    .line 43
    :cond_4c
    iget v1, v0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$WindowLease;->users:I

    add-int/2addr v1, v2

    iput v1, v0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$WindowLease;->users:I

    .line 44
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 45
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    return-void
.end method

.method detach()V
    .registers 4

    .line 57
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->restorePadding()V

    .line 58
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    if-nez v0, :cond_8

    return-void

    .line 59
    :cond_8
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_24

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 60
    :cond_24
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->windows:Ljava/util/WeakHashMap;

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$WindowLease;

    if-eqz v1, :cond_48

    .line 61
    iget v2, v1, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$WindowLease;->users:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v1, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$WindowLease;->users:I

    if-nez v2, :cond_48

    .line 62
    iget-boolean v2, v1, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$WindowLease;->changed:Z

    if-eqz v2, :cond_43

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    iget v1, v1, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$WindowLease;->originalAdjustment:I

    invoke-static {v2, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->adjust(Landroid/view/View;I)Z

    .line 63
    :cond_43
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_48
    const/4 v0, 0x0

    .line 65
    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    return-void
.end method

.method focus(Z)V
    .registers 2

    if-eqz p1, :cond_6

    .line 67
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->reveal()V

    return-void

    :cond_6
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->restorePadding()V

    return-void
.end method

.method public onGlobalLayout()V
    .registers 7

    .line 71
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    if-eqz v0, :cond_d6

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->hasFocus()Z

    move-result v0

    if-nez v0, :cond_e

    goto/16 :goto_d6

    .line 72
    :cond_e
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 73
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    if-gtz v0, :cond_1e

    goto/16 :goto_d6

    .line 75
    :cond_1e
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v1, v2, :cond_5f

    .line 76
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v1

    if-eqz v1, :cond_5f

    .line 77
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m()I

    move-result v2

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsets;I)Z

    move-result v2

    if-eqz v2, :cond_5f

    .line 78
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "window"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager;

    .line 79
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowManager;)Landroid/view/WindowMetrics;

    move-result-object v2

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowMetrics;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 80
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m()I

    move-result v3

    invoke-static {v1, v3}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Insets;)I

    move-result v1

    sub-int/2addr v2, v1

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 83
    :cond_5f
    iput v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->visibleBottom:I

    .line 86
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->list:Landroid/widget/ListView;

    if-nez v1, :cond_83

    .line 87
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    :goto_6b
    if-eqz v1, :cond_83

    instance-of v2, v1, Landroid/widget/ListView;

    if-eqz v2, :cond_7e

    .line 88
    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->list:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getPaddingBottom()I

    move-result v1

    iput v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->originalBottom:I

    iput v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->appliedBottom:I

    goto :goto_83

    .line 87
    :cond_7e
    invoke-interface {v1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    goto :goto_6b

    .line 91
    :cond_83
    :goto_83
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->list:Landroid/widget/ListView;

    if-eqz v1, :cond_bb

    const/4 v2, 0x2

    .line 92
    new-array v2, v2, [I

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->getLocationOnScreen([I)V

    const/4 v1, 0x1

    .line 93
    aget v1, v2, v1

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->list:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getHeight()I

    move-result v2

    add-int/2addr v1, v2

    sub-int/2addr v1, v0

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 94
    iget v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->originalBottom:I

    add-int/2addr v2, v1

    .line 95
    iget v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->appliedBottom:I

    if-eq v2, v1, :cond_bb

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->list:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getPaddingLeft()I

    move-result v3

    iget-object v4, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->list:Landroid/widget/ListView;

    invoke-virtual {v4}, Landroid/widget/ListView;->getPaddingTop()I

    move-result v4

    iget-object v5, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->list:Landroid/widget/ListView;

    invoke-virtual {v5}, Landroid/widget/ListView;->getPaddingRight()I

    move-result v5

    invoke-virtual {v1, v3, v4, v5, v2}, Landroid/widget/ListView;->setPadding(IIII)V

    iput v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->appliedBottom:I

    .line 97
    :cond_bb
    iget v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->lastBottom:I

    if-ne v0, v1, :cond_c9

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    iget v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->lastHeight:I

    if-eq v1, v2, :cond_d6

    .line 98
    :cond_c9
    iput v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->lastBottom:I

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    iput v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->lastHeight:I

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->reveal()V

    :cond_d6
    :goto_d6
    return-void
.end method

.method public onPreDraw()Z
    .registers 1

    .line 69
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->onGlobalLayout()V

    const/4 p0, 0x1

    return p0
.end method

.method reveal()V
    .registers 3

    .line 102
    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->queued:Z

    if-nez v0, :cond_1a

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->hasFocus()Z

    move-result v0

    if-nez v0, :cond_d

    goto :goto_1a

    :cond_d
    const/4 v0, 0x1

    .line 103
    iput-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->queued:Z

    .line 104
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->editor:Landroid/widget/EditText;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$$ExternalSyntheticLambda6;-><init>(Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    :cond_1a
    :goto_1a
    return-void
.end method
