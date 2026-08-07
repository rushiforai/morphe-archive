.class Ll/grq0$b;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/grq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/grq0;


# direct methods
.method public constructor <init>(Ll/grq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/grq0$b;->a:Ll/grq0;

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
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/grq0$b;->a:Ll/grq0;

    .line 2
    .line 3
    const/16 v0, 0x19

    .line 4
    .line 5
    const/16 v1, 0xc8

    .line 6
    .line 7
    invoke-virtual {p0, v1, v0}, Ll/grq0;->h(II)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 13
    .line 14
    .line 15
    const-string v0, "NPTH_CATCH"

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
