.class public LX/mh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LX/mh$b;,
        LX/mh$a;
    }
.end annotation


# instance fields
.field public final a:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/os/Handler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LX/mh;->a:Landroid/os/Handler;

    .line 5
    .line 6
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, LX/mh;->f(Landroid/os/Message;)LX/mh$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :try_start_0
    iget-object v1, p0, LX/mh;->a:Landroid/os/Handler;

    .line 6
    .line 7
    invoke-virtual {v1, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, LX/mh;->c(Landroid/os/Message;LX/mh$b;)V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    return p1

    :catch_0
    move-exception v1
    invoke-static {p1, v0}, LX/mh;->c(Landroid/os/Message;LX/mh$b;)V
    const/4 p1, 0x1
    return p1

    .line 15
    :catchall_0
    move-exception v1

    .line 16
    invoke-static {p1, v0}, LX/mh;->c(Landroid/os/Message;LX/mh$b;)V

    .line 17
    .line 18
    .line 19
    throw v1
.end method
