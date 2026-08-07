.class public Ll/qzm0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qzm0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/qzm0;


# direct methods
.method public constructor <init>(Ll/qzm0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qzm0$a;->a:Ll/qzm0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qzm0$a;->a:Ll/qzm0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qzm0;->c:Ll/qzm0$b;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object p0, p0, Ll/qzm0$a;->a:Ll/qzm0;

    .line 9
    .line 10
    iget-object v1, p0, Ll/qzm0;->c:Ll/qzm0$b;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    iput-object v2, p0, Ll/qzm0;->c:Ll/qzm0$b;

    .line 14
    .line 15
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    invoke-static {p0, v1}, Ll/qzm0;->b(Ll/qzm0;Ll/qzm0$b;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw p0

    .line 23
    :cond_0
    return-void
.end method
