.class public final Lt8p;
.super Laoo;
.source "SourceFile"


# static fields
.field public static J:Z


# instance fields
.field public A:Li8p;

.field public B:I

.field public final C:I

.field public D:Z

.field public E:Z

.field public F:Z

.field public G:Z

.field public H:Z

.field public final I:Lg2p;

.field public u:Leuo;

.field public v:Landroid/widget/ImageView;

.field public w:Landroid/widget/ImageButton;

.field public final x:Lwtm;

.field public y:Ljava/lang/String;

.field public z:Lxho;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Laoo;-><init>(Landroid/content/Context;Landroid/view/View;)V

    sget p1, Lz1m;->b:I

    iput p1, p0, Lt8p;->B:I

    new-instance p1, Lg2p;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lg2p;-><init>(Laoo;B)V

    iput-object p1, p0, Lt8p;->I:Lg2p;

    new-instance p1, Lwtm;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lt8p;->x:Lwtm;

    iget-object p1, p0, Laoo;->a:Landroid/content/Context;

    invoke-static {p1}, Lxvg;->d(Landroid/content/Context;)I

    move-result p1

    iput p1, p0, Lt8p;->C:I

    return-void
.end method


# virtual methods
.method public final i(Landroid/view/View;)V
    .registers 4

    invoke-super {p0, p1}, Laoo;->i(Landroid/view/View;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lt8p;->F:Z

    iget-object p1, p0, Lt8p;->I:Lg2p;

    iget-object v0, p0, Laoo;->c:Lami;

    invoke-virtual {v0, p0, p1}, Lami;->b(Landroid/view/View;Looo;)V

    iget-object p1, p0, Laoo;->j:Landroid/view/View;

    if-nez p1, :cond_12

    move-object p1, p0

    :cond_12
    new-instance v1, Lg8p;

    invoke-direct {v1, p0, p1}, Lg8p;-><init>(Lt8p;Landroid/view/View;)V

    invoke-virtual {v0, p1, v1}, Lami;->b(Landroid/view/View;Looo;)V

    return-void
.end method

.method public final k()Landroid/view/View;
    .registers 5

    new-instance v0, Leuo;

    const/4 v1, 0x0

    iget-object v2, p0, Laoo;->a:Landroid/content/Context;

    invoke-direct {v0, v2, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v1, 0x0

    iput v1, v0, Leuo;->a:I

    const/16 v1, 0xa

    iput-byte v1, v0, Leuo;->b:B

    const/4 v1, 0x3

    iput v1, v0, Leuo;->I:I

    const/4 v1, 0x0

    iput v1, v0, Leuo;->s:F

    const/4 v1, 0x1

    iput-boolean v1, v0, Leuo;->t:Z

    new-instance v1, Lz4k;

    const/16 v3, 0x13

    invoke-direct {v1, v0, v3}, Lz4k;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v0, Leuo;->C:Lz4k;

    new-instance v1, Lh9o;

    const/16 v3, 0x11

    invoke-direct {v1, v3}, Lh9o;-><init>(B)V

    iput-object v1, v0, Leuo;->D:Lh9o;

    new-instance v1, Lrii;

    const/16 v3, 0x1a

    invoke-direct {v1, v0, v3}, Lrii;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v0, Leuo;->E:Lrii;

    new-instance v1, Luto;

    const/4 v3, 0x0

    invoke-direct {v1, v0, v3}, Luto;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v0, Leuo;->F:Luto;

    new-instance v1, Ltvk;

    invoke-direct {v1, v0}, Ltvk;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Leuo;->G:Ltvk;

    new-instance v1, Lioj;

    const/16 v3, 0xd

    invoke-direct {v1, v0, v3}, Lioj;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v0, Leuo;->H:Lioj;

    iput-object v2, v0, Leuo;->c:Landroid/content/Context;

    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Leuo;->f:Landroid/widget/FrameLayout;

    const v2, -0x282725

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iput-object v0, p0, Lt8p;->u:Leuo;

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Lt8p;->u:Leuo;

    invoke-virtual {p0, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p0, p0, Lt8p;->u:Leuo;

    return-object p0
.end method

.method public final l(Lw06;)V
    .registers 4

    invoke-super {p0, p1}, Laoo;->l(Lw06;)V

    iget-object p1, p0, Lt8p;->u:Leuo;

    iget-object v0, p0, Lt8p;->x:Lwtm;

    iput-object v0, p1, Leuo;->l:Lwtm;

    iput-object p0, p1, Leuo;->m:Lt8p;

    iget-object v1, p0, Laoo;->h:Ljava/util/ArrayList;

    iput-object v1, v0, Lwtm;->a:Ljava/lang/Object;

    iput-object p1, v0, Lwtm;->b:Ljava/lang/Object;

    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "android.intent.action.SCREEN_OFF"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "android.intent.action.USER_PRESENT"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    new-instance v0, Li8p;

    invoke-direct {v0, p0}, Li8p;-><init>(Lt8p;)V

    iput-object v0, p0, Lt8p;->A:Li8p;

    iget-object p0, p0, Laoo;->a:Landroid/content/Context;

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method public final m()V
    .registers 3

    iget-object v0, p0, Laoo;->c:Lami;

    iget-object v1, p0, Lt8p;->I:Lg2p;

    invoke-virtual {v0, p0, v1}, Lami;->b(Landroid/view/View;Looo;)V

    return-void
.end method

.method public final n()V
    .registers 2

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lt8p;->w(I)V

    return-void
.end method

.method public final onVisibilityChanged(Landroid/view/View;I)V
    .registers 3

    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    invoke-virtual {p0, p2}, Lt8p;->w(I)V

    return-void
.end method

.method public final onWindowVisibilityChanged(I)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onWindowVisibilityChanged(I)V

    invoke-virtual {p0, p1}, Lt8p;->w(I)V

    return-void
.end method

.method public final p()V
    .registers 6

    iget-object v0, p0, Lt8p;->u:Leuo;

    invoke-virtual {v0}, Leuo;->i()Z

    move-result v0

    if-eqz v0, :cond_10

    iget-boolean v0, p0, Lt8p;->E:Z

    if-nez v0, :cond_10

    const/4 v0, 0x1

    iput-boolean v0, p0, Lt8p;->E:Z

    return-void

    :cond_10
    iget-object v0, p0, Laoo;->c:Lami;

    invoke-virtual {v0, p0}, Lami;->a(Landroid/view/View;)V

    iget-object v0, p0, Lt8p;->u:Leuo;

    iget-object v1, v0, Leuo;->f:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Leuo;->i()Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-virtual {v0}, Leuo;->h()V

    :cond_22
    iget-byte v2, v0, Leuo;->b:B

    const/16 v3, 0xa

    const/16 v4, 0xc

    if-ne v2, v4, :cond_3a

    if-ne v2, v4, :cond_3a

    invoke-static {v1}, Lupj;->j(Landroid/view/View;)V

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v2, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iput-byte v3, v0, Leuo;->b:B

    :cond_3a
    iput-byte v3, v0, Leuo;->b:B

    invoke-virtual {v0}, Leuo;->f()V

    iget-object v2, v0, Leuo;->d:Landroid/media/AudioManager;

    const/4 v3, 0x0

    if-eqz v2, :cond_49

    invoke-virtual {v2, v3}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    iput-object v3, v0, Leuo;->d:Landroid/media/AudioManager;

    :cond_49
    iget-object v2, v0, Leuo;->e:Lqoo;

    if-eqz v2, :cond_61

    iget-object v4, v2, Lqoo;->f:Landroid/media/MediaPlayer;

    invoke-virtual {v4}, Landroid/media/MediaPlayer;->release()V

    iput-object v3, v2, Lqoo;->a:Lz4k;

    iput-object v3, v2, Lqoo;->b:Lrii;

    iput-object v3, v2, Lqoo;->c:Lh9o;

    iput-object v3, v2, Lqoo;->d:Luto;

    iput-object v3, v2, Lqoo;->e:Ltvk;

    invoke-virtual {v2}, Lqoo;->a()V

    iput-object v3, v0, Leuo;->e:Lqoo;

    :cond_61
    iget-object v2, v0, Leuo;->g:Landroid/view/TextureView;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object v1, v0, Leuo;->i:Landroid/view/Surface;

    if-eqz v1, :cond_6f

    invoke-virtual {v1}, Landroid/view/Surface;->release()V

    iput-object v3, v0, Leuo;->i:Landroid/view/Surface;

    :cond_6f
    iget-object v1, v0, Leuo;->h:Landroid/graphics/SurfaceTexture;

    if-eqz v1, :cond_78

    invoke-virtual {v1}, Landroid/graphics/SurfaceTexture;->release()V

    iput-object v3, v0, Leuo;->h:Landroid/graphics/SurfaceTexture;

    :cond_78
    const/4 v1, 0x0

    iput v1, v0, Leuo;->a:I

    iget-object v0, p0, Lt8p;->v:Landroid/widget/ImageView;

    if-eqz v0, :cond_82

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_82
    iget-object v0, p0, Lt8p;->A:Li8p;

    if-eqz v0, :cond_8d

    iget-object v1, p0, Laoo;->a:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-object v3, p0, Lt8p;->A:Li8p;

    :cond_8d
    iget-object p0, p0, Laoo;->o:Lsc;

    if-eqz p0, :cond_94

    invoke-virtual {p0}, Lsc;->a()V

    :cond_94
    return-void
.end method

.method public final q(Landroid/view/View;)V
    .registers 3

    iget-boolean v0, p0, Lt8p;->H:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Laoo;->c:Lami;

    invoke-virtual {v0, p0}, Lami;->a(Landroid/view/View;)V

    iget-object v0, p0, Lt8p;->u:Leuo;

    invoke-virtual {v0}, Leuo;->i()Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object v0, p0, Lt8p;->u:Leuo;

    invoke-virtual {v0}, Leuo;->h()V

    :cond_17
    invoke-virtual {p0, p1}, Laoo;->j(Landroid/view/View;)V

    return-void
.end method

.method public final w(I)V
    .registers 5

    iget-object v0, p0, Laoo;->c:Lami;

    if-eqz p1, :cond_12

    iget-object p1, p0, Lt8p;->u:Leuo;

    iget v1, p1, Leuo;->a:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_11

    invoke-virtual {p1}, Leuo;->a()V

    invoke-virtual {v0, p0}, Lami;->a(Landroid/view/View;)V

    :cond_11
    return-void

    :cond_12
    iget-boolean p1, p0, Lt8p;->F:Z

    if-eqz p1, :cond_1b

    iget-object p1, p0, Lt8p;->I:Lg2p;

    invoke-virtual {v0, p0, p1}, Lami;->b(Landroid/view/View;Looo;)V

    :cond_1b
    return-void
.end method

.method public final x(Z)V
    .registers 5

    const/4 v0, 0x1

    if-nez p1, :cond_17

    iget p1, p0, Lt8p;->B:I

    const/4 v1, 0x3

    if-eq p1, v1, :cond_17

    if-ne p1, v0, :cond_77

    const/4 p1, 0x2

    iget v2, p0, Lt8p;->C:I

    if-eq v2, p1, :cond_17

    if-eq v2, v1, :cond_17

    const/4 p1, 0x4

    if-eq v2, p1, :cond_17

    const/4 p1, 0x5

    if-ne v2, p1, :cond_77

    :cond_17
    iget-object p1, p0, Lt8p;->w:Landroid/widget/ImageButton;

    if-nez p1, :cond_4a

    new-instance p1, Landroid/widget/ImageButton;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, v1}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lt8p;->w:Landroid/widget/ImageButton;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    iget-object p1, p0, Lt8p;->w:Landroid/widget/ImageButton;

    sget-object v1, Lbbp;->o:Lbbp;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lbbp;->d(Landroid/content/Context;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lt8p;->w:Landroid/widget/ImageButton;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object p1, p0, Lt8p;->w:Landroid/widget/ImageButton;

    new-instance v1, La8p;

    invoke-direct {v1, p0, v0}, La8p;-><init>(Lt8p;B)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_4a
    iget-object p1, p0, Lt8p;->w:Landroid/widget/ImageButton;

    invoke-static {p1}, Lupj;->j(Landroid/view/View;)V

    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v0, -0x2

    invoke-direct {p1, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v0, 0x11

    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v0, p0, Lt8p;->w:Landroid/widget/ImageButton;

    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Lt8p;->w:Landroid/widget/ImageButton;

    new-instance v0, Lttn;

    const/16 v1, 0x18

    invoke-direct {v0, p0, v1}, Lttn;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    iget-object p1, p0, Laoo;->o:Lsc;

    if-eqz p1, :cond_77

    iget-object p0, p0, Lt8p;->w:Landroid/widget/ImageButton;

    sget-object v0, Lpp9;->a:Lpp9;

    const-string v1, "play button"

    invoke-virtual {p1, p0, v0, v1}, Lsc;->d(Landroid/view/View;Lpp9;Ljava/lang/String;)V

    :cond_77
    return-void
.end method

.method public final y()V
    .registers 5

    iget-object v0, p0, Lt8p;->v:Landroid/widget/ImageView;

    if-nez v0, :cond_52

    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lt8p;->v:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    iget-object v0, p0, Lt8p;->y:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_39

    iget-object v0, p0, Lt8p;->z:Lxho;

    if-eqz v0, :cond_39

    invoke-virtual {v0}, Lxho;->a()Z

    move-result v0

    if-eqz v0, :cond_39

    iget-object v0, p0, Lt8p;->z:Lxho;

    iget-object v0, v0, Lxho;->s:Ljava/lang/String;

    const-wide/32 v1, 0xf4240

    invoke-static {v1, v2, v0}, Ldbh;->b(JLjava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_52

    iget-object v1, p0, Lt8p;->v:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_52

    :cond_39
    iget-object v0, p0, Lt8p;->y:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_52

    iget-object v0, p0, Lt8p;->v:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lt8p;->y:Ljava/lang/String;

    new-instance v2, Lsmo;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Lsmo;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v1, v2}, Lfip;->b(Landroid/content/Context;Ljava/lang/String;Lzhp;)V

    :cond_52
    :goto_52
    iget-object v0, p0, Lt8p;->v:Landroid/widget/ImageView;

    invoke-static {v0}, Lupj;->j(Landroid/view/View;)V

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Lt8p;->v:Landroid/widget/ImageView;

    invoke-virtual {p0, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Laoo;->o:Lsc;

    if-eqz v0, :cond_6f

    iget-object p0, p0, Lt8p;->v:Landroid/widget/ImageView;

    sget-object v1, Lpp9;->a:Lpp9;

    const-string v2, "cover image"

    invoke-virtual {v0, p0, v1, v2}, Lsc;->d(Landroid/view/View;Lpp9;Ljava/lang/String;)V

    :cond_6f
    return-void
.end method
