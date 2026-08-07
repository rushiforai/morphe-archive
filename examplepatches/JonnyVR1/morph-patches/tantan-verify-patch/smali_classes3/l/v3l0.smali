.class public Ll/v3l0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile d:Ll/v3l0;


# instance fields
.field public a:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/data/VerificationNetworkData;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/lang/String;

.field public c:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/v3l0;->a:Lrx/subjects/b;

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, Ll/v3l0;->b:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Ll/v3l0;->c:Z

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic a(Ll/v3l0;Lcom/p1/mobile/putong/data/VerificationNetworkData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v3l0;->g(Lcom/p1/mobile/putong/data/VerificationNetworkData;)V

    return-void
.end method

.method public static e()Ll/v3l0;
    .locals 2

    .line 1
    sget-object v0, Ll/v3l0;->d:Ll/v3l0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/esf0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/v3l0;->d:Ll/v3l0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/v3l0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/v3l0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/v3l0;->d:Ll/v3l0;

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
    sget-object v0, Ll/v3l0;->d:Ll/v3l0;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public b()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/data/VerificationNetworkData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/v3l0;->a:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/data/VerificationNetworkData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/data/VerificationNetworkData;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationNetworkData;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationNetworkData;->data:Lcom/p1/mobile/putong/data/VerificationData;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationNetworkData;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 39
    .line 40
    iget v0, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 41
    .line 42
    const v1, 0x61bb8

    .line 43
    .line 44
    .line 45
    if-eq v0, v1, :cond_1

    .line 46
    .line 47
    const v1, 0x61bba

    .line 48
    .line 49
    .line 50
    if-eq v0, v1, :cond_1

    .line 51
    .line 52
    const v1, 0x61bb9

    .line 53
    .line 54
    .line 55
    if-ne v0, v1, :cond_2

    .line 56
    .line 57
    :cond_1
    new-instance v0, Ll/u3l0;

    .line 58
    .line 59
    invoke-direct {v0, p0, p1}, Ll/u3l0;-><init>(Ll/v3l0;Lcom/p1/mobile/putong/data/VerificationNetworkData;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    :goto_0
    return-void
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v3l0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/v3l0;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/data/VerificationNetworkData;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v3l0;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public h(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v3l0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public i(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/v3l0;->c:Z

    .line 2
    .line 3
    return-void
.end method
