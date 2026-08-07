.class public Ll/o460$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/o460;->a(Ll/gcg0;)Ll/gcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public e:I

.field public f:Z

.field public final synthetic g:Ll/gcg0;

.field public final synthetic h:Ll/o460;


# direct methods
.method public constructor <init>(Ll/o460;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o460$a;->h:Ll/o460;

    .line 2
    .line 3
    iput-object p2, p0, Ll/o460$a;->g:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public f(Ll/vk90;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o460$a;->g:Ll/gcg0;

    .line 2
    .line 3
    new-instance v1, Ll/o460$a$a;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/o460$a$a;-><init>(Ll/o460$a;Ll/vk90;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/gcg0;->f(Ll/vk90;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/o460$a;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/o460$a;->f:Z

    .line 7
    .line 8
    iget-object p0, p0, Ll/o460$a;->g:Ll/gcg0;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/o460$a;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/o460$a;->f:Z

    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Ll/o460$a;->g:Ll/gcg0;

    .line 9
    .line 10
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p1

    .line 18
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 19
    .line 20
    .line 21
    throw p1

    .line 22
    :cond_0
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/gcg0;->isUnsubscribed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget v0, p0, Ll/o460$a;->e:I

    .line 8
    .line 9
    add-int/lit8 v1, v0, 0x1

    .line 10
    .line 11
    iput v1, p0, Ll/o460$a;->e:I

    .line 12
    .line 13
    iget-object v2, p0, Ll/o460$a;->h:Ll/o460;

    .line 14
    .line 15
    iget v2, v2, Ll/o460;->a:I

    .line 16
    .line 17
    if-ge v0, v2, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    if-ne v1, v2, :cond_0

    .line 21
    .line 22
    move v1, v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v1, 0x0

    .line 25
    :goto_0
    iget-object v2, p0, Ll/o460$a;->g:Ll/gcg0;

    .line 26
    .line 27
    invoke-interface {v2, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    iget-boolean p1, p0, Ll/o460$a;->f:Z

    .line 33
    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    iput-boolean v0, p0, Ll/o460$a;->f:Z

    .line 37
    .line 38
    :try_start_0
    iget-object p1, p0, Ll/o460$a;->g:Ll/gcg0;

    .line 39
    .line 40
    invoke-interface {p1}, Ll/bb50;->onCompleted()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :catchall_0
    move-exception p1

    .line 48
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 49
    .line 50
    .line 51
    throw p1

    .line 52
    :cond_1
    return-void
.end method
