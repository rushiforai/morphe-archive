.class public final Ltu4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/view/Window;B)V
    .registers 3

    .line 12
    iput-byte p2, p0, Ltu4;->a:B

    iput-object p1, p0, Ltu4;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 11
    iput-byte p3, p0, Ltu4;->a:B

    iput-object p1, p0, Ltu4;->b:Ljava/lang/Object;

    iput-object p2, p0, Ltu4;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lx79;Landroid/view/View;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Ltu4;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ltu4;->b:Ljava/lang/Object;

    iput-object p1, p0, Ltu4;->c:Ljava/lang/Object;

    return-void
.end method

.method private final a(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method private final b(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method private final c(Landroid/view/View;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final onViewAttachedToWindow(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, Ltu4;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Ltu4;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_e0

    return-void

    :pswitch_9
    iget-object p0, p0, Ltu4;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_11
    iget-object p1, p0, Ltu4;->b:Ljava/lang/Object;

    check-cast p1, Ld4;

    invoke-static {p1}, Lz7h;->j(Landroid/view/View;)Lndc;

    move-result-object v0

    if-eqz v0, :cond_2b

    check-cast v2, Lpqh;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-static {p1, v0}, Lfac;->w(Ld4;Ltcc;)Leek;

    move-result-object v0

    iput-object v0, v2, Lpqh;->a:Ljava/lang/Object;

    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    goto :goto_44

    :cond_2b
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "View tree for "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " has no ViewTreeLifecycleOwner"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, La8b;->c(Ljava/lang/String;)Ljava/lang/Void;

    invoke-static {}, Lt3p;->v()V

    :goto_44
    return-void

    :pswitch_45
    iget-object v0, p0, Ltu4;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewGroup;

    check-cast v2, Lgzk;

    const/4 v1, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void

    :pswitch_53
    check-cast v2, Landroid/view/Window;

    invoke-virtual {v2}, Landroid/view/Window;->getContext()Landroid/content/Context;

    move-result-object p1

    :goto_59
    instance-of v0, p1, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_72

    instance-of v0, p1, Lcom/opera/android/BrowserActivity;

    if-eqz v0, :cond_6b

    check-cast p1, Lcom/opera/android/BrowserActivity;

    iget-object p1, p1, Lcom/opera/android/BrowserActivity;->Q:Lcom/opera/android/RootView;

    if-nez p1, :cond_68

    move-object p1, v1

    :cond_68
    iget-object p1, p1, Lcom/opera/android/RootView;->z:Lmcj;

    goto :goto_73

    :cond_6b
    check-cast p1, Landroid/content/ContextWrapper;

    invoke-virtual {p1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p1

    goto :goto_59

    :cond_72
    move-object p1, v1

    :goto_73
    if-eqz p1, :cond_7a

    new-instance v1, Lp8f;

    invoke-direct {v1, p1, v2}, Lp8f;-><init>(Lmcj;Landroid/view/Window;)V

    :cond_7a
    iput-object v1, p0, Ltu4;->b:Ljava/lang/Object;

    return-void

    :pswitch_7d
    check-cast v2, Landroid/view/Window;

    invoke-virtual {v2}, Landroid/view/Window;->getContext()Landroid/content/Context;

    move-result-object p1

    :goto_83
    instance-of v0, p1, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_9c

    instance-of v0, p1, Lcom/opera/android/BrowserActivity;

    if-eqz v0, :cond_95

    check-cast p1, Lcom/opera/android/BrowserActivity;

    iget-object p1, p1, Lcom/opera/android/BrowserActivity;->Q:Lcom/opera/android/RootView;

    if-nez p1, :cond_92

    move-object p1, v1

    :cond_92
    iget-object p1, p1, Lcom/opera/android/RootView;->z:Lmcj;

    goto :goto_9d

    :cond_95
    check-cast p1, Landroid/content/ContextWrapper;

    invoke-virtual {p1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p1

    goto :goto_83

    :cond_9c
    move-object p1, v1

    :goto_9d
    if-eqz p1, :cond_a4

    new-instance v1, Lx77;

    invoke-direct {v1, p1, v2}, Lx77;-><init>(Lmcj;Landroid/view/Window;)V

    :cond_a4
    iput-object v1, p0, Ltu4;->b:Ljava/lang/Object;

    return-void

    :pswitch_a7
    iget-object p0, p0, Ltu4;->b:Ljava/lang/Object;

    check-cast p0, Likc;

    check-cast v2, Lf7f;

    invoke-virtual {p0, v2}, Lekc;->k(Lf7f;)V

    return-void

    :pswitch_b1
    iget-object p0, p0, Ltu4;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    check-cast v2, Lx79;

    iget-object p1, v2, Lx79;->c:Ljava/lang/Object;

    check-cast p1, Lza3;

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnScrollChangeListener(Landroid/view/View$OnScrollChangeListener;)V

    iget-object p1, v2, Lx79;->e:Ljava/lang/Object;

    check-cast p1, Lz22;

    invoke-virtual {p0, p1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object p0, v2, Lx79;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    if-eqz p0, :cond_d2

    iget-object p1, v2, Lx79;->d:Ljava/lang/Object;

    check-cast p1, Lr42;

    invoke-virtual {p0, p1}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->x(Lnjf;)V

    :cond_d2
    return-void

    :pswitch_d3
    iget-object p1, p0, Ltu4;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/suggestion/ChatSuggestionView;

    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    check-cast v2, Lcom/opera/android/suggestion/ChatSuggestionView;

    invoke-static {v2}, Lna2;->r(Landroid/widget/TextView;)V

    return-void

    :pswitch_data_e0
    .packed-switch 0x0
        :pswitch_d3
        :pswitch_b1
        :pswitch_a7
        :pswitch_7d
        :pswitch_53
        :pswitch_45
        :pswitch_11
        :pswitch_9
    .end packed-switch
.end method

.method public final onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, Ltu4;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Ltu4;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_86

    iget-object p1, p0, Ltu4;->b:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    check-cast v2, Lhoh;

    invoke-virtual {v2}, Lhoh;->x()V

    return-void

    :pswitch_15
    check-cast v2, Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    :pswitch_1a
    return-void

    :pswitch_1b
    iget-object v0, p0, Ltu4;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewGroup;

    check-cast v2, Lgzk;

    const/4 v1, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void

    :pswitch_29
    iget-object p1, p0, Ltu4;->b:Ljava/lang/Object;

    check-cast p1, Lp8f;

    if-eqz p1, :cond_3e

    iget-object v0, p1, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lmcj;

    iget-object p1, p1, Lp8f;->d:Ljava/lang/Object;

    check-cast p1, Ljje;

    iget-object v0, v0, Lmcj;->a:Ljava/lang/Object;

    check-cast v0, Li7f;

    invoke-virtual {v0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    :cond_3e
    iput-object v1, p0, Ltu4;->b:Ljava/lang/Object;

    return-void

    :pswitch_41
    iget-object p1, p0, Ltu4;->b:Ljava/lang/Object;

    check-cast p1, Lx77;

    if-eqz p1, :cond_56

    iget-object v0, p1, Lx77;->b:Ljava/lang/Object;

    check-cast v0, Lmcj;

    iget-object p1, p1, Lx77;->d:Ljava/lang/Object;

    check-cast p1, Ljje;

    iget-object v0, v0, Lmcj;->a:Ljava/lang/Object;

    check-cast v0, Li7f;

    invoke-virtual {v0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    :cond_56
    iput-object v1, p0, Ltu4;->b:Ljava/lang/Object;

    return-void

    :pswitch_59
    iget-object p0, p0, Ltu4;->b:Ljava/lang/Object;

    check-cast p0, Likc;

    check-cast v2, Lf7f;

    invoke-virtual {p0, v2}, Lekc;->p(Lf7f;)V

    return-void

    :pswitch_63
    iget-object p1, p0, Ltu4;->b:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnScrollChangeListener(Landroid/view/View$OnScrollChangeListener;)V

    check-cast v2, Lx79;

    iget-object p0, v2, Lx79;->e:Ljava/lang/Object;

    check-cast p0, Lz22;

    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object p0, v2, Lx79;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    if-eqz p0, :cond_85

    iget-object p1, v2, Lx79;->d:Ljava/lang/Object;

    check-cast p1, Lr42;

    iget-object p0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->A:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_85
    :pswitch_85
    return-void

    :pswitch_data_86
    .packed-switch 0x0
        :pswitch_85
        :pswitch_63
        :pswitch_59
        :pswitch_41
        :pswitch_29
        :pswitch_1b
        :pswitch_1a
        :pswitch_15
    .end packed-switch
.end method
