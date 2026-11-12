.class public final Lcom/opera/android/notifications/NotificationBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/opera/android/notifications/NotificationBridge$ActionInfo;,
        Lcom/opera/android/notifications/NotificationBridge$TrampolineActivity;,
        Lcom/opera/android/notifications/NotificationBridge$Callback;,
        Lcom/opera/android/notifications/NotificationBridge$ActionInfoArrayBuilder;
    }
.end annotation


# static fields
.field public static final a:Lwub;

.field public static final b:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    invoke-static {}, Laib;->t()Lwub;

    move-result-object v0

    sput-object v0, Lcom/opera/android/notifications/NotificationBridge;->a:Lwub;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/opera/android/notifications/NotificationBridge;->b:Ljava/util/HashMap;

    return-void
.end method

.method public static a(Landroid/content/Intent;Lcom/opera/android/notifications/NotificationBridge$Callback;)V
    .registers 9

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "extra_origin"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "extra_private_mode"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    const-string v3, "extra_action_index"

    const/4 v4, -0x1

    invoke-virtual {p0, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    const-string v4, "extra_id"

    invoke-virtual {p0, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v0, :cond_4e

    if-eqz v1, :cond_4e

    if-eqz v4, :cond_4e

    const-string v5, "com.opera.android.notification.CLICK"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    sget-object v6, Lcom/opera/android/notifications/NotificationBridge;->b:Ljava/util/HashMap;

    if-eqz v5, :cond_3b

    const-string v0, "extra_platform_tag"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v6, v4, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v2, v4, v1, v3, p1}, LJ/N;->M6fGByfk(ZLjava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;)V

    return-void

    :cond_3b
    const-string p0, "com.opera.android.notification.CLOSE"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4a

    invoke-static {v2, v4, v1, p1}, LJ/N;->MrDppPR6(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v6, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_4a
    invoke-interface {p1}, Lcom/opera/android/notifications/NotificationBridge$Callback;->onDone()V

    return-void

    :cond_4e
    invoke-interface {p1}, Lcom/opera/android/notifications/NotificationBridge$Callback;->onDone()V

    return-void
.end method

.method public static b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;Z)Lyhe;
    .registers 11

    invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->fragment(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    const-string v1, "com.opera.android.notification.CLOSE"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2, p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p1, "extra_platform_tag"

    invoke-virtual {v2, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "extra_origin"

    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "extra_private_mode"

    invoke-virtual {p1, p2, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "extra_action_index"

    invoke-virtual {p1, p2, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "extra_id"

    invoke-virtual {p1, p2, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const/4 p2, 0x0

    const/high16 p3, 0x8000000

    if-eqz v1, :cond_6e

    const-class p4, Lcom/opera/android/notifications/NotificationService;

    invoke-virtual {p1, p0, p4}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-static {p7}, Lc26;->s(Z)I

    move-result p4

    or-int/2addr p3, p4

    new-instance p4, Lyhe;

    invoke-static {p0, p2, p1, p3}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    const/16 p1, 0x8

    invoke-direct {p4, p0, p1}, Lyhe;-><init>(Ljava/lang/Object;B)V

    return-object p4

    :cond_6e
    const-class p4, Lcom/opera/android/notifications/NotificationBridge$TrampolineActivity;

    invoke-virtual {p1, p0, p4}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-static {p0, p2, p1, p3, p7}, Lyhe;->f(Landroid/content/Context;ILandroid/content/Intent;IZ)Lyhe;

    move-result-object p0

    return-object p0
.end method

.method public static c(Landroid/content/Intent;)Z
    .registers 3

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "com.opera.android.notification.CLICK"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    const-string v1, "com.opera.android.notification.CLOSE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_41

    :cond_17
    const-string v0, "extra_platform_tag"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_41

    const-string v0, "extra_origin"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_41

    const-string v0, "extra_private_mode"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_41

    const-string v0, "extra_action_index"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_41

    const-string v0, "extra_id"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_41

    const/4 p0, 0x1

    return p0

    :cond_41
    const/4 p0, 0x0

    return p0
.end method

.method public static closePersistentNotification(Ljava/lang/String;)V
    .registers 5
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/opera/android/notifications/NotificationBridge;->b:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_22

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lcom/opera/android/notifications/NotificationBridge;->a:Lwub;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "NotificationManagerProxyImpl.cancel(tag, id)"

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lorg/chromium/base/TraceEvent;->n(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    new-instance v2, Lm2f;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v1, v3}, Lm2f;-><init>(Lwub;Ljava/lang/String;B)V

    invoke-static {v0, v2}, Lwub;->N(Lorg/chromium/base/TraceEvent;Ljava/lang/Runnable;)V

    :cond_22
    return-void
.end method

.method public static displayNotification(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;JZZ[I[Lcom/opera/android/notifications/NotificationBridge$ActionInfo;Ljava/lang/String;)V
    .registers 33
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Landroid/graphics/Bitmap;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Landroid/graphics/Bitmap;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Landroid/graphics/Bitmap;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p12    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p13    # [Lcom/opera/android/notifications/NotificationBridge$ActionInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p14    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    move-object/from16 v3, p0

    move-object/from16 v8, p7

    move-object/from16 v9, p12

    move-object/from16 v10, p13

    move-object/from16 v6, p14

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v4, p1

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-static/range {p2 .. p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_26

    :cond_21
    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const-string v1, "com.opera.android.notification.CLICK"

    const/4 v5, -0x1

    const/4 v7, 0x0

    invoke-static/range {v0 .. v7}, Lcom/opera/android/notifications/NotificationBridge;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;Z)Lyhe;

    move-result-object v12

    const-string v1, "com.opera.android.notification.CLOSE"

    move-object/from16 v3, p0

    move/from16 v4, p1

    move-object/from16 v6, p14

    invoke-static/range {v0 .. v7}, Lcom/opera/android/notifications/NotificationBridge;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;Z)Lyhe;

    move-result-object v1

    new-instance v4, Lcm;

    const/4 v5, 0x5

    const/4 v6, 0x1

    invoke-direct {v4, v2, v6, v5}, Lcm;-><init>(Ljava/lang/String;IB)V

    sget-object v5, Lrmj;->a:Ln9h;

    iget-object v7, v5, Ln9h;->c:Ljava/lang/Object;

    monitor-enter v7

    :try_start_50
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_58

    const/4 v5, 0x0

    goto :goto_5c

    :cond_58
    invoke-virtual {v5, v3}, Ln9h;->l(Ljava/lang/String;)Lsmj;

    move-result-object v5

    :goto_5c
    monitor-exit v7
    :try_end_5d
    .catchall {:try_start_50 .. :try_end_5d} :catchall_3a3

    if-nez v5, :cond_62

    const-string v5, "other"

    goto :goto_64

    :cond_62
    iget-object v5, v5, Lsmj;->a:Ljava/lang/String;

    :goto_64
    new-instance v7, Lm3k;

    invoke-direct {v7, v0, v5, v4}, Lm3k;-><init>(Landroid/content/Context;Ljava/lang/String;Lcm;)V

    invoke-static/range {p3 .. p3}, Lm3k;->d(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    iput-object v4, v7, Lm3k;->f:Ljava/lang/CharSequence;

    invoke-static/range {p4 .. p4}, Lm3k;->d(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    iput-object v4, v7, Lm3k;->g:Ljava/lang/CharSequence;

    move-object/from16 v4, p5

    iput-object v4, v7, Lm3k;->j:Landroid/graphics/Bitmap;

    move-object/from16 v4, p6

    iput-object v4, v7, Lm3k;->u:Landroid/graphics/Bitmap;

    const v4, 0x7f080413

    iput v4, v7, Lm3k;->k:I

    const/4 v5, 0x0

    const/4 v13, -0x1

    if-eqz v8, :cond_ac

    sget-object v15, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v16

    if-eqz v16, :cond_90

    move-object/from16 v15, v16

    :cond_90
    invoke-virtual {v8, v15, v6}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v15

    new-instance v14, Landroid/graphics/Paint;

    invoke-direct {v14}, Landroid/graphics/Paint;-><init>()V

    new-instance v4, Landroid/graphics/PorterDuffColorFilter;

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v4, v13, v6}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v14, v4}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    new-instance v4, Landroid/graphics/Canvas;

    invoke-direct {v4, v15}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v4, v15, v5, v5, v14}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto :goto_ad

    :cond_ac
    const/4 v15, 0x0

    :goto_ad
    iput-object v15, v7, Lm3k;->l:Landroid/graphics/Bitmap;

    if-eqz v8, :cond_d6

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v6

    if-eqz v6, :cond_ba

    move-object v4, v6

    :cond_ba
    const/4 v6, 0x1

    invoke-virtual {v8, v4, v6}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v4

    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    new-instance v8, Landroid/graphics/PorterDuffColorFilter;

    sget-object v14, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v8, v13, v14}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v6, v8}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    new-instance v8, Landroid/graphics/Canvas;

    invoke-direct {v8, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v8, v4, v5, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    :cond_d6
    iput-object v12, v7, Lm3k;->m:Lyhe;

    iput-object v1, v7, Lm3k;->n:Lyhe;

    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    move-object/from16 v4, p3

    invoke-virtual {v1, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    const-string v5, "\n"

    invoke-virtual {v1, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-object/from16 v5, p4

    invoke-virtual {v1, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    new-instance v5, Landroid/text/style/StyleSpan;

    const/4 v6, 0x1

    invoke-direct {v5, v6}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v6, 0x12

    const/4 v8, 0x0

    invoke-virtual {v1, v5, v8, v4, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    invoke-static {v1}, Lm3k;->d(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, v7, Lm3k;->i:Ljava/lang/CharSequence;

    move-wide/from16 v4, p8

    iput-wide v4, v7, Lm3k;->s:J

    move/from16 v1, p10

    iput-boolean v1, v7, Lm3k;->t:Z

    invoke-static {v3, v8}, LJ/N;->MR6Af3ZS(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lm3k;->d(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, v7, Lm3k;->h:Ljava/lang/CharSequence;

    move v1, v8

    :goto_119
    array-length v4, v10

    if-ge v1, v4, :cond_18c

    aget-object v4, v10, v1

    invoke-interface {v4}, Lcom/opera/android/notifications/NotificationBridge$ActionInfo;->getType()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_128

    move/from16 v17, v6

    goto :goto_12a

    :cond_128
    move/from16 v17, v8

    :goto_12a
    const-string v5, "com.opera.android.notification.CLICK"

    move/from16 p6, p1

    move-object/from16 p8, p14

    move-object/from16 p2, v0

    move/from16 p7, v1

    move-object/from16 p4, v2

    move-object/from16 p5, v3

    move-object/from16 p3, v5

    move/from16 p9, v17

    invoke-static/range {p2 .. p9}, Lcom/opera/android/notifications/NotificationBridge;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;Z)Lyhe;

    move-result-object v0

    move-object/from16 v3, p2

    move/from16 v5, p7

    invoke-interface {v4}, Lcom/opera/android/notifications/NotificationBridge$ActionInfo;->getType()I

    move-result v12

    if-ne v12, v6, :cond_169

    invoke-interface {v4}, Lcom/opera/android/notifications/NotificationBridge$ActionInfo;->getIcon()Landroid/graphics/Bitmap;

    move-result-object v6

    invoke-interface {v4}, Lcom/opera/android/notifications/NotificationBridge$ActionInfo;->getTitle()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v4}, Lcom/opera/android/notifications/NotificationBridge$ActionInfo;->a()Ljava/lang/String;

    move-result-object v4

    const/4 v14, 0x2

    move-object/from16 p5, v0

    move-object/from16 p7, v4

    move-object/from16 p3, v6

    move-object/from16 p2, v7

    move-object/from16 p4, v12

    move/from16 p6, v14

    invoke-virtual/range {p2 .. p7}, Lm3k;->b(Landroid/graphics/Bitmap;Ljava/lang/String;Lyhe;ILjava/lang/String;)V

    move-object/from16 v0, p2

    goto :goto_184

    :cond_169
    move-object v6, v0

    move-object v0, v7

    invoke-interface {v4}, Lcom/opera/android/notifications/NotificationBridge$ActionInfo;->getIcon()Landroid/graphics/Bitmap;

    move-result-object v7

    invoke-interface {v4}, Lcom/opera/android/notifications/NotificationBridge$ActionInfo;->getTitle()Ljava/lang/String;

    move-result-object v4

    const/4 v12, 0x1

    const/4 v14, 0x0

    move-object/from16 p2, v0

    move-object/from16 p4, v4

    move-object/from16 p5, v6

    move-object/from16 p3, v7

    move/from16 p6, v12

    move-object/from16 p7, v14

    invoke-virtual/range {p2 .. p7}, Lm3k;->b(Landroid/graphics/Bitmap;Ljava/lang/String;Lyhe;ILjava/lang/String;)V

    :goto_184
    add-int/lit8 v4, v5, 0x1

    move-object v7, v0

    move-object v0, v3

    move v1, v4

    move-object/from16 v3, p0

    goto :goto_119

    :cond_18c
    move-object/from16 v1, p14

    move-object v3, v0

    move-object v0, v7

    array-length v4, v9

    if-nez p11, :cond_197

    if-lez v4, :cond_198

    const/4 v13, -0x3

    goto :goto_198

    :cond_197
    move v13, v8

    :cond_198
    :goto_198
    iput v13, v0, Lm3k;->q:I

    array-length v4, v9

    const/16 v17, 0x1

    add-int/lit8 v4, v4, 0x1

    new-array v5, v4, [J

    move v6, v8

    :goto_1a2
    array-length v7, v9

    if-ge v6, v7, :cond_1ae

    add-int/lit8 v7, v6, 0x1

    aget v6, v9, v6

    int-to-long v12, v6

    aput-wide v12, v5, v7

    move v6, v7

    goto :goto_1a2

    :cond_1ae
    invoke-static {v5, v4}, Ljava/util/Arrays;->copyOf([JI)[J

    move-result-object v4

    iput-object v4, v0, Lm3k;->r:[J

    array-length v4, v10

    if-lez v4, :cond_1bf

    const v4, 0x7f1410cd

    invoke-virtual {v11, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_1c6

    :cond_1bf
    const v4, 0x7f1410a4

    invoke-virtual {v11, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    :goto_1c6
    invoke-static {v3}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v5

    const-string v6, "com.opera.android.settings.SITE_SETTING"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    invoke-static/range {p0 .. p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v5

    const/high16 v6, 0x8000000

    invoke-static {v3, v8, v5, v6, v8}, Lyhe;->f(Landroid/content/Context;ILandroid/content/Intent;IZ)Lyhe;

    move-result-object v5

    new-instance v6, Lt0f;

    invoke-static {v4}, Lm3k;->d(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    iget-object v5, v5, Lyhe;->b:Ljava/lang/Object;

    check-cast v5, Landroid/app/PendingIntent;

    invoke-direct {v6, v4, v5}, Lt0f;-><init>(Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    iput-object v6, v0, Lm3k;->p:Lt0f;

    sget-object v4, Lcom/opera/android/notifications/NotificationBridge;->b:Ljava/util/HashMap;

    invoke-virtual {v4, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v0, Lm3k;->d:Ljava/lang/String;

    iget-object v2, v0, Lm3k;->e:Lcm;

    invoke-static {v1, v2}, Lzi4;->t(Ljava/lang/String;Lcm;)Lua7;

    move-result-object v4

    iget-object v5, v4, Lua7;->b:Ljava/lang/Object;

    check-cast v5, Ll1f;

    iget-object v6, v0, Lm3k;->f:Ljava/lang/CharSequence;

    invoke-virtual {v4, v6}, Lua7;->P(Ljava/lang/CharSequence;)V

    iget-object v6, v0, Lm3k;->g:Ljava/lang/CharSequence;

    invoke-virtual {v4, v6}, Lua7;->O(Ljava/lang/CharSequence;)V

    iget-object v6, v0, Lm3k;->h:Ljava/lang/CharSequence;

    if-eqz v6, :cond_217

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Laik;->a:[Ljava/lang/String;

    invoke-static {v6, v7}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_218

    :cond_217
    const/4 v6, 0x0

    :goto_218
    iget-object v7, v4, Lua7;->b:Ljava/lang/Object;

    check-cast v7, Ll1f;

    invoke-static {v6}, Ll1f;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v6

    iput-object v6, v7, Ll1f;->n:Ljava/lang/CharSequence;

    iget-object v6, v0, Lm3k;->i:Ljava/lang/CharSequence;

    iget-object v7, v5, Ll1f;->G:Landroid/app/Notification;

    invoke-static {v6}, Ll1f;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v6

    iput-object v6, v7, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    iget-object v6, v0, Lm3k;->j:Landroid/graphics/Bitmap;

    iget-object v7, v0, Lm3k;->g:Ljava/lang/CharSequence;

    if-eqz v6, :cond_277

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getAllocationByteCount()I

    move-result v10

    div-int/lit16 v10, v10, 0x3e8

    const/16 v11, 0x1194

    if-gt v10, v11, :cond_23e

    const/4 v11, 0x1

    goto :goto_25c

    :cond_23e
    const-wide v11, 0x40b1940000000000L    # 4500.0

    int-to-double v13, v10

    div-double/2addr v11, v13

    invoke-static {v11, v12}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v10

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v12

    int-to-double v12, v12

    mul-double/2addr v12, v10

    double-to-int v12, v12

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v13

    int-to-double v13, v13

    mul-double/2addr v13, v10

    double-to-int v10, v13

    const/4 v11, 0x1

    invoke-static {v6, v12, v10, v11}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v6

    :goto_25c
    new-instance v10, Lf1f;

    invoke-direct {v10, v8}, Ln1f;-><init>(B)V

    if-nez v6, :cond_265

    const/4 v6, 0x0

    goto :goto_269

    :cond_265
    invoke-static {v6}, Landroidx/core/graphics/drawable/IconCompat;->b(Landroid/graphics/Bitmap;)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object v6

    :goto_269
    iput-object v6, v10, Lf1f;->e:Landroidx/core/graphics/drawable/IconCompat;

    invoke-static {v7}, Ll1f;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v6

    iput-object v6, v10, Ln1f;->d:Ljava/lang/Object;

    iput-boolean v11, v10, Ln1f;->a:Z

    invoke-virtual {v5, v10}, Ll1f;->j(Ln1f;)V

    goto :goto_289

    :cond_277
    iget-object v6, v4, Lua7;->b:Ljava/lang/Object;

    check-cast v6, Ll1f;

    new-instance v10, Lg1f;

    invoke-direct {v10, v8}, Ln1f;-><init>(B)V

    invoke-static {v7}, Ll1f;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v7

    iput-object v7, v10, Lg1f;->e:Ljava/lang/CharSequence;

    invoke-virtual {v6, v10}, Ll1f;->j(Ln1f;)V

    :goto_289
    invoke-virtual {v0}, Lm3k;->c()Landroid/graphics/Bitmap;

    move-result-object v6

    iget-object v7, v4, Lua7;->b:Ljava/lang/Object;

    check-cast v7, Ll1f;

    invoke-virtual {v7, v6}, Ll1f;->i(Landroid/graphics/Bitmap;)V

    iget v6, v0, Lm3k;->k:I

    iget-object v7, v0, Lm3k;->l:Landroid/graphics/Bitmap;

    if-eqz v7, :cond_2a2

    invoke-static {v7}, Landroid/graphics/drawable/Icon;->createWithBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;

    move-result-object v6

    invoke-virtual {v4, v6}, Lua7;->T(Landroid/graphics/drawable/Icon;)V

    goto :goto_2a5

    :cond_2a2
    invoke-virtual {v4, v6}, Lua7;->S(I)V

    :goto_2a5
    iget-object v6, v0, Lm3k;->m:Lyhe;

    invoke-virtual {v4, v6}, Lua7;->N(Lyhe;)V

    iget-object v6, v0, Lm3k;->n:Lyhe;

    iget-object v7, v4, Lua7;->b:Ljava/lang/Object;

    check-cast v7, Ll1f;

    if-eqz v6, :cond_2b7

    iget-object v6, v6, Lyhe;->b:Ljava/lang/Object;

    check-cast v6, Landroid/app/PendingIntent;

    goto :goto_2b8

    :cond_2b7
    const/4 v6, 0x0

    :goto_2b8
    iget-object v7, v7, Ll1f;->G:Landroid/app/Notification;

    iput-object v6, v7, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    iget-object v6, v0, Lm3k;->o:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    move v10, v8

    :goto_2c3
    if-ge v10, v7, :cond_2d1

    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    add-int/lit8 v10, v10, 0x1

    check-cast v11, Lt0f;

    invoke-static {v4, v11}, Lm3k;->a(Lua7;Lt0f;)V

    goto :goto_2c3

    :cond_2d1
    iget-object v6, v0, Lm3k;->p:Lt0f;

    if-eqz v6, :cond_2d8

    invoke-static {v4, v6}, Lm3k;->a(Lua7;Lt0f;)V

    :cond_2d8
    iput v8, v5, Ll1f;->j:I

    iget v6, v0, Lm3k;->q:I

    iget-object v7, v4, Lua7;->b:Ljava/lang/Object;

    check-cast v7, Ll1f;

    invoke-virtual {v7, v6}, Ll1f;->g(I)V

    iget-object v6, v0, Lm3k;->r:[J

    if-eqz v6, :cond_2eb

    iget-object v7, v5, Ll1f;->G:Landroid/app/Notification;

    iput-object v6, v7, Landroid/app/Notification;->vibrate:[J

    :cond_2eb
    iget-wide v6, v0, Lm3k;->s:J

    iget-object v10, v5, Ll1f;->G:Landroid/app/Notification;

    iput-wide v6, v10, Landroid/app/Notification;->when:J

    const/4 v6, 0x1

    iput-boolean v6, v5, Ll1f;->k:Z

    iget-boolean v7, v0, Lm3k;->t:Z

    xor-int/2addr v7, v6

    iget-object v6, v4, Lua7;->b:Ljava/lang/Object;

    check-cast v6, Ll1f;

    const/16 v10, 0x8

    invoke-virtual {v6, v10, v7}, Ll1f;->h(IZ)V

    iget-object v6, v0, Lm3k;->h:Ljava/lang/CharSequence;

    if-eqz v6, :cond_314

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v10, "Web:"

    invoke-direct {v7, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Ll1f;->r:Ljava/lang/String;

    :cond_314
    iget-object v6, v0, Lm3k;->v:Landroid/content/Context;

    invoke-static {v1, v2}, Lzi4;->t(Ljava/lang/String;Lcm;)Lua7;

    move-result-object v1

    const v2, 0x7f140b64

    invoke-virtual {v6, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v6, v1, Lua7;->b:Ljava/lang/Object;

    check-cast v6, Ll1f;

    invoke-virtual {v6, v2}, Ll1f;->e(Ljava/lang/CharSequence;)V

    const v2, 0x7f080413

    invoke-virtual {v1, v2}, Lua7;->S(I)V

    iget-object v2, v0, Lm3k;->h:Ljava/lang/CharSequence;

    iget-object v6, v1, Lua7;->b:Ljava/lang/Object;

    check-cast v6, Ll1f;

    invoke-static {v2}, Ll1f;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    iput-object v2, v6, Ll1f;->n:Ljava/lang/CharSequence;

    iget-object v2, v0, Lm3k;->l:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_353

    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v7

    if-eqz v7, :cond_347

    move-object v6, v7

    :cond_347
    const/4 v11, 0x1

    invoke-virtual {v2, v6, v11}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/drawable/Icon;->createWithBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;

    move-result-object v2

    invoke-virtual {v1, v2}, Lua7;->T(Landroid/graphics/drawable/Icon;)V

    :cond_353
    invoke-virtual {v1}, Lua7;->l()Li16;

    move-result-object v1

    iget-object v1, v1, Li16;->b:Ljava/lang/Object;

    check-cast v1, Landroid/app/Notification;

    iput-object v1, v5, Ll1f;->A:Landroid/app/Notification;

    :try_start_35d
    invoke-virtual {v4}, Lua7;->l()Li16;

    move-result-object v14
    :try_end_361
    .catch Ljava/lang/IllegalArgumentException; {:try_start_35d .. :try_end_361} :catch_362

    goto :goto_37b

    :catch_362
    iget-object v1, v0, Lm3k;->u:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_379

    const/4 v1, 0x0

    iput-object v1, v0, Lm3k;->u:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Lm3k;->c()Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object v2, v4, Lua7;->b:Ljava/lang/Object;

    check-cast v2, Ll1f;

    invoke-virtual {v2, v0}, Ll1f;->i(Landroid/graphics/Bitmap;)V

    :try_start_374
    invoke-virtual {v4}, Lua7;->l()Li16;

    move-result-object v14
    :try_end_378
    .catch Ljava/lang/IllegalArgumentException; {:try_start_374 .. :try_end_378} :catch_37a

    goto :goto_37b

    :cond_379
    const/4 v1, 0x0

    :catch_37a
    move-object v14, v1

    :goto_37b
    if-nez v14, :cond_37e

    return-void

    :cond_37e
    sget-object v0, Lcom/opera/android/notifications/NotificationBridge;->a:Lwub;

    invoke-virtual {v0, v14}, Lwub;->H(Li16;)V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    new-instance v1, Lza9;

    const/4 v6, 0x1

    xor-int/lit8 v2, p11, 0x1

    array-length v3, v9

    if-lez v3, :cond_39a

    move v8, v6

    :cond_39a
    invoke-direct {v1, v2, v8}, Lza9;-><init>(ZZ)V

    invoke-virtual {v0, v1, v6}, Lx5f;->s0(Lqyl;Z)V

    return-void

    :goto_3a1
    :try_start_3a1
    monitor-exit v7
    :try_end_3a2
    .catchall {:try_start_3a1 .. :try_end_3a2} :catchall_3a3

    throw v0

    :catchall_3a3
    move-exception v0

    goto :goto_3a1
.end method

.method public static getNextId()J
    .registers 7

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v1, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "chr.notifications.next_id_key"

    const-wide/16 v3, 0x2710

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    const-wide/16 v5, 0x1

    add-long/2addr v3, v5

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    return-wide v3
.end method

.method public static logUserClickEvent(ZZJ)V
    .registers 7

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    new-instance v1, Lza9;

    const/4 v2, 0x1

    xor-int/2addr p0, v2

    invoke-direct {v1, p0, p1}, Lza9;-><init>(ZZ)V

    invoke-virtual {v0, v1, v2, p2, p3}, Lx5f;->q0(Lqyl;ZJ)V

    return-void
.end method
