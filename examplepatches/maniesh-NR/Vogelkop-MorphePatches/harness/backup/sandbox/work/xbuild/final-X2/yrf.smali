.class public abstract Lyrf;
.super Ldej;
.source "SourceFile"


# instance fields
.field public final c:Ljava/lang/String;

.field public final d:Z

.field public e:Ltn;


# direct methods
.method public constructor <init>(Lmej;Ljava/lang/String;Z)V
    .registers 4

    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    iput-object p2, p0, Lyrf;->c:Ljava/lang/String;

    iput-boolean p3, p0, Lyrf;->d:Z

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;)Landroid/view/View;
    .registers 5

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-static {p1}, Lq5g;->c(Landroid/view/LayoutInflater;)Lq5g;

    move-result-object v0

    iget-object v1, v0, Lq5g;->c:Ljava/lang/Object;

    check-cast v1, Landroid/widget/LinearLayout;

    new-instance v2, Ltn;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object p0, v2, Ltn;->d:Ljava/lang/Object;

    iput-object p1, v2, Ltn;->b:Ljava/lang/Object;

    iput-object v1, v2, Ltn;->c:Ljava/lang/Object;

    iget-boolean p1, p0, Lyrf;->d:Z

    iput-boolean p1, v2, Ltn;->a:Z

    iput-object v2, p0, Lyrf;->e:Ltn;

    iget-object p1, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    iget-object p0, p0, Lyrf;->c:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2f

    const/16 p0, 0x8

    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_32

    :cond_2f
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_32
    iget-object p0, v0, Lq5g;->b:Landroid/view/ViewGroup;

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;

    return-object p0
.end method

.method public final d(Llrf;)V
    .registers 3

    iget-object p0, p0, Lyrf;->e:Ltn;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Ltn;->t(Llrf;Z)V

    return-void
.end method

.method public e(Llrf;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public f(Llrf;)V
    .registers 6

    iget-object p0, p0, Ldej;->b:Lmej;

    invoke-interface {p0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object p0

    iget-object p0, p0, Lydn;->f:Lqq8;

    check-cast p1, Lc8g;

    iget-wide v0, p1, Lc8g;->a:J

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    add-long/2addr v2, v0

    invoke-virtual {p0, v2, v3}, Lqq8;->n(J)V

    iget-object p0, p0, Lqq8;->c:Ljava/lang/Object;

    check-cast p0, Lydn;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lydn;->D(Z)V

    return-void
.end method
