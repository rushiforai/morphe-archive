.class public final Lcom/opera/android/live_score/LiveCommentaryService;
.super Landroid/app/Service;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/opera/android/live_score/LiveCommentaryService;",
        "Landroid/app/Service;",
        "<init>",
        "()V",
        "ujc",
        "live_score"
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
.field public static o:Lix5;

.field public static p:Ldeg;


# instance fields
.field public a:Lujc;

.field public b:Lpod;

.field public c:Lgkg;

.field public d:Lnwa;

.field public e:Landroid/graphics/Bitmap;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:J

.field public j:J

.field public k:Z

.field public final l:Lvjc;

.field public final m:Lqfb;

.field public final n:Lc37;


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/opera/android/live_score/LiveCommentaryService;->g:Ljava/lang/String;

    iput-object v0, p0, Lcom/opera/android/live_score/LiveCommentaryService;->h:Ljava/lang/String;

    new-instance v0, Lvjc;

    invoke-direct {v0, p0}, Lvjc;-><init>(Lcom/opera/android/live_score/LiveCommentaryService;)V

    iput-object v0, p0, Lcom/opera/android/live_score/LiveCommentaryService;->l:Lvjc;

    new-instance v0, Lqfb;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lqfb;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lcom/opera/android/live_score/LiveCommentaryService;->m:Lqfb;

    new-instance v0, Lc37;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Lc37;->b:Ljava/lang/Object;

    new-instance v1, Lq4b;

    const/16 v2, 0xe

    invoke-direct {v1, p0, v2}, Lq4b;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v1

    iput-object v1, v0, Lc37;->a:Ljava/lang/Object;

    iput-object v0, p0, Lcom/opera/android/live_score/LiveCommentaryService;->n:Lc37;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 8

    iget-object v0, p0, Lcom/opera/android/live_score/LiveCommentaryService;->d:Lnwa;

    if-eqz v0, :cond_b

    sget-object v1, Lcom/opera/android/live_score/LiveCommentaryService;->p:Ldeg;

    if-eqz v1, :cond_b

    invoke-virtual {v1, v0}, Ldeg;->a(Ljava/lang/Object;)V

    :cond_b
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/live_score/LiveCommentaryService;->d:Lnwa;

    iget-object v1, p0, Lcom/opera/android/live_score/LiveCommentaryService;->c:Lgkg;

    if-eqz v1, :cond_15

    invoke-virtual {v1, v0}, Lgkg;->b(Lgk9;)V

    :cond_15
    iput-object v0, p0, Lcom/opera/android/live_score/LiveCommentaryService;->c:Lgkg;

    iget-object v1, p0, Lcom/opera/android/live_score/LiveCommentaryService;->f:Ljava/lang/String;

    if-eqz v1, :cond_3f

    iget-object v1, p0, Lcom/opera/android/live_score/LiveCommentaryService;->a:Lujc;

    if-eqz v1, :cond_3f

    iget-boolean v1, p0, Lcom/opera/android/live_score/LiveCommentaryService;->k:Z

    if-eqz v1, :cond_32

    iget-wide v1, p0, Lcom/opera/android/live_score/LiveCommentaryService;->i:J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/opera/android/live_score/LiveCommentaryService;->j:J

    sub-long/2addr v3, v5

    add-long/2addr v3, v1

    iput-wide v3, p0, Lcom/opera/android/live_score/LiveCommentaryService;->i:J

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/opera/android/live_score/LiveCommentaryService;->k:Z

    :cond_32
    sget-object v1, Lcom/opera/android/live_score/LiveCommentaryService;->o:Lix5;

    if-eqz v1, :cond_3f

    sget-object v1, Lpn7;->b:Lon7;

    iget-wide v1, p0, Lcom/opera/android/live_score/LiveCommentaryService;->i:J

    sget-object v3, Lun7;->d:Lun7;

    invoke-static {v1, v2, v3}, Lcs5;->y0(JLun7;)J

    :cond_3f
    iget-object v1, p0, Lcom/opera/android/live_score/LiveCommentaryService;->a:Lujc;

    if-eqz v1, :cond_48

    iget-object v2, p0, Lcom/opera/android/live_score/LiveCommentaryService;->l:Lvjc;

    invoke-virtual {v1, v2}, Lgk9;->g0(Leig;)V

    :cond_48
    iget-object v1, p0, Lcom/opera/android/live_score/LiveCommentaryService;->a:Lujc;

    if-eqz v1, :cond_4f

    invoke-virtual {v1}, Lgk9;->release()V

    :cond_4f
    iput-object v0, p0, Lcom/opera/android/live_score/LiveCommentaryService;->a:Lujc;

    iget-object v1, p0, Lcom/opera/android/live_score/LiveCommentaryService;->b:Lpod;

    if-eqz v1, :cond_58

    invoke-virtual {v1}, Lpod;->a()V

    :cond_58
    iput-object v0, p0, Lcom/opera/android/live_score/LiveCommentaryService;->b:Lpod;

    return-void
