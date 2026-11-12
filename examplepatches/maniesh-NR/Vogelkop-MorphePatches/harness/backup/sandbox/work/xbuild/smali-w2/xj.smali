.class public final synthetic Lxj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;
.implements Ln5o;
.implements Ldkj;
.implements Lu16;
.implements Lyjj;
.implements Lfkj;
.implements Lm9n;
.implements Lb27;
.implements Lxla;
.implements Lcom/google/android/gms/tasks/OnSuccessListener;
.implements Lm94;
.implements Lxo4;
.implements Ltj9;
.implements Lcom/opera/android/browser/BrowserDataManager$CookiesAndLocalStorageUsageCallback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lck;Llk;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lxj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxj;->c:Ljava/lang/Object;

    iput-object p2, p0, Lxj;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 11
    iput-byte p3, p0, Lxj;->a:B

    iput-object p1, p0, Lxj;->b:Ljava/lang/Object;

    iput-object p2, p0, Lxj;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    iget-byte v0, p0, Lxj;->a:B

    iget-object v1, p0, Lxj;->c:Ljava/lang/Object;

    iget-object p0, p0, Lxj;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_56

    check-cast p0, Lq3;

    check-cast v1, Lru2;

    iget v0, v1, Lru2;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lq3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_17
    check-cast p0, Lru9;

    check-cast v1, Ljava/lang/Runnable;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v2, "ai.never_ask_for_mic_permission"

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_30
    check-cast p0, Landroid/content/Context;

    check-cast v1, Lmlj;

    :try_start_34
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v2, "com.android.settings.TTS_SETTINGS"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v2, 0x10000000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_46
    .catch Landroid/content/ActivityNotFoundException; {:try_start_34 .. :try_end_46} :catch_47

    goto :goto_54

    :catch_47
    new-instance p0, Lrxh;

    const v0, 0x7f140beb

    invoke-direct {p0, v0}, Lrxh;-><init>(I)V

    const/16 v0, 0x9c4

    invoke-virtual {v1, p0, v0}, Lmlj;->a(Lrxh;I)V

    :goto_54
    return-void

    nop

    :pswitch_data_56
    .packed-switch 0x6
        :pswitch_30
        :pswitch_17
    .end packed-switch
.end method

