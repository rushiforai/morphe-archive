.class public Ll/qu2$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hvl;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qu2;->y()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public volatile a:Ll/rg50;


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
.method public a()Ll/rg50;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qu2$a;->a:Ll/rg50;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Ll/uqb0;->C:Ll/rg50$b;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    monitor-enter p0

    .line 10
    :try_start_0
    iget-object v0, p0, Ll/qu2$a;->a:Ll/rg50;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    sget-object v0, Ll/uqb0;->C:Ll/rg50$b;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/rg50$b;->c()Ll/rg50;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Ll/qu2$a;->a:Ll/rg50;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    :goto_0
    monitor-exit p0

    .line 28
    goto :goto_2

    .line 29
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    throw v0

    .line 31
    :cond_1
    :goto_2
    iget-object p0, p0, Ll/qu2$a;->a:Ll/rg50;

    .line 32
    .line 33
    return-object p0
.end method

.method public b(Ll/x1d0;)Ll/x1d0;
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/Network;->addHMC(Ll/x1d0;)Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    return-object p1
.end method
