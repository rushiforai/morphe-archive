.class public final synthetic Lf9l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lr9l;


# direct methods
.method public synthetic constructor <init>(Lr9l;B)V
    .registers 3

    iput-byte p2, p0, Lf9l;->a:B

    iput-object p1, p0, Lf9l;->b:Lr9l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Lf9l;->a:B

    iget-object p0, p0, Lf9l;->b:Lr9l;

    packed-switch v0, :pswitch_data_98

    move-object v2, p1

    check-cast v2, Lge;

    new-instance v1, Lasi;

    iget-object v3, p0, Lr9l;->c:Lk6l;

    iget-object v4, p0, Lr9l;->d:Lu4l;

    iget-object v5, p0, Lr9l;->w:Ls9i;

    iget-object v6, p0, Lr9l;->A:Lp9l;

    invoke-virtual {p0}, Lr9l;->f()Lz5l;

    move-result-object p0

    iget-object p0, p0, Lz5l;->s:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    move-object v7, p0

    check-cast v7, Lu3l;

    invoke-direct/range {v1 .. v7}, Lasi;-><init>(Lge;Lk6l;Lu4l;Ls9i;Lp9l;Lu3l;)V

    return-object v1

    :pswitch_25
    move-object v3, p1

    check-cast v3, Lge;

    new-instance v2, Lasi;

    iget-object v4, p0, Lr9l;->c:Lk6l;

    iget-object v5, p0, Lr9l;->d:Lu4l;

    iget-object v6, p0, Lr9l;->w:Ls9i;

    iget-object v7, p0, Lr9l;->A:Lp9l;

    invoke-direct/range {v2 .. v7}, Lasi;-><init>(Lge;Lk6l;Lu4l;Ls9i;Lp9l;)V

    return-object v2

    :pswitch_36
    check-cast p1, Lnnh;

    iget-boolean p1, p1, Lnnh;->a:Z

    if-eqz p1, :cond_45

    const/4 v0, 0x1

    if-ne p1, v0, :cond_4f

    iget-object p0, p0, Lr9l;->D:Lg4l;

    invoke-static {p0}, Lg4l;->e(Lg4l;)V

    goto :goto_4f

    :cond_45
    iget-object p1, p0, Lr9l;->z:Lzkk;

    sget-object v0, Lvr0;->o:Lvr0;

    invoke-virtual {p1, v0}, Lzkk;->b(Lvr0;)V

    invoke-virtual {p0}, Lr9l;->j()Z

    :cond_4f
    :goto_4f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_52
    check-cast p1, Lpn7;

    iget-object p0, p0, Lr9l;->g:Ljo3;

    iget-object p0, p0, Ljo3;->a:Lcom/opera/android/bar/BottomBar;

    iget-object p1, p0, Lcom/opera/android/bar/BottomBar;->c:Lap3;

    iget-object p1, p1, Lap3;->a:Lzo3;

    iget p1, p1, Lzo3;->a:I

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result p1

    const/16 v0, 0xff

    const/4 v1, 0x0

    if-ne p1, v0, :cond_7d

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 v0, 0x64

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_94

    :cond_7d
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 v0, 0x32

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    :goto_94
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_98
    .packed-switch 0x0
        :pswitch_52
        :pswitch_36
        :pswitch_25
    .end packed-switch
.end method