.method public final attachCompleter(Ll94;)Ljava/lang/Object;
    .registers 11

    iget-object v0, p0, Lxj;->b:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lwg4;

    iget-object p0, p0, Lxj;->c:Ljava/lang/Object;

    move-object v3, p0

    check-cast v3, Landroid/content/Context;

    iget-object v4, v2, Lwg4;->d:Ljava/util/concurrent/Executor;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    new-instance v1, Lug4;

    const/4 v5, 0x1

    move-object v6, p1

    invoke-direct/range {v1 .. v8}, Lug4;-><init>(Lwg4;Landroid/content/Context;Ljava/util/concurrent/Executor;ILl94;J)V

    invoke-interface {v4, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    const-string p0, "CameraX initInternal"

    return-object p0
.end method

.method public final b(Lxc;)Landroid/graphics/drawable/Drawable;
    .registers 6

    iget-object v0, p1, Lxc;->f:Lrm5;

    iget-object v1, p0, Lxj;->b:Ljava/lang/Object;

    check-cast v1, Lwo3;

    iget-object p0, p0, Lxj;->c:Ljava/lang/Object;

    check-cast p0, Lk6l;

    sget-object v2, Lxc;->l:Lxc;

    invoke-virtual {p1, v2}, Lxc;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2a

    sget p1, Lm3l;->h:I

    invoke-virtual {v1}, Lwo3;->J0()Lel9;

    move-result-object p1

    iget-object p1, p1, Lel9;->a:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v1, Ll3l;

    new-instance v2, Lm3l;

    const/4 v3, 0x0

    invoke-direct {v2, p1, v3}, Lm3l;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-direct {v1, p1, p0, v2}, Ll3l;-><init>(Landroid/content/Context;Lk6l;Lm3l;)V

    goto :goto_3a

    :cond_2a
    invoke-virtual {v1}, Lwo3;->J0()Lel9;

    move-result-object p0

    iget-object p0, p0, Lel9;->a:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    iget p1, p1, Lxc;->a:I

    invoke-static {p1, p0}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    :goto_3a
    instance-of p0, v0, Lwc;

    if-eqz p0, :cond_57

    instance-of p0, v1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz p0, :cond_57

    new-instance p0, Lb0j;

    check-cast v1, Landroid/graphics/drawable/LayerDrawable;

    check-cast v0, Lwc;

    const p1, 0x7f0a0347

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Integer;

    move-result-object p1

    invoke-direct {p0, v1, p1}, Lb0j;-><init>(Landroid/graphics/drawable/LayerDrawable;[Ljava/lang/Integer;)V

    return-object p0

    :cond_57
    return-object v1
.end method

.method public final c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;
    .registers 13

    iget-byte v0, p0, Lxj;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object v3, p0, Lxj;->c:Ljava/lang/Object;

    iget-object p0, p0, Lxj;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_c4

    check-cast p0, Lnv6;

    check-cast v3, Lhqk;

    new-instance v0, Lkl4;

    invoke-static {p1}, Lp37;->U(Landroid/view/View;)Landroid/view/LayoutInflater;

    move-result-object v4

    const v5, 0x7f0d00b5

    invoke-virtual {v4, v5, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_35

    new-instance v1, Lcq3;

    check-cast p1, Lcom/opera/android/suggestion/ChatSuggestionView;

    const/4 v4, 0x1

    invoke-direct {v1, p1, v4}, Lcq3;-><init>(Landroid/view/View;B)V

    new-instance p1, Lil4;

    invoke-direct {p1, v3, v2}, Lil4;-><init>(Lhqk;B)V

    new-instance v2, Lil4;

    invoke-direct {v2, v3, v4}, Lil4;-><init>(Lhqk;B)V

    invoke-direct {v0, v1, p1, v2, p0}, Lkl4;-><init>(Lcq3;Lil4;Lil4;Lnv6;)V

    move-object v1, v0

    goto :goto_3a

    :cond_35
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_3a
    return-object v1

    :pswitch_3b
    check-cast p0, Lws2;

    check-cast v3, Lbt2;

    invoke-static {p1}, Lp37;->U(Landroid/view/View;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v4, 0x7f0d0082

    invoke-virtual {v0, v4, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a0394

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    if-eqz v2, :cond_9b

    const v0, 0x7f0a059c

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Landroid/widget/Space;

    if-eqz v6, :cond_9b

    const v0, 0x7f0a0acc

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Landroid/widget/ImageView;

    if-eqz v7, :cond_9b

    const v0, 0x7f0a0af4

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Landroid/widget/TextView;

    if-eqz v8, :cond_9b

    const v0, 0x7f0a06c5

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Landroid/widget/TextView;

    if-eqz v9, :cond_9b

    new-instance v4, Lor2;

    move-object v5, p1

    check-cast v5, Landroid/widget/FrameLayout;

    const/4 v10, 0x2

    invoke-direct/range {v4 .. v10}, Lor2;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p1, Lole;

    invoke-direct {p1, v3}, Lole;-><init>(Ljava/lang/Object;)V

    iget-object p0, p0, Lws2;->e:Lcom/opera/android/browser/chromium/ChromiumContent;

    new-instance v1, Lzs2;

    invoke-direct {v1, p0, v4, p1}, Lzs2;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lor2;Lole;)V

    goto :goto_ac

    :cond_9b
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_ac
    return-object v1

    :pswitch_ad
    check-cast p0, Lmq2;

    check-cast v3, Ltw2;

    invoke-static {p1}, Lp37;->U(Landroid/view/View;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-static {v0, p1}, Lvs;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lvs;

    move-result-object p1

    new-instance v0, Lpq2;

    iget-object v1, p0, Lmq2;->d:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget p0, p0, Lmq2;->f:I

    invoke-direct {v0, p1, v1, v3, p0}, Lpq2;-><init>(Lvs;Lcom/opera/android/browser/chromium/ChromiumContent;Loq2;I)V

    return-object v0

    nop

    :pswitch_data_c4
    .packed-switch 0xd
        :pswitch_ad
        :pswitch_3b
    .end packed-switch
.end method

.method public final d(I)V
    .registers 3

    iget-object v0, p0, Lxj;->b:Ljava/lang/Object;

    check-cast v0, Lnrl;

    iget-object p0, p0, Lxj;->c:Ljava/lang/Object;

    check-cast p0, Llq4;

    iget-object p0, p0, Llq4;->a:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkq4;

    invoke-virtual {v0, p0}, Lnrl;->Q(Lkq4;)V

    return-void
.end method

.method public final e(Lgkj;Lhjm;)V
    .registers 3

    iget-object p1, p0, Lxj;->b:Ljava/lang/Object;

    check-cast p1, Lo5f;

    iget-object p0, p0, Lxj;->c:Ljava/lang/Object;

    check-cast p0, Llqh;

    iget-boolean p0, p0, Llqh;->a:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p1, p0}, Lo5f;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final f(Lyla;)V
    .registers 4

    iget-object v0, p0, Lxj;->b:Ljava/lang/Object;

    check-cast v0, Lf93;

    iget-object p0, p0, Lxj;->c:Ljava/lang/Object;

    check-cast p0, Lyla;

    iget-object v1, v0, Lf93;->i:Lg93;

    iget-boolean v0, v0, Lf93;->h:Z

    if-nez v0, :cond_1b

    if-eqz p1, :cond_1b

    iget-object v0, v1, Lg93;->k:Lta7;

    invoke-virtual {v0, p1}, Lta7;->A(Lyla;)V

    invoke-virtual {p1, p0}, Lyla;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1c

    :cond_1b
    return-void

    :cond_1c
    invoke-virtual {v1}, Lt7j;->c()V

    return-void
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 19

    move-object/from16 v0, p0

    iget-byte v1, v0, Lxj;->a:B

    const/4 v3, 0x0

    iget-object v4, v0, Lxj;->c:Ljava/lang/Object;

    iget-object v0, v0, Lxj;->b:Ljava/lang/Object;

    const/4 v5, 0x1

    const/4 v6, 0x0

    packed-switch v1, :pswitch_data_306

    :pswitch_e
    check-cast v0, Lr9i;

    check-cast v4, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Void;

    invoke-virtual {v0}, Lr9i;->G()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2f

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_2f

    new-instance v3, Lc84;

    invoke-direct {v3, v4, v0}, Lc84;-><init>(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    :cond_2f
    return-object v3

    :pswitch_30
    check-cast v0, Lkf;

    check-cast v4, Lht1;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iget-object v0, v0, Lkf;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v2, Ldt1;

    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, v4, Lht1;->e:Lit1;

    invoke-direct {v2, v3, v1, v4}, Ldt1;-><init>(Landroid/content/Context;Ljava/util/List;Lit1;)V

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {v1, v5, v6}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    return-object v0

    :pswitch_56
    check-cast v0, Lat1;

    check-cast v4, Landroid/content/Context;

    move-object/from16 v1, p1

    check-cast v1, Ld7j;

    iget-object v3, v0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v3}, Lcom/opera/android/settings/SettingsManager;->e()Ld7j;

    move-result-object v7

    iget-object v7, v7, Ld7j;->a:Ljava/lang/String;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v8

    new-instance v9, Landroid/content/ComponentName;

    iget-object v10, v1, Ld7j;->a:Ljava/lang/String;

    invoke-direct {v9, v4, v10}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v8, v9, v5, v5}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    const-class v9, Landroid/content/pm/ShortcutManager;

    invoke-virtual {v4, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/content/pm/ShortcutManager;

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v9}, Landroid/content/pm/ShortcutManager;->getPinnedShortcuts()Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_89
    :goto_89
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_138

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/content/pm/ShortcutInfo;

    invoke-virtual {v12}, Landroid/content/pm/ShortcutInfo;->isImmutable()Z

    move-result v13

    if-nez v13, :cond_89

    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v13

    invoke-virtual {v13, v7}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    invoke-virtual {v13}, Landroid/os/Parcel;->marshall()[B

    move-result-object v14

    invoke-virtual {v13}, Landroid/os/Parcel;->recycle()V

    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v13

    iget-object v15, v1, Ld7j;->a:Ljava/lang/String;

    invoke-virtual {v13, v15}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    invoke-virtual {v13}, Landroid/os/Parcel;->marshall()[B

    move-result-object v15

    invoke-virtual {v13}, Landroid/os/Parcel;->recycle()V

    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v13

    invoke-virtual {v12, v13, v6}, Landroid/content/pm/ShortcutInfo;->writeToParcel(Landroid/os/Parcel;I)V

    invoke-virtual {v13}, Landroid/os/Parcel;->marshall()[B

    move-result-object v12

    invoke-virtual {v13}, Landroid/os/Parcel;->recycle()V

    const-string v13, "array"

    invoke-static {v12, v13}, Lz4o;->D(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v13, "target"

    invoke-static {v14, v13}, Lz4o;->D(Ljava/lang/Object;Ljava/lang/String;)V

    array-length v13, v14

    move/from16 p0, v5

    if-nez v13, :cond_d9

    move v13, v6

    :cond_d7
    const/4 v2, -0x1

    goto :goto_f5

    :cond_d9
    move v13, v6

    :goto_da
    array-length v5, v12

    array-length v6, v14

    sub-int/2addr v5, v6

    add-int/lit8 v5, v5, 0x1

    if-ge v13, v5, :cond_f3

    const/4 v5, 0x0

    :goto_e2
    array-length v6, v14

    if-ge v5, v6, :cond_d7

    add-int v6, v13, v5

    aget-byte v6, v12, v6

    aget-byte v2, v14, v5

    if-eq v6, v2, :cond_f0

    add-int/lit8 v13, v13, 0x1

    goto :goto_da

    :cond_f0
    add-int/lit8 v5, v5, 0x1

    goto :goto_e2

    :cond_f3
    const/4 v2, -0x1

    const/4 v13, -0x1

    :goto_f5
    if-eq v13, v2, :cond_133

    array-length v2, v14

    array-length v5, v15

    if-ne v2, v5, :cond_101

    array-length v2, v15

    const/4 v5, 0x0

    invoke-static {v15, v5, v12, v13, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_11a

    :cond_101
    const/4 v5, 0x0

    array-length v2, v12

    array-length v6, v14

    sub-int/2addr v2, v6

    array-length v6, v15

    add-int/2addr v2, v6

    new-array v2, v2, [B

    invoke-static {v12, v5, v2, v5, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v6, v15

    invoke-static {v15, v5, v2, v13, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v6, v14

    add-int/2addr v6, v13

    array-length v14, v15

    add-int/2addr v13, v14

    array-length v14, v12

    sub-int/2addr v14, v6

    invoke-static {v12, v6, v2, v13, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v12, v2

    :goto_11a
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v2

    array-length v6, v12

    invoke-virtual {v2, v12, v5, v6}, Landroid/os/Parcel;->unmarshall([BII)V

    invoke-virtual {v2, v5}, Landroid/os/Parcel;->setDataPosition(I)V

    sget-object v5, Landroid/content/pm/ShortcutInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v5, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/ShortcutInfo;

    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {v10, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_133
    const/4 v6, 0x0

    move/from16 v5, p0

    goto/16 :goto_89

    :cond_138
    move/from16 p0, v5

    invoke-virtual {v10}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_143

    invoke-virtual {v9, v10}, Landroid/content/pm/ShortcutManager;->updateShortcuts(Ljava/util/List;)Z

    :cond_143
    new-instance v2, Landroid/content/ComponentName;

    invoke-direct {v2, v4, v7}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 v4, 0x2

    move/from16 v5, p0

    invoke-virtual {v8, v2, v4, v5}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v2, "app_icon"

    iget-byte v1, v1, Ld7j;->e:B

    invoke-virtual {v3, v1, v2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    iget-object v0, v0, Lat1;->h:Lru9;

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    const-string v2, "app.icon.is_changed"

    invoke-interface {v1, v2, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_16d
    check-cast v0, Ljava/lang/String;

    check-cast v4, Ljava/lang/String;

    sget-object v1, Lt8;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-static {v1, v0}, Lxf8;->O(Landroid/content/Context;Ljava/lang/String;)Lovf;

    move-result-object v1

    if-eqz v1, :cond_210

    iget-object v5, v1, Lovf;->a:Landroid/content/pm/PackageInfo;

    iget-object v6, v5, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v6, :cond_210

    iget-object v1, v1, Lovf;->b:[Landroid/content/pm/Signature;

    array-length v6, v1

    const/4 v7, 0x0

    :goto_187
    if-ge v7, v6, :cond_210

    aget-object v8, v1, v7

    sget-object v9, Lf8a;->i:Lf8a;

    invoke-virtual {v8}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v8

    invoke-virtual {v9, v8}, Lf8a;->b([B)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_20c

    invoke-virtual {v2, v0}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0x1e

    if-eqz v0, :cond_1d9

    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v4

    if-eqz v4, :cond_1d9

    :try_start_1a9
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    const/4 v4, 0x0

    invoke-virtual {v2, v0, v4}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v0

    if-eqz v0, :cond_1d9

    invoke-virtual {v0, v2}, Landroid/content/pm/PackageItemInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v4
    :try_end_1b8
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1a9 .. :try_end_1b8} :catch_1d5

    :try_start_1b8
    invoke-virtual {v0, v2}, Landroid/content/pm/PackageItemInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v6, v1, :cond_1c5

    invoke-static {v2, v0}, Lr9n;->C(Landroid/content/pm/PackageManager;Landroid/graphics/drawable/Drawable;)Z

    move-result v6

    goto :goto_1ce

    :cond_1c5
    invoke-virtual {v2}, Landroid/content/pm/PackageManager;->getDefaultActivityIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    if-ne v6, v0, :cond_1cd

    const/4 v6, 0x1

    goto :goto_1ce

    :cond_1cd
    const/4 v6, 0x0

    :goto_1ce
    if-nez v6, :cond_1d6

    invoke-static {v0}, Lcom/opera/android/autofill/AffiliateHelper;->a(Landroid/graphics/drawable/Drawable;)Lorg/chromium/url/GURL;

    move-result-object v3
    :try_end_1d4
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1b8 .. :try_end_1d4} :catch_1d6

    goto :goto_1d6

    :catch_1d5
    move-object v4, v3

    :catch_1d6
    :cond_1d6
    :goto_1d6
    move-object v0, v3

    move-object v3, v4

    goto :goto_1da

    :cond_1d9
    move-object v0, v3

    :goto_1da
    if-nez v3, :cond_1e2

    iget-object v3, v5, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v3

    :cond_1e2
    if-nez v0, :cond_202

    iget-object v4, v5, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v2, v4}, Landroid/content/pm/PackageManager;->getApplicationIcon(Landroid/content/pm/ApplicationInfo;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v1, :cond_1f3

    invoke-static {v2, v4}, Lr9n;->C(Landroid/content/pm/PackageManager;Landroid/graphics/drawable/Drawable;)Z

    move-result v5

    goto :goto_1fc

    :cond_1f3
    invoke-virtual {v2}, Landroid/content/pm/PackageManager;->getDefaultActivityIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-ne v1, v4, :cond_1fb

    const/4 v5, 0x1

    goto :goto_1fc

    :cond_1fb
    const/4 v5, 0x0

    :goto_1fc
    if-nez v5, :cond_202

    invoke-static {v4}, Lcom/opera/android/autofill/AffiliateHelper;->a(Landroid/graphics/drawable/Drawable;)Lorg/chromium/url/GURL;

    move-result-object v0

    :cond_202
    new-instance v1, Lx40;

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lx40;-><init>(Lorg/chromium/url/GURL;Ljava/lang/String;)V

    goto :goto_212

    :cond_20c
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_187

    :cond_210
    sget-object v1, Lcom/opera/android/autofill/AffiliateHelper;->a:Lx40;

    :goto_212
    return-object v1

    :pswitch_213
    check-cast v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;

    check-cast v4, Landroid/graphics/Bitmap;

    new-instance v1, Lo1;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Lo1;-><init>(B)V

    iget-object v2, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->e:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lo1;->b(Ljava/lang/String;)V

    iget-object v0, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->a:Ldx3;

    iget-object v2, v1, Lo1;->b:Ljava/lang/String;

    iget v3, v1, Lo1;->c:I

    iget v1, v1, Lo1;->d:I

    invoke-static {v0, v4, v2, v3, v1}, Lcom/opera/android/webapps/ShortcutHelper;->b(Ldx3;Landroid/graphics/Bitmap;Ljava/lang/String;II)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    :pswitch_233
    check-cast v0, Lnt;

    check-cast v4, Lesi;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Void;

    iget-object v1, v0, Lnt;->e:Ltr8;

    iget-object v1, v1, Ltr8;->e:Lwnm;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    if-nez v1, :cond_249

    sget-object v1, Lv08;->a:Lv08;

    :cond_249
    iget-object v2, v0, Lnt;->c:Lrq8;

    iget-object v2, v2, Lrq8;->h:Lode;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljq8;

    if-eqz v2, :cond_257

    iget-object v3, v2, Ljq8;->a:Ljava/util/List;

    :cond_257
    if-nez v3, :cond_25b

    sget-object v3, Ll08;->a:Ll08;

    :cond_25b
    check-cast v3, Ljava/lang/Iterable;

    new-instance v2, Ld82;

    const/4 v5, 0x1

    invoke-direct {v2, v3, v5}, Ld82;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lmt;

    const/4 v6, 0x0

    invoke-direct {v3, v4, v6}, Lmt;-><init>(Lesi;B)V

    invoke-static {v2, v3}, Ly1j;->c(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lv39;

    move-result-object v2

    new-instance v3, Ly2;

    const/16 v6, 0xa

    invoke-direct {v3, v6}, Ly2;-><init>(B)V

    new-instance v6, Lm2m;

    invoke-direct {v6, v2, v3}, Lm2m;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)V

    iget-object v2, v0, Lnt;->j:Ljava/util/ArrayList;

    new-instance v3, Ld82;

    invoke-direct {v3, v2, v5}, Ld82;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lmt;

    invoke-direct {v2, v4, v5}, Lmt;-><init>(Lesi;B)V

    invoke-static {v3, v2}, Ly1j;->c(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lv39;

    move-result-object v2

    new-instance v3, Ly2;

    const/16 v4, 0xb

    invoke-direct {v3, v4}, Ly2;-><init>(B)V

    new-instance v7, Lm2m;

    invoke-direct {v7, v2, v3}, Lm2m;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)V

    const/4 v2, 0x2

    new-array v2, v2, [Lkotlin/sequences/Sequence;

    const/16 v16, 0x0

    aput-object v6, v2, v16

    aput-object v7, v2, v5

    invoke-static {v2}, Le82;->m([Ljava/lang/Object;)Lkotlin/sequences/Sequence;

    move-result-object v2

    new-instance v3, Lbli;

    const/16 v5, 0xc

    invoke-direct {v3, v5}, Lbli;-><init>(B)V

    instance-of v5, v2, Lm2m;

    if-eqz v5, :cond_2b9

    check-cast v2, Lm2m;

    new-instance v4, Lr79;

    iget-object v5, v2, Lm2m;->a:Lkotlin/sequences/Sequence;

    iget-object v2, v2, Lm2m;->b:Lkotlin/jvm/functions/Function1;

    invoke-direct {v4, v5, v2, v3}, Lr79;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    goto :goto_2c4

    :cond_2b9
    new-instance v5, Lr79;

    new-instance v6, Lbli;

    invoke-direct {v6, v4}, Lbli;-><init>(B)V

    invoke-direct {v5, v2, v6, v3}, Lr79;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    move-object v4, v5

    :goto_2c4
    new-instance v2, Ly2;

    const/16 v3, 0x8

    invoke-direct {v2, v3}, Ly2;-><init>(B)V

    new-instance v3, Lec7;

    const/4 v5, 0x0

    invoke-direct {v3, v4, v2, v5}, Lec7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Llt;

    invoke-direct {v2, v1, v5}, Llt;-><init>(Ljava/util/Set;B)V

    new-instance v1, Lv39;

    invoke-direct {v1, v3, v5, v2}, Lv39;-><init>(Lkotlin/sequences/Sequence;ZLkotlin/jvm/functions/Function1;)V

    new-instance v2, Ly2;

    const/16 v3, 0x9

    invoke-direct {v2, v3}, Ly2;-><init>(B)V

    new-instance v3, Lv39;

    invoke-direct {v3, v1, v5, v2}, Lv39;-><init>(Lkotlin/sequences/Sequence;ZLkotlin/jvm/functions/Function1;)V

    iget v1, v0, Lnt;->h:I

    invoke-static {v3, v1}, Ly1j;->f(Lkotlin/sequences/Sequence;I)Lkotlin/sequences/Sequence;

    move-result-object v1

    invoke-static {v1}, Ly1j;->g(Lkotlin/sequences/Sequence;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    new-array v2, v5, [Lst;

    invoke-interface {v1, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lst;

    iget-object v0, v0, Lnt;->b:Lqb7;

    invoke-virtual {v0, v1}, Lqb7;->E([Lst;)[Lst;

    move-result-object v0

    invoke-static {v0}, Le82;->B([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0

    :pswitch_data_306
    .packed-switch 0x3
        :pswitch_233
        :pswitch_213
        :pswitch_16d
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_56
        :pswitch_30
    .end packed-switch
.end method

.method public final j()V
    .registers 6

    iget-object v0, p0, Lxj;->b:Ljava/lang/Object;

    check-cast v0, Lo73;

    iget-object p0, p0, Lxj;->c:Ljava/lang/Object;

    check-cast p0, Lim7;

    iget v1, v0, Lo73;->i:I

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_29

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v2, v3}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v4

    if-eqz v4, :cond_29

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v4

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    if-ne v4, v3, :cond_29

    invoke-static {v2}, Lqe6;->N(Landroid/view/View;)V

    goto :goto_59

    :cond_29
    const/4 v2, 0x0

    :goto_2a
    invoke-virtual {p0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v3

    invoke-interface {v3}, Landroid/widget/Adapter;->getCount()I

    move-result v3

    if-ge v2, v3, :cond_59

    invoke-virtual {p0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v3

    invoke-interface {v3, v2}, Landroid/widget/Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Landroid/view/MenuItem;

    if-eqz v4, :cond_48

    check-cast v3, Landroid/view/MenuItem;

    invoke-interface {v3}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    if-eq v3, v1, :cond_4b

    :cond_48
    add-int/lit8 v2, v2, 0x1

    goto :goto_2a

    :cond_4b
    invoke-virtual {p0, v2}, Landroid/widget/ListView;->setSelection(I)V

    new-instance v2, Lbr;

    const/4 v3, 0x4

    invoke-direct {v2, p0, v1, v3}, Lbr;-><init>(Ljava/lang/Object;IB)V

    const-wide/16 v3, 0xfa

    invoke-virtual {p0, v2, v3, v4}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_59
    :goto_59
    const/4 p0, -0x1

    iput p0, v0, Lo73;->i:I

    return-void
.end method

.method public final m(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;)Lcom/google/android/gms/common/api/PendingResult;
    .registers 11

    iget-object v0, p0, Lxj;->b:Ljava/lang/Object;

    check-cast v0, Lzo4;

    iget-object p0, p0, Lxj;->c:Ljava/lang/Object;

    check-cast p0, [I

    array-length v1, p0

    new-array v2, v1, [I

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    :goto_e
    array-length v6, p0

    if-ge v4, v6, :cond_22

    aget v6, p0, v4

    iget-object v7, v0, Lzo4;->l:[I

    array-length v8, v7

    if-ge v6, v8, :cond_1f

    add-int/lit8 v8, v5, 0x1

    aget v6, v7, v6

    aput v6, v2, v5

    move v5, v8

    :cond_1f
    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    :cond_22
    const/4 p0, 0x0

    if-nez v5, :cond_26

    return-object p0

    :cond_26
    const/4 v0, 0x1

    if-ne v5, v0, :cond_30

    aget v0, v2, v3

    invoke-virtual {p1, v0, p0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->queueRemoveItem(ILorg/json/JSONObject;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p0

    return-object p0

    :cond_30
    if-ge v5, v1, :cond_36

    invoke-static {v2, v5}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v2

    :cond_36
    invoke-virtual {p1, v2, p0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->queueRemoveItems([ILorg/json/JSONObject;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p0

    return-object p0
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 3

    iget-object v0, p0, Lxj;->b:Ljava/lang/Object;

    check-cast v0, Ldg7;

    iget-object p0, p0, Lxj;->c:Ljava/lang/Object;

    check-cast p0, [B

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {v0, p0}, Ldg7;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final p(Z)V
    .registers 7

    iget-object v0, p0, Lxj;->b:Ljava/lang/Object;

    check-cast v0, Ld83;

    iget-object p0, p0, Lxj;->c:Ljava/lang/Object;

    check-cast p0, Lw3g;

    iget-object v1, v0, Ld83;->c:Ljava/util/List;

    invoke-static {v1, p0}, Lw3g;->a(Ljava/util/List;Lw3g;)I

    move-result v1

    if-eqz p1, :cond_2b

    iget-object p1, v0, Ld83;->c:Ljava/util/List;

    invoke-interface {p1, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    iget-object p1, v0, Ld83;->b:Ljava/lang/Object;

    check-cast p1, La4g;

    iget-object v2, p1, La4g;->a:Ljava/util/List;

    invoke-static {v2, p0}, Lw3g;->a(Ljava/util/List;Lw3g;)I

    move-result p0

    iget-wide v3, p1, La4g;->b:J

    invoke-static {v3, v4, p0}, LJ/N;->MvKxovNE(JI)V

    invoke-interface {v2, p0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/d;->notifyItemRemoved(I)V

    return-void

    :cond_2b
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    return-void
.end method

.method public final run()Ljava/lang/Object;
    .registers 2

    .line 86
    iget-object v0, p0, Lxj;->b:Ljava/lang/Object;

    check-cast v0, Lg71;

    iget-object p0, p0, Lxj;->c:Ljava/lang/Object;

    check-cast p0, Ljava/net/URL;

    invoke-virtual {v0, p0}, Lg71;->c(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object p0

    return-object p0
.end method

.method public final run([Ljava/lang/String;JZ)V
    .registers 12

    iget-object v0, p0, Lxj;->b:Ljava/lang/Object;

    check-cast v0, Liu2;

    iget-object p0, p0, Lxj;->c:Ljava/lang/Object;

    move-object v1, p0

    check-cast v1, Ls25;

    if-eqz p4, :cond_46

    array-length p0, p1

    const-wide/16 v2, 0x0

    cmp-long p1, p2, v2

    if-nez p1, :cond_1e

    if-nez p0, :cond_1e

    iget-object p0, v1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    const p1, 0x7f14104c

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_42

    :cond_1e
    iget-object p1, v1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {p2, p3, p1}, Laik;->j(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    filled-new-array {p4}, [Ljava/lang/Object;

    move-result-object p4

    const v1, 0x7f12001f

    invoke-virtual {p3, v1, p0, p4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const p3, 0x7f141012

    filled-new-array {p2, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, p3, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    :goto_42
    invoke-virtual {v0, p0}, Liu2;->run(Ljava/lang/Object;)V

    return-void

    :cond_46
    array-length v4, p1

    const v5, 0x7f12001f

    const v6, 0x7f14104c

    move-wide v2, p2

    invoke-static/range {v1 .. v6}, Lqyn;->C(Ls25;JIII)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Liu2;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 4

    iget-byte p1, p0, Lxj;->a:B

    iget-object v0, p0, Lxj;->c:Ljava/lang/Object;

    iget-object p0, p0, Lxj;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_62

    check-cast p0, Llk;

    check-cast v0, Lzj;

    invoke-virtual {p0}, Llk;->H0()Lpk;

    move-result-object p0

    iget-object p1, v0, Lzj;->W:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lpk;->g(Ljava/lang/String;Z)V

    return-void

    :pswitch_17
    check-cast v0, Lck;

    check-cast p0, Llk;

    if-eqz p2, :cond_52

    iget-object p1, v0, Lck;->Z:Lkk;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_47

    const/4 p2, 0x1

    if-eq p1, p2, :cond_3b

    const/4 p2, 0x2

    if-ne p1, p2, :cond_37

    invoke-virtual {p0}, Llk;->H0()Lpk;

    move-result-object p0

    iget-object p0, p0, Lpk;->f:Lpde;

    sget-object p1, La7j;->c:La7j;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    goto :goto_52

    :cond_37
    invoke-static {}, Lh9o;->p()V

    goto :goto_52

    :cond_3b
    invoke-virtual {p0}, Llk;->H0()Lpk;

    move-result-object p0

    iget-object p0, p0, Lpk;->f:Lpde;

    sget-object p1, La7j;->b:La7j;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    goto :goto_52

    :cond_47
    invoke-virtual {p0}, Llk;->H0()Lpk;

    move-result-object p0

    iget-object p0, p0, Lpk;->f:Lpde;

    sget-object p1, La7j;->a:La7j;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_52
    :goto_52
    return-void

    :pswitch_53
    check-cast p0, Llk;

    check-cast v0, Lak;

    invoke-virtual {p0}, Llk;->H0()Lpk;

    move-result-object p0

    iget-object p1, v0, Lak;->W:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lpk;->g(Ljava/lang/String;Z)V

    return-void

    nop

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_53
        :pswitch_17
    .end packed-switch
.end method
