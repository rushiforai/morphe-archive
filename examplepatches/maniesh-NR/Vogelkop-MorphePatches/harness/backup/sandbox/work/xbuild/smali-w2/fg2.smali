.class public final synthetic Lfg2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lgg2;


# direct methods
.method public synthetic constructor <init>(Lgg2;B)V
    .registers 3

    iput-byte p2, p0, Lfg2;->a:B

    iput-object p1, p0, Lfg2;->b:Lgg2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Lfg2;->a:B

    iget-object p0, p0, Lfg2;->b:Lgg2;

    packed-switch v0, :pswitch_data_60

    check-cast p1, Lbg2;

    iget-object p0, p0, Lgg2;->x:Lrf2;

    iget-object v0, p0, Lrf2;->i:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    iget-boolean v1, p1, Lbg2;->b:Z

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    iget-object p0, p0, Lrf2;->g:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    iget-boolean p1, p1, Lbg2;->c:Z

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :pswitch_1e
    check-cast p1, Lzf2;

    iget-object p0, p0, Lgg2;->x:Lrf2;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_47

    if-eq v0, v2, :cond_33

    const/4 v3, 0x2

    if-eq v0, v3, :cond_47

    invoke-static {}, Lh9o;->p()V

    goto :goto_5f

    :cond_33
    iget-object p0, p0, Lrf2;->h:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0, v2}, Landroid/view/View;->setEnabled(Z)V

    const p1, 0x7f1412ad

    invoke-static {p0, p1, v1}, Ln1h;->n(Landroid/view/View;II)V

    const p1, 0x7f0805af

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    goto :goto_5f

    :cond_47
    iget-object p0, p0, Lrf2;->h:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    sget-object v0, Lzf2;->a:Lzf2;

    if-eq p1, v0, :cond_50

    move v2, v1

    :cond_50
    invoke-virtual {p0, v2}, Landroid/view/View;->setEnabled(Z)V

    const p1, 0x7f1412ae

    invoke-static {p0, p1, v1}, Ln1h;->n(Landroid/view/View;II)V

    const p1, 0x7f0805b8

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    :goto_5f
    return-void

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
