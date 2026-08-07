.class public final Lrx/internal/util/InternalObservableUtils$q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/util/InternalObservableUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "q"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/qcj<",
        "Lrx/c<",
        "TT;>;",
        "Lrx/c<",
        "TR;>;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "TT;>;+",
            "Lrx/c<",
            "TR;>;>;"
        }
    .end annotation
.end field

.field public final b:Ll/f2e0;


# direct methods
.method public constructor <init>(Ll/qcj;Ll/f2e0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "TT;>;+",
            "Lrx/c<",
            "TR;>;>;",
            "Ll/f2e0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/util/InternalObservableUtils$q;->a:Ll/qcj;

    .line 5
    .line 6
    iput-object p2, p0, Lrx/internal/util/InternalObservableUtils$q;->b:Ll/f2e0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/util/InternalObservableUtils$q;->a:Ll/qcj;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lrx/c;

    .line 8
    .line 9
    iget-object p0, p0, Lrx/internal/util/InternalObservableUtils$q;->b:Ll/f2e0;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lrx/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/util/InternalObservableUtils$q;->a(Lrx/c;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
