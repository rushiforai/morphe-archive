.class public Lcom/hellogroup/mk/core/log/page/BasePageLog;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/mk/core/log/page/BasePageLog$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000b\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010$\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0008\u0018\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010%\n\u0002\u0008\u0004\n\u0002\u0010\t\n\u0002\u0008\n\u0008\u0016\u0018\u0000 S2\u00020\u0001:\u00019B%\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J7\u0010\u0011\u001a\u00020\u00102\u0006\u0010\t\u001a\u00020\u00042\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000e\u001a\u00020\u00042\u0006\u0010\u000f\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012Ja\u0010\u001c\u001a\u00020\u00042\u0006\u0010\r\u001a\u00020\u000c2\u0006\u0010\u0013\u001a\u00020\u00042\u0006\u0010\u0014\u001a\u00020\u00042\u0006\u0010\u0016\u001a\u00020\u00152\u0016\u0010\u0018\u001a\u0012\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u00172\u0008\u0010\u0019\u001a\u0004\u0018\u00010\u00042\u000e\u0010\u001b\u001a\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u001aH\u0002\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\u001f\u0010\u001f\u001a\u00020\u00152\u0006\u0010\u001e\u001a\u00020\u00152\u0006\u0010\u000b\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u001f\u0010 J\u000f\u0010!\u001a\u00020\u0015H\u0002\u00a2\u0006\u0004\u0008!\u0010\"J\u001f\u0010%\u001a\u00020\u00102\u0006\u0010#\u001a\u00020\u00152\u0008\u0010$\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008%\u0010&J\u0017\u0010\'\u001a\u00020\u00152\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\'\u0010(J\u0015\u0010*\u001a\u00020\u00102\u0006\u0010)\u001a\u00020\u0004\u00a2\u0006\u0004\u0008*\u0010+J\u0017\u0010-\u001a\u00020\u00102\u0008\u0010,\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008-\u0010+J\u0015\u0010/\u001a\u00020\u00102\u0006\u0010.\u001a\u00020\u0004\u00a2\u0006\u0004\u0008/\u0010+J\u0015\u00101\u001a\u00020\u00102\u0006\u00100\u001a\u00020\u0015\u00a2\u0006\u0004\u00081\u00102JY\u00105\u001a\u00020\u00102\u0006\u00104\u001a\u0002032\n\u0008\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00042\u0010\u0008\u0002\u0010\u001b\u001a\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u001a2\u0018\u0008\u0002\u0010\u0018\u001a\u0012\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u00172\u0008\u0008\u0002\u0010\u001e\u001a\u00020\u0015H\u0007\u00a2\u0006\u0004\u00085\u00106J\r\u00107\u001a\u00020\u0010\u00a2\u0006\u0004\u00087\u00108R\u0014\u0010;\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u00089\u0010:R\u0016\u0010>\u001a\u00020\u00158\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008<\u0010=R\u0016\u0010@\u001a\u00020\u00158\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008?\u0010=R\u001a\u0010D\u001a\u0008\u0012\u0004\u0012\u00020\u00040A8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008B\u0010CR\"\u0010G\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00010E8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u00085\u0010FR\u0016\u0010I\u001a\u00020\u00158\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008H\u0010=R\u0014\u0010L\u001a\u00020J8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001c\u0010KR\u0016\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001f\u0010MR$\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0016@\u0016X\u0096\u000e\u00a2\u0006\u0012\n\u0004\u0008N\u0010:\u001a\u0004\u0008N\u0010O\"\u0004\u0008P\u0010+R$\u0010\u0006\u001a\u0004\u0018\u00010\u00048\u0016@\u0016X\u0096\u000e\u00a2\u0006\u0012\n\u0004\u0008Q\u0010:\u001a\u0004\u0008Q\u0010O\"\u0004\u0008R\u0010+\u00a8\u0006T"
    }
    d2 = {
        "Lcom/hellogroup/mk/core/log/page/BasePageLog;",
        "",
        "Lcom/hellogroup/mk/core/log/core/MKLogReporter;",
        "reporter",
        "",
        "bid",
        "url",
        "<init>",
        "(Lcom/hellogroup/mk/core/log/core/MKLogReporter;Ljava/lang/String;Ljava/lang/String;)V",
        "triggerLevel",
        "Lcom/hellogroup/mk/core/log/core/MKLogLevel;",
        "logLevel",
        "Lcom/hellogroup/mk/core/log/core/MKLogSource;",
        "source",
        "thirdBiz",
        "logStr",
        "",
        "m",
        "(Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogLevel;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Ljava/lang/String;)V",
        "errorCode",
        "content",
        "",
        "appendSpace",
        "",
        "extra",
        "description",
        "",
        "messages",
        "g",
        "(Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Ljava/lang/String;ZLjava/util/Map;Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;",
        "reportAllLog",
        "h",
        "(ZLcom/hellogroup/mk/core/log/core/MKLogLevel;)Z",
        "k",
        "()Z",
        "isOffline",
        "version",
        "q",
        "(ZLjava/lang/String;)V",
        "t",
        "(Ljava/lang/String;)Z",
        "fep",
        "p",
        "(Ljava/lang/String;)V",
        "offlineVersion",
        "r",
        "ua",
        "s",
        "dns",
        "o",
        "(Z)V",
        "Lcom/hellogroup/mk/core/log/page/MKPageLogType;",
        "type",
        "e",
        "(Lcom/hellogroup/mk/core/log/page/MKPageLogType;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;Z)V",
        "l",
        "()V",
        "a",
        "Ljava/lang/String;",
        "pageId",
        "b",
        "Z",
        "allowAllLogs",
        "c",
        "allowErrorLogs",
        "Ljava/util/concurrent/CopyOnWriteArrayList;",
        "d",
        "Ljava/util/concurrent/CopyOnWriteArrayList;",
        "logBuffer",
        "",
        "Ljava/util/Map;",
        "extraInfo",
        "f",
        "isFirstError",
        "",
        "J",
        "createTimeMs",
        "Lcom/hellogroup/mk/core/log/core/MKLogReporter;",
        "i",
        "()Ljava/lang/String;",
        "setBid",
        "j",
        "n",
        "Companion",
        "MKCore_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final Companion:Lcom/hellogroup/mk/core/log/page/BasePageLog$a;


# instance fields
.field private final a:Ljava/lang/String;

.field private b:Z

.field private c:Z

.field private final d:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private volatile f:Z

.field private final g:J

.field private final h:Lcom/hellogroup/mk/core/log/core/MKLogReporter;

.field private i:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private j:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hellogroup/mk/core/log/page/BasePageLog$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hellogroup/mk/core/log/page/BasePageLog$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->Companion:Lcom/hellogroup/mk/core/log/page/BasePageLog$a;

    return-void
.end method

.method public constructor <init>(Lcom/hellogroup/mk/core/log/core/MKLogReporter;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/hellogroup/mk/core/log/core/MKLogReporter;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->h:Lcom/hellogroup/mk/core/log/core/MKLogReporter;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->i:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->j:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {}, Ll/rs8;->e()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iput-boolean p1, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->b:Z

    .line 28
    .line 29
    invoke-static {}, Ll/rs8;->l()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput-boolean p1, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->c:Z

    .line 34
    .line 35
    new-instance p1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 36
    .line 37
    invoke-direct {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 41
    .line 42
    new-instance p1, Ljava/util/LinkedHashMap;

    .line 43
    .line 44
    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->e:Ljava/util/Map;

    .line 48
    .line 49
    const/4 p1, 0x1

    .line 50
    iput-boolean p1, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->f:Z

    .line 51
    .line 52
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 53
    .line 54
    .line 55
    move-result-wide p1

    .line 56
    iput-wide p1, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->g:J

    .line 57
    .line 58
    return-void
.end method

.method public static final synthetic a(Lcom/hellogroup/mk/core/log/page/BasePageLog;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->g:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static final synthetic b(Lcom/hellogroup/mk/core/log/page/BasePageLog;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->e:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic c(Lcom/hellogroup/mk/core/log/page/BasePageLog;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic d(Lcom/hellogroup/mk/core/log/page/BasePageLog;)Lcom/hellogroup/mk/core/log/core/MKLogReporter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->h:Lcom/hellogroup/mk/core/log/core/MKLogReporter;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Lcom/hellogroup/mk/core/log/page/BasePageLog;Lcom/hellogroup/mk/core/log/page/MKPageLogType;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;ZILjava/lang/Object;)V
    .locals 1

    .line 1
    if-nez p7, :cond_4

    .line 2
    .line 3
    and-int/lit8 p7, p6, 0x2

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p7, :cond_0

    .line 7
    .line 8
    move-object p2, v0

    .line 9
    :cond_0
    and-int/lit8 p7, p6, 0x4

    .line 10
    .line 11
    if-eqz p7, :cond_1

    .line 12
    .line 13
    move-object p3, v0

    .line 14
    :cond_1
    and-int/lit8 p7, p6, 0x8

    .line 15
    .line 16
    if-eqz p7, :cond_2

    .line 17
    .line 18
    move-object p4, v0

    .line 19
    :cond_2
    and-int/lit8 p6, p6, 0x10

    .line 20
    .line 21
    if-eqz p6, :cond_3

    .line 22
    .line 23
    const/4 p5, 0x0

    .line 24
    :cond_3
    invoke-virtual/range {p0 .. p5}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->e(Lcom/hellogroup/mk/core/log/page/MKPageLogType;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;Z)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_4
    const-string p0, "Super calls with default arguments not supported in this target, function: addLog"

    .line 29
    .line 30
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private final g(Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Ljava/lang/String;ZLjava/util/Map;Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hellogroup/mk/core/log/core/MKLogSource;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-direct {p0, p4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    new-instance p4, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, "|"

    .line 19
    .line 20
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/hellogroup/mk/core/log/core/MKLogSource;->getStringValue()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string p1, "&&&"

    .line 43
    .line 44
    const/4 p2, 0x1

    .line 45
    if-eqz p6, :cond_2

    .line 46
    .line 47
    invoke-static {p6}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    if-eqz p3, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    invoke-virtual {p0, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 55
    .line 56
    .line 57
    move-result p3

    .line 58
    if-eqz p3, :cond_1

    .line 59
    .line 60
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    :cond_1
    invoke-virtual {p4, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    :cond_2
    :goto_0
    if-eqz p7, :cond_4

    .line 67
    .line 68
    check-cast p7, Ljava/lang/Iterable;

    .line 69
    .line 70
    invoke-interface {p7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    :goto_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 75
    .line 76
    .line 77
    move-result p6

    .line 78
    if-eqz p6, :cond_4

    .line 79
    .line 80
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p6

    .line 84
    check-cast p6, Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {p0, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 87
    .line 88
    .line 89
    move-result p7

    .line 90
    if-eqz p7, :cond_3

    .line 91
    .line 92
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    :cond_3
    invoke-virtual {p4, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_4
    if-eqz p5, :cond_7

    .line 100
    .line 101
    invoke-static {p5}, Lkotlin/collections/MapsKt;->toSortedMap(Ljava/util/Map;)Ljava/util/SortedMap;

    .line 102
    .line 103
    .line 104
    move-result-object p3

    .line 105
    if-eqz p3, :cond_7

    .line 106
    .line 107
    invoke-interface {p3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 108
    .line 109
    .line 110
    move-result-object p3

    .line 111
    invoke-interface {p3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 112
    .line 113
    .line 114
    move-result-object p3

    .line 115
    :cond_5
    :goto_2
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 116
    .line 117
    .line 118
    move-result p5

    .line 119
    if-eqz p5, :cond_7

    .line 120
    .line 121
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p5

    .line 125
    check-cast p5, Ljava/util/Map$Entry;

    .line 126
    .line 127
    invoke-interface {p5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object p6

    .line 131
    check-cast p6, Ljava/lang/String;

    .line 132
    .line 133
    invoke-interface {p5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object p5

    .line 137
    if-eqz p5, :cond_5

    .line 138
    .line 139
    invoke-virtual {p0, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 140
    .line 141
    .line 142
    move-result p7

    .line 143
    if-eqz p7, :cond_6

    .line 144
    .line 145
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    :cond_6
    invoke-virtual {p4, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string p6, "="

    .line 152
    .line 153
    invoke-virtual {p4, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    goto :goto_2

    .line 160
    :cond_7
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    return-object p0
.end method

.method private final h(ZLcom/hellogroup/mk/core/log/core/MKLogLevel;)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_2

    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->c:Z

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    sget-object p1, Ll/auf;->INSTANCE:Ll/auf;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/auf;->b()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->h:Lcom/hellogroup/mk/core/log/core/MKLogReporter;

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, p2}, Lcom/hellogroup/mk/core/log/core/MKLogReporter;->b(Lcom/hellogroup/mk/core/log/core/MKLogLevel;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-ne p0, v0, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 p0, 0x0

    .line 28
    return p0

    .line 29
    :cond_2
    :goto_0
    return v0
.end method

.method private final k()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->c:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/auf;->INSTANCE:Ll/auf;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/auf;->b()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->h:Lcom/hellogroup/mk/core/log/core/MKLogReporter;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/hellogroup/mk/core/log/core/MKLogReporter;->d()Ll/okw;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/okw;->a()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    const/4 v0, 0x1

    .line 32
    if-ne p0, v0, :cond_1

    .line 33
    .line 34
    return v0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method private final m(Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogLevel;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Ljava/lang/String;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->toMutableList(Ljava/util/Collection;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v3

    .line 7
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 17
    .line 18
    .line 19
    iget-boolean v4, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->f:Z

    .line 20
    .line 21
    if-eqz v4, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->f:Z

    .line 25
    .line 26
    :cond_1
    sget-object v0, Lcom/hellogroup/fep/base/FepContext;->INSTANCE:Lcom/hellogroup/fep/base/FepContext;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/hellogroup/fep/base/FepContext;->a()Ll/drb;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;

    .line 33
    .line 34
    const/4 v10, 0x0

    .line 35
    move-object v2, p0

    .line 36
    move-object v7, p1

    .line 37
    move-object v5, p2

    .line 38
    move-object v8, p3

    .line 39
    move-object v9, p4

    .line 40
    move-object/from16 v6, p5

    .line 41
    .line 42
    invoke-direct/range {v1 .. v10}, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;-><init>(Lcom/hellogroup/mk/core/log/page/BasePageLog;Ljava/util/List;ZLcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    .line 43
    .line 44
    .line 45
    move-object p3, v1

    .line 46
    const/4 p4, 0x3

    .line 47
    const/4 p0, 0x0

    .line 48
    const/4 p1, 0x0

    .line 49
    const/4 p2, 0x0

    .line 50
    move-object/from16 p5, p0

    .line 51
    .line 52
    move-object p0, v0

    .line 53
    invoke-static/range {p0 .. p5}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 54
    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public final e(Lcom/hellogroup/mk/core/log/page/MKPageLogType;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;Z)V
    .locals 9
    .param p1    # Lcom/hellogroup/mk/core/log/page/MKPageLogType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hellogroup/mk/core/log/page/MKPageLogType;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;Z)V"
        }
    .end annotation

    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->k()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->getAllLogRecord()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->b:Z

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-virtual {p1}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->getCode()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {p1}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->getSource()Lcom/hellogroup/mk/core/log/core/MKLogSource;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {p1}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->getContent()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-virtual {p1}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->getAppendSpace()Z

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    move-object v1, p0

    .line 39
    move-object v7, p2

    .line 40
    move-object v8, p3

    .line 41
    move-object v6, p4

    .line 42
    invoke-direct/range {v1 .. v8}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->g(Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Ljava/lang/String;ZLjava/util/Map;Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string p2, "BasePageLog"

    .line 47
    .line 48
    invoke-static {p2, p0}, Ll/jzv;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object p2, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 52
    .line 53
    invoke-virtual {p2, p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    sget-object p2, Ll/auf;->INSTANCE:Ll/auf;

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->getSource()Lcom/hellogroup/mk/core/log/core/MKLogSource;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    invoke-virtual {p3}, Lcom/hellogroup/mk/core/log/core/MKLogSource;->getStringValue()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    invoke-virtual {p2, p0, p3}, Ll/auf;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->getLogLevel()Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-direct {v1, p5, p2}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->h(ZLcom/hellogroup/mk/core/log/core/MKLogLevel;)Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-eqz p2, :cond_2

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->getLogLevel()Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-virtual {p1}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->getSource()Lcom/hellogroup/mk/core/log/core/MKLogSource;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    invoke-virtual {p1}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->getCode()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p4

    .line 91
    move-object p5, p0

    .line 92
    move-object p0, v1

    .line 93
    move-object p1, v3

    .line 94
    invoke-direct/range {p0 .. p5}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->m(Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogLevel;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_2
    :goto_0
    return-void
.end method

.method public i()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    const/4 p0, 0x0

    throw p0
.end method

.method public j()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    const/4 p0, 0x0

    throw p0
.end method

.method public final l()V
    .locals 8

    .line 1
    sget-object v1, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->ON_DESTROY:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 2
    .line 3
    iget-boolean v5, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->b:Z

    .line 4
    .line 5
    const/16 v6, 0xe

    .line 6
    .line 7
    const/4 v7, 0x0

    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x0

    .line 10
    const/4 v4, 0x0

    .line 11
    move-object v0, p0

    .line 12
    invoke-static/range {v0 .. v7}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->f(Lcom/hellogroup/mk/core/log/page/BasePageLog;Lcom/hellogroup/mk/core/log/page/MKPageLogType;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;ZILjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public n(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    const/4 p0, 0x0

    throw p0
.end method

.method public final o(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->e:Ljava/util/Map;

    .line 2
    .line 3
    const-string v0, "useDns"

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final p(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->e:Ljava/util/Map;

    .line 5
    .line 6
    const-string v0, "fep"

    .line 7
    .line 8
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final q(ZLjava/lang/String;)V
    .locals 2
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->e:Ljava/util/Map;

    .line 2
    .line 3
    const-string v1, "isResourceOfflined"

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    if-eqz p2, :cond_1

    .line 13
    .line 14
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->e:Ljava/util/Map;

    .line 22
    .line 23
    const-string p1, "offlineVersion"

    .line 24
    .line 25
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public final r(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->e:Ljava/util/Map;

    .line 2
    .line 3
    const-string v1, "offlineVersion"

    .line 4
    .line 5
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->e:Ljava/util/Map;

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string v0, "isResourceOfflined"

    .line 25
    .line 26
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public final s(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog;->e:Ljava/util/Map;

    .line 5
    .line 6
    const-string v0, "ua"

    .line 7
    .line 8
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final t(Ljava/lang/String;)Z
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->n(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method
