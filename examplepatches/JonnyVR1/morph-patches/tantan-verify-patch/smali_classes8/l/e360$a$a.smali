.class public Ll/e360$a$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/e360$a;->onNext(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TU;>;"
    }
.end annotation


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ll/e360$a;


# direct methods
.method public constructor <init>(Ll/e360$a;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e360$a$a;->f:Ll/e360$a;

    .line 2
    .line 3
    iput p2, p0, Ll/e360$a$a;->e:I

    .line 4
    .line 5
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e360$a$a;->f:Ll/e360$a;

    .line 2
    .line 3
    iget-object v1, v0, Ll/e360$a;->e:Ll/f360$b;

    .line 4
    .line 5
    iget v2, p0, Ll/e360$a$a;->e:I

    .line 6
    .line 7
    iget-object v3, v0, Ll/e360$a;->g:Ll/are0;

    .line 8
    .line 9
    iget-object v0, v0, Ll/e360$a;->f:Ll/gcg0;

    .line 10
    .line 11
    invoke-virtual {v1, v2, v3, v0}, Ll/f360$b;->b(ILl/gcg0;Ll/gcg0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e360$a$a;->f:Ll/e360$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/e360$a;->f:Ll/gcg0;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TU;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/e360$a$a;->onCompleted()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
