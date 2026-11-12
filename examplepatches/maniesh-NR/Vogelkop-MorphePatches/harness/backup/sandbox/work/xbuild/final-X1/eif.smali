.class public abstract Leif;
.super Landroid/appwidget/AppWidgetProvider;
.source "SourceFile"


# static fields
.field public static final synthetic a:I


# virtual methods
.method public a(Landroid/content/Context;)I
    .registers 2

    invoke-static {p1}, Lcom/opera/android/BrowserAppWidget;->d(Landroid/content/Context;)I

    move-result p0

    return p0
.end method

.method public b(Landroid/content/Context;)V
    .registers 4

    sget-object p0, Lvml;->d:Lumi;

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v0, v1, p0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p0, Liv0;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Liv0;-><init>(Landroid/content/Context;B)V

    invoke-virtual {v0, p0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    new-instance v0, Liv0;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Liv0;-><init>(Landroid/content/Context;B)V

    invoke-virtual {p0, v0}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void
.end method

.method public c(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    .registers 15

    array-length p0, p3

    const/4 v0, 0x0

    move v1, v0

    :goto_3
    if-ge v1, p0, :cond_cb

    aget v2, p3, v1

    new-instance v3, Landroid/widget/RemoteViews;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-static {p1}, Lcom/opera/android/BrowserAppWidget;->d(Landroid/content/Context;)I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    new-instance v4, Landroid/content/Intent;

    const-string v5, "com.opera.android.action.SEARCH_FROM_WIDGET"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v5, 0x10000000

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-class v6, Lcom/opera/android/BrowserActivity;

    invoke-virtual {v4, p1, v6}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    const-string v7, "query"

    const-string v8, ""

    invoke-virtual {v4, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v7, 0xc000000

    invoke-static {p1, v0, v4, v7}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    const v8, 0x7f0a08b4

    invoke-virtual {v3, v8, v4}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    invoke-static {p1}, Lwxe;->J(Landroid/content/Context;)Z

    move-result v4

    const/16 v8, 0x8

    const v9, 0x7f0a08b5

    if-eqz v4, :cond_58

    new-instance v4, Landroid/content/Intent;

    const-string v10, "com.opera.android.action.VOICE_SEARCH_FROM_WIDGET"

    invoke-direct {v4, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {v4, p1, v6}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-static {p1, v0, v4, v7}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    invoke-virtual {v3, v9, v4}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    goto :goto_5b

    :cond_58
    invoke-virtual {v3, v9, v8}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    :goto_5b
    invoke-static {p1}, Lr9n;->A(Landroid/content/Context;)Z

    move-result v4

    const v9, 0x7f0a08b6

    if-eqz v4, :cond_a1

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v4

    iget-object v4, v4, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v8, "qr.google_lens_supported"

    invoke-interface {v4, v8, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    new-instance v8, Landroid/content/Intent;

    const-string v10, "com.opera.android.action.SCAN_QR_CODE_FROM_WIDGET"

    invoke-direct {v8, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {v8, p1, v6}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-static {p1, v0, v8, v7}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    invoke-virtual {v3, v9, v5}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    if-eqz v4, :cond_8a

    const v5, 0x7f0805e3

    goto :goto_8d

    :cond_8a
    const v5, 0x7f080579

    :goto_8d
    invoke-virtual {v3, v9, v5}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    if-eqz v4, :cond_96

    const v4, 0x7f1408ac

    goto :goto_99

    :cond_96
    const v4, 0x7f140ef4

    :goto_99
    invoke-virtual {p1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v9, v4}, Landroid/widget/RemoteViews;->setContentDescription(ILjava/lang/CharSequence;)V

    goto :goto_a4

    :cond_a1
    invoke-virtual {v3, v9, v8}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    :goto_a4
    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/opera/android/settings/SettingsManager;->e()Ld7j;

    move-result-object v4

    sget-object v5, Ld7j;->g:Ld7j;

    if-ne v4, v5, :cond_bc

    const v4, 0x7f080920

    goto :goto_be

    :cond_bc
    iget v4, v4, Ld7j;->b:I

    :goto_be
    const v5, 0x7f0a08ca

    invoke-virtual {v3, v5, v4}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    invoke-virtual {p2, v2, v3}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(ILandroid/widget/RemoteViews;)V

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_3

    :cond_cb
    return-void
.end method

.method public onAppWidgetOptionsChanged(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;ILandroid/os/Bundle;)V
    .registers 6

    new-instance p4, Landroid/widget/RemoteViews;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1}, Leif;->a(Landroid/content/Context;)I

    move-result p0

    invoke-direct {p4, v0, p0}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    invoke-virtual {p2, p3, p4}, Landroid/appwidget/AppWidgetManager;->partiallyUpdateAppWidget(ILandroid/widget/RemoteViews;)V

    return-void
.end method

.method public final onDeleted(Landroid/content/Context;[I)V
    .registers 3

    invoke-virtual {p0, p1}, Leif;->b(Landroid/content/Context;)V

    return-void
.end method

.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 4

    invoke-static {p1}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-super {p0, p1, p2}, Landroid/appwidget/AppWidgetProvider;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public final onUpdate(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    .registers 6

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    instance-of v1, v0, Lcom/opera/android/OperaApplication;

    if-eqz v1, :cond_b

    check-cast v0, Lcom/opera/android/OperaApplication;

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    if-nez v0, :cond_f

    return-void

    :cond_f
    invoke-virtual {p0, p1, p2, p3}, Leif;->c(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V

    invoke-virtual {p0, p1}, Leif;->b(Landroid/content/Context;)V

    return-void
.end method
