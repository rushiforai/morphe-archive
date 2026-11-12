.class public final synthetic Ly6k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lz6k;


# direct methods
.method public synthetic constructor <init>(Lz6k;B)V
    .registers 3

    iput-byte p2, p0, Ly6k;->a:B

    iput-object p1, p0, Ly6k;->b:Lz6k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Ly6k;->a:B

    iget-object p0, p0, Ly6k;->b:Lz6k;

    packed-switch v0, :pswitch_data_58

    check-cast p1, Lf8k;

    iget-object p1, p1, Lf8k;->e:Lw6k;

    iput-object p1, p0, Lz6k;->f:Lw6k;

    invoke-virtual {p0}, Lz6k;->b0()V

    iget-object p0, p0, Lz6k;->d:Lb7k;

    iget-object v0, p0, Lb7k;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_32

    const/4 v1, 0x1

    if-ne p1, v1, :cond_2e

    iget-object p0, p0, Lb7k;->b:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object p1, Lmaj;->b:Lmaj;

    invoke-static {p0, p1}, Lu0h;->g(Landroid/content/Context;Lmaj;)Llaj;

    move-result-object p0

    goto :goto_33

    :cond_2e
    invoke-static {}, Lh9o;->p()V

    goto :goto_36

    :cond_32
    const/4 p0, 0x0

    :goto_33
    invoke-virtual {v0, p0}, Lcom/opera/android/custom_views/DropShadowFrameLayout;->b(Llaj;)V

    :goto_36
    return-void

    :pswitch_37
    check-cast p1, Lf6k;

    if-eqz p1, :cond_56

    iget-object p1, p1, Lf6k;->a:Lzch;

    instance-of v0, p1, Lg6k;

    if-eqz v0, :cond_4b

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast p1, Lg6k;

    iget p1, p1, Lg6k;->a:I

    invoke-static {p1, p0}, Lp37;->l0(ILandroid/view/View;)V

    goto :goto_56

    :cond_4b
    sget-object p0, Lh6k;->a:Lh6k;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_56

    invoke-static {}, Lh9o;->p()V

    :cond_56
    :goto_56
    return-void

    nop

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_37
    .end packed-switch
.end method
