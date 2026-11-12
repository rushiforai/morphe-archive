.class public Ljsd;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/HashMap;

.field public final b:Landroid/widget/ImageView$ScaleType;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    sget-object p1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    iput-object p1, p0, Ljsd;->b:Landroid/widget/ImageView$ScaleType;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Ljsd;->a:Ljava/util/HashMap;

    return-void
.end method

.method public static c(Laoo;Lcie;)V
    .registers 4

    new-instance v0, Li4d;

    const/4 v1, 0x4

    invoke-direct {v0, p1, v1}, Li4d;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0, p1, v0}, Ljsd;->d(Laoo;Lcie;Lloo;)V

    return-void
.end method

.method public static d(Laoo;Lcie;Lloo;)V
    .registers 7

    iput-object p1, p0, Laoo;->i:Lbzo;

    sget-object v0, Lphf;->a:Lx79;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lgxo;->c:Lgxo;

    iget-object v1, v0, Lx79;->e:Ljava/lang/Object;

    check-cast v1, Ltvk;

    if-nez v1, :cond_16

    new-instance v1, Ltvk;

    invoke-direct {v1}, Ltvk;-><init>()V

    iput-object v1, v0, Lx79;->e:Ljava/lang/Object;

    :cond_16
    iput-object v1, p0, Laoo;->p:Ltvk;

    iget-object v0, p1, Lcie;->R:Landroid/view/View;

    iput-object v0, p0, Laoo;->j:Landroid/view/View;

    iget-object v0, p1, Lcie;->S:Landroid/widget/TextView;

    iput-object v0, p0, Laoo;->k:Landroid/view/View;

    iget-object v0, p1, Lcie;->Q:Ljava/util/ArrayList;

    iput-object v0, p0, Laoo;->d:Ljava/util/ArrayList;

    iput-object p2, p0, Laoo;->e:Lloo;

    iget-object p2, p1, Lcie;->T:Ly55;

    iput-object p2, p0, Laoo;->m:Ly55;

    iget-object p2, p1, Lbzo;->c:Lltm;

    iput-object p2, p0, Laoo;->n:Lltm;

    iget-object p2, p1, Lcie;->L:Ljava/util/ArrayList;

    iput-object p2, p0, Laoo;->h:Ljava/util/ArrayList;

    iget-object p2, p1, Lcie;->Y:Loam;

    iput-object p2, p0, Laoo;->r:Loam;

    iget p2, p1, Lcie;->y0:I

    iget-object v0, p1, Lcie;->M:Ljava/lang/String;

    iget-object v1, p1, Lcie;->p0:Ljava/lang/String;

    iget-object v2, p1, Lcie;->q:Ljava/lang/String;

    new-instance v3, Lzg;

    invoke-direct {v3, p2, v0, v1, v2}, Lzg;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v3, p0, Laoo;->s:Lzg;

    iget-object p1, p1, Lbzo;->d:Lw06;

    invoke-virtual {p0, p1}, Laoo;->l(Lw06;)V

    return-void
.end method


# virtual methods
.method public final a(Laoo;)V
    .registers 4

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public b(Lcie;Lw06;)V
    .registers 5

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lez v0, :cond_9

    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    :cond_9
    sget-object v0, Lgsd;->a:[I

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_52

    const/4 p0, 0x0

    goto :goto_48

    :pswitch_16
    new-instance v0, Lnv6;

    invoke-direct {v0, p0}, Lnv6;-><init>(Ljava/lang/Object;)V

    :goto_1b
    move-object p0, v0

    goto :goto_48

    :pswitch_1d
    new-instance v0, Lga6;

    const/16 v1, 0x1c

    invoke-direct {v0, p0, v1}, Lga6;-><init>(Ljava/lang/Object;B)V

    goto :goto_1b

    :pswitch_25
    new-instance v0, Lqfb;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Lqfb;-><init>(Ljava/lang/Object;B)V

    goto :goto_1b

    :pswitch_2d
    new-instance v0, Llld;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Llld;-><init>(Ljava/lang/Object;B)V

    goto :goto_1b

    :pswitch_34
    new-instance v0, Li4d;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Li4d;-><init>(Ljava/lang/Object;B)V

    goto :goto_1b

    :pswitch_3b
    new-instance v0, Lwub;

    invoke-direct {v0, p0}, Lwub;-><init>(Ljava/lang/Object;)V

    goto :goto_1b

    :pswitch_41
    new-instance v0, Lisd;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lisd;-><init>(Ljava/lang/Object;B)V

    goto :goto_1b

    :goto_48
    if-eqz p0, :cond_4d

    invoke-interface {p0, p1}, Lhsd;->e(Lcie;)V

    :cond_4d
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    return-void

    nop

    :pswitch_data_52
    .packed-switch 0x1
        :pswitch_41
        :pswitch_41
        :pswitch_41
        :pswitch_41
        :pswitch_3b
        :pswitch_34
        :pswitch_2d
        :pswitch_25
        :pswitch_25
        :pswitch_1d
        :pswitch_1d
        :pswitch_1d
        :pswitch_1d
        :pswitch_1d
        :pswitch_16
        :pswitch_16
        :pswitch_16
    .end packed-switch
.end method

.method public e(Lcie;)V
    .registers 3

    iget-object p0, p0, Ljsd;->a:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfjo;

    if-eqz v0, :cond_d

    invoke-interface {v0}, Lmro;->unregister()V

    :cond_d
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
