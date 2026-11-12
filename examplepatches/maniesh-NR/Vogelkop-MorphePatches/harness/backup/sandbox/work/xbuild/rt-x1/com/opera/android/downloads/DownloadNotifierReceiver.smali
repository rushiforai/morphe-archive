.class public Lcom/opera/android/downloads/DownloadNotifierReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# static fields
.field public static final synthetic a:I


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 7

    invoke-static {p1}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_c2

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p0

    const-string v0, "com.opera.android.action.DOWNLOAD_NOTIFICATION_DELETED"

    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_67

    const-string p0, "group"

    const/4 v0, -0x1

    invoke-virtual {p2, p0, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p0

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p2

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object p1, p1, Ld6j;->c:Lx5f;

    iget-object v1, p2, Lsf7;->a:Lrf7;

    iget-object v2, v1, Lrf7;->j:Lnc0;

    if-nez v2, :cond_4d

    iget-object v2, v1, Lrf7;->h:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v3, "last_downloaded_file_type"

    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-eq v2, v0, :cond_4d

    invoke-static {v2}, Lnc0;->a(I)Lnc0;

    move-result-object v0

    iput-object v0, v1, Lrf7;->j:Lnc0;

    :cond_4d
    iget-object v0, v1, Lrf7;->j:Lnc0;

    iget-boolean v1, p1, Lx5f;->h:Z

    if-eqz v1, :cond_58

    sget-object v1, Lqc0;->d:Lqc0;

    invoke-virtual {p1, v1, v0}, Lx5f;->P(Lqc0;Lnc0;)V

    :cond_58
    iget-object p1, p2, Lsf7;->b:Ligi;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lvf7;->values()[Lvf7;

    move-result-object p2

    aget-object p0, p2, p0

    invoke-virtual {p1, p0}, Ligi;->q(Lvf7;)V

    return-void

    :cond_67
    const-string v0, "com.opera.android.action.PAUSE_ACTIVE_DOWNLOADS"

    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_81

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p0

    iget-object p0, p0, Lsf7;->a:Lrf7;

    invoke-virtual {p0}, Lrf7;->r()V

    return-void

    :cond_81
    const-string v0, "com.opera.android.action.RESUME_FAILED_DOWNLOADS"

    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_b6

    const-string p0, "to-resume"

    invoke-virtual {p2, p0}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_c2

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p1

    iget-object p1, p1, Lsf7;->a:Lrf7;

    array-length p2, p0

    const/4 v0, 0x0

    move v1, v0

    :goto_a2
    if-ge v1, p2, :cond_c2

    aget-object v2, p0, v1

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {p1, v2, v0}, Lrf7;->e(Landroid/net/Uri;I)Lre7;

    move-result-object v2

    if-eqz v2, :cond_b3

    invoke-virtual {v2}, Lre7;->u()V

    :cond_b3
    add-int/lit8 v1, v1, 0x1

    goto :goto_a2

    :cond_b6
    const-string p2, "com.opera.android.action.RESUME_DOWNLOADS"

    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_c2

    const/4 p0, 0x1

    invoke-static {p1, p0}, Lcom/opera/android/downloads/DownloadService;->d(Landroid/content/Context;Z)V

    :cond_c2
    return-void
.end method
