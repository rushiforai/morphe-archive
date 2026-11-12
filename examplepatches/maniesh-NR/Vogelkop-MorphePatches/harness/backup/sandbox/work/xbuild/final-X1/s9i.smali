.class public final Ls9i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxyn;
.implements Lbn;
.implements Lssf;
.implements Lgln;
.implements Lxan;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 3

    iput-byte p1, p0, Ls9i;->a:B

    sparse-switch p1, :sswitch_data_2c

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    .line 1193
    :sswitch_9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1194
    new-instance p1, Ld8e;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Ld8e;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Ls9i;->d:Ljava/lang/Object;

    return-void

    .line 1195
    :sswitch_15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 p1, 0xa

    .line 1196
    new-array v0, p1, [I

    .line 1197
    iput-object v0, p0, Ls9i;->b:Ljava/lang/Object;

    .line 1198
    new-array v0, p1, [I

    .line 1199
    iput-object v0, p0, Ls9i;->c:Ljava/lang/Object;

    .line 1200
    new-array v0, p1, [I

    .line 1201
    iput-object v0, p0, Ls9i;->d:Ljava/lang/Object;

    .line 1202
    new-array p1, p1, [I

    .line 1203
    iput-object p1, p0, Ls9i;->e:Ljava/lang/Object;

    return-void

    nop

    :sswitch_data_2c
    .sparse-switch
        0xd -> :sswitch_15
        0x15 -> :sswitch_9
    .end sparse-switch
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    const/4 v0, 0x4

    iput-byte v0, p0, Ls9i;->a:B

    .line 1224
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1225
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ls9i;->b:Ljava/lang/Object;

    .line 1226
    new-instance v0, Lzpa;

    const/16 v1, 0x14

    .line 1227
    invoke-direct {v0, v1}, Lzpa;-><init>(B)V

    .line 1228
    iput-object v0, p0, Ls9i;->c:Ljava/lang/Object;

    .line 1229
    new-instance v1, Lxq0;

    invoke-direct {v1, v0}, Lxq0;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Ls9i;->d:Ljava/lang/Object;

    .line 1230
    new-instance v1, La5f;

    const-string v2, "activity"

    .line 1231
    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/ActivityManager;

    invoke-direct {v1, p1, v0}, La5f;-><init>(Landroid/app/ActivityManager;Lzpa;)V

    iput-object v1, p0, Ls9i;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lg77;)V
    .registers 4

    const/16 v0, 0xc

    iput-byte v0, p0, Ls9i;->a:B

    .line 1232
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1233
    new-instance v0, Lvr9;

    invoke-direct {v0, p0}, Lvr9;-><init>(Ls9i;)V

    iput-object v0, p0, Ls9i;->d:Ljava/lang/Object;

    .line 1234
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ls9i;->b:Ljava/lang/Object;

    .line 1235
    new-instance p1, Lga6;

    const/4 v0, 0x5

    invoke-direct {p1, p2, v0}, Lga6;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Ls9i;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 4

    const/16 v0, 0xf

    iput-byte v0, p0, Ls9i;->a:B

    .line 1204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1205
    new-instance v0, Li32;

    invoke-direct {v0, p0, p1, p2}, Li32;-><init>(Ls9i;Landroid/content/Context;Lumi;)V

    iput-object v0, p0, Ls9i;->b:Ljava/lang/Object;

    .line 1206
    iput-object p2, p0, Ls9i;->c:Ljava/lang/Object;

    .line 1207
    invoke-virtual {v0}, Lldk;->h()V

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Path;)V
    .registers 3

    const/16 v0, 0x1c

    iput-byte v0, p0, Ls9i;->a:B

    .line 1132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls9i;->b:Ljava/lang/Object;

    .line 1133
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Ls9i;->c:Ljava/lang/Object;

    .line 1134
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Ls9i;->d:Ljava/lang/Object;

    .line 1135
    new-instance p1, Landroid/graphics/PointF;

    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    iput-object p1, p0, Ls9i;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/media/AudioTrack;Lu59;)V
    .registers 4

    const/4 v0, 0x5

    iput-byte v0, p0, Ls9i;->a:B

    .line 1243
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1244
    iput-object p1, p0, Ls9i;->b:Ljava/lang/Object;

    .line 1245
    iput-object p2, p0, Ls9i;->c:Ljava/lang/Object;

    const/4 p2, 0x0

    .line 1246
    invoke-static {p2}, Ltym;->p(Landroid/os/Handler$Callback;)Landroid/os/Handler;

    move-result-object p2

    .line 1247
    iput-object p2, p0, Ls9i;->d:Ljava/lang/Object;

    .line 1248
    new-instance v0, Lqh2;

    invoke-direct {v0, p0}, Lqh2;-><init>(Ls9i;)V

    iput-object v0, p0, Ls9i;->e:Ljava/lang/Object;

    .line 1249
    invoke-virtual {p1, v0, p2}, Landroid/media/AudioTrack;->addOnRoutingChangedListener(Landroid/media/AudioRouting$OnRoutingChangedListener;Landroid/os/Handler;)V

    return-void
.end method

.method public constructor <init>(Landroid/widget/FrameLayout;)V
    .registers 4

    const/16 v0, 0x11

    iput-byte v0, p0, Ls9i;->a:B

    .line 1185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1186
    new-instance v0, Ltba;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ltba;-><init>(Ls9i;B)V

    iput-object v0, p0, Ls9i;->d:Ljava/lang/Object;

    .line 1187
    new-instance v0, Ltba;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Ltba;-><init>(Ls9i;B)V

    iput-object v0, p0, Ls9i;->e:Ljava/lang/Object;

    .line 1188
    iput-object p1, p0, Ls9i;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/esim/ui/EsimActivity;Lorg/chromium/content_public/browser/WebContents;Lala;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Ls9i;->a:B

    .line 1141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1142
    iput-object p3, p0, Ls9i;->b:Ljava/lang/Object;

    .line 1143
    new-instance p3, Lqq8;

    new-instance v0, Ltu;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Ltu;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p3, v0}, Lqq8;-><init>(Lcom/opera/api/Callback;)V

    iput-object p3, p0, Ls9i;->c:Ljava/lang/Object;

    .line 1144
    new-instance v0, Lcom/opera/android/webcore/WebcoreRpcBridge;

    const/4 v1, 0x3

    invoke-direct {v0, v1, p2, p0}, Lcom/opera/android/webcore/WebcoreRpcBridge;-><init>(ILorg/chromium/content_public/browser/WebContents;Lxyn;)V

    iput-object v0, p0, Ls9i;->d:Ljava/lang/Object;

    .line 1145
    new-instance p2, Ls98;

    invoke-direct {p2, p3}, Ls98;-><init>(Lqq8;)V

    iput-object p2, p0, Ls9i;->e:Ljava/lang/Object;

    .line 1146
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    .line 1147
    new-instance p2, Lrz;

    invoke-direct {p2, p0, v1}, Lrz;-><init>(Ljava/lang/Object;B)V

    .line 1148
    invoke-virtual {p1, p2}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method public constructor <init>(Lie6;Ljava/util/List;)V
    .registers 4

    const/16 v0, 0xa

    iput-byte v0, p0, Ls9i;->a:B

    .line 1236
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1237
    iput-object p1, p0, Ls9i;->e:Ljava/lang/Object;

    .line 1238
    new-instance p1, Lpfe;

    invoke-direct {p1}, Lpfe;-><init>()V

    .line 1239
    iput-object p1, p0, Ls9i;->b:Ljava/lang/Object;

    .line 1240
    new-instance p1, Lcd5;

    invoke-direct {p1}, Lcd5;-><init>()V

    .line 1241
    iput-object p1, p0, Ls9i;->c:Ljava/lang/Object;

    .line 1242
    check-cast p2, Ljava/lang/Iterable;

    invoke-static {p2}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Ls9i;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 6

    .line 1130
    iput-byte p5, p0, Ls9i;->a:B

    iput-object p2, p0, Ls9i;->b:Ljava/lang/Object;

    iput-object p3, p0, Ls9i;->c:Ljava/lang/Object;

    iput-object p4, p0, Ls9i;->d:Ljava/lang/Object;

    iput-object p1, p0, Ls9i;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;BZ)V
    .registers 7

    .line 1131
    iput-byte p5, p0, Ls9i;->a:B

    iput-object p1, p0, Ls9i;->b:Ljava/lang/Object;

    iput-object p2, p0, Ls9i;->c:Ljava/lang/Object;

    iput-object p3, p0, Ls9i;->d:Ljava/lang/Object;

    iput-object p4, p0, Ls9i;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lkwf;)V
    .registers 5

    const/16 v0, 0x17

    iput-byte v0, p0, Ls9i;->a:B

    .line 1208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls9i;->e:Ljava/lang/Object;

    .line 1209
    iget-object v0, p1, Lkwf;->v:Lk6l;

    new-instance v1, Lqz;

    const/16 v2, 0x11

    invoke-direct {v1, p0, v2}, Lqz;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lk6l;->a(La2l;)Lf6l;

    move-result-object v0

    iput-object v0, p0, Ls9i;->b:Ljava/lang/Object;

    .line 1210
    new-instance v0, Lsbf;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lsbf;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ls9i;->c:Ljava/lang/Object;

    .line 1211
    iget-object v1, p1, Lkwf;->y:Lp8f;

    .line 1212
    iget-object v1, v1, Lp8f;->b:Ljava/lang/Object;

    check-cast v1, Li7f;

    .line 1213
    invoke-virtual {v1, v0}, Li7f;->b(Ljava/lang/Object;)Z

    .line 1214
    new-instance v0, Ld8d;

    const/16 v1, 0x13

    invoke-direct {v0, p1, v1}, Ld8d;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ls9i;->d:Ljava/lang/Object;

    .line 1215
    iget-object p0, p1, Lkwf;->D:Lkze;

    if-eqz p0, :cond_39

    .line 1216
    invoke-virtual {p0, v0}, Lekc;->k(Lf7f;)V

    :cond_39
    return-void
.end method

