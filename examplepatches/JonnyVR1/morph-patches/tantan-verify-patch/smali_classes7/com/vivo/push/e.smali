.class public final Lcom/vivo/push/e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vivo/push/e$a;
    }
.end annotation


# static fields
.field private static volatile a:Lcom/vivo/push/e;


# instance fields
.field private b:J

.field private c:J

.field private d:J

.field private e:J

.field private f:J

.field private g:J

.field private h:Landroid/content/Context;

.field private i:Z

.field private j:Lcom/vivo/push/util/b;

.field private k:Ljava/lang/String;

.field private l:Ljava/lang/String;

.field private m:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/vivo/push/e$a;",
            ">;"
        }
    .end annotation
.end field

.field private n:I

.field private o:Ljava/lang/Boolean;

.field private p:Ljava/lang/Long;

.field private q:Z

.field private r:Lcom/vivo/push/IPushClientFactory;

.field private s:I


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/vivo/push/e;->b:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/vivo/push/e;->c:J

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/vivo/push/e;->d:J

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/vivo/push/e;->e:J

    .line 13
    .line 14
    iput-wide v0, p0, Lcom/vivo/push/e;->f:J

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/vivo/push/e;->g:J

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/vivo/push/e;->i:Z

    .line 20
    .line 21
    new-instance v0, Landroid/util/SparseArray;

    .line 22
    .line 23
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/vivo/push/e;->m:Landroid/util/SparseArray;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput v0, p0, Lcom/vivo/push/e;->n:I

    .line 30
    .line 31
    new-instance v0, Lcom/vivo/push/d;

    .line 32
    .line 33
    invoke-direct {v0}, Lcom/vivo/push/d;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/vivo/push/e;->r:Lcom/vivo/push/IPushClientFactory;

    .line 37
    .line 38
    return-void
.end method

.method public static synthetic a(Lcom/vivo/push/e;)Landroid/content/Context;
    .locals 0

    .line 274
    iget-object p0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    return-object p0
.end method

