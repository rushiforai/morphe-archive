.class public Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0017\u0018\u00002\u00020\u0001B\u001d\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;",
        "Landroid/widget/FrameLayout;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public a:Z

.field public final b:Lpde;

.field public final c:Lpde;

.field public final d:Lpde;

.field public final e:Lm9f;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Lpde;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p2

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->b:Lpde;

    new-instance p1, Lpde;

    new-instance p2, Landroid/util/Size;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-direct {p2, v0, v1}, Landroid/util/Size;-><init>(II)V

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->c:Lpde;

    new-instance p1, Lpde;

    const/4 p2, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->d:Lpde;

    new-instance p1, Lm9f;

    invoke-direct {p1, p0}, Lm9f;-><init>(Landroid/view/ViewGroup;)V

    iput-object p1, p0, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->e:Lm9f;

    new-instance p1, Lz61;

    const/4 p2, 0x5

    invoke-direct {p1, p0, p2}, Lz61;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->a:Z

    if-eqz v0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->b:Lpde;

    invoke-virtual {v0, p1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, p0, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->e:Lm9f;

    invoke-virtual {p0}, Lm9f;->h()V

    return-void
.end method

.method public final onSizeChanged(IIII)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    new-instance p3, Landroid/util/Size;

    invoke-direct {p3, p1, p2}, Landroid/util/Size;-><init>(II)V

    iget-object p1, p0, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->c:Lpde;

    invoke-static {p1, p3}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->e:Lm9f;

    invoke-virtual {p1}, Lm9f;->e()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iget-object p0, p0, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->d:Lpde;

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method
