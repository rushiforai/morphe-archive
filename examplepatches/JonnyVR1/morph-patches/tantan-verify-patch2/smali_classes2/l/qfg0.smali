.class public final Ll/qfg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jgg0;


# direct methods
.method public constructor <init>(Ll/jgg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qfg0;->a:Ll/jgg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/qfg0;->a:Ll/jgg0;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v0, p0, Ll/jgg0;->j:Ll/rug0;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/jgg0;->j:Ll/rug0;

    .line 10
    .line 11
    iput-object v1, v0, Ll/rug0;->c:Ll/x1d0;

    .line 12
    .line 13
    iget-object v2, v0, Ll/rug0;->d:Ll/i5d0;

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    invoke-virtual {v2}, Ll/i5d0;->close()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    iput-object v1, v0, Ll/rug0;->d:Ll/i5d0;

    .line 24
    .line 25
    iget-object v0, p0, Ll/jgg0;->j:Ll/rug0;

    .line 26
    .line 27
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/jgg0;->b:Ll/aug0;

    .line 31
    .line 32
    iget v0, v0, Ll/aug0;->b:I

    .line 33
    .line 34
    :cond_1
    iput-object v1, p0, Ll/jgg0;->j:Ll/rug0;

    .line 35
    .line 36
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    return-void

    .line 38
    :goto_1
    monitor-exit p0

    .line 39
    throw v0
.end method
