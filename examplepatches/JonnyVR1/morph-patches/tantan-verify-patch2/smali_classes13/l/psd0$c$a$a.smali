.class public Ll/psd0$c$a$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/psd0$c$a;->g(Landroid/util/Pair;)V
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
.field public final synthetic e:Ll/psd0$c$a;


# direct methods
.method public constructor <init>(Ll/psd0$c$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/psd0$c$a$a;->e:Ll/psd0$c$a;

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
    .locals 2

    .line 1
    iget-object p0, p0, Ll/psd0$c$a$a;->e:Ll/psd0$c$a;

    .line 2
    .line 3
    iget-object v0, p0, Ll/psd0$c$a;->f:Ll/psd0$c;

    .line 4
    .line 5
    iget-object v1, v0, Ll/psd0$c;->g:Ljava/lang/Object;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/psd0$c$a;->e:Ll/gcg0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 p0, 0x1

    .line 16
    iput-boolean p0, v0, Ll/psd0$c;->i:Z

    .line 17
    .line 18
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/psd0$c$a$a;->e:Ll/psd0$c$a;

    .line 2
    .line 3
    iget-object v0, p0, Ll/psd0$c$a;->f:Ll/psd0$c;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-object v1, v0, Ll/psd0$c;->g:Ljava/lang/Object;

    .line 7
    .line 8
    iget-object p0, p0, Ll/psd0$c$a;->e:Ll/gcg0;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/psd0$c$a$a;->e:Ll/psd0$c$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/psd0$c$a;->f:Ll/psd0$c;

    .line 4
    .line 5
    invoke-static {v0}, Ll/psd0$c;->b(Ll/psd0$c;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/psd0$c$a$a;->e:Ll/psd0$c$a;

    .line 12
    .line 13
    iget-object v0, v0, Ll/psd0$c$a;->f:Ll/psd0$c;

    .line 14
    .line 15
    iget-boolean v1, v0, Ll/psd0$c;->h:Z

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iput-object p1, v0, Ll/psd0$c;->g:Ljava/lang/Object;

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    :try_start_0
    iget-object v0, p0, Ll/psd0$c$a$a;->e:Ll/psd0$c$a;

    .line 23
    .line 24
    iget-object v0, v0, Ll/psd0$c$a;->e:Ll/gcg0;

    .line 25
    .line 26
    invoke-interface {v0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catch_0
    move-exception p1

    .line 31
    invoke-virtual {p0, p1}, Ll/psd0$c$a$a;->onError(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
