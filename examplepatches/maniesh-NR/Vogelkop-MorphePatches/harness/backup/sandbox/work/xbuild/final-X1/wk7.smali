.class public final Lwk7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lwk7;->a:B

    iput-object p1, p0, Lwk7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .registers 3

    return-void
.end method


# virtual methods
.method public final invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 8

    iget-byte p1, p0, Lwk7;->a:B

    iget-object p0, p0, Lwk7;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_7a

    check-cast p0, Livk;

    iget-object p0, p0, Livk;->d:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_f
    check-cast p0, Lvdd;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    :pswitch_15
    check-cast p0, Lbl7;

    iget-object p1, p0, Lbl7;->g:Lt0g;

    invoke-virtual {p1}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lt0g;->setValue(Ljava/lang/Object;)V

    iget-object p1, p0, Lbl7;->f:Landroid/graphics/drawable/Drawable;

    sget-object v0, Lcl7;->a:Ll4c;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    if-ltz v0, :cond_5b

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    if-ltz v0, :cond_5b

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p1

    int-to-float p1, p1

    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    int-to-long v0, v0

    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long v2, p1

    const/16 p1, 0x20

    shl-long/2addr v0, p1

    const-wide v4, 0xffffffffL

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    goto :goto_60

    :cond_5b
    const-wide v0, 0x7fc000007fc00000L    # 2.247117487993712E307

    :goto_60
    iget-object p0, p0, Lbl7;->h:Lt0g;

    new-instance p1, Lbpj;

    invoke-direct {p1, v0, v1}, Lbpj;-><init>(J)V

    invoke-virtual {p0, p1}, Lt0g;->setValue(Ljava/lang/Object;)V

    return-void

    :pswitch_6b
    check-cast p0, Lzk7;

    iget-boolean p1, p0, Lzk7;->d:Z

    if-nez p1, :cond_78

    iget-object p0, p0, Lzk7;->e:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz p0, :cond_78

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_78
    return-void

    nop

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_6b
        :pswitch_15
        :pswitch_f
    .end packed-switch
.end method

.method public final scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .registers 6

    iget-byte v0, p0, Lwk7;->a:B

    iget-object p0, p0, Lwk7;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_30

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_b
    check-cast p0, Lvdd;

    invoke-virtual {p0, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    return-void

    :pswitch_11
    sget-object p0, Lcl7;->a:Ll4c;

    invoke-interface {p0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/Handler;

    invoke-virtual {p0, p2, p3, p4}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    return-void

    :pswitch_1d
    check-cast p0, Lzk7;

    iget-object p0, p0, Lzk7;->e:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz p0, :cond_28

    invoke-virtual {p0}, Landroid/view/View;->getHandler()Landroid/os/Handler;

    move-result-object p0

    goto :goto_29

    :cond_28
    const/4 p0, 0x0

    :goto_29
    if-eqz p0, :cond_2e

    invoke-virtual {p0, p2, p1, p3, p4}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;Ljava/lang/Object;J)Z

    :cond_2e
    return-void

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_11
        :pswitch_b
    .end packed-switch
.end method

.method public final unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .registers 4

    iget-byte v0, p0, Lwk7;->a:B

    iget-object p0, p0, Lwk7;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2c

    return-void

    :pswitch_8
    check-cast p0, Lvdd;

    invoke-virtual {p0, p2}, Landroid/graphics/drawable/Drawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    return-void

    :pswitch_e
    sget-object p0, Lcl7;->a:Ll4c;

    invoke-interface {p0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/Handler;

    invoke-virtual {p0, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void

    :pswitch_1a
    check-cast p0, Lzk7;

    iget-object p0, p0, Lzk7;->e:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz p0, :cond_25

    invoke-virtual {p0}, Landroid/view/View;->getHandler()Landroid/os/Handler;

    move-result-object p0

    goto :goto_26

    :cond_25
    const/4 p0, 0x0

    :goto_26
    if-eqz p0, :cond_2b

    invoke-virtual {p0, p2, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;Ljava/lang/Object;)V

    :cond_2b
    return-void

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_e
        :pswitch_8
    .end packed-switch
.end method
