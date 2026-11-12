.class public final Lkqe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfck;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lkqe;->a:B

    iput-object p1, p0, Lkqe;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b()I
    .registers 4

    iget-byte v0, p0, Lkqe;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lkqe;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_6e

    check-cast p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v2, v0, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v2, :cond_19

    check-cast v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result v1

    goto :goto_29

    :cond_19
    instance-of v2, v0, Lzdd;

    if-eqz v2, :cond_29

    check-cast v0, Lzdd;

    iget-object v0, v0, Lzdd;->b:Lxdd;

    iget-object v0, v0, Lxdd;->c:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_29

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    :cond_29
    :goto_29
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result p0

    invoke-static {p0, v1}, Lp37;->a0(FI)I

    move-result p0

    return p0

    :pswitch_32
    check-cast p0, Lcom/opera/android/OverlaidStatusBarDrawingView;

    iget-object v0, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->f:Lwuf;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_46

    const/4 v2, 0x1

    if-ne v0, v2, :cond_42

    const/high16 v0, -0x1000000

    goto :goto_48

    :cond_42
    invoke-static {}, Lh9o;->p()V

    goto :goto_50

    :cond_46
    iget v0, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->e:I

    :goto_48
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result p0

    invoke-static {p0, v0}, Lp37;->a0(FI)I

    move-result v1

    :goto_50
    return v1

    :pswitch_51
    check-cast p0, Llqe;

    iget-object v0, p0, Llqe;->g:Ltsd;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_6d

    iget v0, p0, Llqe;->u:I

    iget p0, p0, Llqe;->n:I

    int-to-float p0, p0

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr p0, v1

    invoke-static {p0, v0}, Lp37;->a0(FI)I

    move-result v1

    :cond_6d
    return v1

    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_51
        :pswitch_32
    .end packed-switch
.end method

.method public final getView()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lkqe;->a:B

    iget-object p0, p0, Lkqe;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_12

    check-cast p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;

    return-object p0

    :pswitch_a
    check-cast p0, Lcom/opera/android/OverlaidStatusBarDrawingView;

    return-object p0

    :pswitch_d
    check-cast p0, Llqe;

    iget-object p0, p0, Llqe;->a:Lcom/opera/android/feed/FeedContainerView;

    return-object p0

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_d
        :pswitch_a
    .end packed-switch
.end method
