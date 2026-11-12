.class public Lcom/opera/android/media/WebPictureInPictureActivity;
.super Lhjf;
.source "SourceFile"


# static fields
.field public static v:J

.field public static final w:Lcvn;


# instance fields
.field public j:J

.field public k:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public l:Lty3;

.field public m:Lqi;

.field public final n:Lzg;

.field public o:Lorg/chromium/components/thinwebview/internal/CompositorViewImpl;

.field public p:Landroid/util/Rational;

.field public q:I

.field public r:Lup1;

.field public s:Lorg/chromium/content/browser/MediaSessionImpl;

.field public t:Levn;

.field public u:Lcyd;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcvn;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/opera/android/media/WebPictureInPictureActivity;->w:Lcvn;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lhjf;-><init>()V

    new-instance v0, Ldvn;

    invoke-direct {v0, p0}, Lpjn;-><init>(Lhjf;)V

    new-instance v1, Lzg;

    invoke-direct {v1, v0}, Lzg;-><init>(Lpjn;)V

    iput-object v1, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->n:Lzg;

    return-void
.end method

.method public static createActivity(JLjava/lang/Object;IIII)V
    .registers 12
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-wide v0, Lcom/opera/android/media/WebPictureInPictureActivity;->v:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_b

    invoke-static {v0, v1}, LJ/N;->MvOQobqj(J)V

    :cond_b
    sput-wide p0, Lcom/opera/android/media/WebPictureInPictureActivity;->v:J

    check-cast p2, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v0, p2, Lcom/opera/android/browser/WebContentsWrapper;->b:Lqi;

    const/4 v1, 0x0

    if-eqz v0, :cond_1f

    invoke-virtual {v0}, Lqi;->m()Lb2b;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    goto :goto_20

    :cond_1f
    move-object v0, v1

    :goto_20
    if-eqz v0, :cond_24

    move-object v2, v0

    goto :goto_26

    :cond_24
    sget-object v2, Lt8;->a:Landroid/content/Context;

    :goto_26
    new-instance v3, Landroid/content/Intent;

    const-class v4, Lcom/opera/android/media/WebPictureInPictureActivity;

    invoke-direct {v3, v2, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v4, "com.opera.android.media.PictureInPicture.WebContents"

    invoke-virtual {p2}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p2

    invoke-virtual {v3, v4, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string p2, "com.opera.android.media.WebPictureInPictureActivity.NativePointer"

    invoke-virtual {v3, p2, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    if-eqz p6, :cond_4c

    int-to-float p0, p5

    int-to-float p1, p6

    div-float/2addr p0, p1

    const p2, 0x3ed639d7

    const p5, 0x4018f5c3    # 2.39f

    invoke-static {p0, p2, p5}, La26;->v(FFF)F

    move-result p0

    mul-float/2addr p0, p1

    float-to-int p5, p0

    :cond_4c
    if-lez p5, :cond_7b

    if-lez p6, :cond_7b

    new-instance p0, Landroid/graphics/Rect;

    add-int p1, p3, p5

    add-int p2, p4, p6

    invoke-direct {p0, p3, p4, p1, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    if-eqz v0, :cond_69

    iget p1, p0, Landroid/graphics/Rect;->left:I

    if-ltz p1, :cond_69

    iget p1, p0, Landroid/graphics/Rect;->top:I

    if-ltz p1, :cond_69

    sget-object p1, Lcom/opera/android/media/WebPictureInPictureActivity;->w:Lcvn;

    invoke-virtual {p1, p0}, Lcvn;->a(Landroid/graphics/Rect;)Landroid/os/Bundle;

    move-result-object v1

    :cond_69
    if-eqz v1, :cond_71

    const-string p0, "com.opera.android.media.PictureInPicture.launched"

    const/4 p1, 0x1

    invoke-virtual {v3, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    :cond_71
    const-string p0, "com.opera.android.media.WebPictureInPictureActivity.source.width"

    invoke-virtual {v3, p0, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p0, "com.opera.android.media.WebPictureInPictureActivity.source.height"

    invoke-virtual {v3, p0, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    :cond_7b
    invoke-virtual {v2, v3, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V

    return-void
.end method

.method public static onWindowDestroyed(J)V
    .registers 10

    sget-wide v0, Lcom/opera/android/media/WebPictureInPictureActivity;->v:J

    cmp-long v0, p0, v0

    const-wide/16 v1, 0x0

    if-nez v0, :cond_a

    sput-wide v1, Lcom/opera/android/media/WebPictureInPictureActivity;->v:J

    :cond_a
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->a()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    :cond_13
    :goto_13
    if-ge v4, v3, :cond_2f

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Landroid/app/Activity;

    instance-of v6, v5, Lcom/opera/android/media/WebPictureInPictureActivity;

    if-eqz v6, :cond_13

    check-cast v5, Lcom/opera/android/media/WebPictureInPictureActivity;

    iget-wide v6, v5, Lcom/opera/android/media/WebPictureInPictureActivity;->j:J

    cmp-long v6, p0, v6

    if-nez v6, :cond_13

    iput-wide v1, v5, Lcom/opera/android/media/WebPictureInPictureActivity;->j:J

    invoke-virtual {v5}, Landroid/app/Activity;->finish()V

    goto :goto_13

    :cond_2f
    return-void
.end method


# virtual methods
.method public final F()Landroid/app/PictureInPictureParams;
    .registers 14

    new-instance v0, Landroid/app/PictureInPictureParams$Builder;

    invoke-direct {v0}, Landroid/app/PictureInPictureParams$Builder;-><init>()V

    iget-object v1, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->u:Lcyd;

    iget-object v2, v1, Lcyd;->l:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/media/WebPictureInPictureActivity;

    iget-object v3, v1, Lcyd;->g:Ljava/lang/Object;

    check-cast v3, Landroid/app/RemoteAction;

    iget-object v4, v1, Lcyd;->c:Ljava/lang/Object;

    check-cast v4, Landroid/app/RemoteAction;

    const/4 v5, 0x3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iget-object v7, v1, Lcyd;->k:Ljava/lang/Object;

    check-cast v7, Ljava/util/HashSet;

    const/4 v8, 0x2

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    const/4 v10, 0x1

    const/4 v11, 0x0

    if-nez v7, :cond_3a

    iget-object v7, v1, Lcyd;->k:Ljava/lang/Object;

    check-cast v7, Ljava/util/HashSet;

    invoke-virtual {v7, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3a

    move v7, v11

    goto :goto_3b

    :cond_3a
    move v7, v10

    :goto_3b
    if-eqz v7, :cond_4b

    iget-object v12, v1, Lcyd;->k:Ljava/lang/Object;

    check-cast v12, Ljava/util/HashSet;

    invoke-virtual {v12, v9}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v9

    invoke-virtual {v4, v9}, Landroid/app/RemoteAction;->setEnabled(Z)V

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4b
    iget-object v4, v1, Lcyd;->k:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashSet;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_78

    iget v4, v1, Lcyd;->b:I

    if-eqz v4, :cond_71

    if-eq v4, v10, :cond_69

    if-ne v4, v8, :cond_78

    iget-object v4, v1, Lcyd;->f:Ljava/lang/Object;

    check-cast v4, Landroid/app/RemoteAction;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_78

    :cond_69
    iget-object v4, v1, Lcyd;->d:Ljava/lang/Object;

    check-cast v4, Landroid/app/RemoteAction;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_78

    :cond_71
    iget-object v4, v1, Lcyd;->e:Ljava/lang/Object;

    check-cast v4, Landroid/app/RemoteAction;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_78
    :goto_78
    if-eqz v7, :cond_88

    iget-object v4, v1, Lcyd;->k:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashSet;

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v3, v4}, Landroid/app/RemoteAction;->setEnabled(Z)V

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_88
    iget-object v3, v1, Lcyd;->k:Ljava/lang/Object;

    check-cast v3, Ljava/util/HashSet;

    const/16 v4, 0xd

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_ab

    iget-object v3, v1, Lcyd;->i:Ljava/lang/Object;

    check-cast v3, Leyi;

    iget-boolean v4, v3, Leyi;->b:Z

    if-eqz v4, :cond_a5

    iget-object v3, v3, Leyi;->c:Ljava/lang/Object;

    :goto_a2
    check-cast v3, Landroid/app/RemoteAction;

    goto :goto_a8

    :cond_a5
    iget-object v3, v3, Leyi;->d:Ljava/lang/Object;

    goto :goto_a2

    :goto_a8
    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_ab
    iget-object v3, v1, Lcyd;->k:Ljava/lang/Object;

    check-cast v3, Ljava/util/HashSet;

    const/16 v4, 0xe

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_ce

    iget-object v3, v1, Lcyd;->j:Ljava/lang/Object;

    check-cast v3, Leyi;

    iget-boolean v4, v3, Leyi;->b:Z

    if-eqz v4, :cond_c8

    iget-object v3, v3, Leyi;->c:Ljava/lang/Object;

    :goto_c5
    check-cast v3, Landroid/app/RemoteAction;

    goto :goto_cb

    :cond_c8
    iget-object v3, v3, Leyi;->d:Ljava/lang/Object;

    goto :goto_c5

    :goto_cb
    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_ce
    iget-object v3, v1, Lcyd;->k:Ljava/lang/Object;

    check-cast v3, Ljava/util/HashSet;

    const/16 v4, 0xf

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e5

    iget-object v1, v1, Lcyd;->h:Ljava/lang/Object;

    check-cast v1, Landroid/app/RemoteAction;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_e5
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_120

    new-instance v1, Landroid/app/RemoteAction;

    filled-new-array {v11}, [I

    move-result-object v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v10, v10, v4}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/drawable/Icon;->createWithBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;

    move-result-object v3

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    new-instance v5, Landroid/content/Intent;

    const-string v7, "com.opera.android.media.WebPictureInPictureActivity.MediaAction"

    invoke-direct {v5, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    const/high16 v5, 0x4000000

    const/4 v7, -0x1

    invoke-static {v4, v7, v2, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    const-string v4, ""

    invoke-direct {v1, v3, v4, v4, v2}, Landroid/app/RemoteAction;-><init>(Landroid/graphics/drawable/Icon;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    invoke-virtual {v1, v11}, Landroid/app/RemoteAction;->setEnabled(Z)V

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_120
    invoke-virtual {v0, v6}, Landroid/app/PictureInPictureParams$Builder;->setActions(Ljava/util/List;)Landroid/app/PictureInPictureParams$Builder;

    iget-object p0, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->p:Landroid/util/Rational;

    invoke-virtual {v0, p0}, Landroid/app/PictureInPictureParams$Builder;->setAspectRatio(Landroid/util/Rational;)Landroid/app/PictureInPictureParams$Builder;

    invoke-virtual {v0}, Landroid/app/PictureInPictureParams$Builder;->build()Landroid/app/PictureInPictureParams;

    move-result-object p0

    return-object p0
.end method

.method public final close()V
    .registers 1

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1}, Lhjf;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lqi;

    iget-object v0, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->n:Lzg;

    const/4 v1, 0x0

    invoke-direct {p1, p0, v0, v1}, Lqi;-><init>(Landroid/content/Context;Lzg;Z)V

    iput-object p1, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->m:Lqi;

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p1, p1, Lxv1;->q1:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Levn;

    iput-object p1, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->t:Levn;

    return-void
.end method

.method public final onDestroy()V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->m:Lqi;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Lorg/chromium/ui/base/WindowAndroid;->destroy()V

    iput-object v1, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->m:Lqi;

    :cond_a
    invoke-super {p0}, Lhjf;->onDestroy()V

    iget-object v0, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->r:Lup1;

    if-eqz v0, :cond_16

    invoke-virtual {p0, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-object v1, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->r:Lup1;

    :cond_16
    iget-object v0, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->s:Lorg/chromium/content/browser/MediaSessionImpl;

    if-eqz v0, :cond_28

    invoke-static {v0}, Lk1g;->I(Lorg/chromium/content/browser/MediaSessionImpl;)Z

    move-result v0

    iget-object v2, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->t:Levn;

    iget-object v3, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->s:Lorg/chromium/content/browser/MediaSessionImpl;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4, v0}, Lsc;->l(Ljava/lang/Object;ZZ)V

    iput-object v1, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->s:Lorg/chromium/content/browser/MediaSessionImpl;

    :cond_28
    iput-object v1, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->t:Levn;

    iget-object v0, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->k:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v0, :cond_35

    iget-object v2, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->l:Lty3;

    invoke-virtual {v0, v2}, Lcom/opera/android/browser/chromium/ChromiumContent;->y(Liz4;)V

    iput-object v1, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->k:Lcom/opera/android/browser/chromium/ChromiumContent;

    :cond_35
    iput-object v1, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->l:Lty3;

    return-void
.end method

.method public final onPictureInPictureModeChanged(ZLandroid/content/res/Configuration;)V
    .registers 5

    invoke-super {p0, p1, p2}, Lxd5;->onPictureInPictureModeChanged(ZLandroid/content/res/Configuration;)V

    iget-object p2, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->s:Lorg/chromium/content/browser/MediaSessionImpl;

    if-eqz p2, :cond_12

    invoke-static {p2}, Lk1g;->I(Lorg/chromium/content/browser/MediaSessionImpl;)Z

    move-result p2

    iget-object v0, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->t:Levn;

    iget-object v1, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->s:Lorg/chromium/content/browser/MediaSessionImpl;

    invoke-virtual {v0, v1, p1, p2}, Lsc;->l(Ljava/lang/Object;ZZ)V

    :cond_12
    if-eqz p1, :cond_15

    return-void

    :cond_15
    iget-wide p1, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->j:J

    invoke-static {p1, p2}, LJ/N;->MUcD_MgJ(J)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final onStart()V
    .registers 9

    invoke-super {p0}, Lfp1;->onStart()V

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "com.opera.android.media.WebPictureInPictureActivity.NativePointer"

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->j:J

    const-class v1, Lorg/chromium/content_public/browser/WebContents;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setExtrasClassLoader(Ljava/lang/ClassLoader;)V

    const-string v1, "com.opera.android.media.PictureInPicture.WebContents"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lorg/chromium/content_public/browser/WebContents;

    sget-object v4, Lcom/opera/android/browser/chromium/ChromiumContent;->V:Lorg/chromium/url/GURL;

    invoke-static {v1}, LJ/N;->Mo8CJari(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/browser/chromium/ChromiumContent;

    iput-object v1, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->k:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-wide v4, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->j:J

    sget-wide v6, Lcom/opera/android/media/WebPictureInPictureActivity;->v:J

    cmp-long v4, v4, v6

    if-nez v4, :cond_125

    if-eqz v1, :cond_3b

    invoke-virtual {v1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    goto :goto_3c

    :cond_3b
    const/4 v1, 0x0

    :goto_3c
    if-eqz v1, :cond_125

    invoke-interface {v1}, Lorg/chromium/content_public/browser/WebContents;->isDestroyed()Z

    move-result v4

    if-nez v4, :cond_125

    invoke-interface {v1}, Lorg/chromium/content_public/browser/WebContents;->k0()Lorg/chromium/ui/base/WindowAndroid;

    move-result-object v1

    if-eqz v1, :cond_125

    invoke-virtual {v1}, Lorg/chromium/ui/base/WindowAndroid;->m()Lb2b;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_125

    sput-wide v2, Lcom/opera/android/media/WebPictureInPictureActivity;->v:J

    new-instance v1, Lty3;

    const/16 v2, 0x9

    invoke-direct {v1, p0, v2}, Lty3;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->l:Lty3;

    iget-object v2, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->k:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v2, v1}, Lcom/opera/android/browser/chromium/ChromiumContent;->k(Liz4;)V

    iget-object v1, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->k:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    invoke-static {v1}, LJ/N;->Mtun$qW8(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/content/browser/MediaSessionImpl;

    iput-object v1, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->s:Lorg/chromium/content/browser/MediaSessionImpl;

    new-instance v3, Lup1;

    const/16 v1, 0x18

    invoke-direct {v3, p0, v1}, Lup1;-><init>(Ljava/lang/Object;B)V

    iput-object v3, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->r:Lup1;

    new-instance v4, Landroid/content/IntentFilter;

    const-string v1, "com.opera.android.media.WebPictureInPictureActivity.MediaAction"

    invoke-direct {v4, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v6, 0x0

    const/4 v7, 0x4

    const/4 v5, 0x0

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    new-instance p0, Lcyd;

    invoke-direct {p0, v2}, Lcyd;-><init>(Lcom/opera/android/media/WebPictureInPictureActivity;)V

    iput-object p0, v2, Lcom/opera/android/media/WebPictureInPictureActivity;->u:Lcyd;

    iget-wide v3, v2, Lcom/opera/android/media/WebPictureInPictureActivity;->j:J

    iget-object p0, v2, Lcom/opera/android/media/WebPictureInPictureActivity;->m:Lqi;

    invoke-static {v3, v4, v2, p0}, LJ/N;->M0CCxfVu(JLjava/lang/Object;Ljava/lang/Object;)V

    iget-object p0, v2, Lcom/opera/android/media/WebPictureInPictureActivity;->m:Lqi;

    iget-object v1, p0, Lorg/chromium/ui/base/WindowAndroid;->d:Lfb7;

    iget v1, v1, Lfb7;->f:I

    int-to-double v3, v1

    const-wide v5, 0x3fee666666666666L    # 0.95

    mul-double/2addr v3, v5

    double-to-int v1, v3

    iput v1, v2, Lcom/opera/android/media/WebPictureInPictureActivity;->q:I

    new-instance v1, Lvll;

    invoke-direct {v1}, Lvll;-><init>()V

    new-instance v3, Lorg/chromium/components/thinwebview/internal/CompositorViewImpl;

    invoke-direct {v3, v2, p0, v1}, Lorg/chromium/components/thinwebview/internal/CompositorViewImpl;-><init>(Landroid/content/Context;Lorg/chromium/ui/base/WindowAndroid;Lvll;)V

    iput-object v3, v2, Lcom/opera/android/media/WebPictureInPictureActivity;->o:Lorg/chromium/components/thinwebview/internal/CompositorViewImpl;

    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {p0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    iget-object v1, v3, Lorg/chromium/components/thinwebview/internal/CompositorViewImpl;->b:Landroid/view/View;

    invoke-virtual {v2, v1, p0}, Lfp1;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p0, v2, Lcom/opera/android/media/WebPictureInPictureActivity;->o:Lorg/chromium/components/thinwebview/internal/CompositorViewImpl;

    iget-object p0, p0, Lorg/chromium/components/thinwebview/internal/CompositorViewImpl;->b:Landroid/view/View;

    new-instance v1, Lho3;

    const/16 v3, 0xb

    invoke-direct {v1, v2, v3}, Lho3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-wide v3, v2, Lcom/opera/android/media/WebPictureInPictureActivity;->j:J

    iget-object p0, v2, Lcom/opera/android/media/WebPictureInPictureActivity;->o:Lorg/chromium/components/thinwebview/internal/CompositorViewImpl;

    invoke-static {v3, v4, p0}, LJ/N;->M_Dn99D1(JLjava/lang/Object;)V

    new-instance p0, Landroid/util/Size;

    const-string v1, "com.opera.android.media.WebPictureInPictureActivity.source.width"

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    const-string v4, "com.opera.android.media.WebPictureInPictureActivity.source.height"

    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    invoke-direct {p0, v1, v0}, Landroid/util/Size;-><init>(II)V

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v0

    if-lez v0, :cond_111

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v0

    if-lez v0, :cond_111

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result p0

    if-eqz p0, :cond_10a

    int-to-float v0, v0

    int-to-float v1, p0

    div-float/2addr v0, v1

    const v3, 0x3ed639d7

    const v4, 0x4018f5c3    # 2.39f

    invoke-static {v0, v3, v4}, La26;->v(FFF)F

    move-result v0

    mul-float/2addr v0, v1

    float-to-int v0, v0

    :cond_10a
    new-instance v1, Landroid/util/Rational;

    invoke-direct {v1, v0, p0}, Landroid/util/Rational;-><init>(II)V

    iput-object v1, v2, Lcom/opera/android/media/WebPictureInPictureActivity;->p:Landroid/util/Rational;

    :cond_111
    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v0, "com.opera.android.media.PictureInPicture.launched"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_124

    invoke-virtual {v2}, Lcom/opera/android/media/WebPictureInPictureActivity;->F()Landroid/app/PictureInPictureParams;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroid/app/Activity;->enterPictureInPictureMode(Landroid/app/PictureInPictureParams;)Z

    :cond_124
    return-void

    :cond_125
    move-object v2, p0

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final onStop()V
    .registers 6

    invoke-super {p0}, Lfp1;->onStop()V

    iget-object p0, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->o:Lorg/chromium/components/thinwebview/internal/CompositorViewImpl;

    if-eqz p0, :cond_20

    iget-object v0, p0, Lorg/chromium/components/thinwebview/internal/CompositorViewImpl;->c:Lorg/chromium/ui/base/WindowAndroid;

    iget-object v0, v0, Lorg/chromium/ui/base/WindowAndroid;->e:Ljava/lang/RuntimeException;

    if-nez v0, :cond_1b

    iget-wide v0, p0, Lorg/chromium/components/thinwebview/internal/CompositorViewImpl;->d:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_20

    invoke-static {v0, v1}, LJ/N;->M_L66GG1(J)V

    iput-wide v2, p0, Lorg/chromium/components/thinwebview/internal/CompositorViewImpl;->d:J

    return-void

    :cond_1b
    const-string p0, "WindowAndroid destroyed before CompositorViewImpl"

    invoke-static {p0, v0}, Lh9o;->m(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_20
    return-void
.end method

.method public final setCameraState(Z)V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->u:Lcyd;

    iget-object v0, v0, Lcyd;->j:Ljava/lang/Object;

    check-cast v0, Leyi;

    iput-boolean p1, v0, Leyi;->b:Z

    :try_start_8
    invoke-virtual {p0}, Lcom/opera/android/media/WebPictureInPictureActivity;->F()Landroid/app/PictureInPictureParams;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setPictureInPictureParams(Landroid/app/PictureInPictureParams;)V
    :try_end_f
    .catch Ljava/lang/IllegalStateException; {:try_start_8 .. :try_end_f} :catch_f

    :catch_f
    return-void
.end method

.method public final setMicrophoneMuted(Z)V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->u:Lcyd;

    iget-object v0, v0, Lcyd;->i:Ljava/lang/Object;

    check-cast v0, Leyi;

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, v0, Leyi;->b:Z

    :try_start_a
    invoke-virtual {p0}, Lcom/opera/android/media/WebPictureInPictureActivity;->F()Landroid/app/PictureInPictureParams;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setPictureInPictureParams(Landroid/app/PictureInPictureParams;)V
    :try_end_11
    .catch Ljava/lang/IllegalStateException; {:try_start_a .. :try_end_11} :catch_11

    :catch_11
    return-void
.end method

.method public final setPlaybackState(I)V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->u:Lcyd;

    iput p1, v0, Lcyd;->b:I

    :try_start_4
    invoke-virtual {p0}, Lcom/opera/android/media/WebPictureInPictureActivity;->F()Landroid/app/PictureInPictureParams;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setPictureInPictureParams(Landroid/app/PictureInPictureParams;)V
    :try_end_b
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_b} :catch_b

    :catch_b
    return-void
.end method

.method public final updateVideoSize(II)V
    .registers 6

    if-eqz p2, :cond_11

    int-to-float p1, p1

    int-to-float v0, p2

    div-float/2addr p1, v0

    const v1, 0x3ed639d7

    const v2, 0x4018f5c3    # 2.39f

    invoke-static {p1, v1, v2}, La26;->v(FFF)F

    move-result p1

    mul-float/2addr p1, v0

    float-to-int p1, p1

    :cond_11
    new-instance v0, Landroid/util/Rational;

    invoke-direct {v0, p1, p2}, Landroid/util/Rational;-><init>(II)V

    iput-object v0, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->p:Landroid/util/Rational;

    :try_start_18
    invoke-virtual {p0}, Lcom/opera/android/media/WebPictureInPictureActivity;->F()Landroid/app/PictureInPictureParams;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setPictureInPictureParams(Landroid/app/PictureInPictureParams;)V
    :try_end_1f
    .catch Ljava/lang/IllegalStateException; {:try_start_18 .. :try_end_1f} :catch_1f

    :catch_1f
    return-void
.end method

.method public final updateVisibleActions([I)V
    .registers 6
    .param p1    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    array-length v1, p1

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v1, :cond_15

    aget v3, p1, v2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_15
    iget-object p1, p0, Lcom/opera/android/media/WebPictureInPictureActivity;->u:Lcyd;

    iput-object v0, p1, Lcyd;->k:Ljava/lang/Object;

    :try_start_19
    invoke-virtual {p0}, Lcom/opera/android/media/WebPictureInPictureActivity;->F()Landroid/app/PictureInPictureParams;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setPictureInPictureParams(Landroid/app/PictureInPictureParams;)V
    :try_end_20
    .catch Ljava/lang/IllegalStateException; {:try_start_19 .. :try_end_20} :catch_20

    :catch_20
    return-void
.end method
