.class public Llz3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpim;


# instance fields
.field public final a:Landroid/view/ViewGroup;

.field public final b:Lcom/opera/android/bubbleview/BubbleView;

.field public final c:Li7f;

.field public final d:J

.field public e:J


# direct methods
.method public constructor <init>(ILandroid/view/ViewGroup;JLjz3;Lhxj;ZZ)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Llz3;->c:Li7f;

    iput-object p2, p0, Llz3;->a:Landroid/view/ViewGroup;

    const-wide/16 v0, 0x0

    invoke-static {p3, p4, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p3

    iput-wide p3, p0, Llz3;->d:J

    const/4 p3, -0x1

    if-eq p1, p3, :cond_21

    new-instance p3, Ldkf;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p4

    invoke-direct {p3, p4, p1}, Ldkf;-><init>(Landroid/content/Context;I)V

    goto :goto_25

    :cond_21
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    :goto_25
    invoke-static {p3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-interface {p5, p0, p1, p2}, Ljz3;->a(Llz3;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lcom/opera/android/bubbleview/BubbleView;

    move-result-object p1

    iput-object p1, p0, Llz3;->b:Lcom/opera/android/bubbleview/BubbleView;

    const p2, 0x7f0a026e

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    new-instance p3, Lhz3;

    const/4 p4, 0x0

    invoke-direct {p3, p4, p0, p7}, Lhz3;-><init>(BLjava/lang/Object;Z)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz p8, :cond_4c

    invoke-virtual {p1, p4}, Landroid/view/View;->setFocusable(Z)V

    new-instance p2, Liz3;

    invoke-direct {p2, p0, p4}, Liz3;-><init>(Llz3;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_4c
    const p2, 0x7f0a0231

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_5e

    new-instance p3, Liz3;

    const/4 p4, 0x1

    invoke-direct {p3, p0, p4}, Liz3;-><init>(Llz3;B)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_5e
    const p2, 0x7f0a0046

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_70

    new-instance p3, Liz3;

    const/4 p4, 0x2

    invoke-direct {p3, p0, p4}, Liz3;-><init>(Llz3;B)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_70
    iput-object p0, p1, Lcom/opera/android/bubbleview/BubbleView;->v:Llz3;

    iput-object p0, p1, Lcom/opera/android/bubbleview/BubbleView;->w:Llz3;

    iput-object p6, p1, Lcom/opera/android/bubbleview/BubbleView;->n:Lhxj;

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup;IJLhxj;)V
    .registers 15

    .line 119
    new-instance v5, Lgz3;

    const/4 v0, 0x0

    invoke-direct {v5, v0, p2}, Lgz3;-><init>(BI)V

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v1, -0x1

    move-object v0, p0

    move-object v2, p1

    move-wide v3, p3

    move-object v6, p5

    .line 120
    invoke-direct/range {v0 .. v8}, Llz3;-><init>(ILandroid/view/ViewGroup;JLjz3;Lhxj;ZZ)V

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup;ILl11;)V
    .registers 10

    const-wide/16 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v5, p3

    .line 121
    invoke-direct/range {v0 .. v5}, Llz3;-><init>(Landroid/view/ViewGroup;IJLhxj;)V

    return-void
.end method


# virtual methods
.method public final a(Lkz3;)V
    .registers 2

    iget-object p0, p0, Llz3;->c:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(Lhjm;)Z
    .registers 5

    iget-object v0, p0, Llz3;->b:Lcom/opera/android/bubbleview/BubbleView;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-nez v1, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    iget-object v1, p0, Llz3;->c:Li7f;

    invoke-static {v1, v1}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v1

    :goto_10
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkz3;

    invoke-interface {v2, p1}, Lkz3;->b(Lhjm;)V

    goto :goto_10

    :cond_20
    iget-object p0, p0, Llz3;->a:Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    const/4 p0, 0x1

    return p0
.end method

.method public c(Z)V
    .registers 3

    iget-object p0, p0, Llz3;->c:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkz3;

    invoke-interface {v0, p1}, Lkz3;->c(Z)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public d(Z)Z
    .registers 2

    invoke-virtual {p0, p1}, Llz3;->e(Z)Z

    move-result p1

    if-eqz p1, :cond_b

    sget-object p1, Lhjm;->b:Lhjm;

    invoke-virtual {p0, p1}, Llz3;->b(Lhjm;)Z

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public e(Z)Z
    .registers 6

    const-wide v0, 0x7fffffffffffffffL

    iget-wide v2, p0, Llz3;->d:J

    cmp-long p1, v2, v0

    if-eqz p1, :cond_18

    iget-wide p0, p0, Llz3;->e:J

    add-long/2addr p0, v2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    cmp-long p0, p0, v0

    if-gtz p0, :cond_18

    const/4 p0, 0x1

    return p0

    :cond_18
    const/4 p0, 0x0

    return p0
.end method

.method public final f()V
    .registers 5

    iget-object v0, p0, Llz3;->b:Lcom/opera/android/bubbleview/BubbleView;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-nez v1, :cond_34

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Llz3;->e:J

    iget-object v1, p0, Llz3;->a:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v1, Lrl;

    const/4 v2, 0x5

    invoke-direct {v1, v2}, Lrl;-><init>(B)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Lcom/opera/android/bubbleview/BubbleView;->a(Ljava/lang/Runnable;J)V

    iget-object v0, p0, Llz3;->c:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_24
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_34

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkz3;

    invoke-interface {v1, p0}, Lkz3;->g(Llz3;)V

    goto :goto_24

    :cond_34
    return-void
.end method
