.class public Ll/ja5;
.super Ll/xi5;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ja5$a;,
        Ll/ja5$b;
    }
.end annotation


# static fields
.field public static b:Ll/wyd0;

.field public static c:Ll/ja5$a;


# instance fields
.field public a:Ll/ja5$b;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    const-string v1, "client_track_sessionId"

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/ja5;->b:Ll/wyd0;

    .line 11
    .line 12
    new-instance v0, Ll/ja5$a;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/ja5$a;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/ja5;->c:Ll/ja5$a;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/xi5;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ja5$b;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ja5$b;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ja5;->a:Ll/ja5$b;

    .line 10
    .line 11
    return-void
.end method

.method public static B()V
    .locals 1

    .line 1
    sget-object v0, Ll/ja5;->c:Ll/ja5$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ja5$a;->e()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic x(Ll/ja5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ja5;->A()V

    return-void
.end method

.method public static bridge synthetic y()Ll/wyd0;
    .locals 1

    .line 1
    sget-object v0, Ll/ja5;->b:Ll/wyd0;

    return-object v0
.end method

.method public static z()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    const-string v1, "event_tracking"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/niw;->d(Ljava/io/File;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method


# virtual methods
.method public final synthetic A()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ja5;->D()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public C()V
    .locals 1

    .line 1
    new-instance v0, Ll/ia5;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ia5;-><init>(Ll/ja5;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public D()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ja5;->a:Ll/ja5$b;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ja5$b;->e()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    move v2, v1

    .line 16
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-eqz v3, :cond_2

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Ll/ja5$b$a;

    .line 27
    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    iget-object v4, p0, Ll/ja5;->a:Ll/ja5$b;

    .line 31
    .line 32
    invoke-virtual {v4, v3, v1}, Ll/ja5$b;->f(Ll/ja5$b$a;Z)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/4 v4, 0x1

    .line 37
    invoke-virtual {p0, v3, v4}, Ll/ja5;->E(Ll/ja5$b$a;Z)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-nez v3, :cond_0

    .line 42
    .line 43
    move v2, v4

    .line 44
    goto :goto_0

    .line 45
    :cond_2
    return-void
.end method

.method public final E(Ll/ja5$b$a;Z)Z
    .locals 7

    .line 1
    const/4 p2, 0x0

    .line 2
    move v0, p2

    .line 3
    :goto_0
    const/4 v1, 0x2

    .line 4
    if-gt p2, v1, :cond_2

    .line 5
    .line 6
    if-nez v0, :cond_2

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    const/4 v3, 0x0

    .line 10
    :try_start_0
    sget-object v4, Ll/uqb0;->D:Ll/rg50;

    .line 11
    .line 12
    sget-object v5, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 13
    .line 14
    invoke-virtual {v5}, Lcom/p1/mobile/putong/api/api/Network;->basic()Ll/x1d0$a;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    iget-object v6, p1, Ll/ja5$b$a;->b:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v5, v6}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    invoke-virtual {v5}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    invoke-virtual {v4, v5}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 29
    .line 30
    .line 31
    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    :try_start_1
    invoke-interface {v4}, Ll/ry3;->execute()Ll/i5d0;

    .line 33
    .line 34
    .line 35
    move-result-object v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    goto :goto_1

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    goto :goto_5

    .line 39
    :catch_0
    add-int/lit8 p2, p2, 0x1

    .line 40
    .line 41
    :goto_1
    if-eqz v3, :cond_1

    .line 42
    .line 43
    :try_start_2
    invoke-virtual {v3}, Ll/i5d0;->q()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    rem-int/lit8 v4, v4, 0x64
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 48
    .line 49
    if-ne v4, v1, :cond_0

    .line 50
    .line 51
    move v0, v2

    .line 52
    goto :goto_2

    .line 53
    :cond_0
    add-int/lit8 p2, p2, 0x3

    .line 54
    .line 55
    :goto_2
    :try_start_3
    invoke-virtual {v3}, Ll/i5d0;->k()Ll/k5d0;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    invoke-virtual {v1}, Ll/k5d0;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 62
    .line 63
    .line 64
    goto :goto_3

    .line 65
    :catch_1
    move-exception v1

    .line 66
    :try_start_4
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 67
    .line 68
    .line 69
    goto :goto_3

    .line 70
    :catch_2
    move-exception v1

    .line 71
    goto :goto_4

    .line 72
    :cond_1
    :goto_3
    invoke-static {v3}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :goto_4
    add-int/2addr p2, v2

    .line 77
    :try_start_5
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 78
    .line 79
    .line 80
    goto :goto_3

    .line 81
    :goto_5
    invoke-static {v3}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 82
    .line 83
    .line 84
    throw p0

    .line 85
    :cond_2
    iget-object p0, p0, Ll/ja5;->a:Ll/ja5$b;

    .line 86
    .line 87
    invoke-virtual {p0, p1, v0}, Ll/ja5$b;->f(Ll/ja5$b$a;Z)V

    .line 88
    .line 89
    .line 90
    return v0
.end method
