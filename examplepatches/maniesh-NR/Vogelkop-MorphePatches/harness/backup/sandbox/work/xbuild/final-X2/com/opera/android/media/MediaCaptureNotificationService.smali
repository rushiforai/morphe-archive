.class public Lcom/opera/android/media/MediaCaptureNotificationService;
.super Landroid/app/Service;
.source "SourceFile"


# static fields
.field public static final synthetic e:I


# instance fields
.field public a:Landroid/app/NotificationManager;

.field public b:Landroid/content/Context;

.field public c:Landroid/content/SharedPreferences;

.field public final d:Landroid/util/SparseIntArray;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lcom/opera/android/media/MediaCaptureNotificationService;->d:Landroid/util/SparseIntArray;

    return-void
.end method

.method public static b(Ldx3;IILjava/lang/String;)V
    .registers 8

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    if-nez p2, :cond_21

    sget-object v2, Lht5;->a:Landroid/content/SharedPreferences;

    const-string v3, "WebRTCNotificationIds"

    invoke-static {v2, v3, v1}, Lw1h;->o(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v2

    if-eqz v2, :cond_8c

    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_8c

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8c

    :cond_21
    instance-of v2, p0, Lcom/opera/android/webapps/WebappActivity;

    if-eqz v2, :cond_2a

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    goto :goto_3e

    :cond_2a
    const/high16 v2, -0x80000000

    if-eq p1, v2, :cond_3d

    invoke-static {p0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    const-string v3, "com.opera.android.action.ACTIVATE_TAB"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v3, "tabId"

    invoke-virtual {v2, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto :goto_3e

    :cond_3d
    move-object v2, v1

    :goto_3e
    if-eqz v2, :cond_46

    const/high16 v1, 0x4000000

    invoke-static {p0, p1, v2, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    :cond_46
    new-instance p0, Landroid/content/Intent;

    const-class v2, Lcom/opera/android/media/MediaCaptureNotificationService;

    invoke-direct {p0, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "org.chromium.chrome.browser.media.SCREEN_CAPTURE_UPDATE"

    invoke-virtual {p0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "NotificationId"

    invoke-virtual {p0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    :try_start_57
    new-instance p1, Ljava/net/URL;

    invoke-direct {p1, p3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3
    :try_end_78
    .catch Ljava/net/MalformedURLException; {:try_start_57 .. :try_end_78} :catch_78

    :catch_78
    const-string p1, "NotificationMediaUrl"

    invoke-virtual {p0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "NotificationMediaType"

    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    if-eqz v1, :cond_89

    const-string p1, "NotificationTabIntent"

    invoke-virtual {p0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    :cond_89
    invoke-virtual {v0, p0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :cond_8c
    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/media/MediaCaptureNotificationService;->c:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    const-string v2, "WebRTCNotificationIds"

    invoke-static {v0, v2, v1}, Lw1h;->o(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    if-nez v0, :cond_c

    return-void

    :cond_c
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_28

    iget-object v1, p0, Lcom/opera/android/media/MediaCaptureNotificationService;->a:Landroid/app/NotificationManager;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    const-string v4, "MediaCaptureNotificationService"

    invoke-virtual {v1, v4, v3}, Landroid/app/NotificationManager;->cancel(Ljava/lang/String;I)V

    goto :goto_10

    :cond_28
    iget-object p0, p0, Lcom/opera/android/media/MediaCaptureNotificationService;->c:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public final c(IZ)V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/media/MediaCaptureNotificationService;->c:Landroid/content/SharedPreferences;

    const-string v1, "WebRTCNotificationIds"

    invoke-static {v0, v1}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v0

    if-eqz p2, :cond_22

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_22

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_2b

    :cond_22
    if-nez p2, :cond_2b

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_2b
    :goto_2b
    iget-object p0, p0, Lcom/opera/android/media/MediaCaptureNotificationService;->c:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public final onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public final onCreate()V
    .registers 3

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/media/MediaCaptureNotificationService;->b:Landroid/content/Context;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/opera/android/media/MediaCaptureNotificationService;->a:Landroid/app/NotificationManager;

    sget-object v0, Lht5;->a:Landroid/content/SharedPreferences;

    iput-object v0, p0, Lcom/opera/android/media/MediaCaptureNotificationService;->c:Landroid/content/SharedPreferences;

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    return-void
.end method

.method public final onDestroy()V
    .registers 1

    invoke-virtual {p0}, Lcom/opera/android/media/MediaCaptureNotificationService;->a()V

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public final onStartCommand(Landroid/content/Intent;II)I
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    if-eqz v1, :cond_138

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    if-eqz v2, :cond_138

    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "NotificationId"

    const/high16 v4, -0x80000000

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    const-string v4, "NotificationMediaType"

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    const-string v6, "NotificationMediaUrl"

    invoke-virtual {v1, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "org.chromium.chrome.browser.media.SCREEN_CAPTURE_UPDATE"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13e

    const-string v2, "NotificationTabIntent"

    const-class v7, Landroid/app/PendingIntent;

    invoke-static {v1, v2, v7}, Lyi4;->x(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/PendingIntent;

    iget-object v7, v0, Lcom/opera/android/media/MediaCaptureNotificationService;->d:Landroid/util/SparseIntArray;

    invoke-virtual {v7, v3}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    move-result v8

    if-ltz v8, :cond_45

    invoke-virtual {v7, v3}, Landroid/util/SparseIntArray;->get(I)I

    move-result v8

    if-eq v8, v4, :cond_13e

    :cond_45
    invoke-virtual {v7, v3}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    move-result v8

    const/4 v9, 0x1

    const-string v10, "MediaCaptureNotificationService"

    if-ltz v8, :cond_59

    iget-object v8, v0, Lcom/opera/android/media/MediaCaptureNotificationService;->a:Landroid/app/NotificationManager;

    invoke-virtual {v8, v10, v3}, Landroid/app/NotificationManager;->cancel(Ljava/lang/String;I)V

    invoke-virtual {v7, v3}, Landroid/util/SparseIntArray;->delete(I)V

    invoke-virtual {v0, v3, v9}, Lcom/opera/android/media/MediaCaptureNotificationService;->c(IZ)V

    :cond_59
    if-eqz v4, :cond_12e

    const/4 v8, 0x4

    if-ne v4, v8, :cond_61

    const-string v11, "screen_capture"

    goto :goto_63

    :cond_61
    const-string v11, "media"

    :goto_63
    new-instance v12, Lcm;

    const/4 v13, 0x5

    invoke-direct {v12, v10, v3, v13}, Lcm;-><init>(Ljava/lang/String;IB)V

    invoke-static {v11, v12}, Lzi4;->t(Ljava/lang/String;Lcm;)Lua7;

    move-result-object v11

    iget-object v12, v11, Lua7;->b:Ljava/lang/Object;

    check-cast v12, Ll1f;

    invoke-virtual {v12, v5}, Ll1f;->d(Z)V

    invoke-virtual {v11, v9}, Lua7;->R(Z)V

    iget-object v13, v0, Lcom/opera/android/media/MediaCaptureNotificationService;->b:Landroid/content/Context;

    const v14, 0x7f1401b7

    invoke-virtual {v13, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ll1f;->f(Ljava/lang/CharSequence;)V

    const/4 v13, 0x3

    const/4 v14, 0x2

    const v15, 0x7f0804c2

    if-eq v4, v9, :cond_95

    if-eq v4, v14, :cond_95

    if-ne v4, v13, :cond_92

    const v15, 0x7f0804c1

    goto :goto_95

    :cond_92
    if-eq v4, v8, :cond_95

    move v15, v5

    :cond_95
    :goto_95
    invoke-virtual {v11, v15}, Lua7;->S(I)V

    iput-boolean v9, v12, Ll1f;->t:Z

    new-instance v15, Ljava/lang/StringBuilder;

    if-ne v4, v8, :cond_b0

    iget-object v8, v0, Lcom/opera/android/media/MediaCaptureNotificationService;->b:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f140eff

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v8, v9, v13}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    goto :goto_cd

    :cond_b0
    if-ne v4, v9, :cond_b6

    const v8, 0x7f141354

    goto :goto_c3

    :cond_b6
    if-ne v4, v14, :cond_bc

    const v8, 0x7f141357

    goto :goto_c3

    :cond_bc
    if-ne v4, v13, :cond_c2

    const v8, 0x7f1401e8

    goto :goto_c3

    :cond_c2
    move v8, v5

    :goto_c3
    iget-object v9, v0, Lcom/opera/android/media/MediaCaptureNotificationService;->b:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    :goto_cd
    invoke-direct {v15, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v8, 0x2e

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    if-eqz v2, :cond_ee

    iput-object v2, v12, Ll1f;->g:Landroid/app/PendingIntent;

    iget-object v2, v0, Lcom/opera/android/media/MediaCaptureNotificationService;->b:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v8, 0x7f140a23

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v2, v8, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_f6

    :cond_ee
    const-string v2, " "

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_f6
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v11, v2}, Lua7;->O(Ljava/lang/CharSequence;)V

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v6, Lg1f;

    invoke-direct {v6, v5}, Ln1f;-><init>(B)V

    iget-object v8, v6, Ln1f;->b:Ljava/lang/Object;

    check-cast v8, Ll1f;

    if-eq v8, v12, :cond_111

    iput-object v12, v6, Ln1f;->b:Ljava/lang/Object;

    invoke-virtual {v12, v6}, Ll1f;->j(Ln1f;)V

    :cond_111
    invoke-static {v2}, Ll1f;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    iput-object v2, v6, Lg1f;->e:Ljava/lang/CharSequence;

    iget-object v2, v6, Ln1f;->b:Ljava/lang/Object;

    check-cast v2, Ll1f;

    if-eqz v2, :cond_122

    invoke-virtual {v2}, Ll1f;->b()Landroid/app/Notification;

    move-result-object v2

    goto :goto_123

    :cond_122
    const/4 v2, 0x0

    :goto_123
    iget-object v6, v0, Lcom/opera/android/media/MediaCaptureNotificationService;->a:Landroid/app/NotificationManager;

    invoke-virtual {v6, v10, v3, v2}, Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V

    invoke-virtual {v7, v3, v4}, Landroid/util/SparseIntArray;->put(II)V

    invoke-virtual {v0, v3, v5}, Lcom/opera/android/media/MediaCaptureNotificationService;->c(IZ)V

    :cond_12e
    invoke-virtual {v7}, Landroid/util/SparseIntArray;->size()I

    move-result v2

    if-nez v2, :cond_13e

    invoke-virtual {v0}, Landroid/app/Service;->stopSelf()V

    goto :goto_13e

    :cond_138
    invoke-virtual {v0}, Lcom/opera/android/media/MediaCaptureNotificationService;->a()V

    invoke-virtual {v0}, Landroid/app/Service;->stopSelf()V

    :cond_13e
    :goto_13e
    invoke-super/range {p0 .. p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v0

    return v0
.end method

.method public final onUnbind(Landroid/content/Intent;)Z
    .registers 2

    invoke-virtual {p0}, Lcom/opera/android/media/MediaCaptureNotificationService;->a()V

    invoke-super {p0, p1}, Landroid/app/Service;->onUnbind(Landroid/content/Intent;)Z

    move-result p0

    return p0
.end method
