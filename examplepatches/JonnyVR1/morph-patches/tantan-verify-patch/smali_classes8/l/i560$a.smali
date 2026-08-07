.class public Ll/i560$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/i560;->a(Ll/gcg0;)Ll/gcg0;
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
.field public final synthetic e:Ll/i560$c;

.field public final synthetic f:Ll/i560;


# direct methods
.method public constructor <init>(Ll/i560;Ll/i560$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i560$a;->f:Ll/i560;

    .line 2
    .line 3
    iput-object p2, p0, Ll/i560$a;->e:Ll/i560$c;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 6
    .line 7
    .line 8
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
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i560$a;->e:Ll/i560$c;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/i560$c;->onCompleted()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i560$a;->e:Ll/i560$c;

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
            "(TU;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/i560$a;->e:Ll/i560$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i560$c;->g(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
