.class public final synthetic Ltwe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxwe;


# direct methods
.method public synthetic constructor <init>(Lxwe;B)V
    .registers 3

    iput-byte p2, p0, Ltwe;->a:B

    iput-object p1, p0, Ltwe;->b:Lxwe;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Ltwe;->a:B

    iget-object p0, p0, Ltwe;->b:Lxwe;

    packed-switch p1, :pswitch_data_50

    invoke-virtual {p0}, Lxwe;->g0()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Lxwe;->g0()V

    return-void

    :pswitch_f
    iget-object p1, p0, Lxwe;->f:Lcom/opera/android/custom_views/LayoutDirectionViewPager;

    invoke-virtual {p1}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->q()I

    move-result v0

    iget-object p1, p1, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->a:Lh2c;

    iget-object p1, p1, Lh2c;->a:Landroidx/viewpager/widget/PagerAdapter;

    invoke-virtual {p1}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result p1

    const/4 v1, 0x1

    sub-int/2addr p1, v1

    if-ne v0, p1, :cond_4a

    iput-boolean v1, p0, Lxwe;->l:Z

    invoke-virtual {p0}, Lxwe;->g0()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    iget-object p1, p1, Landroidx/fragment/app/w;->c:Landroidx/fragment/app/a0;

    invoke-virtual {p1}, Landroidx/fragment/app/a0;->f()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3e

    invoke-static {v1, p1}, Lam2;->l(ILjava/util/List;)Ljava/lang/Object;

    move-result-object p1

    instance-of p1, p1, Lkxe;

    if-nez p1, :cond_4f

    :cond_3e
    iget-object p0, p0, Lxwe;->k:Lgjm;

    new-instance p1, Lexe;

    invoke-direct {p1}, Lexe;-><init>()V

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lgjm;->e(Ln37;Z)V

    goto :goto_4f

    :cond_4a
    iget-object p0, p0, Lxwe;->h:Lghf;

    invoke-virtual {p0}, Lghf;->G()Z

    :cond_4f
    :goto_4f
    return-void

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_f
        :pswitch_b
    .end packed-switch
.end method
