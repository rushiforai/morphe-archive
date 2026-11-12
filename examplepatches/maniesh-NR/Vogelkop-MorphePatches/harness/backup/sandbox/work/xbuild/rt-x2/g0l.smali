.class public final Lg0l;
.super Lryl;
.source "SourceFile"

# interfaces
.implements Lucl;


# instance fields
.field public final c:Landroid/content/Intent;

.field public final d:Ljcj;

.field public final e:Ljava/util/ArrayList;

.field public f:Lup1;

.field public g:Z

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Intent;Ljcj;Ljava/util/ArrayList;)V
    .registers 4

    invoke-direct {p0}, Lryl;-><init>()V

    iput-object p1, p0, Lg0l;->c:Landroid/content/Intent;

    iput-object p2, p0, Lg0l;->d:Ljcj;

    iput-object p3, p0, Lg0l;->e:Ljava/util/ArrayList;

    new-instance p1, Lup1;

    const/16 p2, 0x13

    invoke-direct {p1, p0, p2}, Lup1;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lg0l;->f:Lup1;

    return-void
.end method


# virtual methods
.method public final h0(Landroidx/fragment/app/w;)V
    .registers 2

    invoke-virtual {p1}, Landroidx/fragment/app/w;->U()V

    return-void
.end method

.method public final onDestroy()V
    .registers 3

    invoke-super {p0}, Lryl;->onDestroy()V

    iget-object v0, p0, Lg0l;->f:Lup1;

    if-nez v0, :cond_8

    return-void

    :cond_8
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lg0l;->f:Lup1;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lg0l;->f:Lup1;

    return-void
.end method

.method public final onResume()V
    .registers 15

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    iget-boolean v0, p0, Lg0l;->g:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_4b

    iget-object v0, p0, Lg0l;->f:Lup1;

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Lg0l;->f:Lup1;

    invoke-virtual {v0, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-object v1, p0, Lg0l;->f:Lup1;

    :cond_17
    iget-object v0, p0, Lg0l;->h:Ljava/lang/String;

    iget-object v1, p0, Lg0l;->d:Ljcj;

    if-eqz v0, :cond_42

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->Q0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzcj;

    iget-object v2, p0, Lg0l;->h:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lzcj;->e(Ljava/lang/String;)V

    iget-object v0, p0, Lg0l;->h:Ljava/lang/String;

    iput-object v0, v1, Ljcj;->d:Ljava/lang/String;

    sget-object v0, Lhjm;->a:Lhjm;

    invoke-virtual {v1, v0}, Ljcj;->finish(Lhjm;)V

    goto :goto_47

    :cond_42
    sget-object v0, Lhjm;->b:Lhjm;

    invoke-virtual {v1, v0}, Ljcj;->finish(Lhjm;)V

    :goto_47
    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :cond_4b
    const/4 v0, 0x1

    iput-boolean v0, p0, Lg0l;->g:Z

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lg0l;->f:Lup1;

    new-instance v4, Landroid/content/IntentFilter;

    const-string v8, "com.opera.share.SHARE_ACTION"

    invoke-direct {v4, v8}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v6, 0x0

    const/4 v7, 0x4

    const/4 v5, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v3

    const/high16 v4, 0x8000000

    sget v5, Lw8g;->a:I

    or-int/2addr v5, v4

    const/4 v4, 0x0

    invoke-static {v3, v4, v2, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    iget-object v3, p0, Lg0l;->c:Landroid/content/Intent;

    invoke-virtual {v2}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v2

    invoke-static {v3, v1, v2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;Landroid/content/IntentSender;)Landroid/content/Intent;

    move-result-object v1

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x22

    if-lt v2, v3, :cond_100

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v3, p0, Lg0l;->e:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v6, v4

    :goto_9c
    if-ge v6, v5, :cond_f3

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Lan8;

    sget-object v9, Lt8;->a:Landroid/content/Context;

    new-instance v10, Landroid/content/Intent;

    invoke-direct {v10, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v9}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0x21

    if-ge v9, v11, :cond_c9

    invoke-static {v10}, Lc26;->x(Landroid/content/Intent;)Z

    move-result v9

    if-eqz v9, :cond_c9

    const-string v9, "trusted_application_code_extra"

    invoke-static {}, Lc26;->p()Landroid/app/PendingIntent;

    move-result-object v11

    invoke-virtual {v10, v9, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    :cond_c9
    const-string v9, "EXTRA_SHARE_TARGET_ID"

    invoke-interface {v7}, Lwcj;->getId()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v9, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v7, v9}, Lan8;->e(Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    move-result-object v11

    invoke-interface {v7, v9}, Lwcj;->d(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    add-int/lit8 v12, v0, 0x1

    const/high16 v13, 0x54000000

    invoke-static {v9, v0, v10, v13}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    invoke-static {v11, v7, v0}, Lg8;->E(Landroid/graphics/drawable/Icon;Ljava/lang/String;Landroid/app/PendingIntent;)Landroid/os/Parcelable;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v0, v12

    goto :goto_9c

    :cond_f3
    new-array v0, v4, [Landroid/os/Parcelable;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/os/Parcelable;

    const-string v2, "android.intent.extra.CHOOSER_CUSTOM_ACTIONS"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Landroid/os/Parcelable;)Landroid/content/Intent;

    :cond_100
    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
