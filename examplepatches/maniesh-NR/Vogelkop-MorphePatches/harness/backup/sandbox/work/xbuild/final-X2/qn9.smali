.class public final Lqn9;
.super Llim;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lrn9;

.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lrn9;ILandroidx/recyclerview/widget/RecyclerView;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lqn9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqn9;->b:Lrn9;

    iput p2, p0, Lqn9;->c:I

    iput-object p3, p0, Lqn9;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lrn9;[II)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lqn9;->a:B

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lqn9;->b:Lrn9;

    iput-object p2, p0, Lqn9;->d:Ljava/lang/Object;

    iput p3, p0, Lqn9;->c:I

    return-void
.end method


# virtual methods
.method public final onStart(Lndc;)V
    .registers 7

    iget-byte v0, p0, Lqn9;->a:B

    const/16 v1, 0xf

    iget v2, p0, Lqn9;->c:I

    iget-object v3, p0, Lqn9;->d:Ljava/lang/Object;

    iget-object v4, p0, Lqn9;->b:Lrn9;

    packed-switch v0, :pswitch_data_70

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v3, [I

    array-length p0, v3

    if-eqz p0, :cond_4d

    iget-object p0, v4, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Lltl;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_4d

    array-length p1, v3

    if-eqz p1, :cond_48

    const/4 p1, 0x0

    aget p1, v3, p1

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_4d

    new-instance p1, Lq14;

    const/4 v0, 0x3

    invoke-direct {p1, v4, v3, v2, v0}, Lq14;-><init>(Ljava/lang/Object;Ljava/lang/Object;IB)V

    new-instance v0, Lbm8;

    invoke-direct {v0, p1, v1}, Lbm8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Landroid/view/View;->isLaidOut()Z

    move-result p1

    if-eqz p1, :cond_44

    invoke-virtual {v0}, Lbm8;->j()V

    goto :goto_4d

    :cond_44
    invoke-static {v0, p0}, Lq9n;->d(Lm9n;Landroid/view/View;)V

    goto :goto_4d

    :cond_48
    const-string p0, "Array is empty."

    invoke-static {p0}, Lh9o;->h(Ljava/lang/String;)V

    :cond_4d
    :goto_4d
    return-void

    :pswitch_4e
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v3, Landroidx/recyclerview/widget/RecyclerView;

    new-instance p0, Lug5;

    const/4 p1, 0x1

    invoke-direct {p0, v4, v2, p1}, Lug5;-><init>(Ljava/lang/Object;IB)V

    new-instance p1, Lbm8;

    invoke-direct {p1, p0, v1}, Lbm8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3}, Landroid/view/View;->isLaidOut()Z

    move-result p0

    if-eqz p0, :cond_6c

    invoke-virtual {p1}, Lbm8;->j()V

    goto :goto_6f

    :cond_6c
    invoke-static {p1, v3}, Lq9n;->d(Lm9n;Landroid/view/View;)V

    :goto_6f
    return-void

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_4e
    .end packed-switch
.end method
