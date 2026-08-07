.class public final Ll/dex0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile b:Ll/dex0;

.field public static final c:Ll/dex0;


# instance fields
.field public final a:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/dex0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Ll/dex0;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/dex0;->c:Ll/dex0;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/dex0;->a:Ljava/util/Map;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    iput-object p1, p0, Ll/dex0;->a:Ljava/util/Map;

    return-void
.end method

.method public static a()Ll/dex0;
    .locals 2

    .line 1
    sget-object v0, Ll/dex0;->b:Ll/dex0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    const-class v0, Ll/dex0;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    sget-object v1, Ll/dex0;->b:Ll/dex0;

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    monitor-exit v0

    .line 14
    return-object v1

    .line 15
    :catchall_0
    move-exception v1

    .line 16
    goto :goto_0

    .line 17
    :cond_1
    sget-object v1, Ll/gxx0;->c:Ll/gxx0;

    .line 18
    .line 19
    const-class v1, Ll/dex0;

    .line 20
    .line 21
    invoke-static {v1}, Ll/xmx0;->b(Ljava/lang/Class;)Ll/dex0;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sput-object v1, Ll/dex0;->b:Ll/dex0;

    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return-object v1

    .line 29
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    throw v1
.end method


# virtual methods
.method public final b(Ll/yvx0;I)Ll/uqx0;
    .locals 1

    .line 1
    new-instance v0, Ll/idx0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/idx0;-><init>(Ljava/lang/Object;I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/dex0;->a:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/uqx0;

    .line 13
    .line 14
    return-object p0
.end method