.method private a(Lcom/vivo/push/b/b;Lcom/vivo/push/IPushActionListener;)Lcom/vivo/push/e$a;
    .locals 2

    .line 235
    new-instance v0, Lcom/vivo/push/e$a;

    invoke-direct {v0, p1, p2}, Lcom/vivo/push/e$a;-><init>(Lcom/vivo/push/b/c;Lcom/vivo/push/IPushActionListener;)V

    .line 236
    invoke-direct {p0, v0}, Lcom/vivo/push/e;->a(Lcom/vivo/push/e$a;)Ljava/lang/String;

    move-result-object p2

    .line 237
    invoke-virtual {p1, p2}, Lcom/vivo/push/b/c;->b(Ljava/lang/String;)V

    .line 238
    new-instance v1, Lcom/vivo/push/h;

    invoke-direct {v1, p0, p1, p2}, Lcom/vivo/push/h;-><init>(Lcom/vivo/push/e;Lcom/vivo/push/b/b;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/vivo/push/e$a;->a(Ljava/lang/Runnable;)V

    return-object v0
.end method

.method public static declared-synchronized a()Lcom/vivo/push/e;
    .locals 2

    const-class v0, Lcom/vivo/push/e;

    monitor-enter v0

    .line 178
    :try_start_0
    sget-object v1, Lcom/vivo/push/e;->a:Lcom/vivo/push/e;

    if-nez v1, :cond_0

    .line 179
    new-instance v1, Lcom/vivo/push/e;

    invoke-direct {v1}, Lcom/vivo/push/e;-><init>()V

    sput-object v1, Lcom/vivo/push/e;->a:Lcom/vivo/push/e;

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    .line 180
    :cond_0
    :goto_0
    sget-object v1, Lcom/vivo/push/e;->a:Lcom/vivo/push/e;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private declared-synchronized a(Lcom/vivo/push/e$a;)Ljava/lang/String;
    .locals 2

    monitor-enter p0

    .line 272
    :try_start_0
    iget-object v0, p0, Lcom/vivo/push/e;->m:Landroid/util/SparseArray;

    iget v1, p0, Lcom/vivo/push/e;->n:I

    invoke-virtual {v0, v1, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 273
    iget p1, p0, Lcom/vivo/push/e;->n:I

    add-int/lit8 v0, p1, 0x1

    iput v0, p0, Lcom/vivo/push/e;->n:I

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public static synthetic a(Lcom/vivo/push/e;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 177
    iput-object p1, p0, Lcom/vivo/push/e;->k:Ljava/lang/String;

    return-object p1
.end method

.method private static a(J)Z
    .locals 4

    .line 268
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v2, p0, v2

    if-eqz v2, :cond_1

    cmp-long v2, v0, p0

    if-lez v2, :cond_1

    const-wide/16 v2, 0x7d0

    add-long/2addr p0, v2

    cmp-long p0, v0, p0

    if-ltz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static synthetic b(Lcom/vivo/push/e;)Lcom/vivo/push/util/b;
    .locals 0

    .line 240
    iget-object p0, p0, Lcom/vivo/push/e;->j:Lcom/vivo/push/util/b;

    return-object p0
.end method

.method public static synthetic b(Lcom/vivo/push/e;Ljava/lang/String;)V
    .locals 0

    .line 167
    invoke-direct {p0, p1}, Lcom/vivo/push/e;->e(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic c(Lcom/vivo/push/e;Ljava/lang/String;)Lcom/vivo/push/e$a;
    .locals 0

    .line 63
    invoke-direct {p0, p1}, Lcom/vivo/push/e;->d(Ljava/lang/String;)Lcom/vivo/push/e$a;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Lcom/vivo/push/e;)V
    .locals 0

    .line 62
    invoke-direct {p0}, Lcom/vivo/push/e;->m()V

    return-void
.end method

.method private c(Ljava/lang/String;)V
    .locals 1

    .line 66
    new-instance v0, Lcom/vivo/push/f;

    invoke-direct {v0, p0, p1}, Lcom/vivo/push/f;-><init>(Lcom/vivo/push/e;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/vivo/push/m;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method private declared-synchronized d(Ljava/lang/String;)Lcom/vivo/push/e$a;
    .locals 2

    monitor-enter p0

    if-eqz p1, :cond_0

    .line 29
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    .line 30
    iget-object v0, p0, Lcom/vivo/push/e;->m:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vivo/push/e$a;

    .line 31
    iget-object v1, p0, Lcom/vivo/push/e;->m:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->delete(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    .line 33
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    .line 34
    :catch_0
    :cond_0
    monitor-exit p0

    const/4 p0, 0x0

    return-object p0
.end method

.method public static synthetic d(Lcom/vivo/push/e;)V
    .locals 1

    .line 35
    iget-object p0, p0, Lcom/vivo/push/e;->j:Lcom/vivo/push/util/b;

    const-string v0, "APP_TAGS"

    invoke-virtual {p0, v0}, Lcom/vivo/push/util/b;->b(Ljava/lang/String;)V

    return-void
.end method

.method private e(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/vivo/push/k;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/vivo/push/k;-><init>(Lcom/vivo/push/e;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/vivo/push/m;->a(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private m()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/vivo/push/e;->l:Ljava/lang/String;

    .line 3
    .line 4
    iget-object p0, p0, Lcom/vivo/push/e;->j:Lcom/vivo/push/util/b;

    .line 5
    .line 6
    const-string v0, "APP_ALIAS"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/vivo/push/util/b;->b(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private n()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/vivo/push/e;->o:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/vivo/push/e;->l()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const-wide/16 v2, 0x4ce

    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-ltz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/vivo/push/util/z;->d(Landroid/content/Context;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/vivo/push/e;->o:Ljava/lang/Boolean;

    .line 31
    .line 32
    :cond_1
    iget-object p0, p0, Lcom/vivo/push/e;->o:Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method


# virtual methods
.method public final declared-synchronized a(Landroid/content/Context;)V
    .locals 2

    monitor-enter p0

    .line 181
    :try_start_0
    iget-object v0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 182
    invoke-static {p1}, Lcom/vivo/push/util/ContextDelegate;->getContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    .line 183
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/vivo/push/util/t;->c(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/vivo/push/e;->q:Z

    .line 184
    invoke-static {}, Lcom/vivo/push/util/w;->b()Lcom/vivo/push/util/w;

    move-result-object p1

    iget-object v0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    invoke-virtual {p1, v0}, Lcom/vivo/push/util/w;->a(Landroid/content/Context;)V

    .line 185
    new-instance p1, Lcom/vivo/push/b/g;

    invoke-direct {p1}, Lcom/vivo/push/b/g;-><init>()V

    .line 186
    invoke-virtual {p0, p1}, Lcom/vivo/push/e;->a(Lcom/vivo/push/o;)V

    .line 187
    new-instance p1, Lcom/vivo/push/util/b;

    invoke-direct {p1}, Lcom/vivo/push/util/b;-><init>()V

    iput-object p1, p0, Lcom/vivo/push/e;->j:Lcom/vivo/push/util/b;

    .line 188
    iget-object v0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    const-string v1, "com.vivo.push_preferences.appconfig_v1"

    invoke-virtual {p1, v0, v1}, Lcom/vivo/push/util/b;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 189
    invoke-virtual {p0}, Lcom/vivo/push/e;->f()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/vivo/push/e;->k:Ljava/lang/String;

    .line 190
    iget-object p1, p0, Lcom/vivo/push/e;->j:Lcom/vivo/push/util/b;

    const-string v0, "APP_ALIAS"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/vivo/push/util/b;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/vivo/push/e;->l:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 191
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final a(Landroid/content/Intent;Lcom/vivo/push/sdk/PushMessageCallback;)V
    .locals 2

    .line 275
    iget-object v0, p0, Lcom/vivo/push/e;->r:Lcom/vivo/push/IPushClientFactory;

    invoke-interface {v0, p1}, Lcom/vivo/push/IPushClientFactory;->createReceiverCommand(Landroid/content/Intent;)Lcom/vivo/push/o;

    move-result-object p1

    .line 276
    invoke-static {}, Lcom/vivo/push/e;->a()Lcom/vivo/push/e;

    move-result-object v0

    .line 277
    iget-object v0, v0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    .line 278
    const-string v1, "PushClientManager"

    if-nez p1, :cond_0

    .line 279
    const-string p0, "sendCommand, null command!"

    invoke-static {v1, p0}, Lcom/vivo/push/util/p;->a(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_1

    .line 280
    const-string p0, "[\u6267\u884c\u6307\u4ee4\u5931\u8d25]\u6307\u4ee4\u7a7a\uff01"

    invoke-static {v0, p0}, Lcom/vivo/push/util/p;->c(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 281
    :cond_0
    iget-object p0, p0, Lcom/vivo/push/e;->r:Lcom/vivo/push/IPushClientFactory;

    invoke-interface {p0, p1}, Lcom/vivo/push/IPushClientFactory;->createReceiveTask(Lcom/vivo/push/o;)Lcom/vivo/push/d/z;

    move-result-object p0

    if-nez p0, :cond_2

    .line 282
    const-string p0, "sendCommand, null command task! pushCommand = "

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/vivo/push/util/p;->a(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_1

    .line 283
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "[\u6267\u884c\u6307\u4ee4\u5931\u8d25]\u6307\u4ee4"

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\u4efb\u52a1\u7a7a\uff01"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/vivo/push/util/p;->c(Landroid/content/Context;Ljava/lang/String;)V

    :cond_1
    return-void

    :cond_2
    if-eqz v0, :cond_3

    .line 284
    instance-of v1, p1, Lcom/vivo/push/b/n;

    if-nez v1, :cond_3

    .line 285
    const-string v1, "[\u63a5\u6536\u6307\u4ee4]"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/vivo/push/util/p;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 286
    :cond_3
    invoke-virtual {p0, p2}, Lcom/vivo/push/d/z;->a(Lcom/vivo/push/sdk/PushMessageCallback;)V

    .line 287
    invoke-static {p0}, Lcom/vivo/push/m;->a(Lcom/vivo/push/l;)V

    return-void
.end method

.method public final a(Lcom/vivo/push/IPushActionListener;)V
    .locals 5

    .line 209
    iget-object v0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    const/16 v1, 0x66

    if-nez v0, :cond_0

    if-eqz p1, :cond_8

    .line 210
    invoke-interface {p1, v1}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    return-void

    .line 211
    :cond_0
    invoke-virtual {p0}, Lcom/vivo/push/e;->f()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vivo/push/e;->k:Ljava/lang/String;

    .line 212
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    if-eqz p1, :cond_8

    .line 213
    invoke-interface {p1, v2}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    return-void

    .line 214
    :cond_1
    iget-wide v3, p0, Lcom/vivo/push/e;->b:J

    invoke-static {v3, v4}, Lcom/vivo/push/e;->a(J)Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p1, :cond_8

    const/16 p0, 0x3ea

    .line 215
    invoke-interface {p1, p0}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    return-void

    .line 216
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/vivo/push/e;->b:J

    .line 217
    iget-object v0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 218
    iget-object v3, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    const/4 v4, 0x0

    if-nez v3, :cond_3

    if-eqz p1, :cond_7

    .line 219
    invoke-interface {p1, v1}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    goto :goto_0

    .line 220
    :cond_3
    new-instance v1, Lcom/vivo/push/b/b;

    const/4 v3, 0x1

    invoke-direct {v1, v3, v0}, Lcom/vivo/push/b/b;-><init>(ZLjava/lang/String;)V

    .line 221
    invoke-virtual {v1}, Lcom/vivo/push/b/c;->g()V

    .line 222
    invoke-virtual {v1}, Lcom/vivo/push/b/b;->d()V

    .line 223
    invoke-virtual {v1}, Lcom/vivo/push/b/b;->e()V

    const/16 v0, 0x64

    .line 224
    invoke-virtual {v1, v0}, Lcom/vivo/push/b/c;->a(I)V

    .line 225
    iget-boolean v0, p0, Lcom/vivo/push/e;->q:Z

    if-eqz v0, :cond_5

    .line 226
    invoke-direct {p0}, Lcom/vivo/push/e;->n()Z

    move-result v0

    if-nez v0, :cond_4

    if-eqz p1, :cond_7

    const/16 v0, 0x65

    .line 227
    invoke-interface {p1, v0}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    goto :goto_0

    .line 228
    :cond_4
    invoke-direct {p0, v1, p1}, Lcom/vivo/push/e;->a(Lcom/vivo/push/b/b;Lcom/vivo/push/IPushActionListener;)Lcom/vivo/push/e$a;

    move-result-object v4

    goto :goto_0

    .line 229
    :cond_5
    iget-object v0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    invoke-virtual {v1, v0}, Lcom/vivo/push/b/c;->a(Landroid/content/Context;)I

    move-result v0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_6

    .line 230
    invoke-direct {p0, v1, p1}, Lcom/vivo/push/e;->a(Lcom/vivo/push/b/b;Lcom/vivo/push/IPushActionListener;)Lcom/vivo/push/e$a;

    move-result-object v4

    goto :goto_0

    .line 231
    :cond_6
    invoke-virtual {p0, v1}, Lcom/vivo/push/e;->a(Lcom/vivo/push/o;)V

    if-eqz p1, :cond_7

    .line 232
    invoke-interface {p1, v2}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    :cond_7
    :goto_0
    if-nez v4, :cond_9

    :cond_8
    return-void

    .line 233
    :cond_9
    new-instance p1, Lcom/vivo/push/g;

    invoke-direct {p1, p0, v4}, Lcom/vivo/push/g;-><init>(Lcom/vivo/push/e;Lcom/vivo/push/e$a;)V

    invoke-virtual {v4, p1}, Lcom/vivo/push/e$a;->a(Lcom/vivo/push/IPushActionListener;)V

    .line 234
    invoke-virtual {v4}, Lcom/vivo/push/e$a;->a()V

    return-void
.end method

.method public final a(Lcom/vivo/push/o;)V
    .locals 3

    .line 288
    invoke-static {}, Lcom/vivo/push/e;->a()Lcom/vivo/push/e;

    move-result-object v0

    .line 289
    iget-object v0, v0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    .line 290
    const-string v1, "PushClientManager"

    if-nez p1, :cond_0

    .line 291
    const-string p0, "sendCommand, null command!"

    invoke-static {v1, p0}, Lcom/vivo/push/util/p;->a(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_1

    .line 292
    const-string p0, "[\u6267\u884c\u6307\u4ee4\u5931\u8d25]\u6307\u4ee4\u7a7a\uff01"

    invoke-static {v0, p0}, Lcom/vivo/push/util/p;->c(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 293
    :cond_0
    iget-object p0, p0, Lcom/vivo/push/e;->r:Lcom/vivo/push/IPushClientFactory;

    invoke-interface {p0, p1}, Lcom/vivo/push/IPushClientFactory;->createTask(Lcom/vivo/push/o;)Lcom/vivo/push/l;

    move-result-object p0

    if-nez p0, :cond_2

    .line 294
    const-string p0, "sendCommand, null command task! pushCommand = "

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/vivo/push/util/p;->a(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_1

    .line 295
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "[\u6267\u884c\u6307\u4ee4\u5931\u8d25]\u6307\u4ee4"

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\u4efb\u52a1\u7a7a\uff01"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/vivo/push/util/p;->c(Landroid/content/Context;Ljava/lang/String;)V

    :cond_1
    return-void

    .line 296
    :cond_2
    const-string v0, "client--sendCommand, command = "

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/vivo/push/util/p;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    invoke-static {p0}, Lcom/vivo/push/m;->a(Lcom/vivo/push/l;)V

    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 1

    .line 206
    iput-object p1, p0, Lcom/vivo/push/e;->k:Ljava/lang/String;

    .line 207
    iget-object p0, p0, Lcom/vivo/push/e;->j:Lcom/vivo/push/util/b;

    const-string v0, "APP_TOKEN"

    invoke-virtual {p0, v0, p1}, Lcom/vivo/push/util/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final a(Ljava/lang/String;I)V
    .locals 0

    .line 269
    invoke-direct {p0, p1}, Lcom/vivo/push/e;->d(Ljava/lang/String;)Lcom/vivo/push/e$a;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p1, 0x0

    .line 270
    new-array p1, p1, [Ljava/lang/Object;

    invoke-virtual {p0, p2, p1}, Lcom/vivo/push/e$a;->a(I[Ljava/lang/Object;)V

    return-void

    .line 271
    :cond_0
    const-string p0, "PushClientManager"

    const-string p1, "notifyStatusChanged token is null"

    invoke-static {p0, p1}, Lcom/vivo/push/util/p;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final varargs a(Ljava/lang/String;I[Ljava/lang/Object;)V
    .locals 0

    .line 239
    invoke-direct {p0, p1}, Lcom/vivo/push/e;->d(Ljava/lang/String;)Lcom/vivo/push/e$a;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 240
    invoke-virtual {p0, p2, p3}, Lcom/vivo/push/e$a;->a(I[Ljava/lang/Object;)V

    return-void

    .line 241
    :cond_0
    const-string p0, "PushClientManager"

    const-string p1, "notifyApp token is null"

    invoke-static {p0, p1}, Lcom/vivo/push/util/p;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final a(Ljava/lang/String;Lcom/vivo/push/IPushActionListener;)V
    .locals 5

    .line 242
    iget-object v0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    if-nez v0, :cond_0

    if-eqz p2, :cond_8

    const/16 p0, 0x66

    .line 243
    invoke-interface {p2, p0}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    return-void

    .line 244
    :cond_0
    iget-object v0, p0, Lcom/vivo/push/e;->l:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vivo/push/e;->l:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p2, :cond_8

    .line 245
    invoke-interface {p2, v1}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    return-void

    .line 246
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 247
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 248
    new-instance v2, Lcom/vivo/push/b/a;

    iget-object v3, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-direct {v2, v4, v3, v0}, Lcom/vivo/push/b/a;-><init>(ZLjava/lang/String;Ljava/util/ArrayList;)V

    const/16 v0, 0x64

    .line 249
    invoke-virtual {v2, v0}, Lcom/vivo/push/b/c;->a(I)V

    .line 250
    iget-boolean v0, p0, Lcom/vivo/push/e;->q:Z

    if-eqz v0, :cond_7

    .line 251
    invoke-direct {p0}, Lcom/vivo/push/e;->n()Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p2, :cond_8

    const/16 p0, 0x65

    .line 252
    invoke-interface {p2, p0}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    return-void

    .line 253
    :cond_2
    iget-wide v0, p0, Lcom/vivo/push/e;->d:J

    invoke-static {v0, v1}, Lcom/vivo/push/e;->a(J)Z

    move-result v0

    if-nez v0, :cond_3

    if-eqz p2, :cond_8

    const/16 p0, 0x3ea

    .line 254
    invoke-interface {p2, p0}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    return-void

    .line 255
    :cond_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vivo/push/e;->d:J

    .line 256
    new-instance v0, Lcom/vivo/push/e$a;

    invoke-direct {v0, v2, p2}, Lcom/vivo/push/e$a;-><init>(Lcom/vivo/push/b/c;Lcom/vivo/push/IPushActionListener;)V

    invoke-direct {p0, v0}, Lcom/vivo/push/e;->a(Lcom/vivo/push/e$a;)Ljava/lang/String;

    move-result-object p2

    .line 257
    invoke-virtual {v2, p2}, Lcom/vivo/push/b/c;->b(Ljava/lang/String;)V

    .line 258
    iget-object v0, p0, Lcom/vivo/push/e;->k:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/16 p1, 0x7531

    .line 259
    invoke-virtual {p0, p2, p1}, Lcom/vivo/push/e;->a(Ljava/lang/String;I)V

    return-void

    .line 260
    :cond_4
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    const/16 p1, 0x7532

    .line 261
    invoke-virtual {p0, p2, p1}, Lcom/vivo/push/e;->a(Ljava/lang/String;I)V

    return-void

    .line 262
    :cond_5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    int-to-long v0, p1

    const-wide/16 v3, 0x46

    cmp-long p1, v0, v3

    if-lez p1, :cond_6

    const/16 p1, 0x7533

    .line 263
    invoke-virtual {p0, p2, p1}, Lcom/vivo/push/e;->a(Ljava/lang/String;I)V

    return-void

    .line 264
    :cond_6
    invoke-virtual {p0, v2}, Lcom/vivo/push/e;->a(Lcom/vivo/push/o;)V

    .line 265
    invoke-direct {p0, p2}, Lcom/vivo/push/e;->e(Ljava/lang/String;)V

    return-void

    .line 266
    :cond_7
    invoke-virtual {p0, v2}, Lcom/vivo/push/e;->a(Lcom/vivo/push/o;)V

    if-eqz p2, :cond_8

    .line 267
    invoke-interface {p2, v1}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    :cond_8
    return-void
.end method

.method public final a(Ljava/util/ArrayList;Lcom/vivo/push/IPushActionListener;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/vivo/push/IPushActionListener;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    if-eqz p2, :cond_9

    .line 6
    .line 7
    const/16 p0, 0x66

    .line 8
    .line 9
    invoke-interface {p2, p0}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v1, Lcom/vivo/push/b/z;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-direct {v1, v2, v0, p1}, Lcom/vivo/push/b/z;-><init>(ZLjava/lang/String;Ljava/util/ArrayList;)V

    .line 21
    .line 22
    .line 23
    const/16 v0, 0x1f4

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Lcom/vivo/push/b/c;->a(I)V

    .line 26
    .line 27
    .line 28
    iget-boolean v2, p0, Lcom/vivo/push/e;->q:Z

    .line 29
    .line 30
    if-eqz v2, :cond_8

    .line 31
    .line 32
    invoke-direct {p0}, Lcom/vivo/push/e;->n()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_1

    .line 37
    .line 38
    if-eqz p2, :cond_9

    .line 39
    .line 40
    const/16 p0, 0x65

    .line 41
    .line 42
    invoke-interface {p2, p0}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget-wide v2, p0, Lcom/vivo/push/e;->f:J

    .line 47
    .line 48
    invoke-static {v2, v3}, Lcom/vivo/push/e;->a(J)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-nez v2, :cond_2

    .line 53
    .line 54
    if-eqz p2, :cond_9

    .line 55
    .line 56
    const/16 p0, 0x3ea

    .line 57
    .line 58
    invoke-interface {p2, p0}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 63
    .line 64
    .line 65
    move-result-wide v2

    .line 66
    iput-wide v2, p0, Lcom/vivo/push/e;->f:J

    .line 67
    .line 68
    new-instance v2, Lcom/vivo/push/e$a;

    .line 69
    .line 70
    invoke-direct {v2, v1, p2}, Lcom/vivo/push/e$a;-><init>(Lcom/vivo/push/b/c;Lcom/vivo/push/IPushActionListener;)V

    .line 71
    .line 72
    .line 73
    invoke-direct {p0, v2}, Lcom/vivo/push/e;->a(Lcom/vivo/push/e$a;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-virtual {v1, p2}, Lcom/vivo/push/b/c;->b(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object v2, p0, Lcom/vivo/push/e;->k:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_3

    .line 87
    .line 88
    const/16 p1, 0x4e21

    .line 89
    .line 90
    invoke-virtual {p0, p2, p1}, Lcom/vivo/push/e;->a(Ljava/lang/String;I)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-gez v2, :cond_4

    .line 99
    .line 100
    const/16 p1, 0x4e22

    .line 101
    .line 102
    invoke-virtual {p0, p2, p1}, Lcom/vivo/push/e;->a(Ljava/lang/String;I)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_4
    invoke-virtual {p0}, Lcom/vivo/push/e;->c()Ljava/util/List;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    add-int/2addr v3, v2

    .line 119
    if-le v3, v0, :cond_5

    .line 120
    .line 121
    const/16 p1, 0x4e24

    .line 122
    .line 123
    invoke-virtual {p0, p2, p1}, Lcom/vivo/push/e;->a(Ljava/lang/String;I)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_5
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    :cond_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_7

    .line 136
    .line 137
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    check-cast v0, Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    int-to-long v2, v0

    .line 148
    const-wide/16 v4, 0x46

    .line 149
    .line 150
    cmp-long v0, v2, v4

    .line 151
    .line 152
    if-lez v0, :cond_6

    .line 153
    .line 154
    const/16 p1, 0x4e23

    .line 155
    .line 156
    invoke-virtual {p0, p2, p1}, Lcom/vivo/push/e;->a(Ljava/lang/String;I)V

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :cond_7
    invoke-virtual {p0, v1}, Lcom/vivo/push/e;->a(Lcom/vivo/push/o;)V

    .line 161
    .line 162
    .line 163
    invoke-direct {p0, p2}, Lcom/vivo/push/e;->e(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_8
    invoke-virtual {p0, v1}, Lcom/vivo/push/e;->a(Lcom/vivo/push/o;)V

    .line 168
    .line 169
    .line 170
    if-eqz p2, :cond_9

    .line 171
    .line 172
    const/4 p0, 0x0

    .line 173
    invoke-interface {p2, p0}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    .line 174
    .line 175
    .line 176
    :cond_9
    return-void
.end method

.method public final a(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 192
    const-string v0, "APP_TAGS"

    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-gtz v1, :cond_0

    return-void

    .line 193
    :cond_0
    iget-object v1, p0, Lcom/vivo/push/e;->j:Lcom/vivo/push/util/b;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/vivo/push/util/b;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 194
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 195
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    goto :goto_0

    :catch_0
    move-exception p1

    goto :goto_2

    .line 196
    :cond_1
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    move-object v1, v2

    .line 197
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 198
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    goto :goto_1

    .line 199
    :cond_2
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    .line 200
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    iget-object v2, p0, Lcom/vivo/push/e;->j:Lcom/vivo/push/util/b;

    if-eqz v1, :cond_3

    .line 202
    :try_start_1
    invoke-virtual {v2, v0}, Lcom/vivo/push/util/b;->b(Ljava/lang/String;)V

    return-void

    .line 203
    :cond_3
    invoke-virtual {v2, v0, p1}, Lcom/vivo/push/util/b;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    .line 204
    :goto_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 205
    iget-object p0, p0, Lcom/vivo/push/e;->j:Lcom/vivo/push/util/b;

    invoke-virtual {p0, v0}, Lcom/vivo/push/util/b;->b(Ljava/lang/String;)V

    return-void
.end method

.method public final a(Z)V
    .locals 0

    .line 208
    iput-boolean p1, p0, Lcom/vivo/push/e;->i:Z

    return-void
.end method

.method public final b()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vivo/push/util/VivoPushException;
        }
    .end annotation

    .line 168
    iget-object p0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    if-eqz p0, :cond_0

    .line 169
    invoke-static {p0}, Lcom/vivo/push/util/z;->b(Landroid/content/Context;)V

    :cond_0
    return-void
.end method

.method public final b(Lcom/vivo/push/IPushActionListener;)V
    .locals 5

    .line 184
    iget-object v0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    const/16 v1, 0x66

    if-nez v0, :cond_0

    if-eqz p1, :cond_8

    .line 185
    invoke-interface {p1, v1}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    return-void

    .line 186
    :cond_0
    const-string v0, ""

    iget-object v2, p0, Lcom/vivo/push/e;->k:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 187
    invoke-interface {p1, v2}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    return-void

    .line 188
    :cond_1
    iget-wide v3, p0, Lcom/vivo/push/e;->c:J

    invoke-static {v3, v4}, Lcom/vivo/push/e;->a(J)Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p1, :cond_8

    const/16 p0, 0x3ea

    .line 189
    invoke-interface {p1, p0}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    return-void

    .line 190
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/vivo/push/e;->c:J

    .line 191
    iget-object v0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 192
    iget-object v3, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    const/4 v4, 0x0

    if-nez v3, :cond_3

    if-eqz p1, :cond_7

    .line 193
    invoke-interface {p1, v1}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    goto :goto_0

    .line 194
    :cond_3
    new-instance v1, Lcom/vivo/push/b/b;

    invoke-direct {v1, v2, v0}, Lcom/vivo/push/b/b;-><init>(ZLjava/lang/String;)V

    .line 195
    invoke-virtual {v1}, Lcom/vivo/push/b/b;->d()V

    .line 196
    invoke-virtual {v1}, Lcom/vivo/push/b/b;->e()V

    .line 197
    invoke-virtual {v1}, Lcom/vivo/push/b/c;->g()V

    const/16 v0, 0x64

    .line 198
    invoke-virtual {v1, v0}, Lcom/vivo/push/b/c;->a(I)V

    .line 199
    iget-boolean v0, p0, Lcom/vivo/push/e;->q:Z

    if-eqz v0, :cond_5

    .line 200
    invoke-direct {p0}, Lcom/vivo/push/e;->n()Z

    move-result v0

    if-nez v0, :cond_4

    if-eqz p1, :cond_7

    const/16 v0, 0x65

    .line 201
    invoke-interface {p1, v0}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    goto :goto_0

    .line 202
    :cond_4
    new-instance v4, Lcom/vivo/push/e$a;

    invoke-direct {v4, v1, p1}, Lcom/vivo/push/e$a;-><init>(Lcom/vivo/push/b/c;Lcom/vivo/push/IPushActionListener;)V

    .line 203
    invoke-direct {p0, v4}, Lcom/vivo/push/e;->a(Lcom/vivo/push/e$a;)Ljava/lang/String;

    move-result-object p1

    .line 204
    invoke-virtual {v1, p1}, Lcom/vivo/push/b/c;->b(Ljava/lang/String;)V

    .line 205
    new-instance v0, Lcom/vivo/push/j;

    invoke-direct {v0, p0, v1, p1}, Lcom/vivo/push/j;-><init>(Lcom/vivo/push/e;Lcom/vivo/push/b/b;Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Lcom/vivo/push/e$a;->a(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 206
    :cond_5
    iget-object v0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    invoke-virtual {v1, v0}, Lcom/vivo/push/b/c;->a(Landroid/content/Context;)I

    move-result v0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_6

    .line 207
    invoke-direct {p0, v1, p1}, Lcom/vivo/push/e;->a(Lcom/vivo/push/b/b;Lcom/vivo/push/IPushActionListener;)Lcom/vivo/push/e$a;

    move-result-object v4

    goto :goto_0

    .line 208
    :cond_6
    invoke-virtual {p0, v1}, Lcom/vivo/push/e;->a(Lcom/vivo/push/o;)V

    if-eqz p1, :cond_7

    .line 209
    invoke-interface {p1, v2}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    :cond_7
    :goto_0
    if-nez v4, :cond_9

    :cond_8
    return-void

    .line 210
    :cond_9
    new-instance p1, Lcom/vivo/push/i;

    invoke-direct {p1, p0}, Lcom/vivo/push/i;-><init>(Lcom/vivo/push/e;)V

    invoke-virtual {v4, p1}, Lcom/vivo/push/e$a;->a(Lcom/vivo/push/IPushActionListener;)V

    .line 211
    invoke-virtual {v4}, Lcom/vivo/push/e$a;->a()V

    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .locals 1

    .line 238
    iput-object p1, p0, Lcom/vivo/push/e;->l:Ljava/lang/String;

    .line 239
    iget-object p0, p0, Lcom/vivo/push/e;->j:Lcom/vivo/push/util/b;

    const-string v0, "APP_ALIAS"

    invoke-virtual {p0, v0, p1}, Lcom/vivo/push/util/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final b(Ljava/lang/String;Lcom/vivo/push/IPushActionListener;)V
    .locals 5

    .line 212
    iget-object v0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    if-nez v0, :cond_0

    if-eqz p2, :cond_8

    const/16 p0, 0x66

    .line 213
    invoke-interface {p2, p0}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    return-void

    .line 214
    :cond_0
    iget-object v0, p0, Lcom/vivo/push/e;->l:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    if-eqz p2, :cond_8

    .line 215
    invoke-interface {p2, v1}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    return-void

    .line 216
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 217
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 218
    new-instance v2, Lcom/vivo/push/b/a;

    iget-object v3, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v1, v3, v0}, Lcom/vivo/push/b/a;-><init>(ZLjava/lang/String;Ljava/util/ArrayList;)V

    const/16 v0, 0x64

    .line 219
    invoke-virtual {v2, v0}, Lcom/vivo/push/b/c;->a(I)V

    .line 220
    iget-boolean v0, p0, Lcom/vivo/push/e;->q:Z

    if-eqz v0, :cond_7

    .line 221
    invoke-direct {p0}, Lcom/vivo/push/e;->n()Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p2, :cond_8

    const/16 p0, 0x65

    .line 222
    invoke-interface {p2, p0}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    return-void

    .line 223
    :cond_2
    iget-wide v0, p0, Lcom/vivo/push/e;->e:J

    invoke-static {v0, v1}, Lcom/vivo/push/e;->a(J)Z

    move-result v0

    if-nez v0, :cond_3

    if-eqz p2, :cond_8

    const/16 p0, 0x3ea

    .line 224
    invoke-interface {p2, p0}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    return-void

    .line 225
    :cond_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vivo/push/e;->e:J

    .line 226
    new-instance v0, Lcom/vivo/push/e$a;

    invoke-direct {v0, v2, p2}, Lcom/vivo/push/e$a;-><init>(Lcom/vivo/push/b/c;Lcom/vivo/push/IPushActionListener;)V

    invoke-direct {p0, v0}, Lcom/vivo/push/e;->a(Lcom/vivo/push/e$a;)Ljava/lang/String;

    move-result-object p2

    .line 227
    invoke-virtual {v2, p2}, Lcom/vivo/push/b/c;->b(Ljava/lang/String;)V

    .line 228
    iget-object v0, p0, Lcom/vivo/push/e;->k:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/16 p1, 0x7531

    .line 229
    invoke-virtual {p0, p2, p1}, Lcom/vivo/push/e;->a(Ljava/lang/String;I)V

    return-void

    .line 230
    :cond_4
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    const/16 p1, 0x7532

    .line 231
    invoke-virtual {p0, p2, p1}, Lcom/vivo/push/e;->a(Ljava/lang/String;I)V

    return-void

    .line 232
    :cond_5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    int-to-long v0, p1

    const-wide/16 v3, 0x46

    cmp-long p1, v0, v3

    if-lez p1, :cond_6

    const/16 p1, 0x7533

    .line 233
    invoke-virtual {p0, p2, p1}, Lcom/vivo/push/e;->a(Ljava/lang/String;I)V

    return-void

    .line 234
    :cond_6
    invoke-virtual {p0, v2}, Lcom/vivo/push/e;->a(Lcom/vivo/push/o;)V

    .line 235
    invoke-direct {p0, p2}, Lcom/vivo/push/e;->e(Ljava/lang/String;)V

    return-void

    .line 236
    :cond_7
    invoke-virtual {p0, v2}, Lcom/vivo/push/e;->a(Lcom/vivo/push/o;)V

    if-eqz p2, :cond_8

    .line 237
    invoke-interface {p2, v1}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    :cond_8
    return-void
.end method

.method public final b(Ljava/util/ArrayList;Lcom/vivo/push/IPushActionListener;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/vivo/push/IPushActionListener;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    if-eqz p2, :cond_9

    .line 6
    .line 7
    const/16 p0, 0x66

    .line 8
    .line 9
    invoke-interface {p2, p0}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v1, Lcom/vivo/push/b/z;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-direct {v1, v2, v0, p1}, Lcom/vivo/push/b/z;-><init>(ZLjava/lang/String;Ljava/util/ArrayList;)V

    .line 21
    .line 22
    .line 23
    const/16 v0, 0x1f4

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Lcom/vivo/push/b/c;->a(I)V

    .line 26
    .line 27
    .line 28
    iget-boolean v3, p0, Lcom/vivo/push/e;->q:Z

    .line 29
    .line 30
    if-eqz v3, :cond_8

    .line 31
    .line 32
    invoke-direct {p0}, Lcom/vivo/push/e;->n()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_1

    .line 37
    .line 38
    if-eqz p2, :cond_9

    .line 39
    .line 40
    const/16 p0, 0x65

    .line 41
    .line 42
    invoke-interface {p2, p0}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget-wide v2, p0, Lcom/vivo/push/e;->g:J

    .line 47
    .line 48
    invoke-static {v2, v3}, Lcom/vivo/push/e;->a(J)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-nez v2, :cond_2

    .line 53
    .line 54
    if-eqz p2, :cond_9

    .line 55
    .line 56
    const/16 p0, 0x3ea

    .line 57
    .line 58
    invoke-interface {p2, p0}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 63
    .line 64
    .line 65
    move-result-wide v2

    .line 66
    iput-wide v2, p0, Lcom/vivo/push/e;->g:J

    .line 67
    .line 68
    new-instance v2, Lcom/vivo/push/e$a;

    .line 69
    .line 70
    invoke-direct {v2, v1, p2}, Lcom/vivo/push/e$a;-><init>(Lcom/vivo/push/b/c;Lcom/vivo/push/IPushActionListener;)V

    .line 71
    .line 72
    .line 73
    invoke-direct {p0, v2}, Lcom/vivo/push/e;->a(Lcom/vivo/push/e$a;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-virtual {v1, p2}, Lcom/vivo/push/b/c;->b(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object v2, p0, Lcom/vivo/push/e;->k:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_3

    .line 87
    .line 88
    const/16 p1, 0x4e21

    .line 89
    .line 90
    invoke-virtual {p0, p2, p1}, Lcom/vivo/push/e;->a(Ljava/lang/String;I)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-gez v2, :cond_4

    .line 99
    .line 100
    const/16 p1, 0x4e22

    .line 101
    .line 102
    invoke-virtual {p0, p2, p1}, Lcom/vivo/push/e;->a(Ljava/lang/String;I)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_4
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-le v2, v0, :cond_5

    .line 111
    .line 112
    const/16 p1, 0x4e24

    .line 113
    .line 114
    invoke-virtual {p0, p2, p1}, Lcom/vivo/push/e;->a(Ljava/lang/String;I)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_5
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    :cond_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_7

    .line 127
    .line 128
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    check-cast v0, Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    int-to-long v2, v0

    .line 139
    const-wide/16 v4, 0x46

    .line 140
    .line 141
    cmp-long v0, v2, v4

    .line 142
    .line 143
    if-lez v0, :cond_6

    .line 144
    .line 145
    const/16 p1, 0x4e23

    .line 146
    .line 147
    invoke-virtual {p0, p2, p1}, Lcom/vivo/push/e;->a(Ljava/lang/String;I)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :cond_7
    invoke-virtual {p0, v1}, Lcom/vivo/push/e;->a(Lcom/vivo/push/o;)V

    .line 152
    .line 153
    .line 154
    invoke-direct {p0, p2}, Lcom/vivo/push/e;->e(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :cond_8
    invoke-virtual {p0, v1}, Lcom/vivo/push/e;->a(Lcom/vivo/push/o;)V

    .line 159
    .line 160
    .line 161
    if-eqz p2, :cond_9

    .line 162
    .line 163
    invoke-interface {p2, v2}, Lcom/vivo/push/IPushActionListener;->onStateChanged(I)V

    .line 164
    .line 165
    .line 166
    :cond_9
    return-void
.end method

.method public final b(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 170
    const-string v0, "APP_TAGS"

    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-gtz v1, :cond_0

    return-void

    .line 171
    :cond_0
    iget-object v1, p0, Lcom/vivo/push/e;->j:Lcom/vivo/push/util/b;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/vivo/push/util/b;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 172
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 173
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    goto :goto_0

    :catch_0
    move-exception p1

    goto :goto_2

    .line 174
    :cond_1
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    move-object v1, v2

    .line 175
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 176
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    goto :goto_1

    .line 177
    :cond_2
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    .line 178
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 179
    iget-object v2, p0, Lcom/vivo/push/e;->j:Lcom/vivo/push/util/b;

    if-eqz v1, :cond_3

    .line 180
    :try_start_1
    invoke-virtual {v2, v0}, Lcom/vivo/push/util/b;->b(Ljava/lang/String;)V

    return-void

    .line 181
    :cond_3
    invoke-virtual {v2, v0, p1}, Lcom/vivo/push/util/b;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    .line 182
    :goto_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 183
    iget-object p0, p0, Lcom/vivo/push/e;->j:Lcom/vivo/push/util/b;

    invoke-virtual {p0, v0}, Lcom/vivo/push/util/b;->b(Ljava/lang/String;)V

    return-void
.end method

.method public final c()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/vivo/push/e;->j:Lcom/vivo/push/util/b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "APP_TAGS"

    .line 5
    .line 6
    invoke-virtual {v0, v2, v1}, Lcom/vivo/push/util/b;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    :try_start_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    new-instance v3, Lorg/json/JSONObject;

    .line 23
    .line 24
    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    :goto_1
    return-object v1

    .line 46
    :catch_0
    iget-object p0, p0, Lcom/vivo/push/e;->j:Lcom/vivo/push/util/b;

    .line 47
    .line 48
    invoke-virtual {p0, v2}, Lcom/vivo/push/util/b;->b(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 52
    .line 53
    .line 54
    const-string p0, "PushClientManager"

    .line 55
    .line 56
    const-string v0, "getTags error"

    .line 57
    .line 58
    invoke-static {p0, v0}, Lcom/vivo/push/util/p;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    return-object v1
.end method

.method public final c(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 64
    iget-object v0, p0, Lcom/vivo/push/e;->l:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 65
    invoke-direct {p0}, Lcom/vivo/push/e;->m()V

    :cond_0
    return-void
.end method

.method public final d()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "PushClientManager"

    .line 6
    .line 7
    const-string v0, "support:context is null"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/vivo/push/util/p;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-direct {p0}, Lcom/vivo/push/e;->n()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/vivo/push/e;->o:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method

.method public final e()Z
    .locals 0

    .line 10
    iget-boolean p0, p0, Lcom/vivo/push/e;->q:Z

    return p0
.end method

.method public final f()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/vivo/push/e;->k:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/vivo/push/e;->k:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/vivo/push/e;->j:Lcom/vivo/push/util/b;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const-string v1, "APP_TOKEN"

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v0, v1, v2}, Lcom/vivo/push/util/b;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const-string v0, ""

    .line 25
    .line 26
    :goto_0
    invoke-direct {p0, v0}, Lcom/vivo/push/e;->c(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method public final g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/vivo/push/e;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public final h()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/vivo/push/e;->j:Lcom/vivo/push/util/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/vivo/push/util/b;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final j()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/vivo/push/e;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final k()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/vivo/push/e;->s:I

    .line 2
    .line 3
    return p0
.end method

.method public final l()J
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/vivo/push/e;->h:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, -0x1

    .line 6
    .line 7
    return-wide v0

    .line 8
    :cond_0
    iget-object v1, p0, Lcom/vivo/push/e;->p:Ljava/lang/Long;

    .line 9
    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    invoke-static {v0}, Lcom/vivo/push/util/z;->a(Landroid/content/Context;)J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/vivo/push/e;->p:Ljava/lang/Long;

    .line 21
    .line 22
    :cond_1
    iget-object p0, p0, Lcom/vivo/push/e;->p:Ljava/lang/Long;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    return-wide v0
.end method
