.class public final Ldp;
.super Ldej;
.source "SourceFile"


# static fields
.field public static final f:[Lbp;


# instance fields
.field public final c:Lmq;

.field public final d:I

.field public final e:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lbp;

    sget-object v1, Lwz;->a:Lwz;

    const v2, 0x7f14009e

    invoke-direct {v0, v1, v2}, Lbp;-><init>(Ljava/lang/Object;I)V

    new-instance v1, Lbp;

    sget-object v2, Lwz;->b:Lwz;

    const v3, 0x7f14009d

    invoke-direct {v1, v2, v3}, Lbp;-><init>(Ljava/lang/Object;I)V

    new-instance v2, Lbp;

    sget-object v3, Lwz;->c:Lwz;

    const v4, 0x7f1400a0

    invoke-direct {v2, v3, v4}, Lbp;-><init>(Ljava/lang/Object;I)V

    new-instance v3, Lbp;

    sget-object v4, Lwz;->d:Lwz;

    const v5, 0x7f14009c

    invoke-direct {v3, v4, v5}, Lbp;-><init>(Ljava/lang/Object;I)V

    filled-new-array {v0, v1, v2, v3}, [Lbp;

    move-result-object v0

    sput-object v0, Ldp;->f:[Lbp;

    return-void
.end method

.method public constructor <init>(Lmej;Lmq;ILjava/util/List;)V
    .registers 5

    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    iput-object p2, p0, Ldp;->c:Lmq;

    iput p3, p0, Ldp;->d:I

    iput-object p4, p0, Ldp;->e:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 12

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0d0027

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v3, 0x7f0a07c4

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v4, :cond_81

    const v3, 0x7f0a06c5

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v5, :cond_81

    check-cast v0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    iget v1, p0, Ldp;->d:I

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(I)V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iget-object v5, p0, Ldp;->e:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_35
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_47

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lxz;

    iget-object v7, v6, Lxz;->a:Lwz;

    invoke-virtual {v1, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_35

    :cond_47
    move v5, v2

    :goto_48
    const/4 v6, 0x4

    if-ge v5, v6, :cond_80

    sget-object v6, Ldp;->f:[Lbp;

    aget-object v6, v6, v5

    iget-object v7, v6, Lbp;->b:Ljava/lang/Object;

    check-cast v7, Lwz;

    invoke-virtual {v1, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lxz;

    if-eqz v7, :cond_7d

    const v8, 0x7f0d0028

    invoke-virtual {p1, v8, v4, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    sget-object v9, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v8, v3}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/View;

    check-cast v9, Landroid/widget/TextView;

    iget v6, v6, Lbp;->a:I

    invoke-virtual {v9, v6}, Landroid/widget/TextView;->setText(I)V

    new-instance v6, Lnf;

    const/4 v9, 0x3

    invoke-direct {v6, p0, v7, v9}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v8, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_7d
    add-int/lit8 v5, v5, 0x1

    goto :goto_48

    :cond_80
    return-object v0

    :cond_81
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v1
.end method
