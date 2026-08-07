.class public final Lrx/subjects/UnicastSubject;
.super Ll/wbg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/subjects/UnicastSubject$State;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/wbg0<",
        "TT;TT;>;"
    }
.end annotation


# instance fields
.field public final a:Lrx/subjects/UnicastSubject$State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/UnicastSubject$State<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/subjects/UnicastSubject$State;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/subjects/UnicastSubject$State<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/wbg0;-><init>(Lrx/c$a;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/subjects/UnicastSubject;->a:Lrx/subjects/UnicastSubject$State;

    .line 5
    .line 6
    return-void
.end method

.method public static b()Lrx/subjects/UnicastSubject;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/subjects/UnicastSubject<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    invoke-static {v0}, Lrx/subjects/UnicastSubject;->c(I)Lrx/subjects/UnicastSubject;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static c(I)Lrx/subjects/UnicastSubject;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)",
            "Lrx/subjects/UnicastSubject<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/subjects/UnicastSubject$State;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lrx/subjects/UnicastSubject$State;-><init>(ILl/x20;)V

    .line 5
    .line 6
    .line 7
    new-instance p0, Lrx/subjects/UnicastSubject;

    .line 8
    .line 9
    invoke-direct {p0, v0}, Lrx/subjects/UnicastSubject;-><init>(Lrx/subjects/UnicastSubject$State;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public static d(ILl/x20;)Lrx/subjects/UnicastSubject;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I",
            "Ll/x20;",
            ")",
            "Lrx/subjects/UnicastSubject<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/subjects/UnicastSubject$State;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lrx/subjects/UnicastSubject$State;-><init>(ILl/x20;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Lrx/subjects/UnicastSubject;

    .line 7
    .line 8
    invoke-direct {p0, v0}, Lrx/subjects/UnicastSubject;-><init>(Lrx/subjects/UnicastSubject$State;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method


# virtual methods
.method public onCompleted()V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/subjects/UnicastSubject;->a:Lrx/subjects/UnicastSubject$State;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/UnicastSubject$State;->onCompleted()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/subjects/UnicastSubject;->a:Lrx/subjects/UnicastSubject$State;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/UnicastSubject$State;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
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
    iget-object p0, p0, Lrx/subjects/UnicastSubject;->a:Lrx/subjects/UnicastSubject$State;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/UnicastSubject$State;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