.method public constructor <init>(Ll1f;)V
    .registers 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/16 v2, 0x16

    iput-byte v2, v0, Ls9i;->a:B

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    iput-object v2, v0, Ls9i;->e:Ljava/lang/Object;

    iput-object v1, v0, Ls9i;->d:Ljava/lang/Object;

    iget-object v2, v1, Ll1f;->a:Landroid/content/Context;

    iget-object v3, v1, Ll1f;->d:Ljava/util/ArrayList;

    iput-object v2, v0, Ls9i;->b:Ljava/lang/Object;

    iget-object v4, v1, Ll1f;->D:Ljava/lang/String;

    new-instance v5, Landroid/app/Notification$Builder;

    invoke-direct {v5, v2, v4}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v5, v0, Ls9i;->c:Ljava/lang/Object;

    iget-object v4, v1, Ll1f;->G:Landroid/app/Notification;

    iget-wide v6, v4, Landroid/app/Notification;->when:J

    invoke-virtual {v5, v6, v7}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    move-result-object v6

    iget v7, v4, Landroid/app/Notification;->icon:I

    iget v8, v4, Landroid/app/Notification;->iconLevel:I

    invoke-virtual {v6, v7, v8}, Landroid/app/Notification$Builder;->setSmallIcon(II)Landroid/app/Notification$Builder;

    move-result-object v6

    iget-object v7, v4, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setContent(Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    move-result-object v6

    iget-object v7, v4, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    move-result-object v6

    iget-object v7, v4, Landroid/app/Notification;->vibrate:[J

    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setVibrate([J)Landroid/app/Notification$Builder;

    move-result-object v6

    iget v7, v4, Landroid/app/Notification;->ledARGB:I

    iget v9, v4, Landroid/app/Notification;->ledOnMS:I

    iget v10, v4, Landroid/app/Notification;->ledOffMS:I

    invoke-virtual {v6, v7, v9, v10}, Landroid/app/Notification$Builder;->setLights(III)Landroid/app/Notification$Builder;

    move-result-object v6

    iget v7, v4, Landroid/app/Notification;->flags:I

    and-int/lit8 v7, v7, 0x2

    if-eqz v7, :cond_58

    const/4 v7, 0x1

    goto :goto_59

    :cond_58
    const/4 v7, 0x0

    :goto_59
    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v6

    iget v7, v4, Landroid/app/Notification;->flags:I

    and-int/lit8 v7, v7, 0x8

    if-eqz v7, :cond_65

    const/4 v7, 0x1

    goto :goto_66

    :cond_65
    const/4 v7, 0x0

    :goto_66
    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    move-result-object v6

    iget v7, v4, Landroid/app/Notification;->flags:I

    and-int/lit8 v7, v7, 0x10

    if-eqz v7, :cond_72

    const/4 v7, 0x1

    goto :goto_73

    :cond_72
    const/4 v7, 0x0

    :goto_73
    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v6

    iget v7, v4, Landroid/app/Notification;->defaults:I

    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object v6

    iget-object v7, v1, Ll1f;->e:Ljava/lang/CharSequence;

    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v6

    iget-object v7, v1, Ll1f;->f:Ljava/lang/CharSequence;

    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v6

    invoke-virtual {v6, v8}, Landroid/app/Notification$Builder;->setContentInfo(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v6

    iget-object v7, v1, Ll1f;->g:Landroid/app/PendingIntent;

    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v6

    iget-object v7, v4, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v6

    iget v7, v4, Landroid/app/Notification;->flags:I

    and-int/lit16 v7, v7, 0x80

    if-eqz v7, :cond_a1

    const/4 v7, 0x1

    goto :goto_a2

    :cond_a1
    const/4 v7, 0x0

    :goto_a2
    invoke-virtual {v6, v8, v7}, Landroid/app/Notification$Builder;->setFullScreenIntent(Landroid/app/PendingIntent;Z)Landroid/app/Notification$Builder;

    move-result-object v6

    iget v7, v1, Ll1f;->i:I

    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setNumber(I)Landroid/app/Notification$Builder;

    move-result-object v6

    iget v7, v1, Ll1f;->o:I

    iget v11, v1, Ll1f;->p:I

    iget-boolean v12, v1, Ll1f;->q:Z

    invoke-virtual {v6, v7, v11, v12}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    iget-object v6, v1, Ll1f;->h:Landroidx/core/graphics/drawable/IconCompat;

    if-nez v6, :cond_bb

    move-object v2, v8

    goto :goto_bf

    :cond_bb
    invoke-static {v6, v2}, Lfr3;->f0(Landroidx/core/graphics/drawable/IconCompat;Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    move-result-object v2

    :goto_bf
    invoke-virtual {v5, v2}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/drawable/Icon;)Landroid/app/Notification$Builder;

    iget-object v2, v1, Ll1f;->n:Ljava/lang/CharSequence;

    invoke-virtual {v5, v2}, Landroid/app/Notification$Builder;->setSubText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v2

    iget-boolean v5, v1, Ll1f;->l:Z

    invoke-virtual {v2, v5}, Landroid/app/Notification$Builder;->setUsesChronometer(Z)Landroid/app/Notification$Builder;

    move-result-object v2

    iget v5, v1, Ll1f;->j:I

    invoke-virtual {v2, v5}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    iget-object v2, v1, Ll1f;->b:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v6, 0x0

    :goto_da
    const-string v7, "android.support.allowGeneratedReplies"

    const-string v11, ""

    if-ge v6, v5, :cond_1e2

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v6, v6, 0x1

    check-cast v12, Ld1f;

    iget-object v13, v12, Ld1f;->b:Landroidx/core/graphics/drawable/IconCompat;

    if-nez v13, :cond_f6

    iget v14, v12, Ld1f;->j:I

    if-eqz v14, :cond_f6

    invoke-static {v8, v11, v14}, Landroidx/core/graphics/drawable/IconCompat;->d(Landroid/content/res/Resources;Ljava/lang/String;I)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object v13

    iput-object v13, v12, Ld1f;->b:Landroidx/core/graphics/drawable/IconCompat;

    :cond_f6
    iget v11, v12, Ld1f;->f:I

    iget-boolean v14, v12, Ld1f;->d:Z

    iget-object v15, v12, Ld1f;->a:Landroid/os/Bundle;

    new-instance v9, Landroid/app/Notification$Action$Builder;

    if-eqz v13, :cond_105

    invoke-static {v13, v8}, Lfr3;->f0(Landroidx/core/graphics/drawable/IconCompat;Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    move-result-object v13

    goto :goto_106

    :cond_105
    move-object v13, v8

    :goto_106
    iget-object v8, v12, Ld1f;->k:Ljava/lang/CharSequence;

    iget-object v10, v12, Ld1f;->l:Landroid/app/PendingIntent;

    invoke-direct {v9, v13, v8, v10}, Landroid/app/Notification$Action$Builder;-><init>(Landroid/graphics/drawable/Icon;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    iget-object v8, v12, Ld1f;->c:[Lith;

    if-eqz v8, :cond_185

    array-length v10, v8

    new-array v13, v10, [Landroid/app/RemoteInput;

    move-object/from16 v17, v2

    move/from16 v18, v5

    const/4 v2, 0x0

    :goto_119
    array-length v5, v8

    if-ge v2, v5, :cond_178

    aget-object v5, v8, v2

    move/from16 v19, v2

    new-instance v2, Landroid/app/RemoteInput$Builder;

    move/from16 v20, v6

    iget-object v6, v5, Lith;->a:Ljava/lang/String;

    invoke-direct {v2, v6}, Landroid/app/RemoteInput$Builder;-><init>(Ljava/lang/String;)V

    iget-object v6, v5, Lith;->b:Ljava/lang/CharSequence;

    invoke-virtual {v2, v6}, Landroid/app/RemoteInput$Builder;->setLabel(Ljava/lang/CharSequence;)Landroid/app/RemoteInput$Builder;

    move-result-object v2

    iget-object v6, v5, Lith;->c:[Ljava/lang/CharSequence;

    invoke-virtual {v2, v6}, Landroid/app/RemoteInput$Builder;->setChoices([Ljava/lang/CharSequence;)Landroid/app/RemoteInput$Builder;

    move-result-object v2

    iget-boolean v6, v5, Lith;->d:Z

    invoke-virtual {v2, v6}, Landroid/app/RemoteInput$Builder;->setAllowFreeFormInput(Z)Landroid/app/RemoteInput$Builder;

    move-result-object v2

    iget-object v6, v5, Lith;->f:Landroid/os/Bundle;

    invoke-virtual {v2, v6}, Landroid/app/RemoteInput$Builder;->addExtras(Landroid/os/Bundle;)Landroid/app/RemoteInput$Builder;

    move-result-object v2

    iget-object v6, v5, Lith;->g:Ljava/util/HashSet;

    if-eqz v6, :cond_164

    invoke-virtual {v6}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_149
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_164

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    move-object/from16 v22, v6

    move-object/from16 v6, v21

    check-cast v6, Ljava/lang/String;

    move-object/from16 v21, v8

    const/4 v8, 0x1

    invoke-virtual {v2, v6, v8}, Landroid/app/RemoteInput$Builder;->setAllowDataType(Ljava/lang/String;Z)Landroid/app/RemoteInput$Builder;

    move-object/from16 v8, v21

    move-object/from16 v6, v22

    goto :goto_149

    :cond_164
    move-object/from16 v21, v8

    iget v5, v5, Lith;->e:I

    invoke-virtual {v2, v5}, Landroid/app/RemoteInput$Builder;->setEditChoicesBeforeSending(I)Landroid/app/RemoteInput$Builder;

    invoke-virtual {v2}, Landroid/app/RemoteInput$Builder;->build()Landroid/app/RemoteInput;

    move-result-object v2

    aput-object v2, v13, v19

    add-int/lit8 v2, v19, 0x1

    move/from16 v6, v20

    move-object/from16 v8, v21

    goto :goto_119

    :cond_178
    move/from16 v20, v6

    const/4 v2, 0x0

    :goto_17b
    if-ge v2, v10, :cond_18b

    aget-object v5, v13, v2

    invoke-virtual {v9, v5}, Landroid/app/Notification$Action$Builder;->addRemoteInput(Landroid/app/RemoteInput;)Landroid/app/Notification$Action$Builder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_17b

    :cond_185
    move-object/from16 v17, v2

    move/from16 v18, v5

    move/from16 v20, v6

    :cond_18b
    if-eqz v15, :cond_193

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2, v15}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    goto :goto_198

    :cond_193
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    :goto_198
    invoke-virtual {v2, v7, v14}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v9, v14}, Landroid/app/Notification$Action$Builder;->setAllowGeneratedReplies(Z)Landroid/app/Notification$Action$Builder;

    const-string v5, "android.support.action.semanticAction"

    invoke-virtual {v2, v5, v11}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v9, v11}, Landroid/app/Notification$Action$Builder;->setSemanticAction(I)Landroid/app/Notification$Action$Builder;

    iget-boolean v5, v12, Ld1f;->g:Z

    invoke-virtual {v9, v5}, Landroid/app/Notification$Action$Builder;->setContextual(Z)Landroid/app/Notification$Action$Builder;

    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x1f

    if-lt v5, v6, :cond_1b6

    iget-boolean v6, v12, Ld1f;->m:Z

    invoke-static {v9, v6}, Lm41;->H(Landroid/app/Notification$Action$Builder;Z)V

    :cond_1b6
    const/16 v6, 0x25

    if-lt v5, v6, :cond_1c4

    iget v5, v12, Ld1f;->h:I

    invoke-static {v9, v5}, Lx8;->h(Landroid/app/Notification$Action$Builder;I)V

    iget v5, v12, Ld1f;->i:I

    invoke-static {v9, v5}, Lx8;->k(Landroid/app/Notification$Action$Builder;I)V

    :cond_1c4
    const-string v5, "android.support.action.showsUserInterface"

    iget-boolean v6, v12, Ld1f;->e:Z

    invoke-virtual {v2, v5, v6}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v9, v2}, Landroid/app/Notification$Action$Builder;->addExtras(Landroid/os/Bundle;)Landroid/app/Notification$Action$Builder;

    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    invoke-virtual {v9}, Landroid/app/Notification$Action$Builder;->build()Landroid/app/Notification$Action;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/app/Notification$Builder;->addAction(Landroid/app/Notification$Action;)Landroid/app/Notification$Builder;

    move-object/from16 v2, v17

    move/from16 v5, v18

    move/from16 v6, v20

    const/4 v8, 0x0

    goto/16 :goto_da

    :cond_1e2
    iget-object v2, v1, Ll1f;->x:Landroid/os/Bundle;

    if-eqz v2, :cond_1ed

    iget-object v5, v0, Ls9i;->e:Ljava/lang/Object;

    check-cast v5, Landroid/os/Bundle;

    invoke-virtual {v5, v2}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    :cond_1ed
    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    iget-boolean v5, v1, Ll1f;->k:Z

    invoke-virtual {v2, v5}, Landroid/app/Notification$Builder;->setShowWhen(Z)Landroid/app/Notification$Builder;

    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    iget-boolean v5, v1, Ll1f;->t:Z

    invoke-virtual {v2, v5}, Landroid/app/Notification$Builder;->setLocalOnly(Z)Landroid/app/Notification$Builder;

    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    iget-object v5, v1, Ll1f;->r:Ljava/lang/String;

    invoke-virtual {v2, v5}, Landroid/app/Notification$Builder;->setGroup(Ljava/lang/String;)Landroid/app/Notification$Builder;

    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Landroid/app/Notification$Builder;->setSortKey(Ljava/lang/String;)Landroid/app/Notification$Builder;

    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    iget-boolean v5, v1, Ll1f;->s:Z

    invoke-virtual {v2, v5}, Landroid/app/Notification$Builder;->setGroupSummary(Z)Landroid/app/Notification$Builder;

    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    iget-object v5, v1, Ll1f;->w:Ljava/lang/String;

    invoke-virtual {v2, v5}, Landroid/app/Notification$Builder;->setCategory(Ljava/lang/String;)Landroid/app/Notification$Builder;

    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    iget v5, v1, Ll1f;->y:I

    invoke-virtual {v2, v5}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;

    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    iget v5, v1, Ll1f;->z:I

    invoke-virtual {v2, v5}, Landroid/app/Notification$Builder;->setVisibility(I)Landroid/app/Notification$Builder;

    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    iget-object v5, v1, Ll1f;->A:Landroid/app/Notification;

    invoke-virtual {v2, v5}, Landroid/app/Notification$Builder;->setPublicVersion(Landroid/app/Notification;)Landroid/app/Notification$Builder;

    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    iget-object v5, v4, Landroid/app/Notification;->sound:Landroid/net/Uri;

    iget-object v4, v4, Landroid/app/Notification;->audioAttributes:Landroid/media/AudioAttributes;

    invoke-virtual {v2, v5, v4}, Landroid/app/Notification$Builder;->setSound(Landroid/net/Uri;Landroid/media/AudioAttributes;)Landroid/app/Notification$Builder;

    iget-object v2, v1, Ll1f;->I:Ljava/util/ArrayList;

    if-eqz v2, :cond_269

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_269

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    :goto_257
    if-ge v5, v4, :cond_269

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Ljava/lang/String;

    iget-object v8, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v8, Landroid/app/Notification$Builder;

    invoke-virtual {v8, v6}, Landroid/app/Notification$Builder;->addPerson(Ljava/lang/String;)Landroid/app/Notification$Builder;

    goto :goto_257

    :cond_269
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_3a4

    iget-object v2, v1, Ll1f;->x:Landroid/os/Bundle;

    if-nez v2, :cond_27a

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    iput-object v2, v1, Ll1f;->x:Landroid/os/Bundle;

    :cond_27a
    const-string v4, "android.car.EXTENSIONS"

    invoke-virtual {v2, v4}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    if-nez v2, :cond_287

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    :cond_287
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5, v2}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    const/4 v8, 0x0

    :goto_292
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v8, v9, :cond_387

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ld1f;

    new-instance v12, Landroid/os/Bundle;

    invoke-direct {v12}, Landroid/os/Bundle;-><init>()V

    iget-object v13, v10, Ld1f;->b:Landroidx/core/graphics/drawable/IconCompat;

    if-nez v13, :cond_2b6

    iget v14, v10, Ld1f;->j:I

    if-eqz v14, :cond_2b6

    const/4 v15, 0x0

    invoke-static {v15, v11, v14}, Landroidx/core/graphics/drawable/IconCompat;->d(Landroid/content/res/Resources;Ljava/lang/String;I)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object v13

    iput-object v13, v10, Ld1f;->b:Landroidx/core/graphics/drawable/IconCompat;

    :cond_2b6
    iget-object v14, v10, Ld1f;->a:Landroid/os/Bundle;

    if-eqz v13, :cond_2bf

    invoke-virtual {v13}, Landroidx/core/graphics/drawable/IconCompat;->e()I

    move-result v13

    goto :goto_2c0

    :cond_2bf
    const/4 v13, 0x0

    :goto_2c0
    const-string v15, "icon"

    invoke-virtual {v12, v15, v13}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v13, "title"

    iget-object v15, v10, Ld1f;->k:Ljava/lang/CharSequence;

    invoke-virtual {v12, v13, v15}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    const-string v13, "actionIntent"

    iget-object v15, v10, Ld1f;->l:Landroid/app/PendingIntent;

    invoke-virtual {v12, v13, v15}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    if-eqz v14, :cond_2db

    new-instance v13, Landroid/os/Bundle;

    invoke-direct {v13, v14}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    goto :goto_2e0

    :cond_2db
    new-instance v13, Landroid/os/Bundle;

    invoke-direct {v13}, Landroid/os/Bundle;-><init>()V

    :goto_2e0
    iget-boolean v14, v10, Ld1f;->d:Z

    invoke-virtual {v13, v7, v14}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v14, "extras"

    invoke-virtual {v12, v14, v13}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object v13, v10, Ld1f;->c:[Lith;

    if-nez v13, :cond_2f9

    move-object/from16 v16, v3

    move-object/from16 v17, v7

    const/4 v15, 0x0

    :cond_2f3
    move/from16 v19, v8

    move-object/from16 v20, v11

    goto/16 :goto_367

    :cond_2f9
    array-length v15, v13

    new-array v15, v15, [Landroid/os/Bundle;

    move-object/from16 v16, v3

    move-object/from16 v17, v7

    const/4 v3, 0x0

    :goto_301
    array-length v7, v13

    if-ge v3, v7, :cond_2f3

    aget-object v7, v13, v3

    move/from16 v18, v3

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    move/from16 v19, v8

    const-string v8, "resultKey"

    move-object/from16 v20, v11

    iget-object v11, v7, Lith;->a:Ljava/lang/String;

    invoke-virtual {v3, v8, v11}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v8, "label"

    iget-object v11, v7, Lith;->b:Ljava/lang/CharSequence;

    invoke-virtual {v3, v8, v11}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    const-string v8, "choices"

    iget-object v11, v7, Lith;->c:[Ljava/lang/CharSequence;

    invoke-virtual {v3, v8, v11}, Landroid/os/Bundle;->putCharSequenceArray(Ljava/lang/String;[Ljava/lang/CharSequence;)V

    const-string v8, "allowFreeFormInput"

    iget-boolean v11, v7, Lith;->d:Z

    invoke-virtual {v3, v8, v11}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object v8, v7, Lith;->f:Landroid/os/Bundle;

    invoke-virtual {v3, v14, v8}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object v7, v7, Lith;->g:Ljava/util/HashSet;

    if-eqz v7, :cond_35e

    invoke-virtual {v7}, Ljava/util/HashSet;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_35e

    new-instance v8, Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/HashSet;->size()I

    move-result v11

    invoke-direct {v8, v11}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v7}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_349
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_359

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_349

    :cond_359
    const-string v7, "allowedDataTypes"

    invoke-virtual {v3, v7, v8}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    :cond_35e
    aput-object v3, v15, v18

    add-int/lit8 v3, v18, 0x1

    move/from16 v8, v19

    move-object/from16 v11, v20

    goto :goto_301

    :goto_367
    const-string v3, "remoteInputs"

    invoke-virtual {v12, v3, v15}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    const-string v3, "showsUserInterface"

    iget-boolean v7, v10, Ld1f;->e:Z

    invoke-virtual {v12, v3, v7}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v3, "semanticAction"

    iget v7, v10, Ld1f;->f:I

    invoke-virtual {v12, v3, v7}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v6, v9, v12}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    add-int/lit8 v8, v19, 0x1

    move-object/from16 v3, v16

    move-object/from16 v7, v17

    move-object/from16 v11, v20

    goto/16 :goto_292

    :cond_387
    const-string v3, "invisible_actions"

    invoke-virtual {v2, v3, v6}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    invoke-virtual {v5, v3, v6}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object v3, v1, Ll1f;->x:Landroid/os/Bundle;

    if-nez v3, :cond_39a

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    iput-object v3, v1, Ll1f;->x:Landroid/os/Bundle;

    :cond_39a
    invoke-virtual {v3, v4, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object v2, v0, Ls9i;->e:Ljava/lang/Object;

    check-cast v2, Landroid/os/Bundle;

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_3a4
    iget-object v2, v1, Ll1f;->H:Landroid/graphics/drawable/Icon;

    if-eqz v2, :cond_3af

    iget-object v3, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v3, Landroid/app/Notification$Builder;

    invoke-virtual {v3, v2}, Landroid/app/Notification$Builder;->setSmallIcon(Landroid/graphics/drawable/Icon;)Landroid/app/Notification$Builder;

    :cond_3af
    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    iget-object v3, v1, Ll1f;->x:Landroid/os/Bundle;

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setExtras(Landroid/os/Bundle;)Landroid/app/Notification$Builder;

    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    const/4 v15, 0x0

    invoke-virtual {v2, v15}, Landroid/app/Notification$Builder;->setRemoteInputHistory([Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    iget-object v2, v1, Ll1f;->B:Landroid/widget/RemoteViews;

    if-eqz v2, :cond_3cb

    iget-object v3, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v3, Landroid/app/Notification$Builder;

    invoke-virtual {v3, v2}, Landroid/app/Notification$Builder;->setCustomContentView(Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    :cond_3cb
    iget-object v2, v1, Ll1f;->C:Landroid/widget/RemoteViews;

    if-eqz v2, :cond_3d6

    iget-object v3, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v3, Landroid/app/Notification$Builder;

    invoke-virtual {v3, v2}, Landroid/app/Notification$Builder;->setCustomBigContentView(Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    :cond_3d6
    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    iget-boolean v3, v1, Ll1f;->E:Z

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setBadgeIconType(I)Landroid/app/Notification$Builder;

    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    const/4 v15, 0x0

    invoke-virtual {v2, v15}, Landroid/app/Notification$Builder;->setSettingsText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    invoke-virtual {v2, v15}, Landroid/app/Notification$Builder;->setShortcutId(Ljava/lang/String;)Landroid/app/Notification$Builder;

    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    const-wide/16 v3, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/Notification$Builder;->setTimeoutAfter(J)Landroid/app/Notification$Builder;

    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setGroupAlertBehavior(I)Landroid/app/Notification$Builder;

    iget-boolean v2, v1, Ll1f;->v:Z

    if-eqz v2, :cond_40c

    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    iget-boolean v3, v1, Ll1f;->u:Z

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setColorized(Z)Landroid/app/Notification$Builder;

    :cond_40c
    iget-object v2, v1, Ll1f;->D:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_42a

    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    const/4 v15, 0x0

    invoke-virtual {v2, v15}, Landroid/app/Notification$Builder;->setSound(Landroid/net/Uri;)Landroid/app/Notification$Builder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object v2

    invoke-virtual {v2, v3, v3, v3}, Landroid/app/Notification$Builder;->setLights(III)Landroid/app/Notification$Builder;

    move-result-object v2

    invoke-virtual {v2, v15}, Landroid/app/Notification$Builder;->setVibrate([J)Landroid/app/Notification$Builder;

    goto :goto_42b

    :cond_42a
    const/4 v3, 0x0

    :goto_42b
    iget-object v2, v1, Ll1f;->c:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v9, v3

    :goto_432
    if-ge v9, v4, :cond_44b

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v9, v9, 0x1

    check-cast v3, Lecg;

    iget-object v5, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v5, Landroid/app/Notification$Builder;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3}, Lic4;->O(Lecg;)Landroid/app/Person;

    move-result-object v3

    invoke-virtual {v5, v3}, Landroid/app/Notification$Builder;->addPerson(Landroid/app/Person;)Landroid/app/Notification$Builder;

    goto :goto_432

    :cond_44b
    iget-object v2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    iget-boolean v1, v1, Ll1f;->F:Z

    invoke-virtual {v2, v1}, Landroid/app/Notification$Builder;->setAllowSystemGeneratedContextualActions(Z)Landroid/app/Notification$Builder;

    iget-object v1, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v1, Landroid/app/Notification$Builder;

    const/4 v15, 0x0

    invoke-virtual {v1, v15}, Landroid/app/Notification$Builder;->setBubbleMetadata(Landroid/app/Notification$BubbleMetadata;)Landroid/app/Notification$Builder;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x24

    if-lt v1, v2, :cond_469

    iget-object v0, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Landroid/app/Notification$Builder;

    invoke-static {v0}, Lu8;->q(Landroid/app/Notification$Builder;)V

    :cond_469
    return-void
.end method

.method public constructor <init>(Ln7h;Lhnl;Lunb;)V
    .registers 5

    const/4 v0, 0x7

    iput-byte v0, p0, Ls9i;->a:B

    .line 1217
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1218
    iput-object p1, p0, Ls9i;->b:Ljava/lang/Object;

    .line 1219
    iput-object p2, p0, Ls9i;->c:Ljava/lang/Object;

    .line 1220
    iput-object p3, p0, Ls9i;->d:Ljava/lang/Object;

    .line 1221
    new-instance p1, Lr3;

    const/4 p2, 0x0

    const/16 p3, 0xb

    invoke-direct {p1, p3, p2, p0}, Lr3;-><init>(BLmt5;Ljava/lang/Object;)V

    .line 1222
    invoke-static {p1}, Lf03;->g(Lkotlin/jvm/functions/Function2;)Lj94;

    move-result-object p1

    .line 1223
    iput-object p1, p0, Ls9i;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lns8;Ltq8;)V
    .registers 4

    const/16 v0, 0xe

    iput-byte v0, p0, Ls9i;->a:B

    .line 1189
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls9i;->e:Ljava/lang/Object;

    .line 1190
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ls9i;->c:Ljava/lang/Object;

    .line 1191
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ls9i;->d:Ljava/lang/Object;

    .line 1192
    iput-object p2, p0, Ls9i;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lorg/chromium/content_public/browser/WebContents;Lta7;)V
    .registers 5

    const/16 v0, 0x13

    iput-byte v0, p0, Ls9i;->a:B

    .line 1136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1137
    iput-object p2, p0, Ls9i;->b:Ljava/lang/Object;

    .line 1138
    new-instance p2, Lqq8;

    new-instance v0, Ly0a;

    const/16 v1, 0xf

    invoke-direct {v0, p0, v1}, Ly0a;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p2, v0}, Lqq8;-><init>(Lcom/opera/api/Callback;)V

    iput-object p2, p0, Ls9i;->c:Ljava/lang/Object;

    .line 1139
    new-instance v0, Lnv6;

    invoke-direct {v0, p2}, Lnv6;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Ls9i;->e:Ljava/lang/Object;

    .line 1140
    new-instance p2, Lcom/opera/android/webcore/WebcoreRpcBridge;

    const/4 v0, 0x1

    invoke-direct {p2, v0, p1, p0}, Lcom/opera/android/webcore/WebcoreRpcBridge;-><init>(ILorg/chromium/content_public/browser/WebContents;Lxyn;)V

    iput-object p2, p0, Ls9i;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lpde;Lk6l;)V
    .registers 6

    const/16 v0, 0x1d

    iput-byte v0, p0, Ls9i;->a:B

    .line 1149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1150
    iput-object p2, p0, Ls9i;->b:Ljava/lang/Object;

    .line 1151
    new-instance v0, Lpde;

    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 1152
    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 1153
    iput-object v0, p0, Ls9i;->c:Ljava/lang/Object;

    .line 1154
    new-instance v0, Lpde;

    sget-object v1, Loyi;->a:Loyi;

    .line 1155
    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 1156
    iput-object v0, p0, Ls9i;->d:Ljava/lang/Object;

    .line 1157
    sget-object v0, Lu3l;->c:Lo3l;

    iput-object v0, p0, Ls9i;->e:Ljava/lang/Object;

    .line 1158
    new-instance v0, Lryi;

    invoke-direct {v0, p0}, Lryi;-><init>(Ls9i;)V

    .line 1159
    new-instance v1, Lqz;

    const/16 v2, 0x18

    invoke-direct {v1, p0, v2}, Lqz;-><init>(Ljava/lang/Object;B)V

    .line 1160
    invoke-static {p2, p1, v0}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    .line 1161
    iget-object p0, p2, Lk6l;->s:Lg6l;

    .line 1162
    invoke-static {p0, p1, v1}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Lpxh;Lpxh;)V
    .registers 6

    const/16 v0, 0x1b

    iput-byte v0, p0, Ls9i;->a:B

    .line 1169
    new-instance v0, Lrxh;

    const v1, 0x7f140d85

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    .line 1170
    new-instance v1, Lrxh;

    const v2, 0x7f140b4b

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    .line 1171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1172
    iput-object p1, p0, Ls9i;->b:Ljava/lang/Object;

    .line 1173
    iput-object p2, p0, Ls9i;->c:Ljava/lang/Object;

    .line 1174
    iput-object v0, p0, Ls9i;->d:Ljava/lang/Object;

    .line 1175
    iput-object v1, p0, Ls9i;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lpza;Lni6;Lvzk;)V
    .registers 6

    const/16 v0, 0x1a

    iput-byte v0, p0, Ls9i;->a:B

    .line 1163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1164
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 1165
    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Ls9i;->d:Ljava/lang/Object;

    .line 1166
    new-instance v0, Li16;

    const/16 v1, 0x16

    invoke-direct {v0, p1, p2, v1}, Li16;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p0, Ls9i;->b:Ljava/lang/Object;

    .line 1167
    iput-object p3, p0, Ls9i;->c:Ljava/lang/Object;

    .line 1168
    new-instance p1, Lrx;

    const/4 p2, 0x5

    invoke-direct {p1, p0, p2}, Lrx;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p1}, Lvzk;->h(Ldy;)V

    return-void
.end method

.method public constructor <init>(Lsmg;)V
    .registers 3

    const/16 v0, 0x19

    iput-byte v0, p0, Ls9i;->a:B

    .line 1176
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1177
    iput-object p1, p0, Ls9i;->e:Ljava/lang/Object;

    .line 1178
    sget-object p1, Lqmg;->a:Lqmg;

    iput-object p1, p0, Ls9i;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lu06;Lw3b;Lgvf;Lgvf;)V
    .registers 6

    const/4 v0, 0x2

    iput-byte v0, p0, Ls9i;->a:B

    .line 1184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls9i;->d:Ljava/lang/Object;

    iput-object p2, p0, Ls9i;->e:Ljava/lang/Object;

    iput-object p3, p0, Ls9i;->b:Ljava/lang/Object;

    iput-object p4, p0, Ls9i;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lx79;Ljc9;Lcxj;Ljava/util/Map;Lydp;)V
    .registers 6

    const/16 p5, 0x14

    iput-byte p5, p0, Ls9i;->a:B

    .line 1179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1180
    iput-object p1, p0, Ls9i;->b:Ljava/lang/Object;

    .line 1181
    iput-object p2, p0, Ls9i;->c:Ljava/lang/Object;

    .line 1182
    iput-object p3, p0, Ls9i;->d:Ljava/lang/Object;

    .line 1183
    iput-object p4, p0, Ls9i;->e:Ljava/lang/Object;

    return-void
.end method

.method public static E(Lu06;Lw3b;Lgvf;Lgvf;)Ls9i;
    .registers 8

    sget-object v0, Lgvf;->d:Lgvf;

    const/4 v1, 0x0

    if-eq p2, v0, :cond_1f

    sget-object v0, Lu06;->b:Lu06;

    const-string v2, "ImpressionType/CreativeType can only be defined as DEFINED_BY_JAVASCRIPT if Impression Owner is JavaScript"

    sget-object v3, Lgvf;->b:Lgvf;

    if-ne p0, v0, :cond_f

    if-eq p2, v3, :cond_15

    :cond_f
    sget-object v0, Lw3b;->b:Lw3b;

    if-ne p1, v0, :cond_19

    if-ne p2, v3, :cond_19

    :cond_15
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    return-object v1

    :cond_19
    new-instance v0, Ls9i;

    invoke-direct {v0, p0, p1, p2, p3}, Ls9i;-><init>(Lu06;Lw3b;Lgvf;Lgvf;)V

    return-object v0

    :cond_1f
    const-string p0, "Impression owner is none"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v1
.end method


# virtual methods
.method public final A(Lzc7;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final B(Lf75;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final C(Lkvj;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final D(Liva;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final F(Lk66;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final G(Lnj3;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final H(Ljava/io/ByteArrayOutputStream;Lrsf;)V
    .registers 3

    check-cast p2, Lg11;

    iget-object p0, p2, Lg11;->b:Lx56;

    sget p2, Lxq0;->d:I

    new-instance p2, Ljava/io/DataOutputStream;

    invoke-direct {p2, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    const/4 p1, 0x2

    :try_start_c
    invoke-virtual {p2, p1}, Ljava/io/DataOutputStream;->writeByte(I)V

    invoke-static {p2, p0}, Lxq0;->g4(Ljava/io/DataOutputStream;Lx56;)V
    :try_end_12
    .catchall {:try_start_c .. :try_end_12} :catchall_16

    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    return-void

    :catchall_16
    move-exception p0

    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    throw p0
.end method

.method public final I()V
    .registers 1

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lp00;

    invoke-virtual {p0}, Lbp;->W()V

    return-void
.end method

.method public final J(Ljava/lang/Iterable;)V
    .registers 7

    new-instance v0, Ljava/util/LinkedHashSet;

    iget-object v1, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast v1, Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Collection;

    invoke-direct {v0, v2}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_18
    :goto_18
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2f

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lb2l;

    invoke-virtual {p0, v4}, Ls9i;->Z(Lb2l;)Z

    move-result v4

    if-eqz v4, :cond_18

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_18

    :cond_2f
    new-instance p0, Ljava/util/LinkedHashSet;

    invoke-direct {p0}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-static {v2, p0}, Lo95;->t(Ljava/lang/Iterable;Ljava/util/Collection;)V

    invoke-virtual {v0, p0}, Ljava/util/AbstractCollection;->removeAll(Ljava/util/Collection;)Z

    move-result p0

    if-eqz p0, :cond_40

    invoke-virtual {v1, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_40
    return-void
.end method

.method public final K(JJLnt5;)Ljava/lang/Object;
    .registers 14

    instance-of v0, p5, Lcle;

    if-eqz v0, :cond_14

    move-object v0, p5

    check-cast v0, Lcle;

    iget v1, v0, Lcle;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_14

    sub-int/2addr v1, v2

    iput v1, v0, Lcle;->v:I

    :goto_12
    move-object p5, v0

    goto :goto_1a

    :cond_14
    new-instance v0, Lcle;

    invoke-direct {v0, p0, p5}, Lcle;-><init>(Ls9i;Lnt5;)V

    goto :goto_12

    :goto_1a
    iget-object v0, p5, Lcle;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, p5, Lcle;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_37

    if-eq v2, v5, :cond_33

    if-ne v2, v4, :cond_2d

    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_73

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_33
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_58

    :cond_37
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast v0, Lhle;

    if-eqz v0, :cond_45

    invoke-virtual {v0}, Lhle;->U0()Lhle;

    move-result-object v0

    goto :goto_46

    :cond_45
    move-object v0, v3

    :goto_46
    const-wide/16 v6, 0x0

    if-nez v0, :cond_5d

    iget-object p0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast p0, Lhle;

    if-eqz p0, :cond_77

    iput v5, p5, Lcle;->v:I

    invoke-virtual/range {p0 .. p5}, Lhle;->B0(JJLmt5;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, v1, :cond_72

    :goto_58
    check-cast v0, Li1n;

    iget-wide v6, v0, Li1n;->a:J

    goto :goto_77

    :cond_5d
    iget-object p0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast p0, Lhle;

    if-eqz p0, :cond_67

    invoke-virtual {p0}, Lhle;->U0()Lhle;

    move-result-object v3

    :cond_67
    move-object p0, v3

    if-eqz p0, :cond_77

    iput v4, p5, Lcle;->v:I

    invoke-virtual/range {p0 .. p5}, Lhle;->B0(JJLmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_73

    :cond_72
    return-object v1

    :cond_73
    :goto_73
    check-cast v0, Li1n;

    iget-wide v6, v0, Li1n;->a:J

    :cond_77
    :goto_77
    new-instance p0, Li1n;

    invoke-direct {p0, v6, v7}, Li1n;-><init>(J)V

    return-object p0
.end method

.method public final L(JLnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p3, Ldle;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Ldle;

    iget v1, v0, Ldle;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Ldle;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Ldle;

    invoke-direct {v0, p0, p3}, Ldle;-><init>(Ls9i;Lnt5;)V

    :goto_18
    iget-object p3, v0, Ldle;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Ldle;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_46

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast p0, Lhle;

    if-eqz p0, :cond_3b

    invoke-virtual {p0}, Lhle;->U0()Lhle;

    move-result-object v3

    :cond_3b
    if-eqz v3, :cond_4b

    iput v4, v0, Ldle;->v:I

    invoke-virtual {v3, p1, p2, v0}, Lhle;->f0(JLmt5;)Ljava/lang/Object;

    move-result-object p3

    if-ne p3, v1, :cond_46

    return-object v1

    :cond_46
    :goto_46
    check-cast p3, Li1n;

    iget-wide p0, p3, Li1n;->a:J

    goto :goto_4d

    :cond_4b
    const-wide/16 p0, 0x0

    :goto_4d
    new-instance p2, Li1n;

    invoke-direct {p2, p0, p1}, Li1n;-><init>(J)V

    return-object p2
.end method

.method public final M(Lfmg;Z)V
    .registers 11

    iget-object v0, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast v0, Lsmg;

    iget-object v1, p1, Lfmg;->a:Ljava/util/List;

    move-object v2, v1

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v3

    const/4 v4, 0x0

    move v5, v4

    :goto_f
    if-ge v5, v3, :cond_24

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Llmg;

    invoke-virtual {v6}, Llmg;->c()Z

    move-result v6

    if-eqz v6, :cond_21

    invoke-virtual {p0, p1}, Ls9i;->g0(Lfmg;)V

    return-void

    :cond_21
    add-int/lit8 v5, v5, 0x1

    goto :goto_f

    :cond_24
    iget-object v3, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast v3, Lwye;

    if-eqz v3, :cond_60

    const-wide/16 v5, 0x0

    invoke-virtual {v3, v5, v6}, Lwye;->U(J)J

    move-result-wide v5

    new-instance v3, Lvvf;

    const/4 v7, 0x4

    invoke-direct {v3, p0, v0, v7}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1, v5, v6, v3, v4}, Lgyg;->W(Lfmg;JLkotlin/jvm/functions/Function1;Z)V

    iget-object p0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast p0, Lqmg;

    sget-object v3, Lqmg;->b:Lqmg;

    if-ne p0, v3, :cond_5f

    if-eqz p2, :cond_55

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result p0

    :goto_47
    if-ge v4, p0, :cond_55

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Llmg;

    invoke-virtual {p2}, Llmg;->a()V

    add-int/lit8 v4, v4, 0x1

    goto :goto_47

    :cond_55
    iget-object p0, p1, Lfmg;->b:Lrn9;

    if-eqz p0, :cond_5f

    iget-boolean p1, v0, Lsmg;->d:Z

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p0, Lrn9;->b:Z

    :cond_5f
    return-void

    :cond_60
    const-string p0, "layoutCoordinates not set"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method

.method public final N(Lnt5;)Ljava/lang/Object;
    .registers 9

    iget-object v0, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast v0, Lie6;

    instance-of v1, p1, Lsd6;

    if-eqz v1, :cond_17

    move-object v1, p1

    check-cast v1, Lsd6;

    iget v2, v1, Lsd6;->v:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_17

    sub-int/2addr v2, v3

    iput v2, v1, Lsd6;->v:I

    goto :goto_1c

    :cond_17
    new-instance v1, Lsd6;

    invoke-direct {v1, p0, p1}, Lsd6;-><init>(Ls9i;Lnt5;)V

    :goto_1c
    iget-object p1, v1, Lsd6;->t:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget v3, v1, Lsd6;->v:I

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-eqz v3, :cond_39

    if-eq v3, v6, :cond_35

    if-ne v3, v5, :cond_2f

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_59

    :cond_2f
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_35
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_66

    :cond_39
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_5c

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_5c

    invoke-virtual {v0}, Lie6;->c()Lylj;

    move-result-object p1

    new-instance v3, Lvd6;

    invoke-direct {v3, v0, p0, v4}, Lvd6;-><init>(Lie6;Ls9i;Lmt5;)V

    iput v5, v1, Lsd6;->v:I

    invoke-virtual {p1, v3, v1}, Lylj;->b(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v2, :cond_65

    :goto_59
    check-cast p1, Ljb6;

    goto :goto_68

    :cond_5c
    iput v6, v1, Lsd6;->v:I

    const/4 p0, 0x0

    invoke-virtual {v0, p0, v1}, Lie6;->h(ZLnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v2, :cond_66

    :cond_65
    return-object v2

    :cond_66
    :goto_66
    check-cast p1, Ljb6;

    :goto_68
    iget-object p0, v0, Lie6;->h:Lje6;

    invoke-virtual {p0, p1}, Lje6;->c(Lfak;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final O()V
    .registers 3

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lcxj;

    iget-object v0, p0, Lcxj;->a:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_1d

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v0

    const/16 v1, 0xa

    if-eq v1, v0, :cond_1d

    invoke-virtual {p0, v1}, Lcxj;->a(C)V

    :cond_1d
    return-void
.end method

.method public final P(Landroid/graphics/PointF;)Landroid/graphics/Path;
    .registers 6

    iget-object v0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Matrix;

    iget-object v1, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Path;

    iget-object v2, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/PointF;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_13

    return-object v1

    :cond_13
    invoke-virtual {v2, p1}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    iget v2, p1, Landroid/graphics/PointF;->x:F

    iget p1, p1, Landroid/graphics/PointF;->y:F

    invoke-virtual {v0, v2, p1}, Landroid/graphics/Matrix;->setScale(FF)V

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    iget-object p0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Path;

    invoke-virtual {v1, p0}, Landroid/graphics/Path;->set(Landroid/graphics/Path;)V

    invoke-virtual {v1, v0}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    return-object v1
.end method

.method public final Q()Lnx5;
    .registers 1

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnx5;

    if-eqz p0, :cond_d

    return-object p0

    :cond_d
    const-string p0, "in order to access nested coroutine scope you need to attach dispatcher to the `Modifier.nestedScroll` first."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final R(I)I
    .registers 4

    iget-object v0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast v0, Ltq8;

    iget-object v1, v0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p1, v1, :cond_20

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    iget-object v0, v0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr p1, v0

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgyj;

    iget p0, p0, Lgyj;->a:I

    return p0

    :cond_20
    invoke-virtual {v0, p1}, Ltq8;->u(I)Lhq8;

    move-result-object p0

    instance-of p1, p0, Lqok;

    if-eqz p1, :cond_2c

    const p0, 0x7f0a0428

    return p0

    :cond_2c
    instance-of p1, p0, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    if-eqz p1, :cond_34

    const p0, 0x7f0a0427

    return p0

    :cond_34
    invoke-virtual {p0}, Lhq8;->j()Z

    move-result p0

    if-eqz p0, :cond_3e

    const p0, 0x7f0a0421

    return p0

    :cond_3e
    const p0, 0x7f0a0423

    return p0
.end method

.method public final S(Lxoi;J)V
    .registers 5

    iget-object p1, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast p1, Lro9;

    const/4 v0, 0x2

    iput v0, p1, Lro9;->b:I

    iget-object p1, p1, Lro9;->d:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p2, p3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    iget-object p2, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p2, Ltba;

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->withStartAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    iget-object p0, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast p0, Ltba;

    invoke-virtual {p1, p0}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void
.end method

.method public final T()V
    .registers 11

    iget-object v0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Lro9;

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v0, v0, Lro9;->d:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    iget-object v0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    iget-object v1, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast v1, Lro9;

    iget-object v1, v1, Lro9;->d:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object v0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Lro9;

    iget-object v0, v0, Lro9;->c:Ljava/lang/Object;

    check-cast v0, Lxoi;

    iget-object v1, v0, Lxoi;->d:Lx5f;

    iget-boolean v2, v0, Lxoi;->f:Z

    iget-boolean v3, v1, Lx5f;->h:Z

    const/4 v4, 0x0

    if-eqz v3, :cond_78

    iget-object v3, v1, Lx5f;->d:Lzpa;

    new-instance v5, Lbe0;

    const/4 v6, -0x1

    const/4 v7, 0x2

    const/16 v8, 0x98b

    invoke-direct {v5, v8, v6, v7}, Ljf0;-><init>(III)V

    const/4 v6, 0x1

    invoke-virtual {v5, v6, v6, v2}, Ljf0;->r(IIZ)V

    sget-object v2, Lce0;->b:Lce0;

    invoke-virtual {v5, v4, v6, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-virtual {v2, v3}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v7

    invoke-virtual {v7, v3}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v3

    const/16 v7, 0x9

    invoke-virtual {v3, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    if-eqz v8, :cond_68

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_68

    new-instance v6, Lhf0;

    invoke-direct {v6, v3, v7, v8}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_72

    :cond_68
    invoke-static {v3, v7, v6}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v6

    new-instance v8, Lhf0;

    invoke-direct {v8, v3, v7, v6}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    move-object v6, v8

    :goto_72
    invoke-virtual {v6, v5}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v2}, Lx5f;->U0(Lx56;)V

    :cond_78
    iput-boolean v4, v0, Lxoi;->f:Z

    const/4 v0, 0x0

    iput-object v0, p0, Ls9i;->c:Ljava/lang/Object;

    return-void
.end method

.method public final U(Lxoi;)V
    .registers 5

    iget-object v0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Lro9;

    if-eqz v0, :cond_30

    iget-object v0, v0, Lro9;->c:Ljava/lang/Object;

    check-cast v0, Lxoi;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-object v0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Lro9;

    iget v1, v0, Lro9;->b:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2a

    iget-object v0, v0, Lro9;->d:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Ls9i;->S(Lxoi;J)V

    return-void

    :cond_2a
    const/4 p1, 0x1

    if-ne v1, p1, :cond_30

    invoke-virtual {p0}, Ls9i;->T()V

    :cond_30
    return-void
.end method

.method public final V(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 12

    instance-of v0, p2, Lkq6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lkq6;

    iget v1, v0, Lkq6;->y:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lkq6;->y:I

    goto :goto_18

    :cond_13
    new-instance v0, Lkq6;

    invoke-direct {v0, p0, p2}, Lkq6;-><init>(Ls9i;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lkq6;->w:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lkq6;->y:I

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v2, :cond_48

    if-eq v2, v5, :cond_42

    if-eq v2, v4, :cond_39

    if-ne v2, v3, :cond_33

    iget-object p0, v0, Lkq6;->v:Ljava/lang/String;

    iget-object p1, v0, Lkq6;->u:Ljava/lang/String;

    :try_start_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_31
    .catch Li3k; {:try_start_2e .. :try_end_31} :catch_109

    goto/16 :goto_ff

    :cond_33
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :cond_39
    iget-object p1, v0, Lkq6;->u:Ljava/lang/String;

    iget-object v2, v0, Lkq6;->t:Ljava/lang/String;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_b2

    :cond_42
    iget-object p1, v0, Lkq6;->t:Ljava/lang/String;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_87

    :cond_48
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p2, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast p2, Llv1;

    iget-object p2, p2, Llv1;->b:Lxv1;

    iget-object p2, p2, Lxv1;->s1:Lj4c;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-nez p2, :cond_6e

    sget-object p0, Lt0i;->b:Lp0i;

    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Invalid device user"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    return-object p1

    :cond_6e
    iget-object p2, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast p2, Lx77;

    iput-object p1, v0, Lkq6;->t:Ljava/lang/String;

    iput v5, v0, Lkq6;->y:I

    iget-object v2, p2, Lx77;->c:Ljava/lang/Object;

    check-cast v2, Ljg8;

    new-instance v5, Lbz1;

    const/16 v7, 0xa

    invoke-direct {v5, v7, v6, p2}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v2, v5, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_fb

    :goto_87
    check-cast p2, Ljava/lang/String;

    if-nez p2, :cond_9a

    sget-object p0, Lt0i;->b:Lp0i;

    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Device ID not found"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    return-object p1

    :cond_9a
    iget-object v2, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Leq6;

    iput-object p1, v0, Lkq6;->t:Ljava/lang/String;

    iput-object p2, v0, Lkq6;->u:Ljava/lang/String;

    iput v4, v0, Lkq6;->y:I

    iget-object v2, v2, Leq6;->a:Ljava/lang/Object;

    check-cast v2, Li88;

    invoke-virtual {v2, v0}, Li88;->a(Lnt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v1, :cond_fb

    move-object v8, v2

    move-object v2, p1

    move-object p1, p2

    move-object p2, v8

    :goto_b2
    check-cast p2, Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p2, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    const-string v4, "opera-esim-free-claim:"

    const-string v5, ":"

    invoke-static {v4, p1, v5, p2}, Lp3p;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lf8a;->g:Lf8a;

    invoke-virtual {v5, v4}, Lf8a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_e3

    sget-object p0, Lt0i;->b:Lp0i;

    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Unexpected hash. Expected: "

    const-string p2, " Actual: "

    invoke-static {p1, v2, p2, v4}, Lp3p;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    return-object p1

    :cond_e3
    :try_start_e3
    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lohg;

    iput-object v6, v0, Lkq6;->t:Ljava/lang/String;

    iput-object p1, v0, Lkq6;->u:Ljava/lang/String;

    iput-object p2, v0, Lkq6;->v:Ljava/lang/String;

    iput v3, v0, Lkq6;->y:I

    invoke-virtual {p0, v4, v0}, Lohg;->b(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_fc

    :cond_fb
    return-object v1

    :cond_fc
    move-object v8, p2

    move-object p2, p0

    move-object p0, v8

    :goto_ff
    check-cast p2, Lbqo;
    :try_end_101
    .catch Li3k; {:try_start_e3 .. :try_end_101} :catch_109

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Llcb;

    invoke-direct {v0, p2, p1, p0}, Llcb;-><init>(Lbqo;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :catch_109
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    return-object p1
.end method

.method public final W()Z
    .registers 3

    iget-object v0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqyi;

    instance-of v1, v0, Lpyi;

    if-eqz v1, :cond_24

    check-cast v0, Lpyi;

    iget v0, v0, Lpyi;->a:I

    iget-object p0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/LinkedHashSet;

    invoke-virtual {p0}, Ljava/util/AbstractCollection;->size()I

    move-result p0

    if-ne v0, p0, :cond_24

    const/4 p0, 0x1

    return p0

    :cond_24
    const/4 p0, 0x0

    return p0
.end method

.method public final X(Ljava/util/Collection;)Z
    .registers 2

    iget-object p0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/LinkedHashSet;

    invoke-virtual {p0, p1}, Ljava/util/AbstractCollection;->containsAll(Ljava/util/Collection;)Z

    move-result p0

    return p0
.end method

.method public final Y()Z
    .registers 2

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    sget-object v0, Loyi;->a:Loyi;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public final Z(Lb2l;)Z
    .registers 3

    invoke-virtual {p0}, Ls9i;->Y()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    iget-object p0, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast p0, Lu3l;

    invoke-interface {p0, p1}, Lu3l;->a(Lb2l;)Z

    move-result p0

    return p0
.end method

.method public final a(Lcom/opera/android/custom_views/DialogTitle;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/Button;Landroid/widget/Button;)V
    .registers 7

    iget-object v0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast v0, Lpxh;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v0, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {p1, v0}, Lna2;->S(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    iget-object p1, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast p1, Lpxh;

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1, v0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {p2, p1}, Lna2;->S(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    iget-object p1, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p1, Lrxh;

    invoke-virtual {p3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p1, p2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast p0, Lrxh;

    invoke-virtual {p4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p0, p1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p4, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final a0()I
    .registers 1

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lcxj;

    iget-object p0, p0, Lcxj;->a:Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    return p0
.end method

.method public final b()Lrsf;
    .registers 3

    new-instance v0, Lg11;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lg11;-><init>(Ls9i;Lx56;)V

    return-object v0
.end method

.method public final b0()V
    .registers 7

    iget-object v0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast v0, Lk6l;

    iget-object v1, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast v1, Lpde;

    invoke-virtual {p0}, Ls9i;->Y()Z

    move-result v2

    if-eqz v2, :cond_4b

    iget-object v2, v0, Lk6l;->d:Lghf;

    iget-object v2, v2, Lghf;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_4b

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqyi;

    sget-object v3, Loyi;->a:Loyi;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_30

    check-cast v2, Lpyi;

    iget-boolean v2, v2, Lpyi;->c:Z

    if-eqz v2, :cond_30

    const/4 v2, 0x1

    goto :goto_31

    :cond_30
    const/4 v2, 0x0

    :goto_31
    new-instance v3, Lpyi;

    iget-object v4, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast v4, Lu3l;

    sget-object v5, Ly6l;->a:Ly6l;

    invoke-static {v0, v4, v5}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object p0, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast p0, Lu3l;

    invoke-direct {v3, v0, p0, v2}, Lpyi;-><init>(ILu3l;Z)V

    invoke-virtual {v1, v3}, Lekc;->r(Ljava/lang/Object;)V

    :cond_4b
    return-void
.end method

.method public final c(Lnel;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final c0(Lnt5;)Ljava/lang/Object;
    .registers 10

    iget-object v0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Lcd5;

    instance-of v1, p1, Lxbi;

    if-eqz v1, :cond_17

    move-object v1, p1

    check-cast v1, Lxbi;

    iget v2, v1, Lxbi;->w:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_17

    sub-int/2addr v2, v3

    iput v2, v1, Lxbi;->w:I

    goto :goto_1c

    :cond_17
    new-instance v1, Lxbi;

    invoke-direct {v1, p0, p1}, Lxbi;-><init>(Ls9i;Lnt5;)V

    :goto_1c
    iget-object p1, v1, Lxbi;->u:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget v3, v1, Lxbi;->w:I

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v3, :cond_3e

    if-eq v3, v5, :cond_37

    if-ne v3, v4, :cond_31

    iget-object p0, v1, Lxbi;->t:Lpfe;

    :try_start_2d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_30
    .catchall {:try_start_2d .. :try_end_30} :catchall_79

    goto :goto_70

    :cond_31
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :cond_37
    iget-object v3, v1, Lxbi;->t:Lpfe;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object p1, v3

    goto :goto_58

    :cond_3e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lxob;->h0()Z

    move-result p1

    if-eqz p1, :cond_4a

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_4a
    iget-object p1, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast p1, Lpfe;

    iput-object p1, v1, Lxbi;->t:Lpfe;

    iput v5, v1, Lxbi;->w:I

    invoke-virtual {p1, v1}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object v3

    if-eq v3, v2, :cond_6e

    :goto_58
    :try_start_58
    invoke-virtual {v0}, Lxob;->h0()Z

    move-result v3

    if-eqz v3, :cond_64

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_60
    .catchall {:try_start_58 .. :try_end_60} :catchall_7b

    invoke-virtual {p1, v6}, Lpfe;->l(Ljava/lang/Object;)V

    return-object p0

    :cond_64
    :try_start_64
    iput-object p1, v1, Lxbi;->t:Lpfe;

    iput v4, v1, Lxbi;->w:I

    invoke-virtual {p0, v1}, Ls9i;->N(Lnt5;)Ljava/lang/Object;

    move-result-object p0
    :try_end_6c
    .catchall {:try_start_64 .. :try_end_6c} :catchall_7b

    if-ne p0, v2, :cond_6f

    :cond_6e
    return-object v2

    :cond_6f
    move-object p0, p1

    :goto_70
    :try_start_70
    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p1}, Lxob;->j0(Ljava/lang/Object;)Z
    :try_end_75
    .catchall {:try_start_70 .. :try_end_75} :catchall_79

    invoke-virtual {p0, v6}, Lpfe;->l(Ljava/lang/Object;)V

    return-object p1

    :catchall_79
    move-exception p1

    goto :goto_7f

    :catchall_7b
    move-exception p0

    move-object v7, p1

    move-object p1, p0

    move-object p0, v7

    :goto_7f
    invoke-virtual {p0, v6}, Lpfe;->l(Ljava/lang/Object;)V

    throw p1
.end method

.method public final d(Lbsf;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final d0(Ljava/lang/Iterable;)V
    .registers 9

    iget-object v0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/LinkedHashSet;

    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    iget-object p0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast p0, Lk6l;

    iget-object p0, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_24
    :goto_24
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_41

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Lb2l;

    invoke-virtual {v1, v5}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3d

    invoke-static {p1, v5}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_24

    :cond_3d
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_24

    :cond_41
    invoke-virtual {v2, v3}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4d

    invoke-virtual {v0, v2}, Lekc;->r(Ljava/lang/Object;)V

    :cond_4d
    return-void
.end method

.method public final e(Ljava/util/ArrayList;)V
    .registers 10

    iget-object v0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast v0, Luk5;

    iget-object v1, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    check-cast v1, Ljava/util/Collection;

    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {p1, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    move v6, v5

    :goto_1b
    if-ge v6, v4, :cond_2d

    invoke-virtual {p1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Laln;

    invoke-interface {v7}, Laln;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1b

    :cond_2d
    check-cast v1, Ljava/lang/Iterable;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_38
    :goto_38
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_38

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_38

    :cond_4f
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_7e

    new-instance p0, Ljava/util/ArrayList;

    invoke-static {v4, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result p1

    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result p1

    :goto_62
    if-ge v5, p1, :cond_75

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v5, v5, 0x1

    check-cast v1, Ljava/lang/String;

    new-instance v2, Ljjb;

    invoke-direct {v2, v1}, Ljjb;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_62

    :cond_75
    new-instance p1, Lrw7;

    invoke-direct {p1, p0}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p1}, Luk5;->run(Ljava/lang/Object;)V

    return-void

    :cond_7e
    iget-object v1, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast v1, Lffb;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_10f

    iget-object p0, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast p0, Lzy9;

    iget-object p0, p0, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqln;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v3, v5

    :cond_9d
    if-ge v3, v2, :cond_b7

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    move-object v6, v4

    check-cast v6, Laln;

    invoke-interface {v6}, Laln;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1}, Lvq8;->m(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9d

    goto :goto_b8

    :cond_b7
    const/4 v4, 0x0

    :goto_b8
    check-cast v4, Laln;

    new-instance p1, Liu2;

    const/16 v1, 0x15

    invoke-direct {p1, v0, v1}, Liu2;-><init>(Ljava/lang/Object;B)V

    if-eqz v4, :cond_104

    iget-object v0, p0, Lqln;->m:Lrgh;

    iget-object v1, v0, Lrgh;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/res/Resources;

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    mul-int/lit8 v1, v1, 0x5a

    div-int/lit8 v1, v1, 0x64

    iget-object v2, v0, Lrgh;->b:Ljava/lang/Object;

    check-cast v2, Landroid/content/res/Resources;

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    iget-object v0, v0, Lrgh;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f0700a0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sub-int/2addr v2, v0

    mul-int/lit8 v2, v2, 0x5a

    div-int/lit8 v2, v2, 0x64

    new-instance v0, Lo2c;

    invoke-direct {v0, v5, v1, v2, v5}, Lo2c;-><init>(ZIIZ)V

    iget-object v1, p0, Lqln;->a:Landroid/content/Context;

    invoke-interface {v4, v1, v0}, Laln;->c(Landroid/content/Context;Lo2c;)Lxkn;

    move-result-object v1

    iget-object p0, p0, Lqln;->g:Lagm;

    new-instance v2, Lqjn;

    invoke-direct {v2, p0, v1, p1, v0}, Lqjn;-><init>(Lagm;Lxkn;Lcom/opera/api/Callback;Lo2c;)V

    return-void

    :cond_104
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lzmn;

    invoke-direct {p0, v5}, Lzmn;-><init>(B)V

    invoke-virtual {p1, p0}, Liu2;->run(Ljava/lang/Object;)V

    :cond_10f
    return-void
.end method

.method public final e0(ILjava/lang/Object;)V
    .registers 5

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lcxj;

    iget-object v0, p0, Lcxj;->a:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-eqz p2, :cond_19

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-le v1, p1, :cond_19

    if-ltz p1, :cond_19

    if-gt v1, v0, :cond_19

    invoke-static {p0, p2, p1, v1}, Lcxj;->d(Lcxj;Ljava/lang/Object;II)V

    :cond_19
    return-void
.end method

.method public final f(Lk73;)V
    .registers 2

    iget-object p1, p1, Lk73;->f:Ljava/lang/Object;

    check-cast p1, Lk73;

    if-eqz p1, :cond_12

    invoke-virtual {p0}, Ls9i;->O()V

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lcxj;

    const/16 p1, 0xa

    invoke-virtual {p0, p1}, Lcxj;->a(C)V

    :cond_12
    return-void
.end method

.method public final f0(Ljava/lang/Class;I)V
    .registers 5

    iget-object v0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast v0, Lx79;

    iget-object v1, v0, Lx79;->e:Ljava/lang/Object;

    check-cast v1, Lpw1;

    iget-object v1, v1, Lpw1;->a:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lrj3;

    if-eqz p1, :cond_1d

    iget-object v1, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast v1, Ljc9;

    invoke-virtual {p1, v0, v1}, Lrj3;->a(Lx79;Ljc9;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Ls9i;->e0(ILjava/lang/Object;)V

    :cond_1d
    return-void
.end method

.method public final g(Lk9a;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final g0(Lfmg;)V
    .registers 7

    iget-object v0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Lqmg;

    sget-object v1, Lqmg;->b:Lqmg;

    if-ne v0, v1, :cond_29

    iget-object v0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast v0, Lwye;

    if-eqz v0, :cond_23

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Lwye;->U(J)J

    move-result-wide v0

    iget-object v2, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast v2, Lsmg;

    new-instance v3, Lrmg;

    const/4 v4, 0x0

    invoke-direct {v3, v2, v4}, Lrmg;-><init>(Ljava/lang/Object;B)V

    const/4 v2, 0x1

    invoke-static {p1, v0, v1, v3, v2}, Lgyg;->W(Lfmg;JLkotlin/jvm/functions/Function1;Z)V

    goto :goto_29

    :cond_23
    const-string p0, "layoutCoordinates not set"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void

    :cond_29
    :goto_29
    sget-object p1, Lqmg;->c:Lqmg;

    iput-object p1, p0, Ls9i;->c:Ljava/lang/Object;

    return-void
.end method

.method public final h(Lmma;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final h0()V
    .registers 3

    invoke-virtual {p0}, Ls9i;->Y()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Lpde;

    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lpde;

    sget-object v0, Loyi;->a:Loyi;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final i()V
    .registers 10

    iget-object v0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast v0, Lcie;

    iget-object v1, v0, Lbzo;->d:Lw06;

    iget-object v2, p0, Ls9i;->e:Ljava/lang/Object;

    move-object v3, v2

    check-cast v3, Lq00;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Ls00;->q(Lw06;I)Z

    move-result v2

    if-nez v2, :cond_2d

    invoke-static {v1}, Ls00;->p(Lw06;)Lv50;

    move-result-object v7

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "Unsupported type #"

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-byte v0, v7, Lv50;->a:B

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v4, 0x0

    invoke-virtual/range {v3 .. v8}, Lk43;->b(ZLjava/lang/String;ZLv50;Ljava/lang/Long;)V

    return-void

    :cond_2d
    iget-object v1, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lp00;

    invoke-virtual {v3, v0, v1, p0}, Lq00;->h(Lcie;Ljava/lang/String;Lp00;)V

    return-void
.end method

.method public final i0()Z
    .registers 2

    iget-object p0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast p0, Ltq8;

    instance-of v0, p0, Lydh;

    if-nez v0, :cond_e

    instance-of p0, p0, Lcom/opera/android/favorites/f;

    if-nez p0, :cond_e

    const/4 p0, 0x0

    return p0

    :cond_e
    const/4 p0, 0x1

    return p0
.end method

.method public final j(Ltik;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final j0(Lb2l;)V
    .registers 3

    iget-object v0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedHashSet;

    invoke-virtual {v0, p1}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-virtual {p0, p1}, Ls9i;->J(Ljava/lang/Iterable;)V

    return-void

    :cond_1a
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-virtual {p0, p1}, Ls9i;->d0(Ljava/lang/Iterable;)V

    return-void
.end method

.method public final k(Lbll;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final k0(Z)V
    .registers 6

    iget-object v0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast v0, Ltq8;

    instance-of v1, v0, Lydh;

    if-eqz v1, :cond_13

    check-cast v0, Lydh;

    iget-boolean v1, v0, Lydh;->m:Z

    if-eq v1, p1, :cond_13

    iput-boolean p1, v0, Lydh;->m:Z

    invoke-virtual {v0}, Lydh;->D()V

    :cond_13
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    new-instance v1, Lo00;

    const/4 v2, 0x5

    invoke-direct {v1, v2}, Lo00;-><init>(B)V

    new-instance v2, Lzlb;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v1, v3}, Lzlb;-><init>(Ljava/lang/Iterable;Ljava/lang/Object;B)V

    invoke-static {p1, v2}, Lsfe;->z(Ljava/util/AbstractCollection;Lzlb;)V

    new-instance v0, Ljs8;

    invoke-direct {v0, p0, p1}, Ljs8;-><init>(Ls9i;Ljava/util/ArrayList;)V

    const/4 v1, 0x1

    invoke-static {v0, v1}, Luup;->k(Lk1g;Z)Lj87;

    move-result-object v0

    iput-object p1, p0, Ls9i;->d:Ljava/lang/Object;

    new-instance p1, Lxm5;

    invoke-direct {p1, p0}, Lxm5;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p1}, Lj87;->a(Lsic;)V

    return-void
.end method

.method public final l(Lxy8;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final l0(Lk73;)V
    .registers 4

    iget-object v0, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxbd;

    if-eqz v0, :cond_14

    invoke-interface {v0, p0, p1}, Lxbd;->a(Ls9i;Lk73;)V

    return-void

    :cond_14
    invoke-virtual {p0, p1}, Ls9i;->m0(Lk73;)V

    return-void
.end method

.method public final m(Lbm;)V
    .registers 8

    iget-object p0, p0, Ls9i;->e:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Lq00;

    sget-object p0, Lbm;->d:Lbm;

    if-ne p1, p0, :cond_c

    const/4 p0, 0x1

    :goto_a
    move v1, p0

    goto :goto_e

    :cond_c
    const/4 p0, 0x0

    goto :goto_a

    :goto_e
    iget-object v2, p1, Lbm;->c:Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {v0 .. v5}, Lk43;->b(ZLjava/lang/String;ZLv50;Ljava/lang/Long;)V

    return-void
.end method

.method public final m0(Lk73;)V
    .registers 3

    iget-object p1, p1, Lk73;->c:Ljava/lang/Object;

    check-cast p1, Lk73;

    :goto_4
    if-eqz p1, :cond_f

    iget-object v0, p1, Lk73;->f:Ljava/lang/Object;

    check-cast v0, Lk73;

    invoke-virtual {p1, p0}, Lk73;->a(Lxan;)V

    move-object p1, v0

    goto :goto_4

    :cond_f
    return-void
.end method

.method public final n(Lqz7;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final o(Lkal;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final onAdClicked()V
    .registers 1

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lp00;

    invoke-virtual {p0}, Lbp;->V()V

    return-void
.end method

.method public final onFailure()V
    .registers 3

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Luk5;

    sget-object v0, Lxle;->b:Lxle;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    new-instance v1, Lrw7;

    invoke-direct {v1, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Luk5;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final p(Ll7a;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final q(Lszf;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final r(Lmfc;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final s(Lphc;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final t(Ljava/lang/String;)V
    .registers 3

    iget-byte v0, p0, Ls9i;->a:B

    packed-switch v0, :pswitch_data_20

    :try_start_5
    iget-object p0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast p0, Lqq8;

    new-instance v0, Lorb;

    invoke-direct {v0, p1}, Lorb;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lqq8;->j(Lorb;)V
    :try_end_11
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_11} :catch_11

    :catch_11
    return-void

    :pswitch_12
    :try_start_12
    iget-object p0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast p0, Lqq8;

    new-instance v0, Lorb;

    invoke-direct {v0, p1}, Lorb;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lqq8;->j(Lorb;)V
    :try_end_1e
    .catch Lorg/json/JSONException; {:try_start_12 .. :try_end_1e} :catch_1e

    :catch_1e
    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method

.method public final u(Lxfc;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final v(Ljava/io/ByteArrayInputStream;)Lrsf;
    .registers 5

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast v1, Lxq0;

    new-instance v2, Ljava/io/DataInputStream;

    invoke-direct {v2, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    :try_start_d
    invoke-virtual {v1, v2}, Lxq0;->K2(Ljava/io/DataInputStream;)V

    invoke-virtual {v2}, Ljava/io/DataInputStream;->readShort()S

    move-result p1

    invoke-virtual {v1, v2, v0, p1}, Lxq0;->b1(Ljava/io/DataInputStream;Lx56;I)V
    :try_end_17
    .catchall {:try_start_d .. :try_end_17} :catchall_20

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    new-instance p1, Lg11;

    invoke-direct {p1, p0, v0}, Lg11;-><init>(Ls9i;Lx56;)V

    return-object p1

    :catchall_20
    move-exception p0

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw p0
.end method

.method public final w(Ljava/lang/String;Lilm;)V
    .registers 5

    iget-byte v0, p0, Ls9i;->a:B

    packed-switch v0, :pswitch_data_2e

    :try_start_5
    new-instance v0, Lorb;

    invoke-direct {v0, p1}, Lorb;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast p0, Lta7;

    new-instance p1, Lqq6;

    const/16 v1, 0x1a

    invoke-direct {p1, p2, v1}, Lqq6;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, p0, p1}, Lqs7;->z(Lorb;Lta7;Lqq6;)V
    :try_end_18
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_18} :catch_18

    :catch_18
    return-void

    :pswitch_19
    :try_start_19
    new-instance v0, Lorb;

    invoke-direct {v0, p1}, Lorb;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast p0, Lala;

    new-instance p1, Lisd;

    const/16 v1, 0x14

    invoke-direct {p1, p2, v1}, Lisd;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, p0, p1}, Ly55;->z(Lorb;Lala;Lisd;)V
    :try_end_2c
    .catch Lorg/json/JSONException; {:try_start_19 .. :try_end_2c} :catch_2c

    :catch_2c
    return-void

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method

.method public final x(Lh14;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final y(Lyma;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method

.method public final z(Lu5b;)V
    .registers 2

    invoke-virtual {p0, p1}, Ls9i;->l0(Lk73;)V

    return-void
.end method
