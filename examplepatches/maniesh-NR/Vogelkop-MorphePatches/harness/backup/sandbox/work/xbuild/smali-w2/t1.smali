.class public final synthetic Lt1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lt1;->a:B

    iput-object p1, p0, Lt1;->b:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Lsnc;)V
    .registers 3

    const/4 p2, 0x7

    iput-byte p2, p0, Lt1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lt1;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Lt1;->a:B

    const/16 v1, 0x23

    const/16 v2, 0xd

    const-string v3, ".save_as_pdf"

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x0

    iget-object p0, p0, Lt1;->b:Landroid/content/Context;

    packed-switch v0, :pswitch_data_222

    invoke-static {p0}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object p0

    return-object p0

    :pswitch_15
    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    return-object p0

    :pswitch_1a
    invoke-static {p0}, Lcqp;->j0(Landroid/content/Context;)Lpne;

    move-result-object p0

    return-object p0

    :pswitch_1f
    :try_start_1f
    invoke-virtual {p0, v3}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v1
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_23} :catch_45
    .catchall {:try_start_1f .. :try_end_23} :catchall_42

    :try_start_23
    invoke-virtual {v1}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-static {v0}, Landroid/os/ParcelFileDescriptor;->dup(Ljava/io/FileDescriptor;)Landroid/os/ParcelFileDescriptor;

    move-result-object v2
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_2b} :catch_46
    .catchall {:try_start_23 .. :try_end_2b} :catchall_4d

    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    :try_start_2e
    new-instance v0, Landroid/graphics/pdf/PdfRenderer;

    invoke-direct {v0, v2}, Landroid/graphics/pdf/PdfRenderer;-><init>(Landroid/os/ParcelFileDescriptor;)V
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_33} :catch_35
    .catchall {:try_start_2e .. :try_end_33} :catchall_3c

    move-object v6, v0

    goto :goto_4c

    :catch_35
    :try_start_35
    invoke-virtual {p0, v3}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z
    :try_end_38
    .catchall {:try_start_35 .. :try_end_38} :catchall_3c

    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_4c

    :catchall_3c
    move-exception v0

    move-object p0, v0

    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :catchall_42
    move-exception v0

    move-object p0, v0

    goto :goto_50

    :catch_45
    move-object v1, v6

    :catch_46
    :try_start_46
    invoke-virtual {p0, v3}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z
    :try_end_49
    .catchall {:try_start_46 .. :try_end_49} :catchall_4d

    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    :goto_4c
    return-object v6

    :catchall_4d
    move-exception v0

    move-object p0, v0

    move-object v6, v1

    :goto_50
    invoke-static {v6}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :pswitch_54
    invoke-virtual {p0, v3}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_5d
    sget-object v0, Li0i;->a:Lnx1;

    invoke-virtual {v0, p0}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc36;

    return-object p0

    :pswitch_66
    invoke-static {p0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object p0

    return-object p0

    :pswitch_6b
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    iget-object p0, p0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p0

    new-instance v0, Ljava/io/File;

    const-string v1, "oat/arm"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance p0, Landroid/util/Pair;

    new-instance v1, Ljava/io/File;

    const-string v2, "base.vdex"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    const-string v3, "base.odex"

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p0

    :pswitch_a5
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-class v0, Lcom/opera/android/live_score/data/db/LiveScoreDatabase;

    const-string v1, "live_score"

    invoke-static {p0, v0, v1}, Lxih;->f(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Lu5i;

    move-result-object p0

    sget-object v0, Lvml;->e:Lwjh;

    iget-object v0, v0, Lwjh;->d:Ljava/lang/Object;

    check-cast v0, Ljg8;

    iget-object v1, p0, Lu5i;->f:Ljava/util/concurrent/Executor;

    if-nez v1, :cond_129

    iget-object v1, p0, Lu5i;->g:Ljava/util/concurrent/Executor;

    if-nez v1, :cond_129

    sget-object v1, Lkotlin/coroutines/d;->Hq:Lot5;

    invoke-virtual {v0, v1}, Ldx5;->get(Lkotlin/coroutines/g;)Lkotlin/coroutines/CoroutineContext$Element;

    move-result-object v1

    if-eqz v1, :cond_123

    iput-object v0, p0, Lu5i;->p:Ljg8;

    const/16 v0, 0xe

    new-array v0, v0, [Lryd;

    sget-object v1, Lcom/opera/android/live_score/data/db/LiveScoreDatabase;->l:Lczd;

    aput-object v1, v0, v5

    sget-object v1, Lcom/opera/android/live_score/data/db/LiveScoreDatabase;->m:Lczd;

    const/4 v3, 0x1

    aput-object v1, v0, v3

    sget-object v1, Lcom/opera/android/live_score/data/db/LiveScoreDatabase;->n:Lczd;

    aput-object v1, v0, v4

    sget-object v1, Lcom/opera/android/live_score/data/db/LiveScoreDatabase;->o:Lczd;

    const/4 v3, 0x3

    aput-object v1, v0, v3

    sget-object v1, Lcom/opera/android/live_score/data/db/LiveScoreDatabase;->p:Lczd;

    const/4 v3, 0x4

    aput-object v1, v0, v3

    sget-object v1, Lcom/opera/android/live_score/data/db/LiveScoreDatabase;->q:Lczd;

    const/4 v3, 0x5

    aput-object v1, v0, v3

    sget-object v1, Lcom/opera/android/live_score/data/db/LiveScoreDatabase;->r:Lczd;

    const/4 v3, 0x6

    aput-object v1, v0, v3

    sget-object v1, Lcom/opera/android/live_score/data/db/LiveScoreDatabase;->s:Lczd;

    const/4 v3, 0x7

    aput-object v1, v0, v3

    sget-object v1, Lcom/opera/android/live_score/data/db/LiveScoreDatabase;->t:Lczd;

    const/16 v3, 0x8

    aput-object v1, v0, v3

    sget-object v1, Lcom/opera/android/live_score/data/db/LiveScoreDatabase;->u:Lczd;

    const/16 v3, 0x9

    aput-object v1, v0, v3

    sget-object v1, Lcom/opera/android/live_score/data/db/LiveScoreDatabase;->v:Lczd;

    const/16 v3, 0xa

    aput-object v1, v0, v3

    sget-object v1, Lcom/opera/android/live_score/data/db/LiveScoreDatabase;->w:Lczd;

    const/16 v3, 0xb

    aput-object v1, v0, v3

    sget-object v1, Lcom/opera/android/live_score/data/db/LiveScoreDatabase;->x:Lczd;

    const/16 v3, 0xc

    aput-object v1, v0, v3

    sget-object v1, Lcom/opera/android/live_score/data/db/LiveScoreDatabase;->y:Lczd;

    aput-object v1, v0, v2

    invoke-virtual {p0, v0}, Lu5i;->a([Lryd;)V

    invoke-virtual {p0}, Lu5i;->b()Ly5i;

    move-result-object p0

    check-cast p0, Lcom/opera/android/live_score/data/db/LiveScoreDatabase;

    invoke-virtual {p0}, Lcom/opera/android/live_score/data/db/LiveScoreDatabase;->x()Lwlc;

    move-result-object v6

    goto :goto_12e

    :cond_123
    const-string p0, "It is required that the coroutine context contain a dispatcher."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    goto :goto_12e

    :cond_129
    const-string p0, "This builder has already been configured with an Executor. A RoomDatabase canonly be configured with either an Executor or a CoroutineContext."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_12e
    return-object v6

    :pswitch_12f
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-static {p0, v0, v1, v2}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object p0

    iget-object p0, p0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    return-object p0

    :pswitch_13c
    invoke-static {p0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld3j;

    invoke-virtual {p0, v4}, Ld3j;->c(I)Lc3j;

    move-result-object v0

    if-eqz v0, :cond_154

    iget-object v0, v0, Lc3j;->d:Ljava/lang/Comparable;

    check-cast v0, Landroid/net/Uri;

    if-eqz v0, :cond_154

    :goto_152
    move-object v8, v0

    goto :goto_15b

    :cond_154
    const-string v0, "https://www.apex-football.com"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_152

    :goto_15b
    invoke-virtual {p0, v2, v5}, Ld3j;->d(IZ)Lc3j;

    move-result-object v0

    const-string v2, "https://oscore.opera-api.com/"

    invoke-static {v0, v2}, Lc09;->q(Lc3j;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    const/16 v0, 0x11

    invoke-virtual {p0, v0, v5}, Ld3j;->d(IZ)Lc3j;

    move-result-object v0

    if-eqz v0, :cond_17b

    iget-object v0, v0, Lc3j;->d:Ljava/lang/Comparable;

    check-cast v0, Ljava/lang/String;

    const-string v2, "wss://"

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    :cond_17b
    move-object v10, v6

    invoke-virtual {p0, v1, v5}, Ld3j;->d(IZ)Lc3j;

    move-result-object v0

    const-string v1, "https://ft-oscore.opera-api.com"

    invoke-static {v0, v1}, Lc09;->q(Lc3j;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    const/16 v0, 0x2c

    invoke-virtual {p0, v0, v5}, Ld3j;->d(IZ)Lc3j;

    move-result-object p0

    const-string v0, "https://api.apexscores.io"

    invoke-static {p0, v0}, Lc09;->q(Lc3j;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    new-instance v7, Lf3j;

    invoke-direct/range {v7 .. v12}, Lf3j;-><init>(Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;)V

    return-object v7

    :pswitch_198
    new-instance v0, Lcs6;

    new-instance v1, Lix5;

    invoke-direct {v1, v4}, Lix5;-><init>(B)V

    sget-object v2, Lyne;->b:Ldeg;

    invoke-direct {v0, p0, v1, v2}, Lcs6;-><init>(Landroid/content/Context;Lix5;Ldeg;)V

    return-object v0

    :pswitch_1a5
    invoke-static {p0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld3j;

    invoke-virtual {p0, v1, v5}, Ld3j;->d(IZ)Lc3j;

    move-result-object p0

    if-eqz p0, :cond_1c5

    iget-object p0, p0, Lc3j;->d:Ljava/lang/Comparable;

    check-cast p0, Ljava/lang/String;

    const-string v0, "https://"

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    if-nez p0, :cond_1cb

    :cond_1c5
    const-string p0, "ft-oscore.opera-api.com"

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    :cond_1cb
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1d0
    invoke-static {p0}, Li0l;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1d5
    invoke-static {p0}, Li0l;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1da
    invoke-static {p0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld3j;

    const/16 v0, 0x28

    invoke-virtual {p0, v0, v5}, Ld3j;->d(IZ)Lc3j;

    move-result-object p0

    if-eqz p0, :cond_1f1

    iget-object p0, p0, Lc3j;->d:Ljava/lang/Comparable;

    move-object v6, p0

    check-cast v6, Ljava/lang/String;

    :cond_1f1
    return-object v6

    :pswitch_1f2
    invoke-static {p0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld3j;

    const/16 v0, 0x1c

    invoke-virtual {p0, v0, v5}, Ld3j;->d(IZ)Lc3j;

    move-result-object p0

    if-eqz p0, :cond_209

    iget-object p0, p0, Lc3j;->d:Ljava/lang/Comparable;

    move-object v6, p0

    check-cast v6, Ljava/lang/String;

    :cond_209
    return-object v6

    :pswitch_20a
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-static {p0}, Lcqp;->f0(Landroid/content/Context;)Lpne;

    move-result-object p0

    return-object p0

    :pswitch_211
    invoke-static {p0}, Ls6e;->b(Landroid/content/Context;)Ls6e;

    move-result-object p0

    iget-object v0, p0, Ls6e;->b:Lvq8;

    if-eqz v0, :cond_21e

    iget-object p0, v0, Lvq8;->h:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    goto :goto_220

    :cond_21e
    iget-object p0, p0, Ls6e;->c:Ljava/lang/String;

    :goto_220
    return-object p0

    nop

    :pswitch_data_222
    .packed-switch 0x0
        :pswitch_211
        :pswitch_20a
        :pswitch_1f2
        :pswitch_1da
        :pswitch_1d5
        :pswitch_1d0
        :pswitch_1a5
        :pswitch_198
        :pswitch_13c
        :pswitch_12f
        :pswitch_a5
        :pswitch_6b
        :pswitch_66
        :pswitch_5d
        :pswitch_54
        :pswitch_1f
        :pswitch_1a
        :pswitch_15
    .end packed-switch
.end method
