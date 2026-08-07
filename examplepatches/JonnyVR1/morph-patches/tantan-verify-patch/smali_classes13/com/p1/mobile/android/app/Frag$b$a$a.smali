.class public Lcom/p1/mobile/android/app/Frag$b$a$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/app/Frag$b$a;->g(Lcom/p1/mobile/android/app/c;)V
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
.field public final synthetic e:Lcom/p1/mobile/android/app/Frag$b$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Frag$b$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/Frag$b$a$a;->e:Lcom/p1/mobile/android/app/Frag$b$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag$b$a$a;->e:Lcom/p1/mobile/android/app/Frag$b$a;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/android/app/Frag$b$a;->f:Lcom/p1/mobile/android/app/Frag$b;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/p1/mobile/android/app/Frag$b;->d:Ljava/lang/Object;

    .line 6
    .line 7
    if-nez v2, :cond_2

    .line 8
    .line 9
    :try_start_0
    iget-object v0, v0, Lcom/p1/mobile/android/app/Frag$b$a;->e:Ll/gcg0;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/bb50;->onCompleted()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag$b$a$a;->e:Lcom/p1/mobile/android/app/Frag$b$a;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/android/app/Frag$b$a;->e:Ll/gcg0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/gcg0;->isUnsubscribed()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag$b$a$a;->e:Lcom/p1/mobile/android/app/Frag$b$a;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag$b$a;->e:Ll/gcg0;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    iget-object v1, p0, Lcom/p1/mobile/android/app/Frag$b$a$a;->e:Lcom/p1/mobile/android/app/Frag$b$a;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/android/app/Frag$b$a;->e:Ll/gcg0;

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/gcg0;->isUnsubscribed()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_1

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag$b$a$a;->e:Lcom/p1/mobile/android/app/Frag$b$a;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag$b$a;->e:Ll/gcg0;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 48
    .line 49
    .line 50
    :cond_1
    throw v0

    .line 51
    :cond_2
    const/4 p0, 0x1

    .line 52
    iput-boolean p0, v1, Lcom/p1/mobile/android/app/Frag$b;->f:Z

    .line 53
    .line 54
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag$b$a$a;->e:Lcom/p1/mobile/android/app/Frag$b$a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/android/app/Frag$b$a;->e:Ll/gcg0;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/android/app/Frag$b$a$a;->e:Lcom/p1/mobile/android/app/Frag$b$a;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/android/app/Frag$b$a;->e:Ll/gcg0;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/gcg0;->isUnsubscribed()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag$b$a$a;->e:Lcom/p1/mobile/android/app/Frag$b$a;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag$b$a;->e:Ll/gcg0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 23
    .line 24
    .line 25
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
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag$b$a$a;->e:Lcom/p1/mobile/android/app/Frag$b$a;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/android/app/Frag$b$a;->f:Lcom/p1/mobile/android/app/Frag$b;

    .line 4
    .line 5
    iget-boolean v2, v1, Lcom/p1/mobile/android/app/Frag$b;->h:Z

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    iget-boolean v2, v1, Lcom/p1/mobile/android/app/Frag$b;->e:Z

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    iput-object p1, v1, Lcom/p1/mobile/android/app/Frag$b;->d:Ljava/lang/Object;

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    :try_start_0
    iget-object v0, v0, Lcom/p1/mobile/android/app/Frag$b$a;->e:Ll/gcg0;

    .line 17
    .line 18
    invoke-interface {v0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catch_0
    move-exception p1

    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag$b$a$a;->onError(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
