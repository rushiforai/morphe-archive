.class public final Lcom/opera/android/aiassistant/appwidget/AiAssistantAppWidget;
.super Leif;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/opera/android/aiassistant/appwidget/AiAssistantAppWidget;",
        "Leif;",
        "<init>",
        "()V",
        "k1g",
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


# static fields
.field public static final synthetic b:I


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/appwidget/AppWidgetProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)I
    .registers 2

    invoke-static {p1}, Lk1g;->t(Landroid/content/Context;)I

    move-result p0

    return p0
.end method

.method public final c(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    .registers 13

    array-length p0, p3

    const/4 v0, 0x0

    move v1, v0

    :goto_3
    if-ge v1, p0, :cond_52

    aget v2, p3, v1

    new-instance v3, Landroid/widget/RemoteViews;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-static {p1}, Lk1g;->t(Landroid/content/Context;)I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    const-string v4, "com.opera.android.action.AI_WIDGET_KEYBOARD"

    invoke-static {p1, v4}, Lkfo;->R(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    const-string v5, "com.opera.android.action.EXTRA_FORCE_SHOW_FRAGMENT_IMMEDIATELY"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v7, 0xc000000

    invoke-static {p1, v0, v4, v7}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    const v8, 0x7f0a08bf

    invoke-virtual {v3, v8, v4}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    invoke-static {p1}, Lwxe;->J(Landroid/content/Context;)Z

    move-result v4

    const v8, 0x7f0a08b5

    if-eqz v4, :cond_47

    const-string v4, "com.opera.android.action.AI_WIDGET_VOICE"

    invoke-static {p1, v4}, Lkfo;->R(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p1, v0, v4, v7}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    invoke-virtual {v3, v8, v4}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    goto :goto_4c

    :cond_47
    const/16 v4, 0x8

    invoke-virtual {v3, v8, v4}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    :goto_4c
    invoke-virtual {p2, v2, v3}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(ILandroid/widget/RemoteViews;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_52
    return-void
.end method
