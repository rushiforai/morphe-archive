.class public Ll/lj1;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile b:Ll/lj1;


# instance fields
.field public final a:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 5
    .line 6
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/lj1;->a:Lrx/subjects/a;

    .line 11
    .line 12
    return-void
.end method

.method public static b()Ll/lj1;
    .locals 2

    .line 1
    sget-object v0, Ll/lj1;->b:Ll/lj1;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/lj1;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/lj1;->b:Ll/lj1;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/lj1;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/lj1;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/lj1;->b:Ll/lj1;

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
    sget-object v0, Ll/lj1;->b:Ll/lj1;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lj1;->a:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method
