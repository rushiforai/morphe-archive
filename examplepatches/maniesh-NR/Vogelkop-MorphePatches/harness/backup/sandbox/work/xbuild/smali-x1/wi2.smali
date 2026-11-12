.class public final Lwi2;
.super Llj2;
.source "SourceFile"


# static fields
.field public static final i:Lwi2;

.field public static j:Lcom/opera/android/settings/SettingsManager;

.field public static k:Lulp;

.field public static l:Z

.field public static m:J

.field public static n:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lwi2;

    invoke-direct {v0}, Llj2;-><init>()V

    sput-object v0, Lwi2;->i:Lwi2;

    const-wide/16 v0, -0x1

    sput-wide v0, Lwi2;->m:J

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    sget-boolean p0, Lwi2;->n:Z

    if-nez p0, :cond_12

    sget-object p0, Lwi2;->k:Lulp;

    if-nez p0, :cond_9

    const/4 p0, 0x0

    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lwi2;->m:J

    :cond_12
    return-void
.end method

.method public final c(Landroid/content/Context;Lzy9;Ljava/lang/Runnable;)V
    .registers 12

    sget-object p0, Lwi2;->j:Lcom/opera/android/settings/SettingsManager;

    const/4 v0, 0x0

    if-nez p0, :cond_6

    move-object p0, v0

    :cond_6
    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->p()Ln7j;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_45

    if-eq v1, v3, :cond_42

    sget-wide v4, Lwi2;->m:J

    const-wide/16 v6, -0x1

    cmp-long v1, v4, v6

    if-nez v1, :cond_20

    sput-boolean v2, Lwi2;->n:Z

    :goto_1e
    move v2, v3

    goto :goto_48

    :cond_20
    iget p0, p0, Ln7j;->d:I

    int-to-long v4, p0

    sget-object p0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v4, v5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v4

    sget-object p0, Lwi2;->k:Lulp;

    if-eqz p0, :cond_2e

    move-object v0, p0

    :cond_2e
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v6, Lwi2;->m:J

    add-long/2addr v6, v4

    cmp-long p0, v0, v6

    if-lez p0, :cond_3d

    move v2, v3

    :cond_3d
    xor-int/lit8 p0, v2, 0x1

    sput-boolean p0, Lwi2;->n:Z

    goto :goto_48

    :cond_42
    sput-boolean v2, Lwi2;->n:Z

    goto :goto_48

    :cond_45
    sput-boolean v2, Lwi2;->n:Z

    goto :goto_1e

    :goto_48
    if-eqz v2, :cond_56

    new-instance p0, Lkj2;

    const v0, 0x7f140c74

    invoke-direct {p0, p1, v0, p2, p3}, Lkj2;-><init>(Landroid/content/Context;ILzy9;Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Lsj2;->e()V

    return-void

    :cond_56
    invoke-virtual {p2}, Lzy9;->Y()V

    if-eqz p3, :cond_5e

    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    :cond_5e
    return-void
.end method
