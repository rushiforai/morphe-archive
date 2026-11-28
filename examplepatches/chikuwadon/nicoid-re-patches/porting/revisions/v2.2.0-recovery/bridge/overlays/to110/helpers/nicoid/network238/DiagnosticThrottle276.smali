.class public final Lnicoid/network238/DiagnosticThrottle276;
.super Ljava/lang/Object;
.source "DiagnosticThrottle276.java"


# static fields
.field private static final AMBIENT:Lnicoid/network238/DiagnosticThrottle276;


# instance fields
.field private final last:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    new-instance v0, Lnicoid/network238/DiagnosticThrottle276;

    invoke-direct {v0}, Lnicoid/network238/DiagnosticThrottle276;-><init>()V

    sput-object v0, Lnicoid/network238/DiagnosticThrottle276;->AMBIENT:Lnicoid/network238/DiagnosticThrottle276;

    return-void
.end method

.method public constructor <init>()V
    .registers 5

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    new-instance v0, Ljava/util/LinkedHashMap;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x10

    invoke-direct {v0, v3, v1, v2}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Lnicoid/network238/DiagnosticThrottle276;->last:Ljava/util/LinkedHashMap;

    return-void
.end method

.method public static ambient(Ljava/lang/String;J)Z
    .registers 4

    .line 7
    sget-object v0, Lnicoid/network238/DiagnosticThrottle276;->AMBIENT:Lnicoid/network238/DiagnosticThrottle276;

    invoke-virtual {v0, p0, p1, p2}, Lnicoid/network238/DiagnosticThrottle276;->allow(Ljava/lang/String;J)Z

    move-result p0

    return p0
.end method


# virtual methods
.method declared-synchronized allow(Ljava/lang/String;J)Z
    .registers 9

    monitor-enter p0

    .line 9
    const/4 v0, 0x1

    if-nez p1, :cond_0

    monitor-exit p0

    return v0

    .line 10
    :cond_0
    :try_start_0
    iget-object v1, p0, Lnicoid/network238/DiagnosticThrottle276;->last:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 11
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    cmp-long v2, p2, v2

    if-ltz v2, :cond_1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sub-long v1, p2, v1

    const-wide/16 v3, 0x2710

    cmp-long v1, v1, v3

    if-gez v1, :cond_1

    monitor-exit p0

    const/4 p1, 0x0

    return p1

    .line 12
    :cond_1
    :try_start_1
    iget-object v1, p0, Lnicoid/network238/DiagnosticThrottle276;->last:Ljava/util/LinkedHashMap;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {v1, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    :goto_0
    iget-object p1, p0, Lnicoid/network238/DiagnosticThrottle276;->last:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->size()I

    move-result p1

    const/16 p2, 0x40

    if-le p1, p2, :cond_2

    iget-object p1, p0, Lnicoid/network238/DiagnosticThrottle276;->last:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    invoke-interface {p1}, Ljava/util/Iterator;->remove()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 14
    :cond_2
    monitor-exit p0

    return v0

    .line 8
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_1
.end method
