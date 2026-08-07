.class public Ll/f460$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f460;->a(Ll/gcg0;)Ll/gcg0;
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

.field public final synthetic f:Ll/gcg0;

.field public final synthetic g:Ll/f460;


# direct methods
.method public constructor <init>(Ll/f460;Ll/gcg0;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f460$a;->g:Ll/f460;

    .line 2
    .line 3
    iput-object p3, p0, Ll/f460$a;->f:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ll/gcg0;-><init>(Ll/gcg0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public f(Ll/vk90;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f460$a;->f:Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/gcg0;->f(Ll/vk90;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/f460$a;->g:Ll/f460;

    .line 7
    .line 8
    iget p0, p0, Ll/f460;->a:I

    .line 9
    .line 10
    int-to-long v0, p0

    .line 11
    invoke-interface {p1, v0, v1}, Ll/vk90;->request(J)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onCompleted()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f460$a;->f:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f460$a;->f:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
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
    iget v0, p0, Ll/f460$a;->e:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/f460$a;->g:Ll/f460;

    .line 4
    .line 5
    iget v1, v1, Ll/f460;->a:I

    .line 6
    .line 7
    if-lt v0, v1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/f460$a;->f:Ll/gcg0;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    iput v0, p0, Ll/f460$a;->e:I

    .line 18
    .line 19
    return-void
.end method
