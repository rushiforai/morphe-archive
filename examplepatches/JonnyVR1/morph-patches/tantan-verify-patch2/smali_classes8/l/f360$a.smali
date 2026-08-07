.class public Ll/f360$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f360;->a(Ll/gcg0;)Ll/gcg0;
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
.field public final e:Ll/f360$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/f360$b<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final f:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "*>;"
        }
    .end annotation
.end field

.field public final synthetic g:Ll/wqe0;

.field public final synthetic h:Ll/f2e0$a;

.field public final synthetic i:Ll/are0;

.field public final synthetic j:Ll/f360;


# direct methods
.method public constructor <init>(Ll/f360;Ll/gcg0;Ll/wqe0;Ll/f2e0$a;Ll/are0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f360$a;->j:Ll/f360;

    .line 2
    .line 3
    iput-object p3, p0, Ll/f360$a;->g:Ll/wqe0;

    .line 4
    .line 5
    iput-object p4, p0, Ll/f360$a;->h:Ll/f2e0$a;

    .line 6
    .line 7
    iput-object p5, p0, Ll/f360$a;->i:Ll/are0;

    .line 8
    .line 9
    invoke-direct {p0, p2}, Ll/gcg0;-><init>(Ll/gcg0;)V

    .line 10
    .line 11
    .line 12
    new-instance p1, Ll/f360$b;

    .line 13
    .line 14
    invoke-direct {p1}, Ll/f360$b;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/f360$a;->e:Ll/f360$b;

    .line 18
    .line 19
    iput-object p0, p0, Ll/f360$a;->f:Ll/gcg0;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public d()V
    .locals 2

    .line 1
    const-wide v0, 0x7fffffffffffffffL

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0, v1}, Ll/gcg0;->e(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onCompleted()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f360$a;->e:Ll/f360$b;

    .line 2
    .line 3
    iget-object v1, p0, Ll/f360$a;->i:Ll/are0;

    .line 4
    .line 5
    invoke-virtual {v0, v1, p0}, Ll/f360$b;->c(Ll/gcg0;Ll/gcg0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f360$a;->i:Ll/are0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/are0;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/f360$a;->e:Ll/f360$b;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/f360$b;->a()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/f360$a;->e:Ll/f360$b;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/f360$b;->d(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Ll/f360$a;->g:Ll/wqe0;

    .line 8
    .line 9
    iget-object v1, p0, Ll/f360$a;->h:Ll/f2e0$a;

    .line 10
    .line 11
    new-instance v2, Ll/f360$a$a;

    .line 12
    .line 13
    invoke-direct {v2, p0, p1}, Ll/f360$a$a;-><init>(Ll/f360$a;I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/f360$a;->j:Ll/f360;

    .line 17
    .line 18
    iget-wide v3, p0, Ll/f360;->a:J

    .line 19
    .line 20
    iget-object p0, p0, Ll/f360;->b:Ljava/util/concurrent/TimeUnit;

    .line 21
    .line 22
    invoke-virtual {v1, v2, v3, v4, p0}, Ll/f2e0$a;->c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Ll/wqe0;->b(Ll/kcg0;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
