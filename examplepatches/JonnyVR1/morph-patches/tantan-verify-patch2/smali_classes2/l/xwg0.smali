.class public final Ll/xwg0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/log0;


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


# virtual methods
.method public final a(Ll/aug0;ILjava/lang/Exception;Ll/wkg0;)V
    .locals 0

    .line 1
    check-cast p4, Ll/sug0;

    .line 2
    .line 3
    iget-object p4, p4, Ll/sug0;->e:Ll/yeg0;

    .line 4
    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    monitor-enter p4

    .line 8
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 9
    .line 10
    .line 11
    monitor-exit p4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit p4

    .line 15
    throw p0

    .line 16
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/xwg0;->a:Ll/log0;

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-interface {p0, p1, p2, p3}, Ll/qog0;->a(Ll/aug0;ILjava/lang/Exception;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method
