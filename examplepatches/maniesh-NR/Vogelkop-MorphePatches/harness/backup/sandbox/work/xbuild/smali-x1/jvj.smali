.class public final Ljvj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lh7f;

.field public final b:Lcom/opera/android/BrowserActivity;

.field public final c:F

.field public d:Z


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/opera/android/BrowserActivity;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Ljvj;->a:Lh7f;

    iput-object p2, p0, Ljvj;->b:Lcom/opera/android/BrowserActivity;

    const/high16 v0, 0x42c80000    # 100.0f

    invoke-virtual {p2}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-static {v0, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Ljvj;->c:F

    new-instance p2, Llld;

    const/16 v0, 0x1c

    invoke-direct {p2, p0, v0}, Llld;-><init>(Ljava/lang/Object;B)V

    sget-object p0, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p1, p2}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    new-instance p0, Ltm9;

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Ltm9;-><init>(Landroid/view/View;B)V

    invoke-virtual {p1, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 3

    iget-object p0, p0, Ljvj;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Livj;

    if-eqz p1, :cond_18

    invoke-interface {v0}, Livj;->b()V

    goto :goto_6

    :cond_18
    invoke-interface {v0}, Livj;->a()V

    goto :goto_6

    :cond_1c
    return-void
.end method
