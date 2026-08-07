.class public final Ll/fo50$a$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fo50$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TD1;>;"
    }
.end annotation


# instance fields
.field public final e:I

.field public f:Z

.field public final synthetic g:Ll/fo50$a;


# direct methods
.method public constructor <init>(Ll/fo50$a;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fo50$a$a;->g:Ll/fo50$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Ll/fo50$a$a;->f:Z

    .line 8
    .line 9
    iput p2, p0, Ll/fo50$a$a;->e:I

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/fo50$a$a;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/fo50$a$a;->f:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/fo50$a$a;->g:Ll/fo50$a;

    .line 9
    .line 10
    iget-object v0, v0, Ll/fo50$a;->d:Ljava/lang/Object;

    .line 11
    .line 12
    monitor-enter v0

    .line 13
    :try_start_0
    iget-object v1, p0, Ll/fo50$a$a;->g:Ll/fo50$a;

    .line 14
    .line 15
    iget-object v1, v1, Ll/fo50$a;->g:Ljava/util/Map;

    .line 16
    .line 17
    iget v2, p0, Ll/fo50$a$a;->e:I

    .line 18
    .line 19
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ll/bb50;

    .line 28
    .line 29
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-interface {v1}, Ll/bb50;->onCompleted()V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Ll/fo50$a$a;->g:Ll/fo50$a;

    .line 36
    .line 37
    iget-object v0, v0, Ll/fo50$a;->c:Ll/ft5;

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Ll/ft5;->d(Ll/kcg0;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    throw p0

    .line 46
    :cond_1
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fo50$a$a;->g:Ll/fo50$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fo50$a;->c(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD1;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/fo50$a$a;->onCompleted()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
