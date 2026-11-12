.class public final Lcom/opera/android/minigame/appwidget/JumpMinigameAppWidget;
.super Leif;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/opera/android/minigame/appwidget/JumpMinigameAppWidget;",
        "Leif;",
        "<init>",
        "()V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/appwidget/AppWidgetProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)I
    .registers 2

    const p0, 0x7f0d0233

    return p0
.end method

.method public final b(Landroid/content/Context;)V
    .registers 7

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lsfe;->k0(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_c

    const/4 p0, 0x0

    goto :goto_20

    :cond_c
    invoke-static {p1}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object p0

    new-instance v0, Landroid/content/ComponentName;

    const-class v1, Lcom/opera/android/minigame/appwidget/JumpMinigameAppWidget;

    invoke-direct {v0, p1, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/appwidget/AppWidgetManager;->getAppWidgetIds(Landroid/content/ComponentName;)[I

    move-result-object p0

    array-length p0, p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    :goto_20
    if-eqz p0, :cond_5d

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p1, p1, Lxv1;->T:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Latb;

    iget-object p1, p1, Latb;->b:Lx5f;

    iget-boolean v0, p1, Lx5f;->h:Z

    if-eqz v0, :cond_5d

    iget-object v0, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v2, Lck0;

    invoke-direct {v2, v0, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v0, v2, Lck0;->e:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lun0;

    int-to-long v2, p0

    iget-object p0, v0, Lun0;->b:Lsn0;

    const/16 v0, 0xd

    const/4 v4, 0x1

    invoke-virtual {p0, v0, v4, v2, v3}, Ljf0;->p(IIJ)V

    invoke-virtual {p1, v1}, Lx5f;->U0(Lx56;)V

    :cond_5d
    return-void
.end method

.method public final c(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    .registers 11

    array-length p0, p3

    const/4 v0, 0x0

    move v1, v0

    :goto_3
    if-ge v1, p0, :cond_3d

    aget v2, p3, v1

    new-instance v3, Landroid/widget/RemoteViews;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const v5, 0x7f0d0233

    invoke-direct {v3, v4, v5}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    new-instance v4, Landroid/content/Intent;

    const-string v5, "com.opera.android.action.JUMP_MINIGAME_WIDGET"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v5, 0x10000000

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-class v5, Lcom/opera/android/BrowserActivity;

    invoke-virtual {v4, p1, v5}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    const-string v5, "com.opera.android.action.EXTRA_FORCE_SHOW_FRAGMENT_IMMEDIATELY"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v5, 0xc000000

    invoke-static {p1, v0, v4, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    const v5, 0x7f0a0d2d

    invoke-virtual {v3, v5, v4}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    invoke-virtual {p2, v2, v3}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(ILandroid/widget/RemoteViews;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_3d
    return-void
.end method
