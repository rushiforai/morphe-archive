.class public Ll/g360$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g360;->a(Ll/gcg0;)Ll/gcg0;
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
.field public e:Z

.field public final synthetic f:Ll/f2e0$a;

.field public final synthetic g:Ll/gcg0;

.field public final synthetic h:Ll/g360;


# direct methods
.method public constructor <init>(Ll/g360;Ll/gcg0;Ll/f2e0$a;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g360$a;->h:Ll/g360;

    .line 2
    .line 3
    iput-object p3, p0, Ll/g360$a;->f:Ll/f2e0$a;

    .line 4
    .line 5
    iput-object p4, p0, Ll/g360$a;->g:Ll/gcg0;

    .line 6
    .line 7
    invoke-direct {p0, p2}, Ll/gcg0;-><init>(Ll/gcg0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/g360$a;->f:Ll/f2e0$a;

    .line 2
    .line 3
    new-instance v1, Ll/g360$a$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/g360$a$a;-><init>(Ll/g360$a;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/g360$a;->h:Ll/g360;

    .line 9
    .line 10
    iget-wide v2, p0, Ll/g360;->a:J

    .line 11
    .line 12
    iget-object p0, p0, Ll/g360;->b:Ljava/util/concurrent/TimeUnit;

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2, v3, p0}, Ll/f2e0$a;->c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g360$a;->f:Ll/f2e0$a;

    .line 2
    .line 3
    new-instance v1, Ll/g360$a$b;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/g360$a$b;-><init>(Ll/g360$a;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/f2e0$a;->b(Ll/x20;)Ll/kcg0;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/g360$a;->f:Ll/f2e0$a;

    .line 2
    .line 3
    new-instance v1, Ll/g360$a$c;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/g360$a$c;-><init>(Ll/g360$a;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/g360$a;->h:Ll/g360;

    .line 9
    .line 10
    iget-wide v2, p0, Ll/g360;->a:J

    .line 11
    .line 12
    iget-object p0, p0, Ll/g360;->b:Ljava/util/concurrent/TimeUnit;

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2, v3, p0}, Ll/f2e0$a;->c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method
