.class public final Lqq8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkc9;
.implements Lyb4;


# instance fields
.field public a:J

.field public final b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    sget-object v0, Lj1n;->a:Lj1n;

    .line 57
    new-instance v0, Lk1n;

    invoke-direct {v0}, Lk1n;-><init>()V

    iput-object v0, p0, Lqq8;->b:Ljava/lang/Object;

    .line 58
    new-instance v0, Lk1n;

    invoke-direct {v0}, Lk1n;-><init>()V

    iput-object v0, p0, Lqq8;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(JLbp;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lqq8;->a:J

    iput-object p3, p0, Lqq8;->b:Ljava/lang/Object;

    new-instance p3, Ltr3;

    invoke-direct {p3}, Ljava/lang/Object;-><init>()V

    iput-object p0, p3, Ltr3;->d:Ljava/lang/Object;

    new-instance v0, Ljava/util/LinkedHashMap;

    const/4 v1, 0x0

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p3, Ltr3;->c:Ljava/lang/Object;

    iput-wide p1, p3, Ltr3;->a:J

    const-wide/16 v0, 0x0

    cmp-long p1, p1, v0

    if-lez p1, :cond_24

    iput-object p3, p0, Lqq8;->c:Ljava/lang/Object;

    return-void

    :cond_24
    const-string p0, "maxSize <= 0"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public synthetic constructor <init>(JLjava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 54
    iput-object p3, p0, Lqq8;->b:Ljava/lang/Object;

    iput-object p4, p0, Lqq8;->c:Ljava/lang/Object;

    iput-wide p1, p0, Lqq8;->a:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    .registers 4

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, Lqq8;->b:Ljava/lang/Object;

    .line 65
    iput-object p2, p0, Lqq8;->c:Ljava/lang/Object;

    const-wide/16 p1, 0x0

    const/4 v0, 0x0

    .line 66
    :try_start_a
    invoke-virtual {p0}, Lqq8;->E()Ljava/io/InputStream;

    move-result-object v0

    if-eqz v0, :cond_1b

    .line 67
    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result p1
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_14} :catch_1b
    .catchall {:try_start_a .. :try_end_14} :catchall_16

    int-to-long p1, p1

    goto :goto_1b

    :catchall_16
    move-exception p0

    .line 68
    invoke-static {v0}, Lxvg;->l(Ljava/io/Closeable;)V

    .line 69
    throw p0

    .line 70
    :catch_1b
    :cond_1b
    :goto_1b
    invoke-static {v0}, Lxvg;->l(Ljava/io/Closeable;)V

    .line 71
    iput-wide p1, p0, Lqq8;->a:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqq8;->b:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p1

    iget p1, p1, Landroid/content/pm/PackageInfo;->versionCode:I

    int-to-long v0, p1

    iput-wide v0, p0, Lqq8;->a:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lydn;)V
    .registers 5

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lqq8;->b:Ljava/lang/Object;

    .line 48
    iput-object p2, p0, Lqq8;->c:Ljava/lang/Object;

    .line 49
    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    .line 50
    iget-object p1, p1, Lru9;->a:Landroid/content/SharedPreferences;

    .line 51
    const-string p2, "vpn.resume_timestamp"

    const-wide/16 v0, 0x0

    invoke-interface {p1, p2, v0, v1}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide p1

    .line 52
    iput-wide p1, p0, Lqq8;->a:J

    .line 53
    invoke-virtual {p0}, Lqq8;->k()V

    return-void
.end method

.method public constructor <init>(Lcom/opera/api/Callback;)V
    .registers 2

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqq8;->b:Ljava/lang/Object;

    .line 45
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lqq8;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;JLk6m;)V
    .registers 5

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lqq8;->b:Ljava/lang/Object;

    .line 61
    iput-wide p2, p0, Lqq8;->a:J

    .line 62
    iput-object p4, p0, Lqq8;->c:Ljava/lang/Object;

    return-void
.end method

