.class public Lcom/tencent/open/log/b;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Ljava/text/SimpleDateFormat;


# instance fields
.field private b:Ljava/lang/String;

.field private c:I

.field private d:I

.field private e:I

.field private f:J

.field private g:I

.field private h:Ljava/lang/String;

.field private i:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "yy.MM.dd.HH"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/open/log/d$b;->a(Ljava/lang/String;)Ljava/text/SimpleDateFormat;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/tencent/open/log/b;->a:Ljava/text/SimpleDateFormat;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 11

    .line 63
    const-string v8, ".log"

    const-wide v9, 0x7fffffffffffffffL

    const v1, 0x7fffffff

    const v2, 0x7fffffff

    const/16 v3, 0x1000

    const-string v4, "Tracer.File"

    const-wide/16 v5, 0x2710

    const/16 v7, 0xa

    move-object v0, p0

    invoke-direct/range {v0 .. v10}, Lcom/tencent/open/log/b;-><init>(IIILjava/lang/String;JILjava/lang/String;J)V

    return-void
.end method

.method public constructor <init>(IIILjava/lang/String;JILjava/lang/String;J)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "Tracer.File"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/open/log/b;->b:Ljava/lang/String;

    .line 7
    .line 8
    const v0, 0x7fffffff

    .line 9
    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/open/log/b;->c:I

    .line 12
    .line 13
    iput v0, p0, Lcom/tencent/open/log/b;->d:I

    .line 14
    .line 15
    const/16 v0, 0x1000

    .line 16
    .line 17
    iput v0, p0, Lcom/tencent/open/log/b;->e:I

    .line 18
    .line 19
    const-wide/16 v0, 0x2710

    .line 20
    .line 21
    iput-wide v0, p0, Lcom/tencent/open/log/b;->f:J

    .line 22
    .line 23
    const/16 v0, 0xa

    .line 24
    .line 25
    iput v0, p0, Lcom/tencent/open/log/b;->g:I

    .line 26
    .line 27
    const-string v0, ".log"

    .line 28
    .line 29
    iput-object v0, p0, Lcom/tencent/open/log/b;->h:Ljava/lang/String;

    .line 30
    .line 31
    const-wide v0, 0x7fffffffffffffffL

    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    iput-wide v0, p0, Lcom/tencent/open/log/b;->i:J

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/tencent/open/log/b;->b(I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p2}, Lcom/tencent/open/log/b;->a(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p3}, Lcom/tencent/open/log/b;->c(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p4}, Lcom/tencent/open/log/b;->a(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p5, p6}, Lcom/tencent/open/log/b;->b(J)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p7}, Lcom/tencent/open/log/b;->d(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, p8}, Lcom/tencent/open/log/b;->b(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p9, p10}, Lcom/tencent/open/log/b;->c(J)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static a(J)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ljava/text/SimpleDateFormat;

    .line 9
    .line 10
    const-string p1, "yy.MM.dd.HH"

    .line 11
    .line 12
    invoke-direct {p0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method private c(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "com.tencent.mobileqq_connectSdk."

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p1, ".log"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method private d(J)Ljava/io/File;
    .locals 1

    .line 1
    invoke-static {p1, p2}, Lcom/tencent/open/log/b;->a(J)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p1}, Lcom/tencent/open/log/b;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Lcom/tencent/open/utils/n;->b()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    :cond_0
    :try_start_0
    new-instance p2, Ljava/io/File;

    .line 22
    .line 23
    sget-object v0, Lcom/tencent/open/log/c;->o:Ljava/lang/String;

    .line 24
    .line 25
    invoke-direct {p2, p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    invoke-virtual {p2}, Ljava/io/File;->mkdirs()Z

    .line 35
    .line 36
    .line 37
    :cond_1
    new-instance p1, Ljava/io/File;

    .line 38
    .line 39
    invoke-direct {p1, p2, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    return-object p1

    .line 43
    :catch_0
    move-exception p0

    .line 44
    const-string p1, "openSDK_LOG"

    .line 45
    .line 46
    const-string p2, "getWorkFile,get app specific file exception:"

    .line 47
    .line 48
    invoke-static {p1, p2, p0}, Lcom/tencent/open/log/SLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    const/4 p0, 0x0

    .line 52
    return-object p0
.end method


# virtual methods
.method public a()Ljava/io/File;
    .locals 2

    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/tencent/open/log/b;->d(J)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method public a(I)V
    .locals 0

    .line 26
    iput p1, p0, Lcom/tencent/open/log/b;->c:I

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 0

    .line 25
    iput-object p1, p0, Lcom/tencent/open/log/b;->b:Ljava/lang/String;

    return-void
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/open/log/b;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(I)V
    .locals 0

    .line 4
    iput p1, p0, Lcom/tencent/open/log/b;->d:I

    return-void
.end method

.method public b(J)V
    .locals 0

    .line 5
    iput-wide p1, p0, Lcom/tencent/open/log/b;->f:J

    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    .line 6
    iput-object p1, p0, Lcom/tencent/open/log/b;->h:Ljava/lang/String;

    return-void
.end method

.method public c()I
    .locals 0

    .line 21
    iget p0, p0, Lcom/tencent/open/log/b;->e:I

    return p0
.end method

.method public c(I)V
    .locals 0

    .line 22
    iput p1, p0, Lcom/tencent/open/log/b;->e:I

    return-void
.end method

.method public c(J)V
    .locals 0

    .line 23
    iput-wide p1, p0, Lcom/tencent/open/log/b;->i:J

    return-void
.end method

.method public d()I
    .locals 0

    .line 53
    iget p0, p0, Lcom/tencent/open/log/b;->g:I

    return p0
.end method

.method public d(I)V
    .locals 0

    .line 54
    iput p1, p0, Lcom/tencent/open/log/b;->g:I

    return-void
.end method
