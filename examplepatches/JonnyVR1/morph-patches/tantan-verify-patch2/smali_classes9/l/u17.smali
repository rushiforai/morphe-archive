.class public Ll/u17;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static c:Z

.field public static d:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Lcom/p1/mobile/putong/core/api/c;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/u17;->b:Ljava/util/HashSet;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput-boolean v0, Ll/u17;->c:Z

    .line 10
    .line 11
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Ll/u17;->d:Lrx/subjects/a;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    return-void
.end method

.method public static A(Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 6

    .line 1
    sget-boolean v0, Ll/u17;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 6
    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/android/app/App;->e()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/16 v2, 0x2710

    .line 14
    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    if-gez v0, :cond_2

    .line 18
    .line 19
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    long-to-double v0, v0

    .line 26
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/PushMessage;->createdTime:D

    .line 27
    .line 28
    sub-double/2addr v0, v2

    .line 29
    const-wide v2, 0x41224f8000000000L    # 600000.0

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    cmpl-double v0, v0, v2

    .line 35
    .line 36
    const-string v1, "vivo X20A"

    .line 37
    .line 38
    if-lez v0, :cond_0

    .line 39
    .line 40
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    :cond_0
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 51
    .line 52
    .line 53
    move-result-wide v2

    .line 54
    long-to-double v2, v2

    .line 55
    iget-wide v4, p0, Lcom/p1/mobile/putong/data/PushMessage;->createdTime:D

    .line 56
    .line 57
    sub-double/2addr v2, v4

    .line 58
    const-wide v4, 0x41324f8000000000L    # 1200000.0

    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    cmpl-double p0, v2, v4

    .line 64
    .line 65
    if-lez p0, :cond_2

    .line 66
    .line 67
    sget-object p0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_2

    .line 74
    .line 75
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 76
    .line 77
    .line 78
    move-result-wide v0

    .line 79
    const-wide/32 v2, 0x124f80

    .line 80
    .line 81
    .line 82
    cmp-long p0, v0, v2

    .line 83
    .line 84
    if-lez p0, :cond_2

    .line 85
    .line 86
    sget-object p0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    check-cast p0, Ljava/lang/Integer;

    .line 93
    .line 94
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    const/4 v0, 0x1

    .line 99
    if-le p0, v0, :cond_2

    .line 100
    .line 101
    sput-boolean v0, Ll/u17;->c:Z

    .line 102
    .line 103
    sget-object p0, Ll/u17;->d:Lrx/subjects/a;

    .line 104
    .line 105
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 106
    .line 107
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    :cond_2
    return-void
.end method

.method public static O(I)V
    .locals 1

    .line 1
    sget-object v0, Ll/u17;->b:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static P(I)V
    .locals 1

    .line 1
    sget-object v0, Ll/u17;->b:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 2
    .line 3
    const-string v0, "pending"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 2
    .line 3
    const-string v0, "pending"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic c(Ll/u17;Ljava/util/List;)Ll/bkj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u17;->K(Ljava/util/List;)Ll/bkj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Ll/u17;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u17;->G(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 2
    .line 3
    const-string v0, "pending"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic f()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wr2;->o()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/lang/Integer;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-static {v1}, Ll/u17;->w(I)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_1

    .line 32
    .line 33
    invoke-static {v1}, Ll/u17;->v(I)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_1

    .line 38
    .line 39
    const/4 v2, 0x1

    .line 40
    if-eq v2, v1, :cond_1

    .line 41
    .line 42
    if-nez v1, :cond_0

    .line 43
    .line 44
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    .line 45
    .line 46
    invoke-virtual {v2, v1}, Ll/wr2;->b(I)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/wr2;->c()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static synthetic g(Ll/u17;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u17;->I(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 2
    .line 3
    const-string v0, "pending"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic i(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j(Ll/u17;Ll/vg60;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u17;->H(Ll/vg60;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k(Ll/vg60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vg60;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic l(Ll/u17;Ll/vg60;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u17;->J(Ll/vg60;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m(Ll/vg60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vg60;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 2
    .line 3
    const-string v0, "pending"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic o(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic p(Ll/bkj0;Lcom/p1/mobile/putong/data/User;)Ll/pf60;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic q(Ll/u17;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u17;->L(Ll/pf60;)V

    return-void
.end method

.method public static final r(Ljava/lang/String;)I
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, -0x1

    .line 4
    return p0

    .line 5
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    add-int/lit16 p0, p0, 0x2710

    .line 10
    .line 11
    return p0

    .line 12
    :catch_0
    move-exception v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public static final s(I)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    add-int/lit16 p0, p0, -0x2710

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, ""

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static final t(Ljava/lang/String;)I
    .locals 4

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, -0x1

    .line 4
    return p0

    .line 5
    :cond_0
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    const-wide/32 v2, 0x7fffd8ef

    .line 22
    .line 23
    .line 24
    cmp-long v0, v0, v2

    .line 25
    .line 26
    if-lez v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :catch_0
    move-exception v0

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    add-int/lit16 p0, p0, 0x2710

    .line 40
    .line 41
    neg-int p0, p0

    .line 42
    return p0

    .line 43
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0
.end method

.method public static final u(I)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    add-int/lit16 p0, p0, 0x2710

    .line 7
    .line 8
    neg-int p0, p0

    .line 9
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    const-string p0, ""

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static final v(I)Z
    .locals 1

    .line 1
    const/16 v0, 0x1b58

    .line 2
    .line 3
    if-le p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public static final w(I)Z
    .locals 1

    .line 1
    const/16 v0, -0x1b58

    .line 2
    .line 3
    if-ge p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method


# virtual methods
.method public final B(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 2
    .line 3
    const-string v0, "tickle"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 34
    .line 35
    sget v0, Lcom/tantan/core/base/R$string;->i:I

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 38
    .line 39
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ac(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method

.method public final C(Ljava/util/HashMap;Ljava/util/List;Lcom/p1/mobile/putong/data/User;ILjava/util/HashMap;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/y250;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            "I",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/u17;->z()Ljava/lang/String;

    move-result-object v0

    .line 2
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v1

    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 4
    invoke-virtual {p5, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/String;

    .line 5
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p1, p5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_1

    :cond_0
    :goto_0
    move v1, v3

    goto :goto_1

    :cond_1
    move-object p5, v0

    goto :goto_0

    .line 6
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v4

    const-string v5, "pending"

    if-eqz v4, :cond_2

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    :cond_2
    if-eqz v1, :cond_6

    .line 7
    :cond_3
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object p2

    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E()Z

    move-result p2

    const-string p4, "removed"

    if-eqz p2, :cond_5

    .line 8
    invoke-virtual {p1, p5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ll/y250;

    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-virtual {p1}, Ll/y250;->e()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 10
    iget-object p0, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 11
    invoke-static {v5}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object p1

    .line 12
    invoke-static {p4}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object p2

    .line 13
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/api/g;->Xp(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)Lrx/c;

    goto :goto_2

    .line 14
    :cond_4
    iget-object p0, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 15
    invoke-static {v5}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object p1

    .line 16
    invoke-static {p4}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object p2

    .line 17
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/api/g;->Vp(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)Lrx/c;

    goto :goto_2

    .line 18
    :cond_5
    iget-object p0, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    invoke-static {v5}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object p1

    .line 20
    invoke-static {p4}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object p2

    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/g;->Vp(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)Lrx/c;

    .line 22
    :goto_2
    invoke-static {}, Ll/toh0;->s()V

    return-void

    .line 23
    :cond_6
    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result p3

    const/4 p5, 0x2

    if-nez p3, :cond_a

    .line 24
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    invoke-virtual {p0}, Ll/wr2;->o()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_7
    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_1d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p2

    .line 25
    sget-object p3, Ll/u17;->b:Ljava/util/HashSet;

    invoke-virtual {p3, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    goto :goto_3

    .line 26
    :cond_8
    invoke-static {p2}, Ll/u17;->w(I)Z

    move-result p1

    if-nez p1, :cond_9

    if-ne p2, p5, :cond_7

    .line 27
    :cond_9
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    invoke-virtual {p1, p2}, Ll/wr2;->b(I)V

    goto :goto_3

    .line 28
    :cond_a
    new-instance p3, Ll/j17;

    invoke-direct {p3}, Ll/j17;-><init>()V

    .line 29
    invoke-static {p2, p3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    move-result-object p3

    if-nez p3, :cond_b

    move p3, v2

    goto :goto_4

    :cond_b
    move p3, v3

    .line 30
    :goto_4
    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result v0

    const/4 v1, 0x3

    const-string v4, "https://auto.tancdn.com/v1/images/eyJpZCI6IlVLWVo3Q0lEWk9LVFVHVVJHNktEM1pIVzNEVFJVRiIsInciOjcyMCwiaCI6NzIwLCJkIjowLCJtdCI6ImltYWdlL2pwZWcifQ?format=128x128"

    const-string v6, "conversation.group"

    const/4 v7, 0x4

    const-string v8, "conversation"

    if-gt v0, v1, :cond_16

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    invoke-virtual {v0, v3}, Ll/wr2;->n(I)Z

    move-result v0

    if-eqz v0, :cond_c

    goto/16 :goto_c

    .line 31
    :cond_c
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    invoke-virtual {p2}, Ll/wr2;->o()Ljava/util/Collection;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_d
    :goto_5
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_e

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/Integer;

    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result p4

    .line 32
    invoke-static {p4}, Ll/u17;->w(I)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 33
    invoke-static {p4}, Ll/u17;->u(I)Ljava/lang/String;

    move-result-object v0

    .line 34
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 35
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    invoke-virtual {v0, p4}, Ll/wr2;->b(I)V

    goto :goto_5

    .line 36
    :cond_e
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    invoke-virtual {p2, p5}, Ll/wr2;->b(I)V

    .line 37
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map$Entry;

    .line 38
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ll/y250;

    .line 39
    new-instance p5, Lcom/p1/mobile/putong/data/PushMessage;

    invoke-direct {p5}, Lcom/p1/mobile/putong/data/PushMessage;-><init>()V

    .line 40
    const-string v0, "conversation.single"

    iput-object v0, p5, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 41
    new-instance v0, Lcom/p1/mobile/putong/data/PushMessageContent;

    invoke-direct {v0}, Lcom/p1/mobile/putong/data/PushMessageContent;-><init>()V

    iput-object v0, p5, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 42
    iput-object v8, v0, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    .line 43
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 44
    iput v7, p5, Lcom/p1/mobile/putong/data/PushMessage;->priority:I

    .line 45
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ll/y250;

    invoke-virtual {v0, v3}, Ll/y250;->b(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v0

    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v1

    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 47
    invoke-virtual {p4}, Ll/y250;->e()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 48
    iput-object v6, p5, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 49
    invoke-virtual {p4}, Ll/y250;->c()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ll/u17;->t(Ljava/lang/String;)I

    move-result v1

    iput v1, p5, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 50
    iget-object v1, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    invoke-virtual {p4}, Ll/y250;->c()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {v1, p4}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    move-result-object p4

    if-nez p4, :cond_f

    .line 51
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v9, Lcom/tantan/core/base/R$string;->p:I

    invoke-virtual {v1, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_7

    .line 52
    :cond_f
    iget-object v1, p4, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    :goto_7
    iput-object v1, p5, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 53
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    iget-object v1, p4, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_10

    .line 54
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    invoke-interface {p4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/p1/mobile/putong/data/Picture;

    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    move-result-object p4

    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object p4

    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    move-result-object p4

    iput-object p4, p5, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    .line 55
    :cond_10
    iget-object p4, p5, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    if-eqz p4, :cond_13

    .line 56
    iput-object v4, p5, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    goto :goto_9

    .line 57
    :cond_11
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    invoke-static {p4}, Ll/u17;->t(Ljava/lang/String;)I

    move-result p4

    iput p4, p5, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 58
    iget-object p4, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    invoke-virtual {p4, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    move-result-object p4

    if-nez p4, :cond_12

    .line 59
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v9, Lcom/tantan/core/base/R$string;->p:I

    invoke-virtual {v1, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_8

    :cond_12
    iget-object v1, p4, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    :goto_8
    iput-object v1, p5, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 60
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 61
    invoke-virtual {p0, p5, p4}, Ll/u17;->Q(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/data/User;)V

    .line 62
    :cond_13
    :goto_9
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ll/y250;

    invoke-virtual {p4}, Ll/y250;->f()I

    move-result p4

    if-ne p4, v2, :cond_14

    .line 63
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/tantan/core/base/R$string;->u:I

    invoke-virtual {p4, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p4

    goto :goto_a

    .line 64
    :cond_14
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v9, Lcom/tantan/core/base/R$string;->t:I

    .line 65
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    filled-new-array {p4}, [Ljava/lang/Object;

    move-result-object p4

    .line 66
    invoke-virtual {v1, v9, p4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p4

    :goto_a
    iput-object p4, p5, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 67
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ll/y250;

    invoke-virtual {p2}, Ll/y250;->d()Ljava/util/List;

    move-result-object p2

    new-instance p4, Ll/k17;

    invoke-direct {p4}, Ll/k17;-><init>()V

    .line 68
    invoke-static {p2, p4}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    move-result-object p2

    if-nez p2, :cond_15

    move p2, v2

    goto :goto_b

    :cond_15
    move p2, v3

    :goto_b
    iput-boolean p2, p5, Lcom/p1/mobile/putong/data/PushMessage;->silentAggregation:Z

    .line 69
    iput-boolean p2, p5, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 70
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    double-to-long v0, v0

    long-to-double v0, v0

    iput-wide v0, p5, Lcom/p1/mobile/putong/data/PushMessage;->createdTime:D

    .line 71
    invoke-virtual {p0, p5}, Ll/u17;->x(Lcom/p1/mobile/putong/data/PushMessage;)V

    goto/16 :goto_6

    .line 72
    :cond_16
    :goto_c
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    invoke-virtual {v0}, Ll/wr2;->o()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_17
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 73
    invoke-static {v1}, Ll/u17;->w(I)Z

    move-result v9

    if-eqz v9, :cond_17

    .line 74
    sget-object v9, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    invoke-virtual {v9, v1}, Ll/wr2;->b(I)V

    goto :goto_d

    .line 75
    :cond_18
    new-instance v0, Lcom/p1/mobile/putong/data/PushMessage;

    invoke-direct {v0}, Lcom/p1/mobile/putong/data/PushMessage;-><init>()V

    .line 76
    const-string v1, "conversation.list"

    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 77
    new-instance v1, Lcom/p1/mobile/putong/data/PushMessageContent;

    invoke-direct {v1}, Lcom/p1/mobile/putong/data/PushMessageContent;-><init>()V

    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 78
    iput v7, v0, Lcom/p1/mobile/putong/data/PushMessage;->priority:I

    .line 79
    iput p5, v0, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 80
    sget-object p5, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/tantan/core/base/R$string;->p:I

    invoke-virtual {p5, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p5

    iput-object p5, v0, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 81
    sget-object p5, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/tantan/core/base/R$string;->s:I

    .line 82
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    .line 83
    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p4, p1}, [Ljava/lang/Object;

    move-result-object p1

    .line 84
    invoke-virtual {p5, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 85
    iput-boolean p3, v0, Lcom/p1/mobile/putong/data/PushMessage;->silentAggregation:Z

    .line 86
    iput-boolean p3, v0, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 87
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    .line 88
    iget-wide p4, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    double-to-long p4, p4

    long-to-double p4, p4

    iput-wide p4, v0, Lcom/p1/mobile/putong/data/PushMessage;->createdTime:D

    .line 89
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object p2

    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E()Z

    move-result p2

    if-eqz p2, :cond_1a

    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isGroupMessage()Z

    move-result p2

    if-eqz p2, :cond_1a

    .line 90
    iput-object v6, v0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 91
    iget-object p2, v0, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iput-object v8, p2, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    .line 92
    iget-object p4, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    iput-object p4, p2, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 93
    iget-object p2, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->getHostId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    move-result-object p1

    .line 94
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_19

    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result p2

    if-nez p2, :cond_19

    .line 95
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    move-result-object p1

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object p1

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    .line 96
    :cond_19
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1b

    .line 97
    iput-object v4, v0, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    goto :goto_e

    .line 98
    :cond_1a
    iget-object p2, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    move-result-object p1

    .line 99
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1b

    .line 100
    invoke-virtual {p0, v0, p1}, Ll/u17;->Q(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/data/User;)V

    .line 101
    :cond_1b
    :goto_e
    invoke-virtual {p0, v0}, Ll/u17;->x(Lcom/p1/mobile/putong/data/PushMessage;)V

    :cond_1c
    if-nez p3, :cond_1d

    .line 102
    iget-object p0, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 103
    invoke-static {v5}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object p1

    const-string p2, "ongoing"

    .line 104
    invoke-static {p2}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object p2

    .line 105
    invoke-virtual {p0, p1, p2, v3, v2}, Lcom/p1/mobile/putong/core/api/g;->Wp(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;ZZ)Lrx/c;

    :cond_1d
    return-void
.end method

.method public final D(Ljava/util/HashMap;Ljava/util/List;Lcom/p1/mobile/putong/data/User;ILjava/util/HashMap;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/y250;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            "I",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p5

    .line 1
    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const-string v7, "pending"

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ll/y250;

    .line 2
    invoke-virtual {v6}, Ll/y250;->d()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_1
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/p1/mobile/putong/core/data/Message;

    .line 3
    iget-object v9, v8, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    invoke-static {v9, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 4
    sget-object v9, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v9, v9, Lcom/p1/mobile/putong/core/api/c;->j1:Lcom/p1/mobile/putong/core/api/CoreInnerPush;

    invoke-virtual {v9, v8}, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->m(Lcom/p1/mobile/putong/core/data/Message;)V

    goto :goto_0

    .line 5
    :cond_2
    invoke-virtual {v0}, Ll/u17;->z()Ljava/lang/String;

    move-result-object v5

    .line 6
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    invoke-virtual {v6}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v6

    invoke-interface {v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E()Z

    move-result v6

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-eqz v6, :cond_4

    .line 7
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 8
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 9
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_3

    invoke-virtual {v1, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_3

    move v11, v9

    goto :goto_1

    :cond_3
    move v11, v10

    goto :goto_1

    :cond_4
    move v11, v10

    const/4 v6, 0x0

    .line 10
    :goto_1
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    invoke-virtual {v1, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_6

    :cond_5
    if-eqz v11, :cond_a

    .line 11
    :cond_6
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v2

    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E()Z

    move-result v2

    const-string v3, "removed"

    if-eqz v2, :cond_8

    .line 12
    invoke-virtual {v1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ll/y250;

    .line 13
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-virtual {v2}, Ll/y250;->e()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 14
    iget-object v0, v0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 15
    invoke-static {v7}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v1

    .line 16
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v2

    .line 17
    invoke-virtual {v0, v1, v2, v5}, Lcom/p1/mobile/putong/core/api/g;->Xp(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)Lrx/c;

    return-void

    .line 18
    :cond_7
    iget-object v0, v0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    invoke-static {v7}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v2

    .line 20
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v3

    .line 21
    invoke-virtual {v0, v2, v3, v5}, Lcom/p1/mobile/putong/core/api/g;->Vp(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)Lrx/c;

    goto :goto_2

    .line 22
    :cond_8
    iget-object v0, v0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 23
    invoke-static {v7}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v2

    .line 24
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v3

    .line 25
    invoke-virtual {v0, v2, v3, v5}, Lcom/p1/mobile/putong/core/api/g;->Vp(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)Lrx/c;

    .line 26
    :goto_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->D()Z

    move-result v0

    if-eqz v0, :cond_9

    move/from16 v6, p4

    if-ne v6, v9, :cond_9

    .line 27
    invoke-virtual {v1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ll/y250;

    invoke-virtual {v0, v10}, Ll/y250;->b(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v0

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v1, "tickle"

    .line 28
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    goto/16 :goto_16

    .line 29
    :cond_9
    invoke-static {}, Ll/toh0;->s()V

    return-void

    :cond_a
    move/from16 v6, p4

    .line 30
    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v5

    if-nez v5, :cond_e

    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    invoke-virtual {v0}, Ll/wr2;->o()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_b
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 32
    invoke-static {v2}, Ll/u17;->v(I)Z

    move-result v3

    if-nez v3, :cond_c

    if-nez v2, :cond_b

    .line 33
    :cond_c
    sget-object v3, Ll/u17;->b:Ljava/util/HashSet;

    invoke-virtual {v3, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    goto :goto_3

    .line 34
    :cond_d
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    invoke-virtual {v1, v2}, Ll/wr2;->b(I)V

    goto :goto_3

    .line 35
    :cond_e
    new-instance v5, Ll/g17;

    invoke-direct {v5}, Ll/g17;-><init>()V

    .line 36
    invoke-static {v2, v5}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_f

    move v5, v9

    goto :goto_4

    :cond_f
    move v5, v10

    .line 37
    :goto_4
    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v11

    const/4 v12, 0x3

    const-string v13, "message.single.update"

    const-string v14, "https://auto.tancdn.com/v1/images/eyJpZCI6IlVLWVo3Q0lEWk9LVFVHVVJHNktEM1pIVzNEVFJVRiIsInciOjcyMCwiaCI6NzIwLCJkIjowLCJtdCI6ImltYWdlL2pwZWcifQ?format=128x128"

    const-string v15, "conversation.group"

    const/4 v8, 0x4

    const-string v9, "conversation"

    if-gt v11, v12, :cond_10

    sget-object v11, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    invoke-virtual {v11, v10}, Ll/wr2;->n(I)Z

    move-result v11

    if-eqz v11, :cond_11

    :cond_10
    move-object v8, v7

    goto/16 :goto_10

    .line 38
    :cond_11
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    invoke-virtual {v2}, Ll/wr2;->o()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_12
    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_13

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v11

    .line 39
    invoke-static {v11}, Ll/u17;->v(I)Z

    move-result v12

    if-eqz v12, :cond_12

    sget-object v12, Ll/u17;->b:Ljava/util/HashSet;

    invoke-virtual {v12, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_12

    .line 40
    invoke-static {v11}, Ll/u17;->s(I)Ljava/lang/String;

    move-result-object v6

    .line 41
    invoke-virtual {v1, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_12

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_12

    .line 42
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    invoke-virtual {v6, v11}, Ll/wr2;->b(I)V

    goto :goto_5

    .line 43
    :cond_13
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    invoke-virtual {v2, v10}, Ll/wr2;->b(I)V

    .line 44
    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 45
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 46
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ll/y250;

    if-eqz v3, :cond_15

    .line 47
    iget-object v11, v3, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 48
    invoke-virtual {v11}, Lcom/p1/mobile/putong/data/Settings;->previewPushMessage()Ljava/lang/Boolean;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v11

    if-nez v11, :cond_15

    invoke-static {v4}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_14

    goto :goto_7

    :cond_14
    move v11, v10

    goto :goto_8

    :cond_15
    :goto_7
    const/4 v11, 0x1

    .line 49
    :goto_8
    new-instance v12, Lcom/p1/mobile/putong/data/PushMessage;

    invoke-direct {v12}, Lcom/p1/mobile/putong/data/PushMessage;-><init>()V

    .line 50
    const-string v10, "conversation.single"

    iput-object v10, v12, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 51
    new-instance v10, Lcom/p1/mobile/putong/data/PushMessageContent;

    invoke-direct {v10}, Lcom/p1/mobile/putong/data/PushMessageContent;-><init>()V

    iput-object v10, v12, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 52
    iput-object v9, v10, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    .line 53
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 p1, v1

    move-object/from16 v1, v17

    check-cast v1, Ljava/lang/String;

    iput-object v1, v10, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 54
    iput v8, v12, Lcom/p1/mobile/putong/data/PushMessage;->priority:I

    .line 55
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ll/y250;

    const/4 v10, 0x0

    invoke-virtual {v1, v10}, Ll/y250;->b(I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object v1

    .line 56
    invoke-virtual {v0, v1, v11}, Ll/u17;->T(Lcom/p1/mobile/putong/core/data/Message;Z)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v12, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 57
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ll/y250;

    invoke-virtual {v8}, Ll/y250;->f()I

    move-result v8

    iput v8, v12, Lcom/p1/mobile/putong/data/PushMessage;->counter:I

    move-object/from16 p2, v2

    const/4 v2, 0x1

    if-ne v8, v2, :cond_16

    .line 58
    iput v10, v12, Lcom/p1/mobile/putong/data/PushMessage;->counter:I

    .line 59
    :cond_16
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v2

    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 60
    invoke-virtual {v6}, Ll/y250;->e()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 61
    iput-object v15, v12, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 62
    invoke-virtual {v6}, Ll/y250;->c()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ll/u17;->r(Ljava/lang/String;)I

    move-result v2

    iput v2, v12, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 63
    iget-object v2, v0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    invoke-virtual {v6}, Ll/y250;->c()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    move-result-object v2

    if-nez v2, :cond_17

    .line 64
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v8, Lcom/tantan/core/base/R$string;->p:I

    invoke-virtual {v6, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_9

    .line 65
    :cond_17
    iget-object v6, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    :goto_9
    iput-object v6, v12, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 66
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_18

    iget-object v6, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    invoke-static {v6}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v6

    if-nez v6, :cond_18

    .line 67
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    const/4 v10, 0x0

    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/data/Picture;

    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v2

    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v2

    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v12, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    .line 68
    :cond_18
    iget-object v2, v12, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 69
    iput-object v14, v12, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    goto :goto_b

    .line 70
    :cond_19
    invoke-interface/range {p2 .. p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ll/u17;->r(Ljava/lang/String;)I

    move-result v2

    iput v2, v12, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 71
    iget-object v2, v0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    move-result-object v2

    if-nez v2, :cond_1a

    .line 72
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v8, Lcom/tantan/core/base/R$string;->p:I

    invoke-virtual {v6, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_a

    :cond_1a
    iget-object v6, v2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    :goto_a
    iput-object v6, v12, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 73
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1b

    .line 74
    invoke-virtual {v0, v12, v2}, Ll/u17;->Q(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/data/User;)V

    :cond_1b
    :goto_b
    if-eqz v3, :cond_1d

    .line 75
    iget-object v2, v3, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->previewPushMessage()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_1d

    invoke-static {v4}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1c

    goto :goto_c

    .line 76
    :cond_1c
    iget-object v2, v12, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    goto :goto_d

    .line 77
    :cond_1d
    :goto_c
    invoke-interface/range {p2 .. p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ll/y250;

    invoke-virtual {v2}, Ll/y250;->d()Ljava/util/List;

    move-result-object v2

    const/16 v4, 0xa

    invoke-static {v2, v4}, Ll/jyb;->k0(Ljava/util/List;I)Ljava/util/List;

    move-result-object v2

    new-instance v4, Ll/h17;

    invoke-direct {v4, v0}, Ll/h17;-><init>(Ll/u17;)V

    invoke-static {v2, v4}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    move-result-object v2

    const-string v4, "\n"

    .line 78
    invoke-static {v2, v4}, Ll/hmj0;->d(Ljava/util/List;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v2

    .line 79
    :goto_d
    iput-object v2, v12, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 80
    invoke-interface/range {p2 .. p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ll/y250;

    invoke-virtual {v2}, Ll/y250;->d()Ljava/util/List;

    move-result-object v2

    new-instance v4, Ll/i17;

    invoke-direct {v4}, Ll/i17;-><init>()V

    .line 81
    invoke-static {v2, v4}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_1e

    const/4 v2, 0x1

    goto :goto_e

    :cond_1e
    const/4 v2, 0x0

    :goto_e
    iput-boolean v2, v12, Lcom/p1/mobile/putong/data/PushMessage;->silentAggregation:Z

    .line 82
    iput-boolean v2, v12, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    move-object v8, v7

    .line 83
    iget-wide v6, v1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    double-to-long v6, v6

    long-to-double v6, v6

    iput-wide v6, v12, Lcom/p1/mobile/putong/data/PushMessage;->createdTime:D

    .line 84
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j1:Lcom/p1/mobile/putong/core/api/CoreInnerPush;

    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->i(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 85
    invoke-static {v12}, Ll/u17;->A(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 86
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v1

    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->js()Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 87
    invoke-static {v13}, Lcom/p1/mobile/putong/data/PushMessageIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PushMessageIntent;

    move-result-object v1

    invoke-virtual {v0, v1}, Ll/u17;->E(Lcom/p1/mobile/putong/data/PushMessageIntent;)Z

    move-result v1

    if-eqz v1, :cond_20

    const/4 v1, 0x0

    .line 88
    invoke-virtual {v0, v12, v1, v11}, Ll/u17;->y(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;Z)V

    goto :goto_f

    :cond_1f
    const/4 v1, 0x0

    .line 89
    sget-object v2, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    invoke-virtual {v2}, Ll/cmb0;->N()Z

    move-result v2

    if-nez v2, :cond_20

    .line 90
    invoke-virtual {v0, v12, v1, v11}, Ll/u17;->y(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;Z)V

    :cond_20
    :goto_f
    move-object/from16 v1, p1

    move-object v7, v8

    const/4 v8, 0x4

    const/4 v10, 0x0

    goto/16 :goto_6

    :cond_21
    move-object v8, v7

    goto/16 :goto_15

    .line 91
    :goto_10
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    invoke-virtual {v7}, Ll/wr2;->o()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_22
    :goto_11
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_24

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v11

    .line 92
    invoke-static {v11}, Ll/u17;->v(I)Z

    move-result v12

    if-eqz v12, :cond_22

    sget-object v12, Ll/u17;->b:Ljava/util/HashSet;

    invoke-virtual {v12, v10}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_22

    .line 93
    sget-object v10, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    invoke-virtual {v10}, Ll/cmb0;->N()Z

    move-result v10

    if-nez v10, :cond_23

    .line 94
    sget-object v10, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    invoke-virtual {v10, v11}, Ll/wr2;->b(I)V

    goto :goto_11

    .line 95
    :cond_23
    invoke-static {v11}, Ll/u17;->s(I)Ljava/lang/String;

    move-result-object v10

    .line 96
    invoke-virtual {v1, v10}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    const/16 v16, 0x1

    xor-int/lit8 v12, v12, 0x1

    invoke-virtual {v4, v10}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    xor-int/lit8 v10, v10, 0x1

    and-int/2addr v10, v12

    if-eqz v10, :cond_22

    .line 97
    sget-object v10, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    invoke-virtual {v10, v11}, Ll/wr2;->b(I)V

    goto :goto_11

    :cond_24
    const/4 v10, 0x0

    .line 98
    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/p1/mobile/putong/core/data/Message;

    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    if-eqz v3, :cond_26

    .line 99
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 100
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Settings;->previewPushMessage()Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_26

    invoke-static {v4}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_25

    goto :goto_12

    :cond_25
    const/4 v10, 0x0

    goto :goto_13

    :cond_26
    :goto_12
    const/4 v10, 0x1

    .line 101
    :goto_13
    new-instance v3, Lcom/p1/mobile/putong/data/PushMessage;

    invoke-direct {v3}, Lcom/p1/mobile/putong/data/PushMessage;-><init>()V

    .line 102
    const-string v4, "conversation.list"

    iput-object v4, v3, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 103
    new-instance v4, Lcom/p1/mobile/putong/data/PushMessageContent;

    invoke-direct {v4}, Lcom/p1/mobile/putong/data/PushMessageContent;-><init>()V

    iput-object v4, v3, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    const/4 v4, 0x4

    .line 104
    iput v4, v3, Lcom/p1/mobile/putong/data/PushMessage;->priority:I

    const/4 v4, 0x0

    .line 105
    iput v4, v3, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 106
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/p1/mobile/putong/core/data/Message;

    invoke-virtual {v0, v7, v10}, Ll/u17;->T(Lcom/p1/mobile/putong/core/data/Message;Z)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 107
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v7, Lcom/tantan/core/base/R$string;->p:I

    invoke-virtual {v4, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 108
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v7, Lcom/tantan/core/base/R$string;->A:I

    .line 109
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v6, v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 110
    invoke-virtual {v4, v7, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v3, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 111
    iput-boolean v5, v3, Lcom/p1/mobile/putong/data/PushMessage;->silentAggregation:Z

    .line 112
    iput-boolean v5, v3, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    const/4 v4, 0x0

    .line 113
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/core/data/Message;

    .line 114
    iget-wide v6, v1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    double-to-long v6, v6

    long-to-double v6, v6

    iput-wide v6, v3, Lcom/p1/mobile/putong/data/PushMessage;->createdTime:D

    .line 115
    invoke-static {v3}, Ll/u17;->A(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 116
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v2

    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E()Z

    move-result v2

    if-eqz v2, :cond_28

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isGroupMessage()Z

    move-result v2

    if-eqz v2, :cond_28

    .line 117
    iput-object v15, v3, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 118
    iget-object v2, v3, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iput-object v9, v2, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    .line 119
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    iput-object v4, v2, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 120
    iget-object v2, v0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->getHostId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    move-result-object v1

    .line 121
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_27

    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_27

    .line 122
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    const/4 v4, 0x0

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v3, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    .line 123
    :cond_27
    iget-object v1, v3, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 124
    iput-object v14, v3, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    goto :goto_14

    .line 125
    :cond_28
    iget-object v2, v0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    move-result-object v2

    .line 126
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 127
    invoke-virtual {v0, v3, v2}, Ll/u17;->Q(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/data/User;)V

    .line 128
    :cond_29
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j1:Lcom/p1/mobile/putong/core/api/CoreInnerPush;

    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->i(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 129
    :cond_2a
    :goto_14
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v1

    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->js()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 130
    invoke-static {v13}, Lcom/p1/mobile/putong/data/PushMessageIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PushMessageIntent;

    move-result-object v1

    invoke-virtual {v0, v1}, Ll/u17;->E(Lcom/p1/mobile/putong/data/PushMessageIntent;)Z

    move-result v1

    if-eqz v1, :cond_2c

    const/4 v1, 0x0

    .line 131
    invoke-virtual {v0, v3, v1, v10}, Ll/u17;->y(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;Z)V

    goto :goto_15

    :cond_2b
    const/4 v1, 0x0

    .line 132
    sget-object v2, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    invoke-virtual {v2}, Ll/cmb0;->N()Z

    move-result v2

    if-nez v2, :cond_2c

    .line 133
    invoke-virtual {v0, v3, v1, v10}, Ll/u17;->y(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;Z)V

    :cond_2c
    :goto_15
    if-nez v5, :cond_2d

    .line 134
    iget-object v0, v0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 135
    invoke-static {v8}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v1

    const-string v2, "ongoing"

    .line 136
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v2

    const/4 v3, 0x1

    const/4 v10, 0x0

    .line 137
    invoke-virtual {v0, v1, v2, v10, v3}, Lcom/p1/mobile/putong/core/api/g;->Wp(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;ZZ)Lrx/c;

    :cond_2d
    :goto_16
    return-void
.end method

.method public final E(Lcom/p1/mobile/putong/data/PushMessageIntent;)Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->R:Ll/gyd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 12
    .line 13
    const-string v0, "message.single.update"

    .line 14
    .line 15
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_0
    const-string v0, "moment.match.post"

    .line 31
    .line 32
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0

    .line 47
    :cond_1
    const/4 p0, 0x1

    .line 48
    return p0
.end method

.method public F()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act$r;->b:Lcom/p1/mobile/android/app/c;

    .line 9
    .line 10
    iget-boolean v1, v1, Lcom/p1/mobile/android/app/c;->a:Z

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Landroid/app/Activity;

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-interface {v1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->H6(Landroid/app/Activity;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_1
    :goto_0
    return v0
.end method

.method public final synthetic G(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u17;->B(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic H(Ll/vg60;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Tp()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic I(Ljava/util/List;)V
    .locals 7

    .line 1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Ll/wr2;->b(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/data/PushMessage;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/PushMessage;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v2, "conversation.list"

    .line 20
    .line 21
    iput-object v2, v0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 22
    .line 23
    new-instance v2, Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 24
    .line 25
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/PushMessageContent;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v2, v0, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 29
    .line 30
    const/4 v2, 0x4

    .line 31
    iput v2, v0, Lcom/p1/mobile/putong/data/PushMessage;->priority:I

    .line 32
    .line 33
    iput v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 34
    .line 35
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 36
    .line 37
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-le v3, v1, :cond_1

    .line 42
    .line 43
    sget v3, Lcom/tantan/core/base/R$string;->x:I

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    sget v3, Lcom/tantan/core/base/R$string;->y:I

    .line 47
    .line 48
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    iput-object v2, v0, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 65
    .line 66
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 67
    .line 68
    sget v3, Lcom/tantan/core/base/R$string;->z:I

    .line 69
    .line 70
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    iput-object v2, v0, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 75
    .line 76
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 77
    .line 78
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-ne v3, v1, :cond_2

    .line 83
    .line 84
    sget v3, Lcom/tantan/core/base/R$string;->w:I

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_2
    sget v3, Lcom/tantan/core/base/R$string;->v:I

    .line 88
    .line 89
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    iput-object v2, v0, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 106
    .line 107
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->silentAggregation:Z

    .line 108
    .line 109
    const/4 v2, 0x0

    .line 110
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    check-cast v3, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 115
    .line 116
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 117
    .line 118
    const-string v4, "ongoing"

    .line 119
    .line 120
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    iput-boolean v3, v0, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 125
    .line 126
    iget-object v3, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    .line 127
    .line 128
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 129
    .line 130
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v5

    .line 134
    check-cast v5, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 135
    .line 136
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 137
    .line 138
    invoke-virtual {v3, v5}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v5

    .line 146
    if-eqz v5, :cond_3

    .line 147
    .line 148
    invoke-virtual {p0, v0, v3}, Ll/u17;->Q(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/data/User;)V

    .line 149
    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_3
    new-instance v3, Ljava/lang/Exception;

    .line 153
    .line 154
    new-instance v5, Ljava/lang/StringBuilder;

    .line 155
    .line 156
    const-string v6, "User database lost user otherId: "

    .line 157
    .line 158
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v6

    .line 165
    check-cast v6, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 166
    .line 167
    iget-object v6, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v5

    .line 176
    invoke-direct {v3, v5}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    invoke-static {v3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 180
    .line 181
    .line 182
    :goto_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 183
    .line 184
    .line 185
    move-result v3

    .line 186
    const/16 v5, 0xa

    .line 187
    .line 188
    if-gt v3, v5, :cond_4

    .line 189
    .line 190
    new-instance v3, Ll/f17;

    .line 191
    .line 192
    invoke-direct {v3}, Ll/f17;-><init>()V

    .line 193
    .line 194
    .line 195
    invoke-static {p1, v3}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 196
    .line 197
    .line 198
    move-result v3

    .line 199
    if-eqz v3, :cond_5

    .line 200
    .line 201
    :cond_4
    iget-object v3, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    .line 202
    .line 203
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 204
    .line 205
    const-string v5, "pending"

    .line 206
    .line 207
    invoke-static {v5}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 208
    .line 209
    .line 210
    move-result-object v5

    .line 211
    invoke-static {v4}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 212
    .line 213
    .line 214
    move-result-object v4

    .line 215
    invoke-virtual {v3, v5, v4, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Wp(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;ZZ)Lrx/c;

    .line 216
    .line 217
    .line 218
    :cond_5
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    check-cast v1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 223
    .line 224
    iget-wide v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 225
    .line 226
    double-to-long v3, v3

    .line 227
    long-to-double v3, v3

    .line 228
    iput-wide v3, v0, Lcom/p1/mobile/putong/data/PushMessage;->createdTime:D

    .line 229
    .line 230
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 231
    .line 232
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object v3

    .line 240
    check-cast v3, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 241
    .line 242
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 243
    .line 244
    invoke-interface {v1, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Vq(Ljava/lang/String;)Z

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    if-eqz v1, :cond_6

    .line 249
    .line 250
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 251
    .line 252
    sget v3, Lcom/tantan/core/base/R$string;->r:I

    .line 253
    .line 254
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v1

    .line 258
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 259
    .line 260
    :cond_6
    invoke-static {v0}, Ll/u17;->A(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 261
    .line 262
    .line 263
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 264
    .line 265
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 266
    .line 267
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 272
    .line 273
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 274
    .line 275
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->o3(Ljava/lang/String;)Z

    .line 276
    .line 277
    .line 278
    move-result p1

    .line 279
    if-eqz p1, :cond_7

    .line 280
    .line 281
    goto :goto_3

    .line 282
    :cond_7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 283
    .line 284
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 285
    .line 286
    .line 287
    move-result-object p1

    .line 288
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->js()Z

    .line 289
    .line 290
    .line 291
    move-result p1

    .line 292
    if-eqz p1, :cond_8

    .line 293
    .line 294
    const-string p1, "moment.match.post"

    .line 295
    .line 296
    invoke-static {p1}, Lcom/p1/mobile/putong/data/PushMessageIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PushMessageIntent;

    .line 297
    .line 298
    .line 299
    move-result-object p1

    .line 300
    invoke-virtual {p0, p1}, Ll/u17;->E(Lcom/p1/mobile/putong/data/PushMessageIntent;)Z

    .line 301
    .line 302
    .line 303
    move-result p1

    .line 304
    if-eqz p1, :cond_9

    .line 305
    .line 306
    invoke-virtual {p0, v0}, Ll/u17;->x(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 307
    .line 308
    .line 309
    return-void

    .line 310
    :cond_8
    sget-object p1, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 311
    .line 312
    invoke-virtual {p1}, Ll/cmb0;->N()Z

    .line 313
    .line 314
    .line 315
    move-result p1

    .line 316
    if-nez p1, :cond_9

    .line 317
    .line 318
    invoke-virtual {p0, v0}, Ll/u17;->x(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 319
    .line 320
    .line 321
    :cond_9
    :goto_3
    return-void
.end method

.method public final synthetic J(Ll/vg60;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Pn()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic K(Ljava/util/List;)Ll/bkj0;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/bkj0;

    .line 10
    .line 11
    iget-object v1, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/g;->Up()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 22
    .line 23
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/core/api/g;->Rn(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object p0, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Qn(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-direct {v0, v1, v2, p0}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-object v0
.end method

.method public final synthetic L(Ll/pf60;)V
    .locals 12

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ll/bkj0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Ljava/util/List;

    .line 8
    .line 9
    iget-object v1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 10
    .line 11
    move-object v5, v1

    .line 12
    check-cast v5, Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    const/16 v1, 0xc8

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/16 v1, 0x3e8

    .line 30
    .line 31
    :goto_0
    new-instance v2, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/jyb;->k0(Ljava/util/List;I)Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 38
    .line 39
    .line 40
    new-instance v4, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    new-instance v0, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .line 49
    .line 50
    new-instance v3, Ljava/util/HashMap;

    .line 51
    .line 52
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 53
    .line 54
    .line 55
    new-instance v1, Ljava/util/HashMap;

    .line 56
    .line 57
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 58
    .line 59
    .line 60
    new-instance v7, Ljava/util/HashMap;

    .line 61
    .line 62
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result v6

    .line 73
    if-eqz v6, :cond_7

    .line 74
    .line 75
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    check-cast v6, Lcom/p1/mobile/putong/core/data/Message;

    .line 80
    .line 81
    iget-object v8, v6, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v8

    .line 87
    if-eqz v8, :cond_1

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_1
    sget-object v8, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 91
    .line 92
    invoke-virtual {v8}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 93
    .line 94
    .line 95
    move-result-object v8

    .line 96
    invoke-interface {v8}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->g()Z

    .line 97
    .line 98
    .line 99
    move-result v8

    .line 100
    if-eqz v8, :cond_3

    .line 101
    .line 102
    iget-object v8, v6, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 103
    .line 104
    const-string v9, "voice_call"

    .line 105
    .line 106
    invoke-static {v8, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result v8

    .line 110
    if-eqz v8, :cond_2

    .line 111
    .line 112
    iget-object v8, v6, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 113
    .line 114
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v8

    .line 118
    if-eqz v8, :cond_2

    .line 119
    .line 120
    iget-object v8, v6, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 121
    .line 122
    iget-object v8, v8, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->status:Ljava/lang/String;

    .line 123
    .line 124
    const-string v9, "rejected"

    .line 125
    .line 126
    invoke-static {v9, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 127
    .line 128
    .line 129
    move-result v8

    .line 130
    if-eqz v8, :cond_2

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_2
    iget-object v8, v6, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 134
    .line 135
    const-string v9, "voice_call_invitation"

    .line 136
    .line 137
    invoke-static {v8, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v8

    .line 141
    if-eqz v8, :cond_3

    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_3
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 145
    .line 146
    .line 147
    move-result v8

    .line 148
    iget-object v9, v6, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 149
    .line 150
    if-eqz v8, :cond_4

    .line 151
    .line 152
    invoke-virtual {v1, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v8

    .line 156
    if-nez v8, :cond_5

    .line 157
    .line 158
    iget-object v8, v6, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 159
    .line 160
    new-instance v9, Ll/y250;

    .line 161
    .line 162
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/data/Message;->getHostId()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v10

    .line 166
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/data/Message;->isGroupMessage()Z

    .line 167
    .line 168
    .line 169
    move-result v11

    .line 170
    invoke-direct {v9, v8, v10, v11}, Ll/y250;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v1, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_4
    invoke-virtual {v3, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v8

    .line 181
    if-nez v8, :cond_5

    .line 182
    .line 183
    iget-object v8, v6, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 184
    .line 185
    new-instance v9, Ll/y250;

    .line 186
    .line 187
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/data/Message;->getHostId()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v10

    .line 191
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/data/Message;->isGroupMessage()Z

    .line 192
    .line 193
    .line 194
    move-result v11

    .line 195
    invoke-direct {v9, v8, v10, v11}, Ll/y250;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v3, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    :cond_5
    :goto_2
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/data/Message;->getHostId()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v8

    .line 205
    iget-object v9, v6, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 206
    .line 207
    invoke-virtual {v7, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 211
    .line 212
    .line 213
    move-result v8

    .line 214
    iget-object v9, v6, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 215
    .line 216
    if-eqz v8, :cond_6

    .line 217
    .line 218
    invoke-virtual {v1, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v8

    .line 222
    check-cast v8, Ll/y250;

    .line 223
    .line 224
    invoke-virtual {v8, v6}, Ll/y250;->a(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 225
    .line 226
    .line 227
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    goto/16 :goto_1

    .line 231
    .line 232
    :cond_6
    invoke-virtual {v3, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object v8

    .line 236
    check-cast v8, Ll/y250;

    .line 237
    .line 238
    invoke-virtual {v8, v6}, Ll/y250;->a(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 239
    .line 240
    .line 241
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    goto/16 :goto_1

    .line 245
    .line 246
    :cond_7
    iget-object v2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 247
    .line 248
    check-cast v2, Ll/bkj0;

    .line 249
    .line 250
    iget-object v2, v2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 251
    .line 252
    check-cast v2, Ljava/lang/Integer;

    .line 253
    .line 254
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 255
    .line 256
    .line 257
    move-result v6

    .line 258
    move-object v2, p0

    .line 259
    invoke-virtual/range {v2 .. v7}, Ll/u17;->D(Ljava/util/HashMap;Ljava/util/List;Lcom/p1/mobile/putong/data/User;ILjava/util/HashMap;)V

    .line 260
    .line 261
    .line 262
    iget-object p0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 263
    .line 264
    check-cast p0, Ll/bkj0;

    .line 265
    .line 266
    iget-object p0, p0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 267
    .line 268
    check-cast p0, Ljava/lang/Integer;

    .line 269
    .line 270
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 271
    .line 272
    .line 273
    move-result v6

    .line 274
    move-object v4, v0

    .line 275
    move-object v3, v1

    .line 276
    invoke-virtual/range {v2 .. v7}, Ll/u17;->C(Ljava/util/HashMap;Ljava/util/List;Lcom/p1/mobile/putong/data/User;ILjava/util/HashMap;)V

    .line 277
    .line 278
    .line 279
    return-void
.end method

.method public M(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/u17;->N(IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public N(IZ)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "removed"

    .line 3
    .line 4
    const-string v2, "ongoing"

    .line 5
    .line 6
    const/4 v3, 0x1

    .line 7
    if-ne p1, v3, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p0, p1, p2, v3, v0}, Lcom/p1/mobile/putong/core/api/g;->Wp(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;ZZ)Lrx/c;

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    if-eqz p1, :cond_4

    .line 26
    .line 27
    const/4 v4, 0x2

    .line 28
    if-ne p1, v4, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    invoke-static {p1}, Ll/u17;->v(I)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    iget-object p0, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    if-eqz p2, :cond_2

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 42
    .line 43
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {p1}, Ll/u17;->s(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p2, v0, p1}, Lcom/p1/mobile/putong/core/api/g;->Xp(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)Lrx/c;

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 60
    .line 61
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {p1}, Ll/u17;->s(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p0, p2, v0, p1}, Lcom/p1/mobile/putong/core/api/g;->Vp(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)Lrx/c;

    .line 74
    .line 75
    .line 76
    :cond_3
    return-void

    .line 77
    :cond_4
    :goto_0
    iget-object p0, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 80
    .line 81
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-virtual {p0, p1, p2, v0, v3}, Lcom/p1/mobile/putong/core/api/g;->Wp(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;ZZ)Lrx/c;

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final Q(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Di(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 30
    .line 31
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isAnonymous()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_0

    .line 48
    .line 49
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    .line 54
    .line 55
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->c()Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-eqz p0, :cond_1

    .line 66
    .line 67
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_1

    .line 72
    .line 73
    iput-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->user:Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    :cond_1
    return-void
.end method

.method public R(F)V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/PushMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/PushMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 7
    .line 8
    sget v2, Lcom/tantan/core/base/R$string;->d:I

    .line 9
    .line 10
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v3, "%.1f"

    .line 19
    .line 20
    invoke-static {v3, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {v1, v2, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 33
    .line 34
    sget v2, Lcom/tantan/core/base/R$string;->e:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 41
    .line 42
    iput-object p1, v0, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 43
    .line 44
    iput-object p1, v0, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 45
    .line 46
    new-instance p1, Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 47
    .line 48
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/PushMessageContent;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object p1, v0, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 52
    .line 53
    const/4 p1, 0x4

    .line 54
    iput p1, v0, Lcom/p1/mobile/putong/data/PushMessage;->priority:I

    .line 55
    .line 56
    const/4 p1, 0x3

    .line 57
    iput p1, v0, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ll/u17;->x(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public S()Ll/ft5;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->on()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/d17;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/d17;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->first(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/m17;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/m17;-><init>(Ll/u17;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/n17;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/n17;-><init>(Ll/u17;)V

    .line 30
    .line 31
    .line 32
    new-instance v2, Ll/o17;

    .line 33
    .line 34
    invoke-direct {v2}, Ll/o17;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/g;->on()Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v2, Ll/p17;

    .line 54
    .line 55
    invoke-direct {v2}, Ll/p17;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v2}, Lrx/c;->first(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    new-instance v2, Ll/q17;

    .line 63
    .line 64
    invoke-direct {v2, p0}, Ll/q17;-><init>(Ll/u17;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    new-instance v2, Ll/r17;

    .line 84
    .line 85
    invoke-direct {v2, p0}, Ll/r17;-><init>(Ll/u17;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    iget-object v2, p0, Ll/u17;->a:Lcom/p1/mobile/putong/core/api/c;

    .line 101
    .line 102
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 103
    .line 104
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    new-instance v3, Ll/s17;

    .line 109
    .line 110
    invoke-direct {v3}, Ll/s17;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1, v2, v3}, Lrx/c;->withLatestFrom(Lrx/c;Ll/rcj;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    new-instance v2, Ll/t17;

    .line 118
    .line 119
    invoke-direct {v2, p0}, Ll/t17;-><init>(Ll/u17;)V

    .line 120
    .line 121
    .line 122
    new-instance p0, Ll/e17;

    .line 123
    .line 124
    invoke-direct {p0}, Ll/e17;-><init>()V

    .line 125
    .line 126
    .line 127
    invoke-static {v2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    new-instance v1, Ll/l17;

    .line 136
    .line 137
    invoke-direct {v1}, Ll/l17;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-static {v1}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    const/4 v2, 0x3

    .line 145
    new-array v2, v2, [Ll/kcg0;

    .line 146
    .line 147
    const/4 v3, 0x0

    .line 148
    aput-object v0, v2, v3

    .line 149
    .line 150
    const/4 v0, 0x1

    .line 151
    aput-object p0, v2, v0

    .line 152
    .line 153
    const/4 p0, 0x2

    .line 154
    aput-object v1, v2, p0

    .line 155
    .line 156
    invoke-static {v2}, Ll/pcg0;->c([Ll/kcg0;)Ll/ft5;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    return-object p0
.end method

.method public T(Lcom/p1/mobile/putong/core/data/Message;Z)Ljava/lang/String;
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    const-string v1, ""

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 23
    .line 24
    :goto_0
    if-nez v0, :cond_1

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    :goto_1
    if-eqz p2, :cond_2

    .line 33
    .line 34
    new-instance p2, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v2, ": "

    .line 43
    .line 44
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    goto :goto_2

    .line 57
    :cond_2
    sget p2, Lcom/tantan/core/base/R$string;->F:I

    .line 58
    .line 59
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {p0, p2, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    :goto_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->video()Lcom/p1/mobile/putong/data/Video;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-eqz v2, :cond_3

    .line 76
    .line 77
    sget p1, Lcom/tantan/core/base/R$string;->I:I

    .line 78
    .line 79
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-virtual {p0, p1, p2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0

    .line 88
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->audio()Lcom/p1/mobile/putong/data/Audio;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-eqz v2, :cond_4

    .line 97
    .line 98
    sget p1, Lcom/tantan/core/base/R$string;->B:I

    .line 99
    .line 100
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-virtual {p0, p1, p2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    return-object p0

    .line 109
    :cond_4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->picture()Lcom/p1/mobile/putong/data/Picture;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    if-eqz v2, :cond_5

    .line 118
    .line 119
    sget p1, Lcom/tantan/core/base/R$string;->D:I

    .line 120
    .line 121
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    invoke-virtual {p0, p1, p2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    return-object p0

    .line 130
    :cond_5
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 131
    .line 132
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    if-eqz v2, :cond_6

    .line 137
    .line 138
    sget p1, Lcom/tantan/core/base/R$string;->E:I

    .line 139
    .line 140
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    invoke-virtual {p0, p1, p2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    return-object p0

    .line 149
    :cond_6
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    .line 150
    .line 151
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    if-eqz v2, :cond_7

    .line 156
    .line 157
    if-nez v0, :cond_7

    .line 158
    .line 159
    sget p1, Lcom/tantan/core/base/R$string;->G:I

    .line 160
    .line 161
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    invoke-virtual {p0, p1, p2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    return-object p0

    .line 170
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 171
    .line 172
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-eqz v0, :cond_8

    .line 177
    .line 178
    sget p1, Lcom/tantan/core/base/R$string;->H:I

    .line 179
    .line 180
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    invoke-virtual {p0, p1, p2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    return-object p0

    .line 189
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 190
    .line 191
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    if-eqz v0, :cond_9

    .line 196
    .line 197
    sget p1, Lcom/tantan/core/base/R$string;->C:I

    .line 198
    .line 199
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object p2

    .line 203
    invoke-virtual {p0, p1, p2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    return-object p0

    .line 208
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 209
    .line 210
    const-string v0, "call_2_buy"

    .line 211
    .line 212
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 213
    .line 214
    .line 215
    move-result p0

    .line 216
    if-eqz p0, :cond_b

    .line 217
    .line 218
    :try_start_0
    sget-object p0, Lcom/p1/mobile/putong/data/MessageCallToBuy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 219
    .line 220
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 221
    .line 222
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    check-cast p0, Lcom/p1/mobile/putong/data/MessageCallToBuy;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    .line 228
    goto :goto_3

    .line 229
    :catch_0
    move-exception p0

    .line 230
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 231
    .line 232
    .line 233
    const/4 p0, 0x0

    .line 234
    :goto_3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    move-result p1

    .line 238
    if-eqz p1, :cond_a

    .line 239
    .line 240
    iget-object p2, p0, Lcom/p1/mobile/putong/data/MessageCallToBuy;->previewText:Ljava/lang/String;

    .line 241
    .line 242
    :cond_a
    return-object p2

    .line 243
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 244
    .line 245
    const-string p1, "hide_for_fake_user"

    .line 246
    .line 247
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 248
    .line 249
    .line 250
    move-result p0

    .line 251
    if-eqz p0, :cond_c

    .line 252
    .line 253
    new-instance p0, Ljava/lang/StringBuilder;

    .line 254
    .line 255
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 256
    .line 257
    .line 258
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    const-string p1, ": \u5bf9\u65b9\u53d1\u6765\u4e00\u6761\u6d88\u606f"

    .line 262
    .line 263
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    return-object p0

    .line 271
    :cond_c
    return-object p2
.end method

.method public final x(Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/data/PushMessageCustom;->new_()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 12
    .line 13
    const-string v0, "tantan_default"

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->pushChannel:Ljava/lang/String;

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/wr2;->i(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final y(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;Z)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/data/PushMessageCustom;->new_()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 12
    .line 13
    const-string v0, "tantan_default"

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->pushChannel:Ljava/lang/String;

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2, p3}, Ll/wr2;->k(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public z()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act$r;->b:Lcom/p1/mobile/android/app/c;

    .line 8
    .line 9
    iget-boolean v0, v0, Lcom/p1/mobile/android/app/c;->a:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Landroid/app/Activity;

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ac(Landroid/app/Activity;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 34
    return-object p0
.end method