.method public static s(Ljava/io/File;)V
    .registers 4

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_18

    const/4 v1, 0x0

    :goto_d
    array-length v2, v0

    if-ge v1, v2, :cond_18

    aget-object v2, v0, v1

    invoke-static {v2}, Lqq8;->s(Ljava/io/File;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    :cond_18
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_33

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_33

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    const-string v0, "Failed to delete \'"

    const-string v1, "\'"

    invoke-static {v0, p0, v1}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    :cond_33
    return-void
.end method

.method public static u(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .registers 3

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_14

    return-object v0

    :cond_14
    const-string p0, "split ID cannot be placed in target directory"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static v(Ljava/io/File;)V
    .registers 2

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result p0

    if-nez p0, :cond_1b

    const-string p0, "File input must be directory when it exists."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_12
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1c

    :cond_1b
    return-void

    :cond_1c
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Unable to create directory: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final E()Ljava/io/InputStream;
    .registers 2

    iget-object v0, p0, Lqq8;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/ContentResolver;

    iget-object p0, p0, Lqq8;->c:Ljava/lang/Object;

    check-cast p0, Landroid/net/Uri;

    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method public final b(JJ)V
    .registers 8

    iget-object v0, p0, Lqq8;->b:Ljava/lang/Object;

    check-cast v0, Lk1n;

    const/16 v1, 0x20

    shr-long v1, p3, v1

    long-to-int v1, v1

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    invoke-virtual {v0, p1, p2, v1}, Lk1n;->a(JF)V

    iget-object p0, p0, Lqq8;->c:Ljava/lang/Object;

    check-cast p0, Lk1n;

    const-wide v0, 0xffffffffL

    and-long/2addr p3, v0

    long-to-int p3, p3

    invoke-static {p3}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p3

    invoke-virtual {p0, p1, p2, p3}, Lk1n;->a(JF)V

    return-void
.end method

.method public final c()I
    .registers 1

    iget-object p0, p0, Lqq8;->b:Ljava/lang/Object;

    check-cast p0, Lyb4;

    if-eqz p0, :cond_b

    invoke-interface {p0}, Lyb4;->c()I

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x1

    return p0
.end method

.method public final d()Lhbl;
    .registers 1

    iget-object p0, p0, Lqq8;->c:Ljava/lang/Object;

    check-cast p0, Lhbl;

    return-object p0
.end method

.method public final e()J
    .registers 5

    iget-object v0, p0, Lqq8;->b:Ljava/lang/Object;

    check-cast v0, Lyb4;

    if-eqz v0, :cond_b

    invoke-interface {v0}, Lyb4;->e()J

    move-result-wide v0

    return-wide v0

    :cond_b
    iget-wide v0, p0, Lqq8;->a:J

    const-wide/16 v2, -0x1

    cmp-long p0, v0, v2

    if-eqz p0, :cond_14

    return-wide v0

    :cond_14
    const-string p0, "No timestamp is available."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public final f(Landroid/content/Context;)Lsxh;
    .registers 7

    invoke-static {p1}, Landroid/text/format/DateFormat;->getTimeFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object p1

    new-instance v0, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    sub-long/2addr v1, v3

    iget-wide v3, p0, Lqq8;->a:J

    add-long/2addr v1, v3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p1, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    new-instance p1, Lsxh;

    const v0, 0x7f1413a9

    invoke-direct {p1, v0, p0}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    return-object p1
.end method

.method public final g()Z
    .registers 5

    iget-wide v0, p0, Lqq8;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final h()Ljava/lang/String;
    .registers 5

    iget-wide v0, p0, Lqq8;->a:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lqq8;->a:J

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final i(Lhjm;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_e

    const/4 v0, 0x1

    if-eq p1, v0, :cond_a

    return-void

    :cond_a
    sget-object p1, Lvb0;->d:Lvb0;

    const/4 v0, 0x3

    goto :goto_11

    :cond_e
    sget-object p1, Lvb0;->c:Lvb0;

    const/4 v0, 0x0

    :goto_11
    iget-wide v1, p0, Lqq8;->a:J

    const/4 v3, 0x0

    invoke-static {v1, v2, v0, v3}, LJ/N;->Mf9jHO_s(JILjava/lang/Object;)V

    iget-object p0, p0, Lqq8;->b:Ljava/lang/Object;

    check-cast p0, Lx5f;

    invoke-virtual {p0, p1}, Lx5f;->w0(Lvb0;)V

    return-void
.end method

.method public final j(Lorb;)V
    .registers 3

    const-string v0, "id"

    invoke-virtual {p1, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lqq8;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-interface {p0, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlin/jvm/functions/Function1;

    if-nez p0, :cond_13

    return-void

    :cond_13
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final k()V
    .registers 7

    iget-wide v0, p0, Lqq8;->a:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    iget-object p0, p0, Lqq8;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    const/4 v3, 0x0

    const-string v4, "alarm"

    if-eqz v2, :cond_26

    sget v2, Lcom/opera/android/vpn/VpnReceiver;->a:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/AlarmManager;

    invoke-static {p0}, Lcom/opera/android/vpn/VpnReceiver;->a(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v4

    const/high16 v5, 0xc000000

    invoke-static {p0, v3, v4, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    const/4 v3, 0x3

    invoke-virtual {v2, v3, v0, v1, p0}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    return-void

    :cond_26
    sget v0, Lcom/opera/android/vpn/VpnReceiver;->a:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    invoke-static {p0}, Lcom/opera/android/vpn/VpnReceiver;->a(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    const/high16 v2, 0x24000000

    invoke-static {p0, v3, v1, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    if-nez p0, :cond_3b

    return-void

    :cond_3b
    invoke-virtual {v0, p0}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    return-void
.end method

.method public final l(Lorb;Lkotlin/jvm/functions/Function1;)V
    .registers 5

    const-string v0, "id"

    invoke-virtual {p1, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lqq8;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashMap;

    invoke-interface {v1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqq8;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    iget-object p1, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final length()J
    .registers 3

    iget-wide v0, p0, Lqq8;->a:J

    return-wide v0
.end method

.method public final m(Lwsd;Ljva;Ljava/util/Map;J)V
    .registers 12

    iget-object v0, p0, Lqq8;->c:Ljava/lang/Object;

    check-cast v0, Ltr3;

    iget-wide v1, v0, Ltr3;->a:J

    iget-object v3, v0, Ltr3;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/LinkedHashMap;

    cmp-long v1, p4, v1

    if-gtz v1, :cond_38

    new-instance p0, Ldmh;

    invoke-direct {p0, p2, p3, p4, p5}, Ldmh;-><init>(Ljva;Ljava/util/Map;J)V

    invoke-interface {v3, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {v0}, Ltr3;->k()J

    move-result-wide p3

    invoke-virtual {v0, p1, p0}, Ltr3;->n(Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide v1

    add-long/2addr v1, p3

    iput-wide v1, v0, Ltr3;->b:J

    if-eqz p2, :cond_32

    invoke-virtual {v0}, Ltr3;->k()J

    move-result-wide p3

    invoke-virtual {v0, p1, p2}, Ltr3;->n(Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide v1

    sub-long/2addr p3, v1

    iput-wide p3, v0, Ltr3;->b:J

    invoke-virtual {v0, p1, p2, p0}, Ltr3;->j(Ljava/lang/Object;Ljava/lang/Object;Ldmh;)V

    :cond_32
    iget-wide p0, v0, Ltr3;->a:J

    invoke-virtual {v0, p0, p1}, Ltr3;->p(J)V

    return-void

    :cond_38
    invoke-interface {v3, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_4d

    invoke-virtual {v0}, Ltr3;->k()J

    move-result-wide v2

    invoke-virtual {v0, p1, v1}, Ltr3;->n(Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide v4

    sub-long/2addr v2, v4

    iput-wide v2, v0, Ltr3;->b:J

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Ltr3;->j(Ljava/lang/Object;Ljava/lang/Object;Ldmh;)V

    :cond_4d
    iget-object p0, p0, Lqq8;->b:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Lbp;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    invoke-virtual/range {v0 .. v5}, Lbp;->a0(Lwsd;Ljva;Ljava/util/Map;J)V

    return-void
.end method

.method public final n(J)V
    .registers 6

    iget-wide v0, p0, Lqq8;->a:J

    cmp-long v0, p1, v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    iput-wide p1, p0, Lqq8;->a:J

    iget-object p1, p0, Lqq8;->b:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-wide v0, p0, Lqq8;->a:J

    iget-object p2, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast p2, Landroid/content/SharedPreferences$Editor;

    const-string v2, "vpn.resume_timestamp"

    invoke-interface {p2, v2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    invoke-virtual {p0}, Lqq8;->k()V

    return-void
.end method

.method public final o()Ljava/util/HashSet;
    .registers 7

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lqq8;->x()Ljava/io/File;

    move-result-object p0

    const-string v1, "verified-splits"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Lqq8;->v(Ljava/io/File;)V

    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_51

    const/4 v1, 0x0

    move v2, v1

    :goto_1b
    array-length v3, v0

    if-ge v2, v3, :cond_51

    aget-object v3, v0, v2

    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_4e

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".apk"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4e

    invoke-virtual {v3}, Ljava/io/File;->canWrite()Z

    move-result v4

    if-nez v4, :cond_4e

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x4

    invoke-virtual {v4, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Leqp;

    invoke-direct {v5, v3, v4}, Leqp;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_4e
    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    :cond_51
    return-object p0
.end method

.method public final p()Lvb4;
    .registers 1

    iget-object p0, p0, Lqq8;->b:Ljava/lang/Object;

    check-cast p0, Lyb4;

    if-eqz p0, :cond_b

    invoke-interface {p0}, Lyb4;->p()Lvb4;

    move-result-object p0

    return-object p0

    :cond_b
    sget-object p0, Lvb4;->a:Lvb4;

    return-object p0
.end method

.method public final q()Lwb4;
    .registers 1

    iget-object p0, p0, Lqq8;->b:Ljava/lang/Object;

    check-cast p0, Lyb4;

    if-eqz p0, :cond_b

    invoke-interface {p0}, Lyb4;->q()Lwb4;

    move-result-object p0

    return-object p0

    :cond_b
    sget-object p0, Lwb4;->a:Lwb4;

    return-object p0
.end method

.method public final r()V
    .registers 7

    invoke-virtual {p0}, Lqq8;->w()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2a

    const/4 v2, 0x0

    :goto_b
    array-length v3, v1

    if-ge v2, v3, :cond_2a

    aget-object v3, v1, v2

    iget-wide v4, p0, Lqq8;->a:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_27

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-static {v4}, Lqq8;->s(Ljava/io/File;)V

    :cond_27
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    :cond_2a
    return-void
.end method

.method public final t()Lub4;
    .registers 1

    iget-object p0, p0, Lqq8;->b:Ljava/lang/Object;

    check-cast p0, Lyb4;

    if-eqz p0, :cond_b

    invoke-interface {p0}, Lyb4;->t()Lub4;

    move-result-object p0

    return-object p0

    :cond_b
    sget-object p0, Lub4;->a:Lub4;

    return-object p0
.end method

.method public final w()Ljava/io/File;
    .registers 3

    iget-object v0, p0, Lqq8;->c:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    if-nez v0, :cond_1a

    iget-object v0, p0, Lqq8;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    if-eqz v0, :cond_13

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lqq8;->c:Ljava/lang/Object;

    goto :goto_1a

    :cond_13
    const-string p0, "context must be non-null to populate null filesDir"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_1a
    :goto_1a
    new-instance v0, Ljava/io/File;

    iget-object p0, p0, Lqq8;->c:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    const-string v1, "splitcompat"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Lqq8;->v(Ljava/io/File;)V

    return-object v0
.end method

.method public final x()Ljava/io/File;
    .registers 5

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lqq8;->w()Ljava/io/File;

    move-result-object v1

    iget-wide v2, p0, Lqq8;->a:J

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Lqq8;->v(Ljava/io/File;)V

    return-object v0
.end method