.end method

.method public final onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public final onDestroy()V
    .registers 2

    invoke-virtual {p0}, Lcom/opera/android/live_score/LiveCommentaryService;->a()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/app/Service;->stopForeground(I)V

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public final onStartCommand(Landroid/content/Intent;II)I
    .registers 34

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    const/4 v11, 0x0

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    goto :goto_d

    :cond_c
    move-object v2, v11

    :goto_d
    const/4 v12, 0x1

    if-eqz v2, :cond_263

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_268

    goto/16 :goto_263

    :sswitch_19
    const-string v0, "com.opera.android.live_score.ACTION_STOP"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_263

    sget-object v0, Lcs6;->c:Lnak;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lxjc;->a:Lxjc;

    invoke-virtual {v0, v11, v2}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-virtual {v1}, Landroid/app/Service;->stopSelf()V

    return v12

    :sswitch_2f
    const-string v3, "com.opera.android.live_score.ACTION_PLAY"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_263

    const-string v2, "extra_id"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_47

    const-string v3, "extra_url"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_4a

    :cond_47
    move v3, v12

    goto/16 :goto_262

    :cond_4a
    const-string v5, "extra_title"

    invoke-virtual {v0, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, ""

    if-nez v6, :cond_55

    move-object v6, v7

    :cond_55
    const-string v8, "extra_description"

    invoke-virtual {v0, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_5e

    move-object v7, v9

    :cond_5e
    const-string v9, "extra_image_url"

    invoke-virtual {v0, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v1}, Lcom/opera/android/live_score/LiveCommentaryService;->a()V

    iput-object v13, v1, Lcom/opera/android/live_score/LiveCommentaryService;->f:Ljava/lang/String;

    iput-object v6, v1, Lcom/opera/android/live_score/LiveCommentaryService;->g:Ljava/lang/String;

    iput-object v7, v1, Lcom/opera/android/live_score/LiveCommentaryService;->h:Ljava/lang/String;

    iput-object v11, v1, Lcom/opera/android/live_score/LiveCommentaryService;->e:Landroid/graphics/Bitmap;

    move/from16 p3, v12

    const-wide/16 v11, 0x0

    iput-wide v11, v1, Lcom/opera/android/live_score/LiveCommentaryService;->i:J

    new-instance v0, Lfjd;

    invoke-direct {v0}, Lfjd;-><init>()V

    new-instance v10, Lijd;

    invoke-direct {v10}, Lijd;-><init>()V

    sget-object v20, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    sget-object v11, Lh1b;->b:La1b;

    sget-object v22, Lcsh;->e:Lcsh;

    new-instance v11, Lkjd;

    invoke-direct {v11}, Lkjd;-><init>()V

    sget-object v29, Lnjd;->d:Lnjd;

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v16

    new-instance v12, Lujd;

    invoke-direct {v12}, Lujd;-><init>()V

    new-instance v15, Landroid/os/Bundle;

    invoke-direct {v15}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v15, v2, v13}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v15, v3, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v15, v5, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v15, v8, v7}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v15, v9, v14}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v15, v12, Lujd;->H:Landroid/os/Bundle;

    new-instance v2, Lvjd;

    invoke-direct {v2, v12}, Lvjd;-><init>(Lujd;)V

    iget-object v3, v10, Lijd;->e:Ljava/lang/Object;

    check-cast v3, Landroid/net/Uri;

    const/4 v4, 0x0

    if-eqz v3, :cond_bf

    iget-object v3, v10, Lijd;->d:Ljava/lang/Object;

    check-cast v3, Ljava/util/UUID;

    if-nez v3, :cond_bf

    move v3, v4

    goto :goto_c1

    :cond_bf
    move/from16 v3, p3

    :goto_c1
    invoke-static {v3}, Lz4o;->H(Z)V

    if-eqz v16, :cond_e9

    new-instance v15, Lmjd;

    iget-object v3, v10, Lijd;->d:Ljava/lang/Object;

    check-cast v3, Ljava/util/UUID;

    if-eqz v3, :cond_d6

    new-instance v3, Ljjd;

    invoke-direct {v3, v10}, Ljjd;-><init>(Lijd;)V

    move-object/from16 v18, v3

    goto :goto_d8

    :cond_d6
    const/16 v18, 0x0

    :goto_d8
    const/16 v17, 0x0

    const/16 v19, 0x0

    const/16 v21, 0x0

    const-wide v23, -0x7fffffffffffffffL    # -4.9E-324

    invoke-direct/range {v15 .. v24}, Lmjd;-><init>(Landroid/net/Uri;Ljava/lang/String;Ljjd;Ldjd;Ljava/util/List;Ljava/lang/String;Lh1b;J)V

    move-object/from16 v26, v15

    goto :goto_eb

    :cond_e9
    const/16 v26, 0x0

    :goto_eb
    new-instance v23, Lqjd;

    new-instance v3, Lhjd;

    invoke-direct {v3, v0}, Lgjd;-><init>(Lfjd;)V

    new-instance v0, Lljd;

    invoke-direct {v0, v11}, Lljd;-><init>(Lkjd;)V

    const-string v24, ""

    move-object/from16 v27, v0

    move-object/from16 v28, v2

    move-object/from16 v25, v3

    invoke-direct/range {v23 .. v29}, Lqjd;-><init>(Ljava/lang/String;Lhjd;Lmjd;Lljd;Lvjd;Lnjd;)V

    move-object/from16 v0, v23

    new-instance v2, Lai8;

    invoke-direct {v2, v1}, Lai8;-><init>(Landroid/content/Context;)V

    new-instance v5, Lpf2;

    const/4 v12, 0x0

    const/4 v9, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v10, 0x1

    move v11, v10

    invoke-direct/range {v5 .. v12}, Lpf2;-><init>(IIIZZII)V

    iget-boolean v3, v2, Lai8;->o:Z

    xor-int/lit8 v3, v3, 0x1

    invoke-static {v3}, Lz4o;->H(Z)V

    iput-object v5, v2, Lai8;->g:Lpf2;

    move/from16 v3, p3

    iput-boolean v3, v2, Lai8;->h:Z

    invoke-virtual {v2}, Lai8;->a()Lqi8;

    move-result-object v2

    new-instance v3, Lujc;

    invoke-direct {v3, v2, v4}, Lujc;-><init>(Lgig;B)V

    iget-object v2, v1, Lcom/opera/android/live_score/LiveCommentaryService;->l:Lvjc;

    invoke-virtual {v3, v2}, Lgk9;->S(Leig;)V

    invoke-virtual {v3, v0}, Lgk9;->E(Lqjd;)V

    invoke-virtual {v3}, Lgk9;->a()V

    invoke-virtual {v3}, Lgk9;->play()V

    iput-object v3, v1, Lcom/opera/android/live_score/LiveCommentaryService;->a:Lujc;

    new-instance v7, Lhr5;

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    iget-object v0, v3, Lgk9;->b:Lgig;

    invoke-interface {v0}, Lgig;->n()Z

    move-result v0

    invoke-static {v0}, Lz4o;->w(Z)V

    new-instance v8, Landroid/os/Bundle;

    invoke-direct {v8}, Landroid/os/Bundle;-><init>()V

    new-instance v9, Landroid/os/Bundle;

    invoke-direct {v9}, Landroid/os/Bundle;-><init>()V

    sget-object v0, Lh1b;->b:La1b;

    sget-object v0, Lcsh;->e:Lcsh;

    sget-object v2, Lpod;->b:Ljava/lang/Object;

    sget-object v2, Lnpd;->C:Ldsk;

    invoke-interface {v2}, Ldsk;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    new-instance v10, Lbpd;

    new-instance v5, Lgd6;

    invoke-direct {v5, v1, v4}, Lgd6;-><init>(Landroid/content/Context;B)V

    iput v2, v5, Lgd6;->c:I

    const/4 v2, 0x1

    iput-boolean v2, v5, Lgd6;->b:Z

    new-instance v2, Lhd6;

    invoke-direct {v2, v5}, Lhd6;-><init>(Lgd6;)V

    invoke-direct {v10, v2}, Lbpd;-><init>(Lhd6;)V

    move-object v4, v0

    new-instance v0, Lpod;

    const-string v2, "live_commentary"

    move-object v5, v4

    move-object v6, v4

    invoke-direct/range {v0 .. v10}, Lpod;-><init>(Landroid/content/Context;Ljava/lang/String;Lgk9;Lcsh;Lcsh;Lcsh;Lkod;Landroid/os/Bundle;Landroid/os/Bundle;Lbpd;)V

    iput-object v0, v1, Lcom/opera/android/live_score/LiveCommentaryService;->b:Lpod;

    const-string v2, "notification"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/NotificationManager;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Landroid/app/NotificationChannel;

    const v5, 0x7f140b57

    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "media"

    const/4 v7, 0x2

    invoke-direct {v4, v6, v5, v7}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    invoke-virtual {v2, v4}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    new-instance v2, Lgkg;

    const v4, 0x7f0a060e

    iget-object v5, v1, Lcom/opera/android/live_score/LiveCommentaryService;->n:Lc37;

    iget-object v6, v1, Lcom/opera/android/live_score/LiveCommentaryService;->m:Lqfb;

    invoke-direct {v2, v1, v4, v5, v6}, Lgkg;-><init>(Landroid/app/Service;ILdkg;Lekg;)V

    iget v4, v2, Lgkg;->C:I

    iget-object v5, v2, Lgkg;->f:Landroid/os/Handler;

    const v6, 0x7f08062c

    if-eq v4, v6, :cond_1c7

    iput v6, v2, Lgkg;->C:I

    iget-boolean v4, v2, Lgkg;->r:Z

    if-eqz v4, :cond_1c7

    const/4 v4, 0x1

    invoke-virtual {v5, v4}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v6

    if-nez v6, :cond_1c7

    invoke-virtual {v5, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_1c7
    invoke-virtual {v2, v3}, Lgkg;->b(Lgk9;)V

    iget-object v0, v0, Lpod;->a:Lnpd;

    iget-object v0, v0, Lnpd;->h:Laqd;

    iget-object v0, v0, Laqd;->j:Lbpd;

    iget-object v0, v0, Lbpd;->b:Ljava/lang/Object;

    check-cast v0, Lxod;

    iget-object v0, v0, Lxod;->c:Lapd;

    iget-object v0, v0, Lapd;->b:Landroid/media/session/MediaSession$Token;

    iget-object v3, v2, Lgkg;->t:Landroid/media/session/MediaSession$Token;

    invoke-static {v3, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1f0

    iput-object v0, v2, Lgkg;->t:Landroid/media/session/MediaSession$Token;

    iget-boolean v0, v2, Lgkg;->r:Z

    if-eqz v0, :cond_1f0

    const/4 v3, 0x1

    invoke-virtual {v5, v3}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_1f0

    invoke-virtual {v5, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_1f0
    iput-object v2, v1, Lcom/opera/android/live_score/LiveCommentaryService;->c:Lgkg;

    sget-object v0, Lcs6;->c:Lnak;

    new-instance v2, Lzjc;

    invoke-direct {v2, v13}, Lzjc;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    if-eqz v14, :cond_261

    sget-object v0, Lcom/opera/android/live_score/LiveCommentaryService;->p:Ldeg;

    if-eqz v0, :cond_261

    new-instance v2, Lnwa;

    const/4 v3, 0x1

    invoke-direct {v2, v1, v3}, Lnwa;-><init>(Ljava/lang/Object;B)V

    iput-object v2, v1, Lcom/opera/android/live_score/LiveCommentaryService;->d:Lnwa;

    invoke-virtual {v0, v14}, Ldeg;->i(Ljava/lang/String;)Ldwh;

    move-result-object v0

    invoke-virtual {v0, v2}, Ldwh;->f(Lacl;)V

    return v3

    :sswitch_216
    const-string v0, "com.opera.android.live_score.ACTION_RESUME"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_244

    iget-object v0, v1, Lcom/opera/android/live_score/LiveCommentaryService;->f:Ljava/lang/String;

    iget-object v1, v1, Lcom/opera/android/live_score/LiveCommentaryService;->a:Lujc;

    if-eqz v0, :cond_261

    if-eqz v1, :cond_261

    sget-object v2, Lcs6;->c:Lnak;

    new-instance v3, Lzjc;

    invoke-direct {v3, v0}, Lzjc;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    invoke-virtual {v2, v0, v3}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-virtual {v1}, Lgk9;->a()V

    invoke-virtual {v1}, Lgk9;->play()V

    const/4 v3, 0x1

    return v3

    :sswitch_23c
    const-string v0, "com.opera.android.live_score.ACTION_PAUSE"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_246

    :cond_244
    const/4 v3, 0x1

    goto :goto_264

    :cond_246
    iget-object v0, v1, Lcom/opera/android/live_score/LiveCommentaryService;->f:Ljava/lang/String;

    iget-object v1, v1, Lcom/opera/android/live_score/LiveCommentaryService;->a:Lujc;

    if-eqz v0, :cond_261

    if-eqz v1, :cond_261

    sget-object v2, Lcs6;->c:Lnak;

    new-instance v3, Lyjc;

    invoke-direct {v3, v0}, Lyjc;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    invoke-virtual {v2, v0, v3}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-virtual {v1}, Lgk9;->stop()V

    const/4 v3, 0x1

    return v3

    :cond_261
    const/4 v3, 0x1

    :goto_262
    return v3

    :cond_263
    :goto_263
    move v3, v12

    :goto_264
    invoke-virtual {v1}, Landroid/app/Service;->stopSelf()V

    return v3

    :sswitch_data_268
    .sparse-switch
        0x2239b755 -> :sswitch_23c
        0x289e628e -> :sswitch_216
        0x432b4dd5 -> :sswitch_2f
        0x432ccaa3 -> :sswitch_19
    .end sparse-switch
.end method
