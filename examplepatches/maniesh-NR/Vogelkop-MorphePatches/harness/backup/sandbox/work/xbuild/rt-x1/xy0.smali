.class public final Lxy0;
.super Landroid/os/Handler;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/ref/WeakReference;


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    .line 14
    const/4 v0, 0x0

    iput-byte v0, p0, Lxy0;->a:B

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/os/Looper;Ltfp;)V
    .registers 4

    const/4 v0, 0x3

    iput-byte v0, p0, Lxy0;->a:B

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lxy0;->b:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public constructor <init>(Ljava/lang/ref/WeakReference;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lxy0;->a:B

    .line 15
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 16
    iput-object p1, p0, Lxy0;->b:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public constructor <init>(Lsrh;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Lxy0;->a:B

    .line 17
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 18
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lxy0;->b:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lxy0;->a:B

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    packed-switch v2, :pswitch_data_3f2

    iget-object v0, v0, Lxy0;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltfp;

    if-eqz v0, :cond_5e

    iget-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [D

    aget-wide v9, v0, v6

    aget-wide v11, v0, v7

    new-instance v8, Landroid/location/Geocoder;

    sget-object v0, Lphf;->a:Lx79;

    iget-object v0, v0, Lx79;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-direct {v8, v0, v1}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;Ljava/util/Locale;)V

    const/4 v13, 0x1

    :try_start_30
    invoke-virtual/range {v8 .. v13}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_46

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_46

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/Address;

    invoke-virtual {v0}, Landroid/location/Address;->getCountryCode()Ljava/lang/String;

    move-result-object v5
    :try_end_46
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_46} :catch_46

    :catch_46
    :cond_46
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5e

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Let2;

    const/4 v2, 0x7

    invoke-direct {v1, v5, v2}, Let2;-><init>(Ljava/lang/String;B)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_5e
    return-void

    :pswitch_5f
    iget-object v0, v0, Lxy0;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsrh;

    if-eqz v0, :cond_23d

    iget-object v2, v0, Lsrh;->h:Landroid/util/SparseArray;

    iget-object v8, v0, Lsrh;->i:Lxrh;

    iget-object v9, v8, Lxrh;->k:Ljava/util/ArrayList;

    iget v10, v1, Landroid/os/Message;->what:I

    iget v11, v1, Landroid/os/Message;->arg1:I

    iget v12, v1, Landroid/os/Message;->arg2:I

    iget-object v13, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v1}, Landroid/os/Message;->peekData()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v10, :cond_225

    packed-switch v10, :pswitch_data_3fc

    goto/16 :goto_23d

    :pswitch_82
    iget-object v1, v8, Lxrh;->n:Lsrh;

    if-ne v1, v0, :cond_23d

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    :cond_8a
    if-ge v6, v0, :cond_9b

    invoke-virtual {v9, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v6, v6, 0x1

    check-cast v1, Ltrh;

    invoke-interface {v1}, Ltrh;->b()I

    move-result v2

    if-ne v2, v12, :cond_8a

    move-object v5, v1

    :cond_9b
    iget-object v0, v8, Lxrh;->p:Lr9g;

    if-eqz v0, :cond_b9

    instance-of v1, v5, Lsnd;

    if-eqz v1, :cond_b9

    move-object v1, v5

    check-cast v1, Lsnd;

    iget-object v0, v0, Lr9g;->b:Ljava/lang/Object;

    check-cast v0, Lijc;

    iget-object v0, v0, Lijc;->d:Ljava/lang/Object;

    check-cast v0, Lez9;

    iget-object v2, v0, Lez9;->e:Lsnd;

    if-ne v2, v1, :cond_b9

    invoke-virtual {v0}, Lez9;->c()Lcod;

    move-result-object v1

    invoke-virtual {v0, v1, v4, v3, v7}, Lez9;->l(Lcod;IIZ)V

    :cond_b9
    if-eqz v5, :cond_23d

    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-interface {v5}, Ltrh;->c()V

    invoke-virtual {v8}, Lxrh;->l()V

    goto/16 :goto_23d

    :pswitch_c6
    if-eqz v13, :cond_cc

    instance-of v1, v13, Landroid/os/Bundle;

    if-eqz v1, :cond_23d

    :cond_cc
    check-cast v13, Landroid/os/Bundle;

    iget v1, v0, Lsrh;->f:I

    if-eqz v1, :cond_23d

    if-eqz v13, :cond_23d

    const-string v1, "groupRoute"

    invoke-virtual {v13, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/os/Bundle;

    if-eqz v1, :cond_e6

    new-instance v2, Lbnd;

    sget-object v3, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-direct {v2, v5, v1, v3}, Lbnd;-><init>(Ljava/lang/String;Landroid/os/Bundle;Ljava/util/List;)V

    goto :goto_e7

    :cond_e6
    move-object v2, v5

    :goto_e7
    const-string v1, "dynamicRoutes"

    invoke-virtual {v13, v1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_23d

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v10, v6

    :goto_f9
    if-ge v10, v4, :cond_13e

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    add-int/lit8 v10, v10, 0x1

    check-cast v11, Landroid/os/Bundle;

    if-nez v11, :cond_107

    move-object v11, v5

    goto :goto_13a

    :cond_107
    const-string v13, "mrDescriptor"

    invoke-virtual {v11, v13}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v13

    if-eqz v13, :cond_119

    new-instance v14, Lbnd;

    sget-object v15, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-direct {v14, v5, v13, v15}, Lbnd;-><init>(Ljava/lang/String;Landroid/os/Bundle;Ljava/util/List;)V

    move-object/from16 v17, v14

    goto :goto_11b

    :cond_119
    move-object/from16 v17, v5

    :goto_11b
    const-string v13, "selectionState"

    invoke-virtual {v11, v13, v7}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v18

    const-string v13, "isUnselectable"

    invoke-virtual {v11, v13, v6}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v19

    const-string v13, "isGroupable"

    invoke-virtual {v11, v13, v6}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v20

    const-string v13, "isTransferable"

    invoke-virtual {v11, v13, v6}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v21

    new-instance v16, Lqnd;

    invoke-direct/range {v16 .. v21}, Lqnd;-><init>(Lbnd;IZZZ)V

    move-object/from16 v11, v16

    :goto_13a
    invoke-virtual {v3, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f9

    :cond_13e
    iget-object v1, v8, Lxrh;->n:Lsrh;

    if-ne v1, v0, :cond_23d

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    :cond_146
    if-ge v6, v0, :cond_157

    invoke-virtual {v9, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v6, v6, 0x1

    check-cast v1, Ltrh;

    invoke-interface {v1}, Ltrh;->b()I

    move-result v4

    if-ne v4, v12, :cond_146

    move-object v5, v1

    :cond_157
    instance-of v0, v5, Lvrh;

    if-eqz v0, :cond_23d

    check-cast v5, Lvrh;

    invoke-virtual {v5, v2, v3}, Lrnd;->l(Lbnd;Ljava/util/ArrayList;)V

    goto/16 :goto_23d

    :pswitch_162
    instance-of v0, v13, Landroid/os/Bundle;

    if-eqz v0, :cond_23d

    check-cast v13, Landroid/os/Bundle;

    invoke-virtual {v2, v11}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lurh;

    if-eqz v0, :cond_23d

    invoke-virtual {v2, v11}, Landroid/util/SparseArray;->remove(I)V

    const-string v1, "routeId"

    invoke-virtual {v13, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_180

    invoke-virtual {v0, v13}, Lurh;->a(Landroid/os/Bundle;)V

    goto/16 :goto_23d

    :cond_180
    invoke-static {v13}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    goto/16 :goto_23d

    :pswitch_185
    if-eqz v13, :cond_18b

    instance-of v1, v13, Landroid/os/Bundle;

    if-eqz v1, :cond_23d

    :cond_18b
    check-cast v13, Landroid/os/Bundle;

    iget v1, v0, Lsrh;->f:I

    if-eqz v1, :cond_23d

    invoke-static {v13}, Lmi9;->a(Landroid/os/Bundle;)Lmi9;

    move-result-object v1

    iget-object v2, v8, Lxrh;->n:Lsrh;

    if-ne v2, v0, :cond_23d

    invoke-virtual {v8, v1}, Lund;->f(Lmi9;)V

    goto/16 :goto_23d

    :pswitch_19e
    if-eqz v13, :cond_1a4

    instance-of v0, v13, Landroid/os/Bundle;

    if-eqz v0, :cond_23d

    :cond_1a4
    if-eqz v1, :cond_1ab

    const-string v0, "error"

    invoke-virtual {v1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    :cond_1ab
    check-cast v13, Landroid/os/Bundle;

    invoke-virtual {v2, v11}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lurh;

    if-eqz v0, :cond_23d

    invoke-virtual {v2, v11}, Landroid/util/SparseArray;->remove(I)V

    invoke-static {v13}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    goto/16 :goto_23d

    :pswitch_1bd
    if-eqz v13, :cond_1c3

    instance-of v0, v13, Landroid/os/Bundle;

    if-eqz v0, :cond_23d

    :cond_1c3
    check-cast v13, Landroid/os/Bundle;

    invoke-virtual {v2, v11}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lurh;

    if-eqz v0, :cond_23d

    invoke-virtual {v2, v11}, Landroid/util/SparseArray;->remove(I)V

    invoke-virtual {v0, v13}, Lurh;->a(Landroid/os/Bundle;)V

    goto :goto_23d

    :pswitch_1d4
    if-eqz v13, :cond_1da

    instance-of v1, v13, Landroid/os/Bundle;

    if-eqz v1, :cond_23d

    :cond_1da
    check-cast v13, Landroid/os/Bundle;

    iget v1, v0, Lsrh;->f:I

    if-nez v1, :cond_23d

    iget v1, v0, Lsrh;->g:I

    if-ne v11, v1, :cond_23d

    if-lt v12, v7, :cond_23d

    iput v6, v0, Lsrh;->g:I

    iput v12, v0, Lsrh;->f:I

    invoke-static {v13}, Lmi9;->a(Landroid/os/Bundle;)Lmi9;

    move-result-object v1

    iget-object v2, v8, Lxrh;->n:Lsrh;

    if-ne v2, v0, :cond_1f5

    invoke-virtual {v8, v1}, Lund;->f(Lmi9;)V

    :cond_1f5
    iget-object v1, v8, Lxrh;->n:Lsrh;

    if-ne v1, v0, :cond_23d

    iput-boolean v7, v8, Lxrh;->o:Z

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_1ff
    if-ge v6, v0, :cond_20f

    invoke-virtual {v9, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltrh;

    iget-object v2, v8, Lxrh;->n:Lsrh;

    invoke-interface {v1, v2}, Ltrh;->a(Lsrh;)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_1ff

    :cond_20f
    iget-object v0, v8, Lund;->e:Ldnd;

    if-eqz v0, :cond_23d

    iget-object v1, v8, Lxrh;->n:Lsrh;

    iget v3, v1, Lsrh;->d:I

    add-int/lit8 v2, v3, 0x1

    iput v2, v1, Lsrh;->d:I

    iget-object v5, v0, Ldnd;->a:Landroid/os/Bundle;

    const/4 v6, 0x0

    const/16 v2, 0xa

    const/4 v4, 0x0

    invoke-virtual/range {v1 .. v6}, Lsrh;->b(IIILjava/lang/Object;Landroid/os/Bundle;)Z

    goto :goto_23d

    :cond_225
    iget v1, v0, Lsrh;->g:I

    if-ne v11, v1, :cond_232

    iput v6, v0, Lsrh;->g:I

    iget-object v1, v8, Lxrh;->n:Lsrh;

    if-ne v1, v0, :cond_232

    invoke-virtual {v8}, Lxrh;->k()V

    :cond_232
    invoke-virtual {v2, v11}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lurh;

    if-eqz v0, :cond_23d

    invoke-virtual {v2, v11}, Landroid/util/SparseArray;->remove(I)V

    :cond_23d
    :goto_23d
    return-void

    :pswitch_23e
    iget-object v0, v0, Lxy0;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhq9;

    if-eqz v0, :cond_3c9

    iget-object v2, v0, Lhq9;->b:Lxr5;

    iget v1, v1, Landroid/os/Message;->what:I

    iget-object v8, v0, Lhq9;->g:Lqt6;

    iget-object v9, v0, Lhq9;->a:Lgq9;

    invoke-virtual {v2}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v10

    iget-object v11, v2, Lxr5;->c:Lh7f;

    if-eq v1, v7, :cond_289

    if-eq v1, v4, :cond_267

    if-ne v1, v3, :cond_3c9

    iget-short v1, v0, Lhq9;->h:S

    if-eq v10, v1, :cond_3c9

    iput-short v1, v0, Lhq9;->h:S

    invoke-virtual {v2, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto/16 :goto_3c9

    :cond_267
    invoke-virtual {v11, v9}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v0, v8, Lqt6;->f:Ljava/lang/Object;

    check-cast v0, Lhq9;

    iput-short v6, v0, Lhq9;->h:S

    iget-object v0, v0, Lhq9;->b:Lxr5;

    invoke-virtual {v0, v6}, Landroid/view/View;->setSystemUiVisibility(I)V

    iget-object v0, v8, Lqt6;->d:Ljava/lang/Object;

    check-cast v0, Li18;

    invoke-virtual {v0}, Li18;->M()V

    iget-object v0, v8, Lqt6;->e:Ljava/lang/Object;

    check-cast v0, Loml;

    if-eqz v0, :cond_3c9

    invoke-virtual {v0, v6}, Loml;->cancel(Z)Z

    iput-object v5, v8, Lqt6;->e:Ljava/lang/Object;

    goto/16 :goto_3c9

    :cond_289
    iget-object v0, v8, Lqt6;->f:Ljava/lang/Object;

    check-cast v0, Lhq9;

    iget-object v1, v0, Lhq9;->b:Lxr5;

    iget-object v2, v8, Lqt6;->c:Ljava/lang/Object;

    move-object v13, v2

    check-cast v13, Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v13}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v2

    if-nez v2, :cond_3c6

    iget-boolean v2, v8, Lqt6;->a:Z

    if-nez v2, :cond_2a1

    const/16 v2, 0x1406

    goto :goto_2a3

    :cond_2a1
    const/16 v2, 0x1404

    :goto_2a3
    iput-short v2, v0, Lhq9;->h:S

    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    iget-boolean v2, v8, Lqt6;->b:Z

    if-nez v2, :cond_3a9

    iget-object v2, v8, Lqt6;->d:Ljava/lang/Object;

    check-cast v2, Li18;

    invoke-virtual {v13}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v3

    invoke-interface {v3}, Lorg/chromium/content_public/browser/WebContents;->f0()Z

    move-result v3

    if-nez v3, :cond_3a9

    invoke-virtual {v13}, Lcom/opera/android/browser/chromium/ChromiumContent;->m()Lorg/chromium/url/GURL;

    move-result-object v3

    invoke-virtual {v13}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v4

    invoke-interface {v4}, Lorg/chromium/content_public/browser/WebContents;->I()Lorg/chromium/content_public/browser/RenderFrameHost;

    move-result-object v4

    invoke-interface {v4}, Lorg/chromium/content_public/browser/RenderFrameHost;->d()Lorg/chromium/url/Origin;

    move-result-object v4

    if-eqz v4, :cond_2d5

    sget-object v10, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v3, v4}, LJ/N;->MlKpOXRH(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/chromium/url/Origin;

    goto :goto_2db

    :cond_2d5
    invoke-static {v3}, LJ/N;->Me$8dlre(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/chromium/url/Origin;

    :goto_2db
    iget-boolean v10, v4, Lorg/chromium/url/Origin;->d:Z

    if-nez v10, :cond_2e2

    iget-object v4, v4, Lorg/chromium/url/Origin;->b:Ljava/lang/String;

    goto :goto_2e4

    :cond_2e2
    const-string v4, ""

    :goto_2e4
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_2f0

    iget-object v4, v3, Lorg/chromium/url/GURL;->a:Ljava/lang/String;

    invoke-static {v4}, Lwqm;->H(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :cond_2f0
    iget-boolean v10, v13, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    if-nez v10, :cond_308

    iget-object v10, v2, Li18;->d:Lki;

    iget-object v10, v10, Lki;->b:Ljava/lang/Object;

    check-cast v10, Lpw3;

    invoke-virtual {v10}, Lpw3;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lydn;

    iget-object v10, v10, Lydn;->d:Lvdn;

    invoke-virtual {v10}, Lvdn;->a()Z

    move-result v10

    if-eqz v10, :cond_30a

    :cond_308
    move v10, v6

    goto :goto_30b

    :cond_30a
    move v10, v7

    :goto_30b
    sget-object v12, Lq9n;->c:Ll5b;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v12

    :goto_311
    if-eqz v12, :cond_327

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v14

    const-class v15, Lcom/opera/android/RootView;

    invoke-virtual {v15, v14}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v14

    if-eqz v14, :cond_322

    check-cast v12, Landroid/view/View;

    goto :goto_328

    :cond_322
    invoke-interface {v12}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v12

    goto :goto_311

    :cond_327
    move-object v12, v5

    :goto_328
    if-eqz v12, :cond_331

    const v14, 0x7f0a0a8c

    invoke-virtual {v12, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    :cond_331
    if-nez v12, :cond_334

    move-object v12, v1

    :cond_334
    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    new-instance v14, Lsxh;

    const v15, 0x7f141145

    invoke-direct {v14, v15, v4}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    new-instance v15, Le18;

    invoke-direct {v15, v12, v14}, Le18;-><init>(Landroid/view/View;Lsxh;)V

    invoke-static {v12, v14, v6, v5}, Lgtj;->d(Landroid/view/View;Lpxh;ILandroid/view/View;)Lgtj;

    move-result-object v14

    new-instance v4, Lyk4;

    const/16 v12, 0x12

    invoke-direct {v4, v13, v12}, Lyk4;-><init>(Ljava/lang/Object;B)V

    const v12, 0x7f140a2b

    invoke-virtual {v14, v12, v4}, Lgtj;->f(ILandroid/view/View$OnClickListener;)V

    new-instance v4, Lh18;

    invoke-direct {v4, v15, v2, v10, v3}, Lh18;-><init>(Le18;Li18;ZLorg/chromium/url/GURL;)V

    iget-object v3, v14, Lgtj;->a:Lasj;

    invoke-virtual {v3, v4}, Lna3;->a(Lzrj;)V

    invoke-virtual {v14, v1}, Lgtj;->b(Landroid/view/View;)V

    iget-object v1, v2, Li18;->a:Lumi;

    new-instance v3, Lcn7;

    const/4 v4, 0x5

    invoke-direct {v3, v2, v14, v4}, Lcn7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v1, v3}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v1

    new-instance v3, Loml;

    invoke-direct {v3, v1}, Loml;-><init>(Lnml;)V

    new-instance v1, Lig;

    const/16 v4, 0x19

    invoke-direct {v1, v2, v4}, Lig;-><init>(Ljava/lang/Object;B)V

    iget-boolean v4, v13, Lcom/opera/android/browser/chromium/ChromiumContent;->S:Z

    if-eqz v4, :cond_384

    iput-boolean v7, v15, Le18;->e:Z

    invoke-virtual {v15, v6}, Le18;->b(Z)V

    :cond_384
    new-instance v12, Lf18;

    move-object/from16 v17, v1

    move-object/from16 v16, v3

    invoke-direct/range {v12 .. v17}, Lf18;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lgtj;Le18;Loml;Lig;)V

    move-object/from16 v1, v16

    move-object/from16 v3, v17

    iput-object v12, v2, Li18;->f:Lf18;

    sget-wide v6, Li18;->h:J

    invoke-static {v1, v5, v6, v7}, Lcoh;->k(Loml;Ljava/lang/Object;J)V

    sget-object v1, Lc18;->a:Lc18;

    invoke-virtual {v13}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v4

    new-instance v5, Lg18;

    invoke-direct {v5, v3}, Lg18;-><init>(Lig;)V

    invoke-virtual {v1, v4, v5}, Lc18;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v13, v2}, Lcom/opera/android/browser/chromium/ChromiumContent;->k(Liz4;)V

    :cond_3a9
    iget-object v0, v0, Lhq9;->c:Lumi;

    new-instance v1, Lld9;

    const/16 v2, 0x8

    invoke-direct {v1, v8, v2}, Lld9;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v1, Loml;

    invoke-direct {v1, v0}, Loml;-><init>(Lnml;)V

    iput-object v1, v8, Lqt6;->e:Ljava/lang/Object;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v6, 0x0

    const/4 v2, 0x0

    const-wide/16 v3, 0xc9

    invoke-virtual/range {v1 .. v6}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    :cond_3c6
    invoke-virtual {v11, v9}, Lh7f;->b(Ljava/lang/Object;)Z

    :cond_3c9
    :goto_3c9
    return-void

    :pswitch_3ca
    iget v2, v1, Landroid/os/Message;->what:I

    const/4 v3, -0x3

    if-eq v2, v3, :cond_3df

    const/4 v3, -0x2

    if-eq v2, v3, :cond_3df

    const/4 v3, -0x1

    if-eq v2, v3, :cond_3df

    if-ne v2, v7, :cond_3f0

    iget-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/content/DialogInterface;

    invoke-interface {v0}, Landroid/content/DialogInterface;->dismiss()V

    goto :goto_3f0

    :cond_3df
    iget-object v2, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/content/DialogInterface$OnClickListener;

    iget-object v0, v0, Lxy0;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/DialogInterface;

    iget v1, v1, Landroid/os/Message;->what:I

    invoke-interface {v2, v0, v1}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    :cond_3f0
    :goto_3f0
    return-void

    nop

    :pswitch_data_3f2
    .packed-switch 0x0
        :pswitch_3ca
        :pswitch_23e
        :pswitch_5f
    .end packed-switch

    :pswitch_data_3fc
    .packed-switch 0x2
        :pswitch_1d4
        :pswitch_1bd
        :pswitch_19e
        :pswitch_185
        :pswitch_162
        :pswitch_c6
        :pswitch_82
    .end packed-switch
.end method
