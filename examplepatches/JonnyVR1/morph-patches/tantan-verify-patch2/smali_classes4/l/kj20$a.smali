.class Ll/kj20$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/kj20;->e(JLl/s1m;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/s1m;


# direct methods
.method public constructor <init>(Ll/s1m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kj20$a;->a:Ll/s1m;

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
    invoke-static {}, Ll/kj20;->a()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/xp50;->d:Ll/w4m;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-interface {v1, v0}, Ll/w4m;->a(Ll/x1d0;)Ll/x1d0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :cond_0
    invoke-static {}, Ll/kj20;->b()Ll/rg50;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1, v0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ll/ry3;->execute()Ll/i5d0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Ll/kj20$a;->a:Ll/s1m;

    .line 26
    .line 27
    invoke-interface {v1, v0}, Ll/s1m;->a(Ll/i5d0;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :catch_0
    iget-object p0, p0, Ll/kj20$a;->a:Ll/s1m;

    .line 32
    .line 33
    invoke-interface {p0}, Ll/s1m;->onFail()V

    .line 34
    .line 35
    .line 36
    return-void
.end method
