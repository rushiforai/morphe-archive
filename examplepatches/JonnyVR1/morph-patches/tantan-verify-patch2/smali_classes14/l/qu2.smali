.class public Ll/qu2;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/qu2$d;,
        Ll/qu2$e;
    }
.end annotation


# static fields
.field public static a:Ll/i1;

.field public static b:Lcom/tantanapp/beatles/block/c;

.field public static c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/qu2$e;",
            ">;"
        }
    .end annotation
.end field

.field public static d:Z

.field public static e:J

.field public static f:Ll/wyd0;

.field public static g:Ll/ili;

.field public static h:Ll/ili;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/qu2;->c:Ljava/util/List;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput-boolean v0, Ll/qu2;->d:Z

    .line 10
    .line 11
    new-instance v0, Ll/wyd0;

    .line 12
    .line 13
    const-string v1, "logUploadCount"

    .line 14
    .line 15
    const-string v2, "0_0"

    .line 16
    .line 17
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Ll/qu2;->f:Ll/wyd0;

    .line 21
    .line 22
    new-instance v0, Ll/hu2;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/hu2;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Ll/qu2;->g:Ll/ili;

    .line 28
    .line 29
    new-instance v0, Ll/iu2;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/iu2;-><init>()V

    .line 32
    .line 33
    .line 34
    sput-object v0, Ll/qu2;->h:Ll/ili;

    .line 35
    .line 36
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static A(JLjava/lang/String;)V
    .locals 0
    .param p0    # J
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p2, p0, p1}, Ll/du2;->y(Ljava/lang/String;J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static B(JLjava/util/List;)V
    .locals 0
    .param p0    # J
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2, p0, p1}, Ll/du2;->z(Ljava/util/List;J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static C(JLjava/lang/String;Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    invoke-static {p2, p3}, Ll/qu2;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/util/HashSet;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    new-instance p3, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/util/Date;

    .line 38
    .line 39
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 40
    .line 41
    .line 42
    move-result-wide v1

    .line 43
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    .line 44
    .line 45
    .line 46
    move-result-wide v3

    .line 47
    sub-long/2addr v1, v3

    .line 48
    const-wide/32 v3, 0x240c8400

    .line 49
    .line 50
    .line 51
    cmp-long v1, v1, v3

    .line 52
    .line 53
    if-gez v1, :cond_1

    .line 54
    .line 55
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    if-lez p2, :cond_3

    .line 64
    .line 65
    const-string p2, "push"

    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    invoke-static {p3, p2, p0, p1, v0}, Ll/qu2;->D(Ljava/util/List;Ljava/lang/String;JLl/b3k0;)V

    .line 69
    .line 70
    .line 71
    :cond_3
    :goto_1
    return-void
.end method

.method public static D(Ljava/util/List;Ljava/lang/String;JLl/b3k0;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # J
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ll/b3k0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Date;",
            ">;",
            "Ljava/lang/String;",
            "J",
            "Ll/b3k0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Ll/du2;->B(Ljava/util/List;Ljava/lang/String;JLl/b3k0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static E(Ljava/util/List;Ljava/lang/String;JLl/b3k0;)V
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # J
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ll/b3k0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Date;",
            ">;",
            "Ljava/lang/String;",
            "J",
            "Ll/b3k0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-wide v2, Ll/qu2;->e:J

    .line 6
    .line 7
    sub-long v2, v0, v2

    .line 8
    .line 9
    const-wide/32 v4, 0xea60

    .line 10
    .line 11
    .line 12
    cmp-long v2, v2, v4

    .line 13
    .line 14
    if-lez v2, :cond_2

    .line 15
    .line 16
    sput-wide v0, Ll/qu2;->e:J

    .line 17
    .line 18
    sget-object v0, Ll/qu2;->f:Ll/wyd0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0}, Ll/jyb;->L(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const/4 v2, 0x1

    .line 31
    const-string v3, "_"

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    if-nez v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    array-length v1, v0

    .line 41
    const/4 v5, 0x2

    .line 42
    if-ne v1, v5, :cond_1

    .line 43
    .line 44
    aget-object v1, v0, v4

    .line 45
    .line 46
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 47
    .line 48
    .line 49
    move-result-wide v5

    .line 50
    aget-object v0, v0, v2

    .line 51
    .line 52
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-static {v5, v6}, Ll/pzi0;->D(J)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_1

    .line 61
    .line 62
    const/16 v1, 0xa

    .line 63
    .line 64
    if-lt v0, v1, :cond_0

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    move v4, v0

    .line 68
    :cond_1
    invoke-static {p0, p1, p2, p3, p4}, Ll/qu2;->D(Ljava/util/List;Ljava/lang/String;JLl/b3k0;)V

    .line 69
    .line 70
    .line 71
    sget-object p0, Ll/qu2;->f:Ll/wyd0;

    .line 72
    .line 73
    new-instance p1, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 79
    .line 80
    .line 81
    move-result-wide p2

    .line 82
    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    add-int/2addr v4, v2

    .line 89
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    :cond_2
    :goto_0
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/tantanapp/common/network/NetIgnoredException;

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/qu2;->x(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c(Ljava/lang/String;Lorg/json/JSONObject;J)V
    .locals 3

    .line 1
    :try_start_0
    sget-object v0, Ll/qu2;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/qu2$e;

    .line 18
    .line 19
    invoke-interface {v1}, Ll/qu2$e;->a()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {p0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    new-instance v2, Ll/pu2;

    .line 30
    .line 31
    invoke-direct {v2, p2, p3}, Ll/pu2;-><init>(J)V

    .line 32
    .line 33
    .line 34
    invoke-interface {v1, p1, p2, p3, v2}, Ll/qu2$e;->b(Lorg/json/JSONObject;JLl/y20;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catch_0
    :cond_1
    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)Z
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/tantanapp/common/network/NetIgnoredException;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    instance-of v0, p0, Lcom/tantanapp/common/network/ApiExcep;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    instance-of v0, p0, Ljava/net/UnknownHostException;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    instance-of v0, p0, Ljavax/net/ssl/SSLException;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    instance-of v0, p0, Ljava/net/SocketTimeoutException;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    instance-of v0, p0, Ljava/net/SocketException;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    instance-of v0, p0, Lokhttp3/internal/http2/StreamResetException;

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    instance-of v0, p0, Lokhttp3/internal/http2/ConnectionShutdownException;

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    instance-of p0, p0, Lcom/tantanapp/sharedlibrary/loader/internal/NoReportException;

    .line 34
    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0

    .line 40
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 41
    return p0
.end method

.method public static synthetic e()Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/qu2;->o()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    return-object v0
.end method

.method public static synthetic f()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/common/R$string;->R:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic g()Ljava/lang/String;
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->isActResumed:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    sget-boolean v0, Lcom/p1/mobile/android/app/Frag;->isFragResumed:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "PAGE_RUNNING"

    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_1
    :goto_0
    const-string v0, "PAGE_CREATING"

    .line 14
    .line 15
    return-object v0
.end method

.method public static synthetic h(JLjava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p1, p2}, Ll/qu2;->A(JLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic i()Ljava/util/Map;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public static bridge synthetic j(Ljava/lang/String;Lorg/json/JSONObject;J)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/qu2;->n(Ljava/lang/String;Lorg/json/JSONObject;J)V

    return-void
.end method

.method public static bridge synthetic k(JLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/qu2;->C(JLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static l(Ll/rg50$b;)Ll/rg50$b;
    .locals 2

    .line 1
    new-instance v0, Ll/qu2$d;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/qu2$d;-><init>(Ll/ru2;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/rg50$b;->a(Ll/azm;)Ll/rg50$b;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static m(Ljava/lang/String;Ljava/lang/String;)Ljava/util/HashSet;
    .locals 6
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashSet<",
            "Ljava/util/Date;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 11
    .line 12
    .line 13
    move-result-wide p0

    .line 14
    invoke-static {p0, p1}, Ll/m8c;->b(J)Ljava/util/Date;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    :goto_0
    cmp-long v4, v1, p0

    .line 19
    .line 20
    if-gez v4, :cond_0

    .line 21
    .line 22
    invoke-static {v1, v2}, Ll/m8c;->b(J)Ljava/util/Date;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-virtual {v0, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    const-wide/32 v4, 0x5265c00

    .line 30
    .line 31
    .line 32
    add-long/2addr v1, v4

    .line 33
    goto :goto_0

    .line 34
    :catch_0
    move-exception p0

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    return-object v0

    .line 40
    :goto_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    return-object v0
.end method

.method public static n(Ljava/lang/String;Lorg/json/JSONObject;J)V
    .locals 1

    .line 1
    new-instance v0, Ll/ou2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/ou2;-><init>(Ljava/lang/String;Lorg/json/JSONObject;J)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static o()Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    const-string v1, "http.proxyHost"

    .line 3
    .line 4
    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const-string v2, "http.proxyPort"

    .line 9
    .line 10
    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-string v2, "-1"

    .line 18
    .line 19
    :goto_0
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    const/4 v1, -0x1

    .line 30
    if-eq v2, v1, :cond_1

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    :catch_0
    :cond_1
    return v0
.end method

.method public static p(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/qu2;->q(Landroid/content/Context;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static q(Landroid/content/Context;Z)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/io/File;

    .line 10
    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v4, "beatles_crash_collector"

    .line 25
    .line 26
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-nez v2, :cond_0

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    :cond_1
    new-instance v1, Ll/su2;

    .line 53
    .line 54
    invoke-direct {v1}, Ll/su2;-><init>()V

    .line 55
    .line 56
    .line 57
    new-instance v2, Ll/cjk0$b;

    .line 58
    .line 59
    invoke-direct {v2}, Ll/cjk0$b;-><init>()V

    .line 60
    .line 61
    .line 62
    const/4 v4, 0x1

    .line 63
    invoke-virtual {v2, v4}, Ll/cjk0$b;->h(Z)Ll/cjk0$b;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v2, v0}, Ll/cjk0$b;->f(Ljava/lang/String;)Ll/cjk0$b;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const/4 v2, 0x0

    .line 72
    invoke-virtual {v0, v2}, Ll/cjk0$b;->b(Z)Ll/cjk0$b;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v5, Ll/ytb;

    .line 77
    .line 78
    invoke-direct {v5}, Ll/ytb;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v5}, Ll/cjk0$b;->k(Ll/c610;)Ll/cjk0$b;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v5, Ll/f6f;

    .line 86
    .line 87
    invoke-direct {v5}, Ll/f6f;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v5}, Ll/cjk0$b;->k(Ll/c610;)Ll/cjk0$b;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0, v1}, Ll/cjk0$b;->i(Ll/x3f;)Ll/cjk0$b;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ll/gu2;

    .line 99
    .line 100
    invoke-direct {v1}, Ll/gu2;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ll/cjk0$b;->e(Ll/r4f;)Ll/cjk0$b;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    new-instance v1, Ll/ju2;

    .line 108
    .line 109
    invoke-direct {v1}, Ll/ju2;-><init>()V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, v1}, Ll/cjk0$b;->g(Ll/yul;)Ll/cjk0$b;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    const/4 v1, 0x2

    .line 117
    if-eqz p1, :cond_3

    .line 118
    .line 119
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    new-instance v6, Ll/owd0;

    .line 124
    .line 125
    move-object v7, p0

    .line 126
    check-cast v7, Landroid/app/Application;

    .line 127
    .line 128
    invoke-direct {v6, v7}, Ll/owd0;-><init>(Landroid/app/Application;)V

    .line 129
    .line 130
    .line 131
    invoke-static {}, Ll/swd0;->e()Lcom/p1/mobile/putong/data/SafetyModeConfig;

    .line 132
    .line 133
    .line 134
    move-result-object v7

    .line 135
    iget-boolean v8, v7, Lcom/p1/mobile/putong/data/SafetyModeConfig;->enable:Z

    .line 136
    .line 137
    iget-boolean v9, v7, Lcom/p1/mobile/putong/data/SafetyModeConfig;->protectActivity:Z

    .line 138
    .line 139
    iget-boolean v7, v7, Lcom/p1/mobile/putong/data/SafetyModeConfig;->protectEvent:Z

    .line 140
    .line 141
    invoke-virtual {v6, v8, v9, v7}, Ll/owd0;->f(ZZZ)V

    .line 142
    .line 143
    .line 144
    new-instance v7, Lcom/p1/mobile/putong/safety/UpgradePolicy;

    .line 145
    .line 146
    invoke-direct {v7, v1}, Lcom/p1/mobile/putong/safety/UpgradePolicy;-><init>(I)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v6, v7}, Ll/owd0;->e(Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;)Ll/owd0;

    .line 150
    .line 151
    .line 152
    new-instance v7, Ll/ku2;

    .line 153
    .line 154
    invoke-direct {v7}, Ll/ku2;-><init>()V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v6, v7}, Ll/owd0;->g(Ljava/lang/Runnable;)V

    .line 158
    .line 159
    .line 160
    new-instance v7, Ll/i1;

    .line 161
    .line 162
    invoke-direct {v7, v2}, Ll/i1;-><init>(Z)V

    .line 163
    .line 164
    .line 165
    sput-object v7, Ll/qu2;->a:Ll/i1;

    .line 166
    .line 167
    const/4 v7, 0x0

    .line 168
    invoke-virtual {p0, v7}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 169
    .line 170
    .line 171
    move-result-object v7

    .line 172
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v8

    .line 176
    if-eqz v8, :cond_2

    .line 177
    .line 178
    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v7

    .line 182
    goto :goto_0

    .line 183
    :cond_2
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 184
    .line 185
    .line 186
    move-result-object v7

    .line 187
    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v7

    .line 191
    :goto_0
    new-instance v8, Ll/qyv$b;

    .line 192
    .line 193
    invoke-direct {v8}, Ll/qyv$b;-><init>()V

    .line 194
    .line 195
    .line 196
    const-wide/16 v9, 0x7

    .line 197
    .line 198
    invoke-virtual {v8, v9, v10}, Ll/qyv$b;->c(J)Ll/qyv$b;

    .line 199
    .line 200
    .line 201
    move-result-object v8

    .line 202
    const-string v9, "0118bef53a6dce8e3f390600fb054e937892b4463f05e1666ea37e8f85eef023dec74954c67675ac8e61ed389464233bb2f301770985fd6bd77d1ff5871e55af"

    .line 203
    .line 204
    invoke-virtual {v8, v9}, Ll/qyv$b;->d(Ljava/lang/String;)Ll/qyv$b;

    .line 205
    .line 206
    .line 207
    move-result-object v8

    .line 208
    const-wide/32 v9, 0x900000

    .line 209
    .line 210
    .line 211
    invoke-virtual {v8, v9, v10}, Ll/qyv$b;->e(J)Ll/qyv$b;

    .line 212
    .line 213
    .line 214
    move-result-object v8

    .line 215
    new-instance v9, Ljava/lang/StringBuilder;

    .line 216
    .line 217
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    const-string v7, "xlog_path"

    .line 227
    .line 228
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v7

    .line 235
    invoke-virtual {v8, v7}, Ll/qyv$b;->f(Ljava/lang/String;)Ll/qyv$b;

    .line 236
    .line 237
    .line 238
    move-result-object v7

    .line 239
    new-instance v8, Ljava/lang/StringBuilder;

    .line 240
    .line 241
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 242
    .line 243
    .line 244
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 245
    .line 246
    .line 247
    move-result-object v9

    .line 248
    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v9

    .line 252
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    const-string v3, "xlog"

    .line 259
    .line 260
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v3

    .line 267
    invoke-virtual {v7, v3}, Ll/qyv$b;->b(Ljava/lang/String;)Ll/qyv$b;

    .line 268
    .line 269
    .line 270
    move-result-object v3

    .line 271
    invoke-virtual {v3}, Ll/qyv$b;->a()Ll/qyv;

    .line 272
    .line 273
    .line 274
    move-result-object v3

    .line 275
    new-instance v7, Lcom/tantanapp/beatles/block/c;

    .line 276
    .line 277
    new-instance v8, Ll/e43$c;

    .line 278
    .line 279
    invoke-direct {v8}, Ll/e43$c;-><init>()V

    .line 280
    .line 281
    .line 282
    invoke-virtual {v8, v4}, Ll/e43$c;->c(Z)Ll/e43$c;

    .line 283
    .line 284
    .line 285
    move-result-object v8

    .line 286
    new-instance v9, Ll/lu2;

    .line 287
    .line 288
    invoke-direct {v9}, Ll/lu2;-><init>()V

    .line 289
    .line 290
    .line 291
    invoke-virtual {v8, v9}, Ll/e43$c;->g(Ll/e43$b;)Ll/e43$c;

    .line 292
    .line 293
    .line 294
    move-result-object v8

    .line 295
    invoke-virtual {v8, v4}, Ll/e43$c;->f(Z)Ll/e43$c;

    .line 296
    .line 297
    .line 298
    move-result-object v8

    .line 299
    const/16 v9, 0xbb8

    .line 300
    .line 301
    invoke-virtual {v8, v9}, Ll/e43$c;->e(I)Ll/e43$c;

    .line 302
    .line 303
    .line 304
    move-result-object v8

    .line 305
    const-wide/16 v9, 0x3e8

    .line 306
    .line 307
    invoke-virtual {v8, v9, v10}, Ll/e43$c;->d(J)Ll/e43$c;

    .line 308
    .line 309
    .line 310
    move-result-object v8

    .line 311
    const-string v9, "qq"

    .line 312
    .line 313
    invoke-static {}, Ll/ls4;->b()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v10

    .line 317
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    move-result v9

    .line 321
    invoke-virtual {v8, v9}, Ll/e43$c;->b(Z)Ll/e43$c;

    .line 322
    .line 323
    .line 324
    move-result-object v8

    .line 325
    invoke-virtual {v8}, Ll/e43$c;->a()Ll/e43;

    .line 326
    .line 327
    .line 328
    move-result-object v8

    .line 329
    invoke-direct {v7, v8}, Lcom/tantanapp/beatles/block/c;-><init>(Ll/e43;)V

    .line 330
    .line 331
    .line 332
    sput-object v7, Ll/qu2;->b:Lcom/tantanapp/beatles/block/c;

    .line 333
    .line 334
    invoke-virtual {v0, v4}, Ll/cjk0$b;->c(Z)Ll/cjk0$b;

    .line 335
    .line 336
    .line 337
    move-result-object v7

    .line 338
    invoke-virtual {v7, v3}, Ll/cjk0$b;->j(Ll/qyv;)Ll/cjk0$b;

    .line 339
    .line 340
    .line 341
    move-result-object v3

    .line 342
    invoke-virtual {v3, p1}, Ll/cjk0$b;->d(Z)Ll/cjk0$b;

    .line 343
    .line 344
    .line 345
    move-result-object p1

    .line 346
    invoke-virtual {p1, v6}, Ll/cjk0$b;->l(Ll/j5m;)Ll/cjk0$b;

    .line 347
    .line 348
    .line 349
    move-result-object p1

    .line 350
    sget-object v3, Ll/qu2;->a:Ll/i1;

    .line 351
    .line 352
    invoke-virtual {p1, v3}, Ll/cjk0$b;->k(Ll/c610;)Ll/cjk0$b;

    .line 353
    .line 354
    .line 355
    move-result-object p1

    .line 356
    new-instance v3, Ll/vkq0;

    .line 357
    .line 358
    invoke-direct {v3}, Ll/vkq0;-><init>()V

    .line 359
    .line 360
    .line 361
    invoke-virtual {p1, v3}, Ll/cjk0$b;->k(Ll/c610;)Ll/cjk0$b;

    .line 362
    .line 363
    .line 364
    move-result-object p1

    .line 365
    sget-object v3, Ll/qu2;->b:Lcom/tantanapp/beatles/block/c;

    .line 366
    .line 367
    invoke-virtual {p1, v3}, Ll/cjk0$b;->k(Ll/c610;)Ll/cjk0$b;

    .line 368
    .line 369
    .line 370
    goto :goto_1

    .line 371
    :cond_3
    const/4 v5, -0x1

    .line 372
    :goto_1
    invoke-virtual {v0}, Ll/cjk0$b;->a()Ll/cjk0;

    .line 373
    .line 374
    .line 375
    move-result-object p1

    .line 376
    sget v0, Ll/uqb0;->t:I

    .line 377
    .line 378
    invoke-static {v0}, Ll/du2;->H(I)V

    .line 379
    .line 380
    .line 381
    sget-object v0, Ll/uqb0;->s:Ljava/lang/String;

    .line 382
    .line 383
    invoke-static {v0}, Ll/du2;->I(Ljava/lang/String;)V

    .line 384
    .line 385
    .line 386
    invoke-static {v2}, Ll/du2;->E(Z)V

    .line 387
    .line 388
    .line 389
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 390
    .line 391
    .line 392
    move-result-object v0

    .line 393
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 394
    .line 395
    and-int/2addr v0, v1

    .line 396
    if-eqz v0, :cond_4

    .line 397
    .line 398
    goto :goto_2

    .line 399
    :cond_4
    move v4, v2

    .line 400
    :goto_2
    new-instance v0, Ll/ywd0;

    .line 401
    .line 402
    const-string v1, "release"

    .line 403
    .line 404
    invoke-direct {v0, v4, v2, v1, v5}, Ll/ywd0;-><init>(ZZLjava/lang/String;I)V

    .line 405
    .line 406
    .line 407
    const-string v1, "35"

    .line 408
    .line 409
    invoke-static {p0, v1, p1, v2, v0}, Ll/du2;->s(Landroid/content/Context;Ljava/lang/String;Ll/cjk0;ZLl/ywd0;)V

    .line 410
    .line 411
    .line 412
    const-class p0, Lrx/exceptions/OnErrorThrowable$OnNextValue;

    .line 413
    .line 414
    filled-new-array {p0}, [Ljava/lang/Class;

    .line 415
    .line 416
    .line 417
    move-result-object p0

    .line 418
    invoke-static {p0}, Ll/du2;->a([Ljava/lang/Class;)V

    .line 419
    .line 420
    .line 421
    invoke-static {}, Ll/qu2;->r()V

    .line 422
    .line 423
    .line 424
    return-void
.end method

.method public static r()V
    .locals 2

    .line 1
    new-instance v0, Ll/qu2$b;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qu2$b;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/tu2;->c(Ll/myv;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Ll/qu2;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ll/l1c;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/l1c;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    sget-object v0, Ll/qu2;->c:Ljava/util/List;

    .line 20
    .line 21
    new-instance v1, Ll/gki;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/gki;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static s(Landroid/content/Context;)V
    .locals 7

    .line 1
    sget-object v0, Ll/ls4;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "360store"

    .line 4
    .line 5
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v2, "meizu"

    .line 10
    .line 11
    const-string v3, "organic"

    .line 12
    .line 13
    const-string v4, "ppzhushou"

    .line 14
    .line 15
    const-string v5, "baidu"

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Ll/ls4;->a:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    sget-object v0, Ll/ls4;->a:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    sget-object v0, Ll/ls4;->a:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    sget-object v0, Ll/ls4;->a:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    :cond_0
    new-instance v0, Ll/mu2;

    .line 52
    .line 53
    invoke-direct {v0}, Ll/mu2;-><init>()V

    .line 54
    .line 55
    .line 56
    new-instance v6, Ll/nu2;

    .line 57
    .line 58
    invoke-direct {v6}, Ll/nu2;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v6}, Lcom/tantanapp/common/network/NetReporter;->init(Ll/y20;Ll/pcj;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    invoke-static {}, Ll/qu2;->v()V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Lcom/tantanapp/beatles/fd/a;->e()V

    .line 68
    .line 69
    .line 70
    invoke-static {}, Lcom/tantanapp/beatles/thread/a;->n()V

    .line 71
    .line 72
    .line 73
    sget-object v0, Ll/ls4;->a:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_2

    .line 80
    .line 81
    sget-object v0, Ll/ls4;->a:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_2

    .line 88
    .line 89
    sget-object v0, Ll/ls4;->a:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-nez v0, :cond_2

    .line 96
    .line 97
    sget-object v0, Ll/ls4;->a:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_2

    .line 104
    .line 105
    sget-object v0, Ll/ls4;->a:Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_4

    .line 112
    .line 113
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    .line 114
    .line 115
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 116
    .line 117
    .line 118
    const/4 v1, 0x0

    .line 119
    invoke-virtual {p0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    if-eqz v2, :cond_3

    .line 128
    .line 129
    invoke-virtual {p0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    :cond_3
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    new-instance p0, Ll/nii$b;

    .line 152
    .line 153
    invoke-direct {p0}, Ll/nii$b;-><init>()V

    .line 154
    .line 155
    .line 156
    const-wide/32 v1, 0x100000

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0, v1, v2}, Ll/nii$b;->d(J)Ll/nii$b;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    const-wide/32 v1, 0x2bc00000

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0, v1, v2}, Ll/nii$b;->c(J)Ll/nii$b;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    const/4 v1, 0x1

    .line 171
    invoke-virtual {p0, v1}, Ll/nii$b;->e(I)Ll/nii$b;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-virtual {p0, v0}, Ll/nii$b;->b(Ljava/util/List;)Ll/nii$b;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    invoke-virtual {p0}, Ll/nii$b;->a()Ll/nii;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    invoke-static {p0}, Ll/xji;->i(Ll/nii;)V

    .line 184
    .line 185
    .line 186
    :cond_4
    invoke-static {}, Ll/fu2;->g()V

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method public static t(Ljava/lang/Throwable;Ll/ili;)Z
    .locals 1

    .line 1
    :goto_0
    invoke-interface {p1, p0}, Ll/ili;->a(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    instance-of v0, p0, Lcom/p1/mobile/android/app/App$HandledGlobally;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    check-cast p0, Lcom/p1/mobile/android/app/App$HandledGlobally;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/App$HandledGlobally;->getThrowable()Ljava/lang/Throwable;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0, p1}, Ll/qu2;->t(Ljava/lang/Throwable;Ll/ili;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_1
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_2
    move-object p0, v0

    .line 33
    goto :goto_0
.end method

.method public static u()V
    .locals 0

    .line 1
    invoke-static {}, Ll/su2;->c()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/du2;->w()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static v()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 2
    .line 3
    new-instance v1, Ll/qu2$c;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/qu2$c;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "xlog.upload"

    .line 9
    .line 10
    filled-new-array {v2}, [Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v1, v2}, Ll/cmb0;->a0(Ll/cmb0$g;Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static w(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/android/rx/RxException;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/qu2;->g:Ll/ili;

    .line 6
    .line 7
    invoke-static {p0, v0}, Ll/qu2;->t(Ljava/lang/Throwable;Ll/ili;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    const-string v0, "[RX]"

    .line 14
    .line 15
    invoke-static {v0, p0}, Ll/fhw;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    const-string v0, "RX"

    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/uu2;->f(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    instance-of v0, p0, Lcom/tantanapp/common/utils/NullChecker$TantanNullException;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const-string v0, "NULL"

    .line 29
    .line 30
    invoke-static {p0, v0}, Ll/uu2;->f(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    sget-object v0, Ll/qu2;->g:Ll/ili;

    .line 35
    .line 36
    invoke-static {p0, v0}, Ll/qu2;->t(Ljava/lang/Throwable;Ll/ili;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    const-string v0, "[CATCH]"

    .line 43
    .line 44
    invoke-static {v0, p0}, Ll/fhw;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    const-string v0, "CATCH"

    .line 48
    .line 49
    invoke-static {p0, v0}, Ll/uu2;->f(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    return-void
.end method

.method public static x(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    sget-object v0, Ll/qu2;->h:Ll/ili;

    .line 2
    .line 3
    invoke-static {p0, v0}, Ll/qu2;->t(Ljava/lang/Throwable;Ll/ili;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    const-class v0, Ljavax/net/ssl/SSLHandshakeException;

    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-string v1, "NET"

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    const/16 v2, 0x1f4

    .line 21
    .line 22
    invoke-static {v0, v2}, Ll/gkc0;->a(II)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    invoke-static {p0, v1}, Ll/uu2;->f(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-static {p0, v1}, Ll/uu2;->f(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public static y()V
    .locals 1

    .line 1
    new-instance v0, Ll/qu2$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qu2$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/du2;->D(Ll/hvl;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static z()V
    .locals 2

    .line 1
    sget-object v0, Ll/qu2;->b:Lcom/tantanapp/beatles/block/c;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    sget-boolean v1, Ll/qu2;->d:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v0}, Lcom/tantanapp/beatles/block/c;->r()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    sput-boolean v0, Ll/qu2;->d:Z

    .line 15
    .line 16
    :cond_1
    :goto_0
    return-void
.end method
