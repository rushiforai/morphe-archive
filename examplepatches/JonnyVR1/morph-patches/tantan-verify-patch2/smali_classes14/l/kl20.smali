.class public Ll/kl20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v4m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/v4m<",
        "Lcom/tantanapp/common/network/NetworkTrackInfo;",
        ">;"
    }
.end annotation


# static fields
.field public static volatile d:Ll/kl20;


# instance fields
.field public a:Ll/e5y;

.field public b:Ll/tt0;

.field public c:Ll/y1;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b()Ll/kl20;
    .locals 2

    .line 1
    sget-object v0, Ll/kl20;->d:Ll/kl20;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/kl20;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/kl20;->d:Ll/kl20;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/kl20;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/kl20;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/kl20;->d:Ll/kl20;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/kl20;->d:Ll/kl20;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kl20;->d(Lcom/tantanapp/common/network/NetworkTrackInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c(Lcom/tantanapp/common/network/NetworkTrackInfo;)Ll/v4m;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/network/NetworkTrackInfo;",
            ")",
            "Ll/v4m<",
            "Lcom/tantanapp/common/network/NetworkTrackInfo;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getReportType()Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    sget-object v0, Ll/kl20$a;->a:[I

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    aget p1, v0, p1

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    if-eq p1, v0, :cond_4

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    if-eq p1, v0, :cond_2

    .line 19
    .line 20
    const/4 v0, 0x3

    .line 21
    if-eq p1, v0, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    iget-object p1, p0, Ll/kl20;->c:Ll/y1;

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    new-instance p1, Ll/y1;

    .line 30
    .line 31
    invoke-direct {p1}, Ll/y1;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Ll/kl20;->c:Ll/y1;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p1

    .line 38
    goto :goto_2

    .line 39
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/kl20;->c:Ll/y1;

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    iget-object p1, p0, Ll/kl20;->b:Ll/tt0;

    .line 43
    .line 44
    if-nez p1, :cond_3

    .line 45
    .line 46
    new-instance p1, Ll/tt0;

    .line 47
    .line 48
    invoke-direct {p1}, Ll/tt0;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Ll/kl20;->b:Ll/tt0;

    .line 52
    .line 53
    :cond_3
    iget-object p1, p0, Ll/kl20;->b:Ll/tt0;

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_4
    iget-object p1, p0, Ll/kl20;->a:Ll/e5y;

    .line 57
    .line 58
    if-nez p1, :cond_5

    .line 59
    .line 60
    new-instance p1, Ll/e5y;

    .line 61
    .line 62
    invoke-direct {p1}, Ll/e5y;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object p1, p0, Ll/kl20;->a:Ll/e5y;

    .line 66
    .line 67
    :cond_5
    iget-object p1, p0, Ll/kl20;->a:Ll/e5y;

    .line 68
    .line 69
    :goto_1
    monitor-exit p0

    .line 70
    return-object p1

    .line 71
    :goto_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    throw p1
.end method

.method public d(Lcom/tantanapp/common/network/NetworkTrackInfo;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "NetworkTrackReporter report "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "[common][network]"

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/kl20;->c(Lcom/tantanapp/common/network/NetworkTrackInfo;)Ll/v4m;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    invoke-interface {p0, p1}, Ll/v4m;->a(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method
