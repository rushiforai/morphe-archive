.class public final Lnwa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lacl;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lnwa;->a:B

    iput-object p1, p0, Lnwa;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final d(Ljava/lang/Exception;Landroid/graphics/drawable/Drawable;)V
    .registers 3

    return-void
.end method

.method private final e(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    return-void
.end method

.method private final f(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    return-void
.end method

.method private final g(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    return-void
.end method

.method private final h(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Exception;Landroid/graphics/drawable/Drawable;)V
    .registers 3

    iget-byte p1, p0, Lnwa;->a:B

    iget-object p2, p0, Lnwa;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_34

    check-cast p2, Lne5;

    sget-object p0, Lt7l;->a:Lt7l;

    invoke-virtual {p2, p0}, Lne5;->P(Lv7l;)V

    return-void

    :pswitch_f
    check-cast p2, Lnh4;

    sget-object p1, Lquk;->a:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_27

    invoke-virtual {p2}, Lnh4;->r()Ljava/lang/Object;

    move-result-object p0

    instance-of p0, p0, Lc0f;

    if-eqz p0, :cond_27

    sget-object p0, Lt0i;->b:Lp0i;

    const/4 p0, 0x0

    invoke-virtual {p2, p0}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_27
    return-void

    :pswitch_28
    check-cast p2, Lynj;

    sget-object p0, Lznj;->a:Lznj;

    invoke-virtual {p2, p0}, Lynj;->a(Lcoj;)V

    :pswitch_2f
    return-void

    :pswitch_30
    invoke-virtual {p0}, Lnwa;->i()V

    return-void

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_30
        :pswitch_2f
        :pswitch_28
        :pswitch_f
    .end packed-switch
.end method

.method public final b(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    iget-byte p1, p0, Lnwa;->a:B

    packed-switch p1, :pswitch_data_a

    :pswitch_5
    return-void

    :pswitch_6
    invoke-virtual {p0}, Lnwa;->i()V

    return-void

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method

.method public final c(Landroid/graphics/Bitmap;I)V
    .registers 7

    iget-byte p2, p0, Lnwa;->a:B

    const/4 v0, 0x1

    iget-object v1, p0, Lnwa;->b:Ljava/lang/Object;

    packed-switch p2, :pswitch_data_9c

    check-cast v1, Lne5;

    if-eqz p1, :cond_23

    new-instance p0, Lu7l;

    new-instance p2, Lyni;

    iget-object v0, v1, Lne5;->e:Ljava/lang/Object;

    check-cast v0, Ll7l;

    if-nez v0, :cond_17

    const/4 v0, 0x0

    :cond_17
    iget v0, v0, Ll7l;->e:F

    invoke-direct {p2, v0, p1}, Lyni;-><init>(FLandroid/graphics/Bitmap;)V

    invoke-direct {p0, p2}, Lu7l;-><init>(Lyni;)V

    invoke-virtual {v1, p0}, Lne5;->P(Lv7l;)V

    goto :goto_28

    :cond_23
    sget-object p0, Lt7l;->a:Lt7l;

    invoke-virtual {v1, p0}, Lne5;->P(Lv7l;)V

    :goto_28
    return-void

    :pswitch_29
    check-cast v1, Lnh4;

    sget-object p2, Lquk;->a:Ljava/util/ArrayList;

    invoke-virtual {p2, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_40

    invoke-virtual {v1}, Lnh4;->r()Ljava/lang/Object;

    move-result-object p0

    instance-of p0, p0, Lc0f;

    if-eqz p0, :cond_40

    sget-object p0, Lt0i;->b:Lp0i;

    invoke-virtual {v1, p1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_40
    return-void

    :pswitch_41
    check-cast v1, Lynj;

    new-instance p0, Lboj;

    invoke-direct {p0, p1}, Lboj;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v1, p0}, Lynj;->a(Lcoj;)V

    return-void

    :pswitch_4c
    check-cast v1, Lcom/opera/android/live_score/LiveCommentaryService;

    iput-object p1, v1, Lcom/opera/android/live_score/LiveCommentaryService;->e:Landroid/graphics/Bitmap;

    iget-object p0, v1, Lcom/opera/android/live_score/LiveCommentaryService;->c:Lgkg;

    if-eqz p0, :cond_63

    iget-boolean p1, p0, Lgkg;->r:Z

    if-eqz p1, :cond_63

    iget-object p0, p0, Lgkg;->f:Landroid/os/Handler;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->hasMessages(I)Z

    move-result p1

    if-nez p1, :cond_63

    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_63
    return-void

    :pswitch_64
    if-eqz p1, :cond_97

    check-cast v1, Lowa;

    sget p0, Lowa;->l:I

    iget-object p0, v1, Lowa;->a:Landroid/content/Context;

    new-instance p2, Lhq4;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070091

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    sget-object v3, Lwz3;->a:Lixh;

    invoke-virtual {v3, p0}, Ly7h;->k(Landroid/content/Context;)I

    move-result v3

    shl-int/2addr v3, v0

    sub-int/2addr v2, v3

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {p0, v3}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p0

    shl-int/2addr p0, v0

    sub-int/2addr v2, p0

    invoke-direct {p2, p1, v2}, Lhq4;-><init>(Landroid/graphics/Bitmap;I)V

    iget-object p0, v1, Lowa;->f:Lld9;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-object p0, v1, Lowa;->c:Lfwk;

    invoke-virtual {p0, p2}, Lfwk;->b(Landroid/graphics/drawable/Drawable;)V

    goto :goto_9a

    :cond_97
    invoke-virtual {p0}, Lnwa;->i()V

    :goto_9a
    return-void

    nop

    :pswitch_data_9c
    .packed-switch 0x0
        :pswitch_64
        :pswitch_4c
        :pswitch_41
        :pswitch_29
    .end packed-switch
.end method

.method public final i()V
    .registers 3

    iget-object p0, p0, Lnwa;->b:Ljava/lang/Object;

    check-cast p0, Lowa;

    iget-object p0, p0, Lowa;->f:Lld9;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    sget-wide v0, Lowa;->j:J

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    invoke-static {p0, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void
.end method
