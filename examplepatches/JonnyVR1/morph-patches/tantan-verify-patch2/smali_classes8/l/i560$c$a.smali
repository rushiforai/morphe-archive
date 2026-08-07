.class public Ll/i560$c$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/i560$c;->g(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public e:Z

.field public final synthetic f:Ll/i560$b;

.field public final synthetic g:Ll/i560$c;


# direct methods
.method public constructor <init>(Ll/i560$c;Ll/i560$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i560$c$a;->g:Ll/i560$c;

    .line 2
    .line 3
    iput-object p2, p0, Ll/i560$c$a;->f:Ll/i560$b;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Ll/i560$c$a;->e:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/i560$c$a;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/i560$c$a;->e:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/i560$c$a;->g:Ll/i560$c;

    .line 9
    .line 10
    iget-object v1, p0, Ll/i560$c$a;->f:Ll/i560$b;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/i560$c;->i(Ll/i560$b;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/i560$c$a;->g:Ll/i560$c;

    .line 16
    .line 17
    iget-object v0, v0, Ll/i560$c;->f:Ll/ft5;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ll/ft5;->d(Ll/kcg0;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i560$c$a;->g:Ll/i560$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i560$c;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/i560$c$a;->onCompleted()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
