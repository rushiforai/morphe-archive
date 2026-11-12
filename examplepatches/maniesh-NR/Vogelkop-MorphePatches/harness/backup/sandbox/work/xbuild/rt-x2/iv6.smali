.class public final Liv6;
.super Ldej;
.source "SourceFile"


# instance fields
.field public final c:Ljava/lang/String;

.field public final d:Lq6e;

.field public e:Ld5o;

.field public final f:Lr9g;


# direct methods
.method public constructor <init>(Lmej;Ljava/lang/String;Lq6e;Lr9g;)V
    .registers 5

    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    iput-object p4, p0, Liv6;->f:Lr9g;

    iput-object p2, p0, Liv6;->c:Ljava/lang/String;

    iput-object p3, p0, Liv6;->d:Lq6e;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 12

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-static {p1}, Lq5g;->c(Landroid/view/LayoutInflater;)Lq5g;

    move-result-object v0

    new-instance v1, Ld5o;

    iget-object v2, v0, Lq5g;->c:Ljava/lang/Object;

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object p0, v1, Ld5o;->c:Ljava/lang/Object;

    iput-object p1, v1, Ld5o;->a:Ljava/lang/Object;

    iput-object v2, v1, Ld5o;->b:Ljava/lang/Object;

    iput-object v1, p0, Liv6;->e:Ld5o;

    iget-object p1, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v1, p0, Liv6;->c:Ljava/lang/String;

    if-nez v1, :cond_27

    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2a

    :cond_27
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_2a
    iget-object p1, p0, Liv6;->d:Lq6e;

    iget-object v1, p1, Lq6e;->a:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Lq6e;->b()Leri;

    move-result-object p1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3a
    :goto_3a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_b0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Leri;

    instance-of v3, v2, Ll6e;

    if-eqz v3, :cond_3a

    invoke-interface {v2}, Leri;->e()Z

    move-result v3

    if-eqz v3, :cond_3a

    iget-object v3, p0, Liv6;->e:Ld5o;

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-ne v2, p1, :cond_58

    move v6, v4

    goto :goto_59

    :cond_58
    move v6, v5

    :goto_59
    iget-object v7, v3, Ld5o;->a:Ljava/lang/Object;

    check-cast v7, Landroid/view/LayoutInflater;

    iget-object v8, v3, Ld5o;->b:Ljava/lang/Object;

    check-cast v8, Landroid/widget/LinearLayout;

    const v9, 0x7f0d038f

    invoke-virtual {v7, v9, v8, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v8, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    sget-object v8, Lr5n;->a:Ljava/util/WeakHashMap;

    const v8, 0x7f0a0322

    invoke-static {v7, v8}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/View;

    check-cast v8, Landroid/widget/ImageView;

    new-instance v9, Lvs5;

    check-cast v2, Ll6e;

    invoke-direct {v9, v3, v8, v2, v4}, Lvs5;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v8, v9}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    const v4, 0x7f0a06c5

    invoke-static {v7, v4}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    check-cast v4, Landroid/widget/TextView;

    iget-object v8, v2, Ll6e;->c:Ljava/lang/String;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v4, 0x7f0a0201

    invoke-virtual {v7, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-eqz v6, :cond_9d

    move v8, v5

    goto :goto_9e

    :cond_9d
    const/4 v8, 0x4

    :goto_9e
    invoke-virtual {v4, v8}, Landroid/view/View;->setVisibility(I)V

    new-instance v4, Lhv6;

    invoke-direct {v4, v5, v3, v2, v6}, Lhv6;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    new-instance v2, Lks8;

    const/4 v3, 0x2

    invoke-direct {v2, v4, v3}, Lks8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v7, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_3a

    :cond_b0
    iget-object p0, v0, Lq5g;->b:Landroid/view/ViewGroup;

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;

    return-object p0
.end method
