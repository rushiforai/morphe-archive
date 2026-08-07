.class public Ll/no50$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/no50;->a(Ll/oqf0;)V
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

.field public f:Z

.field public g:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public final synthetic h:Ll/oqf0;

.field public final synthetic i:Ll/no50;


# direct methods
.method public constructor <init>(Ll/no50;Ll/oqf0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/no50$a;->i:Ll/no50;

    .line 2
    .line 3
    iput-object p2, p0, Ll/no50$a;->h:Ll/oqf0;

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
    const-wide/16 v0, 0x2

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Ll/gcg0;->e(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onCompleted()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/no50$a;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v0, p0, Ll/no50$a;->f:Z

    .line 7
    .line 8
    iget-object v1, p0, Ll/no50$a;->h:Ll/oqf0;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Ll/no50$a;->g:Ljava/lang/Object;

    .line 13
    .line 14
    invoke-virtual {v1, p0}, Ll/oqf0;->c(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 19
    .line 20
    const-string v0, "Observable emitted no items"

    .line 21
    .line 22
    invoke-direct {p0, v0}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, p0}, Ll/oqf0;->b(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/no50$a;->h:Ll/oqf0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/oqf0;->b(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

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
    iget-boolean v0, p0, Ll/no50$a;->f:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Ll/no50$a;->e:Z

    .line 7
    .line 8
    iget-object p1, p0, Ll/no50$a;->h:Ll/oqf0;

    .line 9
    .line 10
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 11
    .line 12
    const-string v1, "Observable emitted too many elements"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ll/oqf0;->b(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iput-boolean v1, p0, Ll/no50$a;->f:Z

    .line 25
    .line 26
    iput-object p1, p0, Ll/no50$a;->g:Ljava/lang/Object;

    .line 27
    .line 28
    return-void
.end method
