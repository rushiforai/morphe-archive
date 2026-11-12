.class public abstract Lxb9;
.super Lab2;
.source "SourceFile"


# instance fields
.field public final d:Lcom/opera/android/BrowserActivity;

.field public final e:Ltcl;

.field public final f:Ljava/lang/String;

.field public final g:Lrn9;

.field public final h:Lcom/opera/android/flow/MyFlowMessageRoot;

.field public final i:Landroid/widget/TextView;

.field public j:J

.field public final k:Lq65;

.field public l:Lob9;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Ltcl;Landroid/view/View;Ljava/lang/String;Lrn9;)V
    .registers 8

    invoke-direct {p0, p3}, Lab2;-><init>(Landroid/view/View;)V

    new-instance v0, Lq65;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lq65;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lxb9;->k:Lq65;

    iput-object p1, p0, Lxb9;->d:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lxb9;->e:Ltcl;

    iput-object p4, p0, Lxb9;->f:Ljava/lang/String;

    iput-object p5, p0, Lxb9;->g:Lrn9;

    move-object p1, p3

    check-cast p1, Lcom/opera/android/flow/MyFlowMessageRoot;

    iput-object p1, p0, Lxb9;->h:Lcom/opera/android/flow/MyFlowMessageRoot;

    sget-object p1, Lr5n;->a:Ljava/util/WeakHashMap;

    const p1, 0x7f0a0b93

    invoke-static {p3, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lxb9;->i:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public V(Lja2;Z)V
    .registers 12

    move-object v0, p1

    check-cast v0, Lhb9;

    invoke-virtual {p0, v0}, Lxb9;->h0(Lhb9;)Z

    move-result v1

    invoke-virtual {p0, v0}, Lxb9;->c0(Lhb9;)I

    move-result v2

    iget-object v3, p0, Lxb9;->h:Lcom/opera/android/flow/MyFlowMessageRoot;

    invoke-virtual {v3, v2}, Lcom/opera/android/flow/MyFlowMessageRoot;->b(I)V

    iget-object v2, p0, Lxb9;->g:Lrn9;

    iget-object v4, v2, Lrn9;->d:Ljava/lang/Object;

    check-cast v4, Lja2;

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-ne v0, v4, :cond_24

    iget-boolean v4, v2, Lrn9;->b:Z

    if-eqz v4, :cond_24

    iput-boolean v6, v2, Lrn9;->b:Z

    invoke-virtual {v3, v6, v6}, Lcom/opera/android/flow/MyFlowMessageRoot;->a(ZZ)V

    move p2, v5

    :cond_24
    iget-object v4, v2, Lrn9;->c:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashMap;

    iget-wide v7, v0, Lhb9;->b:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    if-eqz v4, :cond_3b

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    goto :goto_44

    :cond_3b
    if-nez v1, :cond_44

    iget-object v1, v2, Lrn9;->d:Ljava/lang/Object;

    check-cast v1, Lja2;

    if-eq v0, v1, :cond_44

    move v5, v6

    :cond_44
    :goto_44
    invoke-virtual {v3, v5, p2}, Lcom/opera/android/flow/MyFlowMessageRoot;->a(ZZ)V

    new-instance p2, Ldv2;

    const/4 v1, 0x2

    invoke-direct {p2, p0, p1, v0, v1}, Ldv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lys2;

    const/4 v0, 0x3

    invoke-direct {p2, p0, p1, v0}, Lys2;-><init>(Landroidx/recyclerview/widget/i;Ljava/lang/Object;B)V

    invoke-virtual {v3, p2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public Y()V
    .registers 1

    iget-object p0, p0, Lxb9;->k:Lq65;

    invoke-virtual {p0}, Ln1;->S()V

    return-void
.end method

.method public final b0(Landroid/widget/TextView;)V
    .registers 6

    new-instance v0, Lob9;

    invoke-direct {v0, p1}, Lob9;-><init>(Landroid/widget/TextView;)V

    iget-object v1, p0, Lxb9;->l:Lob9;

    iget-object v2, p0, Lxb9;->h:Lcom/opera/android/flow/MyFlowMessageRoot;

    if-eqz v1, :cond_13

    iget-object v3, v2, Lcom/opera/android/flow/MyFlowMessageRoot;->c:Li7f;

    invoke-virtual {v3, v1}, Li7f;->c(Ljava/lang/Object;)Z

    const/4 v1, 0x0

    iput-object v1, p0, Lxb9;->l:Lob9;

    :cond_13
    iput-object v0, p0, Lxb9;->l:Lob9;

    iget-object p0, v2, Lcom/opera/android/flow/MyFlowMessageRoot;->c:Li7f;

    invoke-virtual {p0, v0}, Li7f;->b(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_39

    iget p0, v2, Lcom/opera/android/flow/MyFlowMessageRoot;->i:I

    iget v1, v0, Lob9;->a:I

    if-ne v1, p0, :cond_27

    iget-boolean v1, v0, Lob9;->c:Z

    if-nez v1, :cond_39

    :cond_27
    const/4 v1, 0x1

    iput-boolean v1, v0, Lob9;->c:Z

    iput p0, v0, Lob9;->a:I

    iget-object v1, v0, Lob9;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-eqz v1, :cond_39

    invoke-static {p0, v1}, Lob9;->b(ILandroid/view/View;)V

    :cond_39
    invoke-static {p1, v0}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    return-void
.end method

.method public c0(Lhb9;)I
    .registers 2

    iget-object p0, p0, Lxb9;->f:Ljava/lang/String;

    iget-object p1, p1, Lhb9;->d:Ljava/lang/String;

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    return p0
.end method

.method public e0(Lja2;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public f0(Lja2;)V
    .registers 6

    iget-object v0, p0, Lxb9;->d:Lcom/opera/android/BrowserActivity;

    invoke-static {v0}, La4h;->f(Landroid/content/Context;)Lnej;

    move-result-object v0

    new-instance v1, Lxq3;

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-direct {v1, v2, p0, p1, v3}, Lxq3;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final g0(J)V
    .registers 7

    iget-wide v0, p0, Lxb9;->j:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_d

    cmp-long v0, v0, p1

    if-gez v0, :cond_d

    return-void

    :cond_d
    iput-wide p1, p0, Lxb9;->j:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long/2addr p1, v0

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v1, p0, Lxb9;->k:Lq65;

    iget-object p0, p0, Lxb9;->e:Ltcl;

    invoke-virtual {v1, p0, p1, p2, v0}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    return-void
.end method

.method public h0(Lhb9;)Z
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, v1, Lhb9;->c:J

    iget-wide v8, v1, Lhb9;->c:J

    sub-long v10, v3, v5

    const-wide/32 v12, 0xea60

    cmp-long v1, v10, v12

    iget-object v14, v0, Lxb9;->i:Landroid/widget/TextView;

    const/4 v15, 0x0

    if-gez v1, :cond_23

    const v1, 0x7f1405b3

    invoke-virtual {v14, v1}, Landroid/widget/TextView;->setText(I)V

    add-long/2addr v8, v12

    invoke-virtual {v0, v8, v9}, Lxb9;->g0(J)V

    return v15

    :cond_23
    const-wide/32 v16, 0x36ee80

    cmp-long v1, v10, v16

    const-wide/16 v18, 0x1

    if-gez v1, :cond_47

    move-wide v1, v5

    const-wide/32 v5, 0xea60

    const/high16 v7, 0x40000

    invoke-static/range {v1 .. v7}, Landroid/text/format/DateUtils;->getRelativeTimeSpanString(JJJI)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v14, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    div-long/2addr v10, v12

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    add-long v10, v10, v18

    invoke-virtual {v1, v10, v11}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v1

    add-long/2addr v1, v8

    invoke-virtual {v0, v1, v2}, Lxb9;->g0(J)V

    return v15

    :cond_47
    move-wide v1, v5

    const-wide/32 v5, 0x2932e00

    cmp-long v5, v10, v5

    if-gez v5, :cond_6a

    const-wide/32 v5, 0x36ee80

    const/high16 v7, 0x40000

    invoke-static/range {v1 .. v7}, Landroid/text/format/DateUtils;->getRelativeTimeSpanString(JJJI)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v14, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    div-long v10, v10, v16

    sget-object v1, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    add-long v10, v10, v18

    invoke-virtual {v1, v10, v11}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v1

    add-long/2addr v1, v8

    invoke-virtual {v0, v1, v2}, Lxb9;->g0(J)V

    return v15

    :cond_6a
    const/4 v0, 0x3

    invoke-static {v0}, Ljava/text/DateFormat;->getTimeInstance(I)Ljava/text/DateFormat;

    move-result-object v0

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, v8, v9}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return v15
.end method

.method public final onDestroy()V
    .registers 3

    iget-object v0, p0, Lxb9;->l:Lob9;

    if-eqz v0, :cond_e

    iget-object v1, p0, Lxb9;->h:Lcom/opera/android/flow/MyFlowMessageRoot;

    iget-object v1, v1, Lcom/opera/android/flow/MyFlowMessageRoot;->c:Li7f;

    invoke-virtual {v1, v0}, Li7f;->c(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lxb9;->l:Lob9;

    :cond_e
    return-void
.end method
