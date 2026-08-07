.class Ll/h410$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/q210$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/h410;->e(Lcom/momo/pub/MomoPipelineModuleRegister$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/momo/pub/MomoPipelineModuleRegister$a;

.field final synthetic b:Ll/h410;


# direct methods
.method public constructor <init>(Ll/h410;Lcom/momo/pub/MomoPipelineModuleRegister$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/h410$c;->b:Ll/h410;

    .line 2
    .line 3
    iput-object p2, p0, Ll/h410$c;->a:Lcom/momo/pub/MomoPipelineModuleRegister$a;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public q0(IILjava/lang/Object;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/h410$c;->b:Ll/h410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/h410;->R(Ll/h410;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Ll/h410$c;->b:Ll/h410;

    .line 9
    .line 10
    invoke-static {v1}, Ll/h410;->R(Ll/h410;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const/4 v2, 0x1

    .line 19
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Ll/fr2;

    .line 30
    .line 31
    invoke-virtual {v3}, Ll/fr2;->s2()Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    if-ne v4, p3, :cond_0

    .line 36
    .line 37
    iget-object v2, p0, Ll/h410$c;->a:Lcom/momo/pub/MomoPipelineModuleRegister$a;

    .line 38
    .line 39
    invoke-interface {v2, p1, p2, v3}, Lcom/momo/pub/MomoPipelineModuleRegister$a;->b(IILl/c4m;)V

    .line 40
    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    iget-object p0, p0, Ll/h410$c;->a:Lcom/momo/pub/MomoPipelineModuleRegister$a;

    .line 50
    .line 51
    const/4 p3, 0x0

    .line 52
    invoke-interface {p0, p1, p2, p3}, Lcom/momo/pub/MomoPipelineModuleRegister$a;->b(IILl/c4m;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void

    .line 56
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    throw p0
.end method

.method public w0(IILjava/lang/Object;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/h410$c;->b:Ll/h410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/h410;->R(Ll/h410;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Ll/h410$c;->b:Ll/h410;

    .line 9
    .line 10
    invoke-static {v1}, Ll/h410;->R(Ll/h410;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const/4 v2, 0x1

    .line 19
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Ll/fr2;

    .line 30
    .line 31
    invoke-virtual {v3}, Ll/fr2;->s2()Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    if-ne v4, p3, :cond_0

    .line 36
    .line 37
    iget-object v2, p0, Ll/h410$c;->a:Lcom/momo/pub/MomoPipelineModuleRegister$a;

    .line 38
    .line 39
    invoke-interface {v2, p1, p2, v3}, Lcom/momo/pub/MomoPipelineModuleRegister$a;->a(IILl/c4m;)V

    .line 40
    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    iget-object p0, p0, Ll/h410$c;->a:Lcom/momo/pub/MomoPipelineModuleRegister$a;

    .line 50
    .line 51
    const/4 p3, 0x0

    .line 52
    invoke-interface {p0, p1, p2, p3}, Lcom/momo/pub/MomoPipelineModuleRegister$a;->a(IILl/c4m;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void

    .line 56
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    throw p0
.end method
