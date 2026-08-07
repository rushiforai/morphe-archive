.class public Ll/yc2;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static f:Ll/yc2;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/AppealInfo;

.field public b:Lcom/p1/mobile/putong/data/FaceidLiveData;

.field public c:Lcom/p1/mobile/putong/data/IdCard;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;


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

.method public static e()Ll/yc2;
    .locals 2

    .line 1
    sget-object v0, Ll/yc2;->f:Ll/yc2;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/yc2;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/yc2;->f:Ll/yc2;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/yc2;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/yc2;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/yc2;->f:Ll/yc2;

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
    sget-object v0, Ll/yc2;->f:Ll/yc2;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/data/AppealInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yc2;->a:Lcom/p1/mobile/putong/core/data/AppealInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yc2;->a:Lcom/p1/mobile/putong/core/data/AppealInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/yc2;->a:Lcom/p1/mobile/putong/core/data/AppealInfo;

    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->allowAppeal:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "inProgress"

    .line 18
    .line 19
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const-string p0, "under_review"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    const-string p0, "no_appeal"

    .line 29
    .line 30
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/data/FaceidLiveData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yc2;->b:Lcom/p1/mobile/putong/data/FaceidLiveData;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/data/IdCard;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yc2;->c:Lcom/p1/mobile/putong/data/IdCard;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yc2;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yc2;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Lcom/p1/mobile/putong/core/data/AppealInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yc2;->a:Lcom/p1/mobile/putong/core/data/AppealInfo;

    .line 2
    .line 3
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/data/FaceidLiveData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yc2;->b:Lcom/p1/mobile/putong/data/FaceidLiveData;

    .line 2
    .line 3
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/data/IdCard;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yc2;->c:Lcom/p1/mobile/putong/data/IdCard;

    .line 2
    .line 3
    return-void
.end method

.method public k(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yc2;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public l(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yc2;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
