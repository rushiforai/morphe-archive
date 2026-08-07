.class public Ll/hi40;
.super Ll/j3z;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/j3z<",
        "Ll/ki40;",
        ">;"
    }
.end annotation


# instance fields
.field public final b:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ll/fi40;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j3z;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/hi40;->b:Lrx/subjects/b;

    .line 9
    .line 10
    new-instance p1, Ll/fi40;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/fi40;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/hi40;->c:Ll/fi40;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public h0()Ll/fi40;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hi40;->c:Ll/fi40;

    .line 2
    .line 3
    return-object p0
.end method

.method public i0()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hi40;->b:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public j0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hi40;->b:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
