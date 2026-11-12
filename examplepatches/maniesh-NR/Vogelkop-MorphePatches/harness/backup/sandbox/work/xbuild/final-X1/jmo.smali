.class public final Ljmo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/media/MediaPlayer$OnBufferingUpdateListener;
.implements Landroid/media/MediaPlayer$OnSeekCompleteListener;
.implements Landroid/media/MediaPlayer$OnVideoSizeChangedListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;
.implements Landroid/media/MediaPlayer$OnInfoListener;


# instance fields
.field public final a:Ljava/lang/ref/WeakReference;

.field public final synthetic b:Lqoo;


# direct methods
.method public constructor <init>(Lqoo;Lqoo;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljmo;->b:Lqoo;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Ljmo;->a:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public final onBufferingUpdate(Landroid/media/MediaPlayer;I)V
    .registers 3

    iget-object p0, p0, Ljmo;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqoo;

    return-void
.end method

.method public final onCompletion(Landroid/media/MediaPlayer;)V
    .registers 8

    iget-object p1, p0, Ljmo;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqoo;

    if-eqz p1, :cond_b7

    iget-object p0, p0, Ljmo;->b:Lqoo;

    iget-object p0, p0, Lqoo;->b:Lrii;

    if-eqz p0, :cond_b7

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Leuo;

    const/4 p1, 0x7

    iput p1, p0, Leuo;->a:I

    iget-object p1, p0, Leuo;->f:Landroid/widget/FrameLayout;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setKeepScreenOn(Z)V

    invoke-virtual {p0}, Leuo;->f()V

    iput-boolean v0, p0, Leuo;->B:Z

    invoke-virtual {p0}, Leuo;->i()Z

    move-result p1

    if-eqz p1, :cond_2b

    invoke-virtual {p0}, Leuo;->h()V

    :cond_2b
    iget-object p0, p0, Leuo;->m:Lt8p;

    if-eqz p0, :cond_b7

    iget-object p1, p0, Lt8p;->x:Lwtm;

    const/16 v1, 0xc

    invoke-virtual {p1, v1}, Lwtm;->a(I)V

    iget-object p1, p0, Lt8p;->z:Lxho;

    if-eqz p1, :cond_b3

    iget-object p1, p0, Lt8p;->v:Landroid/widget/ImageView;

    if-nez p1, :cond_4e

    new-instance p1, Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lt8p;->v:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    :cond_4e
    iget-object p1, p0, Lt8p;->y:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_8c

    iget-object p1, p0, Lt8p;->u:Leuo;

    iget-object p1, p1, Leuo;->e:Lqoo;

    if-eqz p1, :cond_63

    :try_start_5c
    iget-object p1, p1, Lqoo;->f:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result p1
    :try_end_62
    .catch Ljava/lang/IllegalStateException; {:try_start_5c .. :try_end_62} :catch_63

    goto :goto_64

    :catch_63
    :cond_63
    move p1, v0

    :goto_64
    if-lez p1, :cond_7a

    const v1, 0x493e0

    if-gt p1, v1, :cond_7a

    iget-object v1, p0, Lt8p;->z:Lxho;

    iget-object v1, v1, Lxho;->s:Ljava/lang/String;

    int-to-long v2, p1

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    invoke-static {v2, v3, v1}, Ldbh;->b(JLjava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_8c

    goto :goto_87

    :cond_7a
    iget-object p1, p0, Lt8p;->z:Lxho;

    iget-object p1, p1, Lxho;->s:Ljava/lang/String;

    const-wide/32 v1, 0xf4240

    invoke-static {v1, v2, p1}, Ldbh;->b(JLjava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_8c

    :goto_87
    iget-object v1, p0, Lt8p;->v:Landroid/widget/ImageView;

    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_8c
    iget-object p1, p0, Lt8p;->v:Landroid/widget/ImageView;

    new-instance v1, La8p;

    invoke-direct {v1, p0, v0}, La8p;-><init>(Lt8p;B)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lt8p;->v:Landroid/widget/ImageView;

    invoke-static {p1}, Lupj;->j(Landroid/view/View;)V

    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v0, -0x1

    invoke-direct {p1, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iget-object v0, p0, Lt8p;->v:Landroid/widget/ImageView;

    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Laoo;->o:Lsc;

    if-eqz p1, :cond_b3

    iget-object v0, p0, Lt8p;->v:Landroid/widget/ImageView;

    sget-object v1, Lpp9;->b:Lpp9;

    const-string v2, "end image"

    invoke-virtual {p1, v0, v1, v2}, Lsc;->d(Landroid/view/View;Lpp9;Ljava/lang/String;)V

    :cond_b3
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lt8p;->x(Z)V

    :cond_b7
    return-void
.end method

.method public final onError(Landroid/media/MediaPlayer;II)Z
    .registers 6

    iget-object p1, p0, Ljmo;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqoo;

    if-eqz p1, :cond_47

    iget-object p0, p0, Ljmo;->b:Lqoo;

    iget-object p0, p0, Lqoo;->d:Luto;

    if-eqz p0, :cond_47

    iget-object p0, p0, Luto;->b:Ljava/lang/Object;

    check-cast p0, Leuo;

    const/4 p1, 0x1

    const/16 v0, -0x26

    if-eq p2, v0, :cond_46

    const/high16 v1, -0x80000000

    if-eq p2, v1, :cond_46

    if-eq p3, v0, :cond_46

    if-eq p3, v1, :cond_46

    invoke-virtual {p0}, Leuo;->i()Z

    move-result p2

    if-eqz p2, :cond_2a

    invoke-virtual {p0}, Leuo;->h()V

    :cond_2a
    const/4 p2, -0x1

    iput p2, p0, Leuo;->a:I

    invoke-virtual {p0}, Leuo;->f()V

    iput p1, p0, Leuo;->I:I

    iget-object p0, p0, Leuo;->m:Lt8p;

    if-eqz p0, :cond_46

    iget-boolean p2, p0, Lt8p;->D:Z

    if-nez p2, :cond_46

    iget-object p2, p0, Lt8p;->x:Lwtm;

    const/16 p3, 0x10

    invoke-virtual {p2, p3}, Lwtm;->a(I)V

    invoke-virtual {p0}, Lt8p;->y()V

    iput-boolean p1, p0, Lt8p;->D:Z

    :cond_46
    return p1

    :cond_47
    const/4 p0, 0x0

    return p0
.end method

.method public final onInfo(Landroid/media/MediaPlayer;II)Z
    .registers 8

    iget-object p1, p0, Ljmo;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqoo;

    if-eqz p1, :cond_6e

    iget-object p0, p0, Ljmo;->b:Lqoo;

    iget-object p0, p0, Lqoo;->e:Ltvk;

    if-eqz p0, :cond_6e

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Leuo;

    const/4 p1, 0x3

    if-ne p2, p1, :cond_3c

    iput p1, p0, Leuo;->a:I

    iget-object p0, p0, Leuo;->m:Lt8p;

    if-eqz p0, :cond_6c

    iget-object p1, p0, Lt8p;->v:Landroid/widget/ImageView;

    invoke-static {p1}, Lupj;->j(Landroid/view/View;)V

    iget-object p1, p0, Lt8p;->w:Landroid/widget/ImageButton;

    invoke-static {p1}, Lupj;->j(Landroid/view/View;)V

    iget-object p1, p0, Laoo;->o:Lsc;

    if-eqz p1, :cond_6c

    iget-object p2, p0, Lt8p;->v:Landroid/widget/ImageView;

    if-eqz p2, :cond_32

    invoke-virtual {p1, p2}, Lsc;->c(Landroid/view/View;)V

    :cond_32
    iget-object p1, p0, Lt8p;->w:Landroid/widget/ImageButton;

    if-eqz p1, :cond_6c

    iget-object p0, p0, Laoo;->o:Lsc;

    invoke-virtual {p0, p1}, Lsc;->c(Landroid/view/View;)V

    goto :goto_6c

    :cond_3c
    const/16 v0, 0x2bd

    const/4 v1, 0x5

    const/4 v2, 0x4

    const/4 v3, 0x6

    if-ne p2, v0, :cond_4f

    iget p1, p0, Leuo;->a:I

    if-eq p1, v2, :cond_4c

    if-eq p1, v3, :cond_4c

    iput v1, p0, Leuo;->a:I

    goto :goto_6c

    :cond_4c
    iput v3, p0, Leuo;->a:I

    goto :goto_6c

    :cond_4f
    const/16 v0, 0x2be

    if-ne p2, v0, :cond_60

    iget p2, p0, Leuo;->a:I

    if-ne p2, v1, :cond_5a

    iput p1, p0, Leuo;->a:I

    goto :goto_5b

    :cond_5a
    move p1, p2

    :goto_5b
    if-ne p1, v3, :cond_6c

    iput v2, p0, Leuo;->a:I

    goto :goto_6c

    :cond_60
    const/16 p1, 0x2711

    if-ne p2, p1, :cond_6c

    iget-object p0, p0, Leuo;->g:Landroid/view/TextureView;

    if-eqz p0, :cond_6c

    int-to-float p1, p3

    invoke-virtual {p0, p1}, Landroid/view/View;->setRotation(F)V

    :cond_6c
    :goto_6c
    const/4 p0, 0x1

    return p0

    :cond_6e
    const/4 p0, 0x0

    return p0
.end method

.method public final onPrepared(Landroid/media/MediaPlayer;)V
    .registers 3

    iget-object p1, p0, Ljmo;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqoo;

    if-eqz p1, :cond_29

    iget-object p0, p0, Ljmo;->b:Lqoo;

    iget-object p1, p0, Lqoo;->a:Lz4k;

    if-eqz p1, :cond_29

    iget-object p1, p1, Lz4k;->b:Ljava/lang/Object;

    check-cast p1, Leuo;

    const/4 v0, 0x2

    iput v0, p1, Leuo;->a:I

    iget-object p0, p0, Lqoo;->f:Landroid/media/MediaPlayer;

    invoke-virtual {p0}, Landroid/media/MediaPlayer;->start()V

    iget-object p0, p1, Leuo;->l:Lwtm;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lwtm;->a(I)V

    const/4 p0, 0x3

    iput p0, p1, Leuo;->a:I

    invoke-virtual {p1}, Leuo;->d()V

    :cond_29
    return-void
.end method

.method public final onSeekComplete(Landroid/media/MediaPlayer;)V
    .registers 2

    iget-object p0, p0, Ljmo;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqoo;

    return-void
.end method

.method public final onVideoSizeChanged(Landroid/media/MediaPlayer;II)V
    .registers 4

    iget-object p1, p0, Ljmo;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqoo;

    if-eqz p1, :cond_12

    iget-object p0, p0, Ljmo;->b:Lqoo;

    iget-object p0, p0, Lqoo;->c:Lh9o;

    if-eqz p0, :cond_12

    sget p0, Leuo;->J:I

    :cond_12
    return-void
.end method
