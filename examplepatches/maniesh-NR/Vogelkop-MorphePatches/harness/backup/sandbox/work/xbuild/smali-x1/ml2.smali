.class public final synthetic Lml2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lml2;->a:B

    iput-object p1, p0, Lml2;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onPreDraw()Z
    .registers 7

    iget-byte v0, p0, Lml2;->a:B

    const-wide/16 v1, 0x64

    const/4 v3, 0x0

    iget-object p0, p0, Lml2;->b:Ljava/lang/Object;

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_b8

    check-cast p0, Ltuj;

    iget-boolean v0, p0, Ltuj;->c:Z

    if-nez v0, :cond_1e

    iput-boolean v4, p0, Ltuj;->c:Z

    iget-object v0, p0, Ltuj;->k:Ljava/lang/Object;

    check-cast v0, Landroid/os/Handler;

    iget-object p0, p0, Ltuj;->j:Ljava/lang/Object;

    check-cast p0, Liv;

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1e
    return v4

    :pswitch_1f
    check-cast p0, Ltuj;

    iget-boolean v0, p0, Ltuj;->c:Z

    if-nez v0, :cond_32

    iput-boolean v4, p0, Ltuj;->c:Z

    iget-object v0, p0, Ltuj;->k:Ljava/lang/Object;

    check-cast v0, Landroid/os/Handler;

    iget-object p0, p0, Ltuj;->j:Ljava/lang/Object;

    check-cast p0, Liv;

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_32
    return v4

    :pswitch_33
    check-cast p0, Lh5k;

    iget-boolean v0, p0, Lh5k;->a:Z

    if-nez v0, :cond_48

    iput-boolean v4, p0, Lh5k;->a:Z

    iget-object v0, p0, Lh5k;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    new-instance v1, Ly1n;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Ly1n;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    :cond_48
    return v4

    :pswitch_49
    check-cast p0, Lev4;

    iput-boolean v3, p0, Lev4;->b:Z

    iget-object v0, p0, Lev4;->e:Ljava/lang/Object;

    check-cast v0, Lj1k;

    invoke-virtual {v0}, Lj1k;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_63

    iget-boolean v0, p0, Lev4;->c:Z

    if-eqz v0, :cond_63

    move v0, v4

    goto :goto_64

    :cond_63
    move v0, v3

    :goto_64
    if-eqz v0, :cond_7a

    iput-boolean v3, p0, Lev4;->c:Z

    iget-object v1, p0, Lev4;->d:Ljava/lang/Object;

    check-cast v1, Landroid/view/View;

    new-instance v2, Luog;

    invoke-direct {v2, p0, v4}, Luog;-><init>(Lev4;B)V

    new-instance v3, Lol2;

    const/4 v5, 0x4

    invoke-direct {v3, p0, v5}, Lol2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, p0, v2, v3}, Lp37;->A(Landroid/view/View;Ljava/lang/Object;Ldh4;Landroid/view/ViewTreeObserver$OnDrawListener;)V

    :cond_7a
    xor-int/2addr v0, v4

    return v0

    :pswitch_7c
    check-cast p0, Lcom/opera/android/bubbleview/BubbleView;

    sget v0, Lcom/opera/android/bubbleview/BubbleView;->D:I

    invoke-virtual {p0}, Lcom/opera/android/bubbleview/BubbleView;->c()Z

    move-result p0

    xor-int/2addr p0, v4

    return p0

    :pswitch_86
    check-cast p0, Lx03;

    iget-object v0, p0, Lx03;->e:Ln03;

    if-eqz v0, :cond_96

    iget-object v0, v0, Ln03;->b:Lpde;

    if-eqz v0, :cond_96

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb03;

    :cond_96
    iget-object v0, p0, Lx03;->a:Landroid/view/View;

    iget-object v1, p0, Lx03;->d:[I

    invoke-virtual {v0, v1}, Landroid/view/View;->getLocationInWindow([I)V

    aget v0, v1, v3

    iget v2, p0, Lx03;->b:I

    if-ne v0, v2, :cond_a9

    aget v2, v1, v4

    iget v3, p0, Lx03;->c:I

    if-eq v2, v3, :cond_af

    :cond_a9
    iput v0, p0, Lx03;->b:I

    aget v0, v1, v4

    iput v0, p0, Lx03;->c:I

    :cond_af
    return v4

    :pswitch_b0
    check-cast p0, Lql2;

    iput-boolean v3, p0, Lql2;->c:Z

    invoke-virtual {p0}, Lql2;->b()V

    return v3

    :pswitch_data_b8
    .packed-switch 0x0
        :pswitch_b0
        :pswitch_86
        :pswitch_7c
        :pswitch_49
        :pswitch_33
        :pswitch_1f
    .end packed-switch
.end method
