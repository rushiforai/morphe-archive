.class public Lcom/mygate/user/quickapprove/QuickApproveWidget;
.super Landroid/appwidget/AppWidgetProvider;
.source "QuickApproveWidget.java"

.field private static sPending:Z
.field private static sQueued:I
.field private static sLastStartSeconds:J
.field private static sPhase:Ljava/lang/String;

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Landroid/appwidget/AppWidgetProvider;-><init>()V
    return-void
.end method

.method public onUpdate(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    .locals 1
    invoke-super {p0, p1, p2, p3}, Landroid/appwidget/AppWidgetProvider;->onUpdate(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    const-string v0, "APPROVE\nDELIVERY"
    invoke-static {p1, v0}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->updateWidgets(Landroid/content/Context;Ljava/lang/String;)V
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    invoke-super {p0, p1, p2}, Landroid/appwidget/AppWidgetProvider;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    if-eqz p2, :done
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object v0
    const-string v1, "com.mygate.user.QUICK_APPROVE"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :done
    invoke-direct {p0, p1}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->approve(Landroid/content/Context;)V
    :done
    return-void
.end method

.method private approve(Landroid/content/Context;)V
    .locals 10
    sget-boolean v0, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sPending:Z
    if-eqz v0, :begin
    # This is a distinct tap: queue another request rather than dropping it.
    sget v0, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sQueued:I
    add-int/lit8 v0, v0, 0x1
    sput v0, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sQueued:I
    invoke-static {}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->queuedStatus()Ljava/lang/String;
    move-result-object v0
    invoke-static {p1, v0}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->updateWidgets(Landroid/content/Context;Ljava/lang/String;)V
    return-void

    :begin
    const/4 v0, 0x1
    sput-boolean v0, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sPending:Z

    :try_start
    const-string v0, "PROFILE"
    sput-object v0, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sPhase:Ljava/lang/String;
    invoke-static {}, Lcom/mygate/user/app/AppController;->a()Lcom/mygate/user/app/AppController;
    move-result-object v0
    iget-object v0, v0, Lcom/mygate/user/app/AppController;->g:Lcom/mygate/user/modules/userprofile/entity/UserProfile;
    if-nez v0, :have_profile
    const-string v1, "SIGN IN\nTO MYGATE"
    invoke-static {p1, v1}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->updateWidgets(Landroid/content/Context;Ljava/lang/String;)V
    goto :reset

    :have_profile
    invoke-virtual {v0}, Lcom/mygate/user/modules/userprofile/entity/UserProfile;->getApiKey()Ljava/lang/String;
    move-result-object v9
    sput-object v9, Lcom/mygate/user/rest/ServiceGenerator;->a:Ljava/lang/String;
    invoke-virtual {v0}, Lcom/mygate/user/modules/userprofile/entity/UserProfile;->getUserid()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0}, Lcom/mygate/user/modules/userprofile/entity/UserProfile;->getActiveFlat()Ljava/lang/String;
    move-result-object v2
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    move-result v3
    if-nez v3, :missing_flat
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    move-result v3
    if-eqz v3, :make_data

    :missing_flat
    const-string v3, "SELECT\nA FLAT"
    invoke-static {p1, v3}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->updateWidgets(Landroid/content/Context;Ljava/lang/String;)V
    goto :reset

    :make_data
    const-string v9, "PAYLOAD"
    sput-object v9, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sPhase:Ljava/lang/String;
    new-instance v3, Lcom/mygate/user/modules/notifygate/entity/PreApproveData;
    invoke-direct {v3}, Lcom/mygate/user/modules/notifygate/entity/PreApproveData;-><init>()V
    invoke-virtual {v3, v1}, Lcom/mygate/user/modules/notifygate/entity/PreApproveData;->setUserid(Ljava/lang/String;)V
    invoke-virtual {v3, v2}, Lcom/mygate/user/modules/notifygate/entity/PreApproveData;->setFlatid(Ljava/lang/String;)V
    const-string v4, "1008"
    invoke-virtual {v3, v4}, Lcom/mygate/user/modules/notifygate/entity/PreApproveData;->setUsertypeid(Ljava/lang/String;)V
    const-string v4, "2305"
    invoke-virtual {v3, v4}, Lcom/mygate/user/modules/notifygate/entity/PreApproveData;->setNtype(Ljava/lang/String;)V
    const/4 v4, 0x1
    invoke-virtual {v3, v4}, Lcom/mygate/user/modules/notifygate/entity/PreApproveData;->setIsSurprise(Z)V
    const/4 v4, 0x0
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v4
    invoke-virtual {v3, v4}, Lcom/mygate/user/modules/notifygate/entity/PreApproveData;->setIsMulti(Ljava/lang/Integer;)V
    const-string v4, "0"
    invoke-virtual {v3, v4}, Lcom/mygate/user/modules/notifygate/entity/PreApproveData;->setDelegateDelivery(Ljava/lang/String;)V

    # Distinct start timestamp for each tap, even if the API responds within one second.
    invoke-static {}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->nextStartSeconds()J
    move-result-wide v4
    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;
    move-result-object v8
    invoke-virtual {v3, v8}, Lcom/mygate/user/modules/notifygate/entity/PreApproveData;->setStime(Ljava/lang/String;)V
    const-wide/16 v6, 0xe10
    add-long/2addr v4, v6
    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;
    move-result-object v8
    invoke-virtual {v3, v8}, Lcom/mygate/user/modules/notifygate/entity/PreApproveData;->setEtime(Ljava/lang/String;)V

    const-string v9, "EVENTBUS"
    sput-object v9, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sPhase:Ljava/lang/String;
    sget-object v8, Lcom/mygate/user/utilities/eventbus/EventbusImpl;->c:Lcom/mygate/user/utilities/eventbus/EventbusImpl;
    invoke-virtual {v8, p0}, Lcom/mygate/user/utilities/eventbus/EventbusImpl;->a(Ljava/lang/Object;)V
    const-string v9, "ENGINE"
    sput-object v9, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sPhase:Ljava/lang/String;
    sget-object v8, Lcom/mygate/user/modules/notifygate/manager/NotifyGateManager;->g:Lcom/mygate/user/modules/notifygate/manager/NotifyGateManager;
    iget-object v8, v8, Lcom/mygate/user/modules/notifygate/manager/NotifyGateManager;->c:Lcom/mygate/user/modules/notifygate/engine/NotifyGateEngine;
    sget-object v9, Lcom/mygate/user/utilities/eventbus/EventbusImpl;->c:Lcom/mygate/user/utilities/eventbus/EventbusImpl;
    iput-object v9, v8, Lcom/mygate/user/modules/notifygate/engine/NotifyGateEngine;->a:Lcom/mygate/user/utilities/eventbus/EventbusImpl;
    const-string v9, "SENDING..."
    invoke-static {p1, v9}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->updateWidgets(Landroid/content/Context;Ljava/lang/String;)V
    const-string v9, "REQUEST"
    sput-object v9, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sPhase:Ljava/lang/String;
    invoke-virtual {v8, v3}, Lcom/mygate/user/modules/notifygate/engine/NotifyGateEngine;->m(Lcom/mygate/user/modules/notifygate/entity/PreApproveData;)V
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :error
    return-void

    :reset
    const/4 v1, 0x0
    sput-boolean v1, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sPending:Z
    invoke-static {p1}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->startNextQueued(Landroid/content/Context;)V
    return-void

    :error
    move-exception v0
    const/4 v1, 0x0
    sput-boolean v1, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sPending:Z
    invoke-virtual {v0}, Ljava/lang/Throwable;->getClass()Ljava/lang/Class;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object v2
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "ERROR\n"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    sget-object v4, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sPhase:Ljava/lang/String;
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v4, "\n"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static {p1, v1}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->updateWidgets(Landroid/content/Context;Ljava/lang/String;)V
    sget-object v1, Lcom/mygate/user/utilities/eventbus/EventbusImpl;->c:Lcom/mygate/user/utilities/eventbus/EventbusImpl;
    invoke-virtual {v1, p0}, Lcom/mygate/user/utilities/eventbus/EventbusImpl;->b(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :end
    invoke-virtual {v1, p0}, Lcom/mygate/user/utilities/eventbus/EventbusImpl;->c(Ljava/lang/Object;)V
    :end
    invoke-static {p1}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->startNextQueued(Landroid/content/Context;)V
    return-void
.end method

.method public onQuickApprovalSuccess(Lcom/mygate/user/modules/notifygate/events/engine/IPreApprovalSuccessEngineEvent;)V
    .locals 2
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
    .end annotation
    const/4 v0, 0x0
    sput-boolean v0, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sPending:Z
    invoke-static {}, Lcom/mygate/user/app/AppController;->a()Lcom/mygate/user/app/AppController;
    move-result-object v0
    const-string v1, "APPROVED\n1 HOUR"
    invoke-static {v0, v1}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->updateWidgets(Landroid/content/Context;Ljava/lang/String;)V
    sget-object v0, Lcom/mygate/user/utilities/eventbus/EventbusImpl;->c:Lcom/mygate/user/utilities/eventbus/EventbusImpl;
    invoke-virtual {v0, p0}, Lcom/mygate/user/utilities/eventbus/EventbusImpl;->c(Ljava/lang/Object;)V
    invoke-static {}, Lcom/mygate/user/app/AppController;->a()Lcom/mygate/user/app/AppController;
    move-result-object v0
    invoke-static {v0}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->startNextQueued(Landroid/content/Context;)V
    return-void
.end method

.method public onQuickApprovalFailure(Lcom/mygate/user/modules/notifygate/events/engine/IPreApprovalFailureEngineEvent;)V
    .locals 3
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
    .end annotation
    const/4 v0, 0x0
    sput-boolean v0, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sPending:Z
    invoke-interface {p1}, Lcom/mygate/user/modules/notifygate/events/engine/IPreApprovalFailureEngineEvent;->getMessage()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :have_message
    const-string v0, "Approval failed"
    :have_message
    invoke-static {}, Lcom/mygate/user/app/AppController;->a()Lcom/mygate/user/app/AppController;
    move-result-object v1
    invoke-static {v1, v0}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->updateWidgets(Landroid/content/Context;Ljava/lang/String;)V
    sget-object v2, Lcom/mygate/user/utilities/eventbus/EventbusImpl;->c:Lcom/mygate/user/utilities/eventbus/EventbusImpl;
    invoke-virtual {v2, p0}, Lcom/mygate/user/utilities/eventbus/EventbusImpl;->c(Ljava/lang/Object;)V
    invoke-static {v1}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->startNextQueued(Landroid/content/Context;)V
    return-void
.end method

.method public static updateWidgets(Landroid/content/Context;Ljava/lang/String;)V
    .locals 13
    invoke-static {p0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;
    move-result-object v0
    new-instance v1, Landroid/content/ComponentName;
    const-class v10, Lcom/mygate/user/common/appwidget/security/SecurityWidgetReceiver;
    invoke-direct {v1, p0, v10}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-virtual {v0, v1}, Landroid/appwidget/AppWidgetManager;->getAppWidgetIds(Landroid/content/ComponentName;)[I
    move-result-object v2
    if-eqz v2, :done
    array-length v3, v2
    if-lez v3, :done
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v4
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    const-string v6, "qa_widget"
    const-string v7, "layout"
    invoke-virtual {v5, v6, v7, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v6
    const-string v7, "qa_widget_status"
    const-string v8, "id"
    invoke-virtual {v5, v7, v8, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v7
    const-string v9, "qa_widget_hit"
    invoke-virtual {v5, v9, v8, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v8
    const-string v9, "qa_widget_footer"
    const-string v10, "id"
    invoke-virtual {v5, v9, v10, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v5
    if-eqz v6, :done
    if-eqz v7, :done
    if-eqz v8, :done

    new-instance v9, Landroid/content/Intent;
    const-class v10, Lcom/mygate/user/common/appwidget/security/SecurityWidgetReceiver;
    invoke-direct {v9, p0, v10}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const-string v10, "com.mygate.user.QUICK_APPROVE"
    invoke-virtual {v9, v10}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;
    const-string v10, "approval_token"
    invoke-static {p0}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->getToken(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v11
    invoke-virtual {v9, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    const/4 v10, 0x0
    const v11, 0xc000000
    invoke-static {p0, v10, v9, v11}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;
    move-result-object v11
    const/4 v12, 0x0
    :loop
    if-ge v12, v3, :done
    new-instance v9, Landroid/widget/RemoteViews;
    invoke-direct {v9, v4, v6}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V
    invoke-virtual {v9, v7, p1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V
    if-eqz v5, :no_footer
    invoke-static {p1}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->footerText(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v10
    invoke-virtual {v9, v5, v10}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V
    :no_footer
    invoke-virtual {v9, v8, v11}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V
    aget v10, v2, v12
    invoke-virtual {v0, v10, v9}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(ILandroid/widget/RemoteViews;)V
    add-int/lit8 v12, v12, 0x1
    goto :loop
    :done
    return-void
.end method

.method private static getToken(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    const-string v0, "mygate_quickapprove"
    const/4 v1, 0x0
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    const-string v2, "approval_token"
    const/4 v3, 0x0
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    if-nez v3, :have_token
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;
    move-result-object v3
    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v4
    invoke-interface {v4, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object v4
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :have_token
    return-object v3
.end method

.method public static onWidgetClick(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    const-string v0, "approval_token"
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :end
    invoke-static {p0}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->getToken(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :end
    new-instance v1, Lcom/mygate/user/quickapprove/QuickApproveWidget;
    invoke-direct {v1}, Lcom/mygate/user/quickapprove/QuickApproveWidget;-><init>()V
    invoke-direct {v1, p0}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->approve(Landroid/content/Context;)V
    :end
    return-void
.end method

.method public static isQuickApproveAction(Landroid/content/Intent;)Z
    .locals 2
    if-eqz p0, :false
    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object v0
    const-string v1, "com.mygate.user.QUICK_APPROVE"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    return v0
    :false
    const/4 v0, 0x0
    return v0
.end method


.method public static footerText(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    if-eqz p0, :retry
    const-string v0, "APPROVE"
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :check_send
    const-string v0, "1 HOUR"
    return-object v0
    :check_send
    const-string v0, "QUEUED"
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :check_sending
    const-string v0, "IN QUEUE"
    return-object v0
    :check_sending
    const-string v0, "SENDING"
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :retry
    const-string v0, "WORKING"
    return-object v0
    :retry
    const-string v0, "TAP TO RETRY"
    return-object v0
.end method

.method public static networkFailureDetails(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    if-eqz p0, :original
    sget-boolean v0, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sPending:Z
    if-eqz v0, :original
    const-string v0, "mExceptionType"
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :original
    const-string v0, "message"
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    # Keep the message short enough for the widget and avoid copying full network details.
    const/16 v3, 0x25
    invoke-virtual {v2}, Ljava/lang/String;->length()I
    move-result v4
    if-le v4, v3, :msg_ok
    const/4 v4, 0x0
    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v2
    :msg_ok
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v4, "\n"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
    return-object v5
    :original
    return-object p1
.end method


.method private static queuedStatus()Ljava/lang/String;
    .locals 3
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "QUEUED\n"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    sget v1, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sQueued:I
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " MORE"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    return-object v2
.end method

.method private static startNextQueued(Landroid/content/Context;)V
    .locals 2
    sget v0, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sQueued:I
    if-lez v0, :done
    add-int/lit8 v0, v0, -0x1
    sput v0, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sQueued:I
    new-instance v1, Lcom/mygate/user/quickapprove/QuickApproveWidget;
    invoke-direct {v1}, Lcom/mygate/user/quickapprove/QuickApproveWidget;-><init>()V
    invoke-direct {v1, p0}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->approve(Landroid/content/Context;)V
    :done
    return-void
.end method


.method private static nextStartSeconds()J
    .locals 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v0
    const-wide/16 v2, 0x3e8
    div-long/2addr v0, v2
    sget-wide v2, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sLastStartSeconds:J
    cmp-long v4, v0, v2
    if-lez v4, :advance
    sput-wide v0, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sLastStartSeconds:J
    return-wide v0
    :advance
    const-wide/16 v4, 0x1
    add-long/2addr v2, v4
    sput-wide v2, Lcom/mygate/user/quickapprove/QuickApproveWidget;->sLastStartSeconds:J
    return-wide v2
.end method
