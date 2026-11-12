.class public final synthetic Lal7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lal7;->a:B

    iput-object p1, p0, Lal7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lzb7;Lr17;)V
    .registers 3

    const/4 p2, 0x4

    iput-byte p2, p0, Lal7;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lal7;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Lal7;->a:B

    const/4 v1, 0x2

    const/16 v2, 0x14

    const/16 v3, 0x17

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    packed-switch v0, :pswitch_data_340

    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lp4b;

    iget-object v0, p0, Lp4b;->d:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d021a

    invoke-virtual {v1, v2, v0, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a0806

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Landroid/widget/TextView;

    if-eqz v8, :cond_4c

    const v1, 0x7f0a0807

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Landroid/widget/TextView;

    if-eqz v9, :cond_4c

    move-object v7, v0

    check-cast v7, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v6, La7n;

    iget-object v10, p0, Lp4b;->f:Lpde;

    iget-object v11, p0, Lp4b;->e:Lgjm;

    iget-object p0, p0, Lp4b;->g:Lo4b;

    iget-object v12, p0, Lk6k;->c:Lpde;

    invoke-direct/range {v6 .. v12}, La7n;-><init>(Landroid/view/ViewGroup;Landroid/widget/TextView;Landroid/widget/TextView;Lpde;Lgjm;Lpde;)V

    move-object v5, v6

    goto :goto_5d

    :cond_4c
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Missing required view with ID: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_5d
    return-object v5

    :pswitch_5e
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lo2b;

    invoke-virtual {p0}, Lryl;->g0()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_68
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/tabui2/siteimages/ImageUrlRepDatabase_Impl;

    new-instance v0, Le58;

    invoke-direct {v0, p0}, Le58;-><init>(Ly5i;)V

    return-object v0

    :pswitch_72
    const-class v0, Landroid/app/ActivityManager;

    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Ligi;

    iget-object p0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    const-wide v6, 0x3fc999999999999aL    # 0.2

    :try_start_81
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    invoke-virtual {v1}, Landroid/app/ActivityManager;->isLowRamDevice()Z

    move-result v1
    :try_end_8b
    .catch Ljava/lang/Exception; {:try_start_81 .. :try_end_8b} :catch_92

    if-eqz v1, :cond_92

    const-wide v6, 0x3fc3333333333333L    # 0.15

    :catch_92
    :cond_92
    const-wide/16 v8, 0x0

    cmpg-double v1, v8, v6

    if-gtz v1, :cond_d0

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    cmpg-double v1, v6, v8

    if-gtz v1, :cond_d0

    new-instance v1, Lbp;

    invoke-direct {v1, v3}, Lbp;-><init>(B)V

    :try_start_a3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    iget p0, p0, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v3, 0x100000

    and-int/2addr p0, v3

    if-eqz p0, :cond_b9

    invoke-virtual {v0}, Landroid/app/ActivityManager;->getLargeMemoryClass()I

    move-result p0

    goto :goto_c0

    :cond_b9
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result p0
    :try_end_bd
    .catch Ljava/lang/Exception; {:try_start_a3 .. :try_end_bd} :catch_be

    goto :goto_c0

    :catch_be
    const/16 p0, 0x100

    :goto_c0
    int-to-long v3, p0

    shl-long/2addr v3, v2

    long-to-double v2, v3

    mul-double/2addr v6, v2

    double-to-long v2, v6

    new-instance p0, Lqq8;

    invoke-direct {p0, v2, v3, v1}, Lqq8;-><init>(JLbp;)V

    new-instance v5, Lamh;

    invoke-direct {v5, p0, v1}, Lamh;-><init>(Lqq8;Lbp;)V

    goto :goto_d5

    :cond_d0
    const-string p0, "percent must be in the range [0.0, 1.0]."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_d5
    return-object v5

    :pswitch_d6
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lnxa;

    iget-object v0, p0, Lnxa;->a:Landroid/content/Context;

    invoke-static {v0}, Lui6;->o(Landroid/content/Context;)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object v1

    invoke-virtual {p0, v6, v1}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    new-instance v1, Lw3a;

    const v2, 0x7f0803ec

    invoke-static {v2, v0}, Lw8h;->u(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const v3, 0x7f0402af

    invoke-static {v3, v0}, Lj7h;->k(ILandroid/content/Context;)I

    move-result v0

    invoke-static {v2, v0}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    const/16 v0, 0x11

    invoke-direct {v1, v2, v0, v6}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    invoke-virtual {p0, v4, v1}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_104
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Laxa;

    sget v0, Laxa;->i:I

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    move-object v7, p0

    check-cast v7, Lcom/opera/hype/image/editor/ImageEditorActivity;

    new-instance v6, Lmxa;

    invoke-virtual {v7}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    if-eqz p0, :cond_11d

    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v5

    :cond_11d
    move-object v8, v5

    invoke-virtual {v7}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    iget-object p0, v7, Lcom/opera/hype/image/editor/ImageEditorActivity;->b:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    move-object v10, p0

    check-cast v10, Landroid/net/Uri;

    iget-object p0, v7, Lcom/opera/hype/image/editor/ImageEditorActivity;->a:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    move-object v11, p0

    check-cast v11, Ljava/util/List;

    iget-object p0, v7, Lcom/opera/hype/image/editor/ImageEditorActivity;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    move-object v12, p0

    check-cast v12, Lra5;

    invoke-direct/range {v6 .. v12}, Lmxa;-><init>(Lcom/opera/hype/image/editor/ImageEditorActivity;Landroid/os/Bundle;Landroid/content/Context;Landroid/net/Uri;Ljava/util/List;Lra5;)V

    return-object v6

    :pswitch_141
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lokhttp3/internal/http2/Http2Connection;

    invoke-static {p0}, Lokhttp3/internal/http2/Http2Connection;->p(Lokhttp3/internal/http2/Http2Connection;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_14a
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/webaiassistant/db/HistoryDatabase_Impl;

    new-instance v0, Lqca;

    invoke-direct {v0, p0}, Lqca;-><init>(Ly5i;)V

    return-object v0

    :pswitch_154
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Ldg5;

    new-instance v0, Lhba;

    invoke-direct {v0, p0}, Lhba;-><init>(Ldg5;)V

    return-object v0

    :pswitch_15e
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lv8a;

    invoke-virtual {p0}, Lv8a;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_168
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lh5a;

    invoke-virtual {p0}, Lh5a;->a()Lvt8;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_186

    if-eq p0, v4, :cond_184

    if-eq p0, v1, :cond_187

    const/4 v1, 0x3

    if-eq p0, v1, :cond_187

    const/4 v1, 0x4

    if-eq p0, v1, :cond_187

    invoke-static {}, Lh9o;->p()V

    goto :goto_18b

    :cond_184
    move v1, v4

    goto :goto_187

    :cond_186
    move v1, v6

    :cond_187
    :goto_187
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    :goto_18b
    return-object v5

    :pswitch_18c
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lg5a;

    iget-object v0, p0, Lg5a;->c:Lkol;

    new-instance v1, Lfol;

    iget-object p0, p0, Lg5a;->a:Lb2l;

    move-object v2, p0

    check-cast v2, Ld7l;

    invoke-virtual {v2}, Ld7l;->h0()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0}, Lb9l;->T()Lp6l;

    move-result-object v3

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getId()I

    move-result p0

    invoke-direct {v1, p0, v3, v2}, Lfol;-><init>(ILp6l;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lkol;->j(Lfol;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1b2
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Ld5a;

    invoke-virtual {p0}, Ld5a;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1bc
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lcw3;

    invoke-virtual {p0}, Lcw3;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lysj;

    return-object p0

    :pswitch_1c7
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lcw3;

    invoke-virtual {p0}, Lcw3;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1da

    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    :cond_1da
    return-object p0

    :pswitch_1db
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lk5o;

    iget-object p0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lcom/google/android/gms/location/LocationServices;->getFusedLocationProviderClient(Landroid/content/Context;)Lcom/google/android/gms/location/FusedLocationProviderClient;

    move-result-object p0

    return-object p0

    :pswitch_1e8
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lup9;

    new-instance v0, Lg77;

    invoke-direct {v0, v2}, Lg77;-><init>(B)V

    iget-object v2, p0, Lup9;->b:Lpnc;

    invoke-virtual {v2}, Lpnc;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lpna;

    iput-object v2, v0, Lg77;->b:Ljava/lang/Object;

    iget-object p0, p0, Lup9;->a:Lt1;

    invoke-virtual {p0}, Lt1;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf3j;

    iget-object p0, p0, Lf3j;->d:Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v2, "/"

    invoke-static {p0, v2, v6}, Lkotlin/text/c;->l(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_215

    invoke-virtual {p0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_215
    invoke-static {v0, p0}, Lg77;->d(Lg77;Ljava/lang/String;)V

    new-instance p0, Lpw6;

    invoke-direct {p0, v1}, Lpw6;-><init>(B)V

    filled-new-array {p0}, [Lpw6;

    move-result-object p0

    iget-object v1, v0, Lg77;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashSet;

    invoke-static {v1, p0}, Lo95;->s(Ljava/util/Collection;[Ljava/lang/Object;)V

    invoke-virtual {v0}, Lg77;->f()Ljyb;

    move-result-object p0

    new-instance v0, Lsfo;

    iget-object v1, p0, Ljyb;->a:Ljava/lang/String;

    iget-object v2, p0, Ljyb;->b:Lpna;

    new-instance v4, Lqe6;

    invoke-direct {v4, p0, v3}, Lqe6;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1, v2, v4}, Lsfo;-><init>(Ljava/lang/String;Lpna;Lqe6;)V

    return-object v0

    :pswitch_23b
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lyo9;

    iget-object v4, p0, Lyo9;->c:Le04;

    iget-object v0, p0, Lyo9;->b:Ljava/lang/String;

    const/16 v1, 0x10

    if-eqz v0, :cond_26b

    iget-boolean v2, p0, Lyo9;->d:Z

    if-eqz v2, :cond_26b

    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lyo9;->a:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getNoBackupFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v0, Lxo9;

    move v3, v1

    iget-object v1, p0, Lyo9;->a:Landroid/content/Context;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    move v5, v3

    new-instance v3, Leq6;

    invoke-direct {v3, v5}, Leq6;-><init>(B)V

    iget-boolean v5, p0, Lyo9;->e:Z

    invoke-direct/range {v0 .. v5}, Lxo9;-><init>(Landroid/content/Context;Ljava/lang/String;Leq6;Le04;Z)V

    goto :goto_27c

    :cond_26b
    move v5, v1

    new-instance v0, Lxo9;

    iget-object v1, p0, Lyo9;->a:Landroid/content/Context;

    iget-object v2, p0, Lyo9;->b:Ljava/lang/String;

    new-instance v3, Leq6;

    invoke-direct {v3, v5}, Leq6;-><init>(B)V

    iget-boolean v5, p0, Lyo9;->e:Z

    invoke-direct/range {v0 .. v5}, Lxo9;-><init>(Landroid/content/Context;Ljava/lang/String;Leq6;Le04;Z)V

    :goto_27c
    iget-boolean p0, p0, Lyo9;->g:Z

    invoke-virtual {v0, p0}, Landroid/database/sqlite/SQLiteOpenHelper;->setWriteAheadLoggingEnabled(Z)V

    return-object v0

    :pswitch_282
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lpad;

    iget-object p0, p0, Lpad;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    const-class v0, Landroid/location/LocationManager;

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/location/LocationManager;

    return-object p0

    :pswitch_293
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lc37;

    iget-object v0, p0, Lc37;->a:Ljava/lang/Object;

    check-cast v0, Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    iget-object p0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/MenuItem;

    if-eqz v0, :cond_2ab

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->n()Z

    move-result v0

    if-eq v0, v4, :cond_2ac

    :cond_2ab
    move v4, v6

    :cond_2ac
    invoke-interface {p0, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2b2
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lvg9;

    invoke-virtual {p0}, Lvg9;->V0()Lig9;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2bc
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, La49;

    iget-object v0, p0, La49;->b:Lk6l;

    sget-object v1, Lp6l;->b:Lp6l;

    invoke-virtual {v0, v1}, Lk6l;->s(Lp6l;)I

    move-result v0

    if-nez v0, :cond_2d4

    iget v1, p0, La49;->c:I

    if-lez v1, :cond_2d4

    iget-object v1, p0, La49;->a:Lcom/opera/android/bar/FindInPage;

    const-string v2, ""

    iput-object v2, v1, Lcom/opera/android/bar/FindInPage;->o:Ljava/lang/String;

    :cond_2d4
    iput v0, p0, La49;->c:I

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2d9
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    sget-object v1, Lw19;->e:Ljava/lang/Object;

    monitor-enter v1

    :try_start_2e0
    sget-object v0, Lw19;->d:Ljava/util/LinkedHashSet;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_2e9
    .catchall {:try_start_2e0 .. :try_end_2e9} :catchall_2ed

    monitor-exit v1

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :catchall_2ed
    move-exception v0

    move-object p0, v0

    monitor-exit v1

    throw p0

    :pswitch_2f1
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lks3;

    iget-object p0, p0, Lks3;->e:Ljava/lang/Object;

    check-cast p0, Lbr6;

    invoke-virtual {p0}, Lbr6;->b()Lesk;

    move-result-object p0

    invoke-interface {p0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt9f;

    return-object p0

    :pswitch_304
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/favorites/data/FavoriteRemovedSuggestionsDatabase_Impl;

    new-instance v0, Lur8;

    invoke-direct {v0, p0}, Lur8;-><init>(Ly5i;)V

    return-object v0

    :pswitch_30e
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lzb7;

    invoke-virtual {p0}, Lzb7;->invoke()Ljava/lang/Object;

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :pswitch_318
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lx77;

    iget-object p0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lzi4;->A(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_325
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/emoji2/emojipicker/EmojiPickerView;

    iget-object p0, p0, Landroidx/emoji2/emojipicker/EmojiPickerView;->i:Lc82;

    if-eqz p0, :cond_32e

    move-object v5, p0

    :cond_32e
    return-object v5

    :pswitch_32f
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/hype/image/editor/EditImage;

    iget-object p0, p0, Lcom/opera/hype/image/editor/EditImage;->d:Ldya;

    return-object p0

    :pswitch_336
    iget-object p0, p0, Lal7;->b:Ljava/lang/Object;

    check-cast p0, Lbl7;

    new-instance v0, Lwk7;

    invoke-direct {v0, p0, v4}, Lwk7;-><init>(Ljava/lang/Object;B)V

    return-object v0

    :pswitch_data_340
    .packed-switch 0x0
        :pswitch_336
        :pswitch_32f
        :pswitch_325
        :pswitch_318
        :pswitch_30e
        :pswitch_304
        :pswitch_2f1
        :pswitch_2d9
        :pswitch_2bc
        :pswitch_2b2
        :pswitch_293
        :pswitch_282
        :pswitch_23b
        :pswitch_1e8
        :pswitch_1db
        :pswitch_1c7
        :pswitch_1bc
        :pswitch_1b2
        :pswitch_18c
        :pswitch_168
        :pswitch_15e
        :pswitch_154
        :pswitch_14a
        :pswitch_141
        :pswitch_104
        :pswitch_d6
        :pswitch_72
        :pswitch_68
        :pswitch_5e
    .end packed-switch
.end method
