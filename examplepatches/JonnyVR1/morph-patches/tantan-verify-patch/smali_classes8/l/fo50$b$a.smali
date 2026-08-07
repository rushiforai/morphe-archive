.class public final Ll/fo50$b$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fo50$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final e:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation
.end field

.field public final f:Ll/kcg0;

.field public final synthetic g:Ll/fo50$b;


# direct methods
.method public constructor <init>(Ll/fo50$b;Ll/gcg0;Ll/kcg0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;",
            "Ll/kcg0;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/fo50$b$a;->g:Ll/fo50$b;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/gcg0;-><init>(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/fo50$b$a;->e:Ll/gcg0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/fo50$b$a;->f:Ll/kcg0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fo50$b$a;->e:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bb50;->onCompleted()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/fo50$b$a;->f:Ll/kcg0;

    .line 7
    .line 8
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fo50$b$a;->e:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/fo50$b$a;->f:Ll/kcg0;

    .line 7
    .line 8
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fo50$b$a;->e:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
