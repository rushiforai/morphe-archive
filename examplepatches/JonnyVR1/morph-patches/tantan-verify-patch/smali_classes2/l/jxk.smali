.class public Ll/jxk;
.super Ll/qx3;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jxk$a;
    }
.end annotation


# instance fields
.field private d:Lcom/momocv/handgesture/HandGesture;

.field private e:Lcom/momocv/handgesture/HandGestureParams;

.field private f:Ljava/lang/String;

.field private g:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/qx3;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momocv/handgesture/HandGestureParams;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momocv/handgesture/HandGestureParams;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/jxk;->e:Lcom/momocv/handgesture/HandGestureParams;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Ll/jxk;->g:I

    .line 13
    .line 14
    return-void
.end method

.method public static e()Ll/jxk;
    .locals 1

    .line 1
    invoke-static {}, Ll/jxk$a;->a()Ll/jxk;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jxk;->d:Lcom/momocv/handgesture/HandGesture;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/momocv/handgesture/HandGesture;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/momocv/handgesture/HandGesture;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/jxk;->d:Lcom/momocv/handgesture/HandGesture;

    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized d()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Ll/jxk;->f()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Ll/jxk;->f:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/jxk;->f:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/jxk;->g(Ljava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw v0
.end method

.method public declared-synchronized g(Ljava/lang/String;)Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Ll/jxk;->f:Ljava/lang/String;

    .line 3
    .line 4
    invoke-direct {p0}, Ll/jxk;->f()V

    .line 5
    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/jxk;->d:Lcom/momocv/handgesture/HandGesture;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lcom/momocv/handgesture/HandGesture;->LoadModel(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    monitor-exit p0

    .line 20
    return p1

    .line 21
    :catchall_0
    move-exception p1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    monitor-exit p0

    .line 24
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    throw p1
.end method

.method public declared-synchronized h(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    check-cast p1, Lcom/momocv/MMFrame;

    .line 3
    .line 4
    iget-object v0, p0, Ll/jxk;->e:Lcom/momocv/handgesture/HandGestureParams;

    .line 5
    .line 6
    iget v1, p0, Ll/qx3;->a:I

    .line 7
    .line 8
    iput v1, v0, Lcom/momocv/BaseParams;->restore_degree_:I

    .line 9
    .line 10
    iget v1, p0, Ll/qx3;->b:I

    .line 11
    .line 12
    iput v1, v0, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 13
    .line 14
    iget-boolean v1, p0, Ll/qx3;->c:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 17
    .line 18
    iget v1, p0, Ll/jxk;->g:I

    .line 19
    .line 20
    iput v1, v0, Lcom/momocv/handgesture/HandGestureParams;->handgesture_type_:I

    .line 21
    .line 22
    new-instance v0, Lcom/momocv/handgesture/HandGestureInfo;

    .line 23
    .line 24
    invoke-direct {v0}, Lcom/momocv/handgesture/HandGestureInfo;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/jxk;->d:Lcom/momocv/handgesture/HandGesture;

    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iget-object v2, p0, Ll/jxk;->e:Lcom/momocv/handgesture/HandGestureParams;

    .line 32
    .line 33
    invoke-virtual {v1, p1, v2, v0}, Lcom/momocv/handgesture/HandGesture;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/handgesture/HandGestureParams;Lcom/momocv/handgesture/HandGestureInfo;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    .line 36
    monitor-exit p0

    .line 37
    return-object v0

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    monitor-exit p0

    .line 41
    const/4 p0, 0x0

    .line 42
    return-object p0

    .line 43
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    throw p1
.end method

.method public declared-synchronized i()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/jxk;->d:Lcom/momocv/handgesture/HandGesture;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/momocv/handgesture/HandGesture;->Release()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Ll/jxk;->d:Lcom/momocv/handgesture/HandGesture;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    monitor-exit p0

    .line 16
    return-void

    .line 17
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw v0
.end method

.method public j(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/jxk;->g:I

    .line 2
    .line 3
    return-void
.end method
