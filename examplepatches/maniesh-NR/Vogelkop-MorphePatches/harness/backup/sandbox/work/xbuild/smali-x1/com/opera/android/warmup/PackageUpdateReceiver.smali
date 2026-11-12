.class public Lcom/opera/android/warmup/PackageUpdateReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 4

    invoke-static {p1}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_be

    if-eqz p2, :cond_be

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p0

    const-string p2, "android.intent.action.MY_PACKAGE_REPLACED"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_be

    sget p0, Lcom/opera/android/notifications/channels/ChannelsUpdateService;->f:I

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-class p2, Landroid/app/job/JobScheduler;

    invoke-virtual {p0, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/job/JobScheduler;

    const/16 v0, 0x3f1

    invoke-virtual {p0, v0}, Landroid/app/job/JobScheduler;->cancel(I)V

    invoke-static {p1}, Lcom/opera/android/notifications/channels/ChannelsUpdateWorker;->d(Landroid/content/Context;)V

    sget p0, Lcom/opera/android/warmup/UpdateLibraryService;->f:I

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/job/JobScheduler;

    const/16 v0, 0x3ee

    invoke-virtual {p0, v0}, Landroid/app/job/JobScheduler;->cancel(I)V

    sget p0, Lcom/opera/android/news/newsfeed/internal/NewsPushUploaderService;->f:I

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/job/JobScheduler;

    const/16 p2, 0x3ed

    invoke-virtual {p0, p2}, Landroid/app/job/JobScheduler;->cancel(I)V

    invoke-static {p1}, Lcom/opera/android/startup/InstallSplitLocaleActivity;->K(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_77

    const-string p0, "localize"

    const/4 p2, 0x0

    invoke-virtual {p1, p0, p2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string p2, "language_code"

    const/4 v0, 0x0

    invoke-interface {p0, p2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lwwc;->f(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object p0

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->K()Lr0k;

    move-result-object p2

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p2, p0}, Lr0k;->a(Ljava/util/List;)Lcom/google/android/gms/tasks/Task;

    :cond_77
    new-instance p0, Ljava/util/ArrayList;

    const/4 p2, 0x2

    invoke-direct {p0, p2}, Ljava/util/ArrayList;-><init>(I)V

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->K()Lr0k;

    move-result-object p2

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->v()Lfs6;

    move-result-object v0

    iget-object v0, v0, Lfs6;->d:Ljze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_b5

    const v0, 0x7f140a54

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2}, Lr0k;->h()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b5

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_b5
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_be

    invoke-interface {p2, p0}, Lr0k;->k(Ljava/util/ArrayList;)Lcom/google/android/gms/tasks/Task;

    :cond_be
    return-void
.end method
