.class public Ll/j360$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/j360;->a(Ll/gcg0;)Ll/gcg0;
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
.field public e:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "TU;>;"
        }
    .end annotation
.end field

.field public final synthetic f:Ll/gcg0;

.field public final synthetic g:Ll/j360;


# direct methods
.method public constructor <init>(Ll/j360;Ll/gcg0;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j360$a;->g:Ll/j360;

    .line 2
    .line 3
    iput-object p3, p0, Ll/j360$a;->f:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ll/gcg0;-><init>(Ll/gcg0;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ljava/util/HashSet;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/j360$a;->e:Ljava/util/Set;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/j360$a;->e:Ljava/util/Set;

    .line 3
    .line 4
    iget-object p0, p0, Ll/j360$a;->f:Ll/gcg0;

    .line 5
    .line 6
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/j360$a;->e:Ljava/util/Set;

    .line 3
    .line 4
    iget-object p0, p0, Ll/j360$a;->f:Ll/gcg0;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
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
    iget-object v0, p0, Ll/j360$a;->g:Ll/j360;

    .line 2
    .line 3
    iget-object v0, v0, Ll/j360;->a:Ll/qcj;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/j360$a;->e:Ljava/util/Set;

    .line 10
    .line 11
    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/j360$a;->f:Ll/gcg0;

    .line 18
    .line 19
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-wide/16 v0, 0x1

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Ll/gcg0;->e(J)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
