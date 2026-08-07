.class public abstract Ll/ij2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k3m;
.implements Ll/s1e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V::",
        "Ll/iam;",
        ">",
        "Ljava/lang/Object;",
        "Ll/k3m<",
        "TV;>;",
        "Ll/s1e;"
    }
.end annotation


# instance fields
.field public a:Ll/iam;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field

.field public b:Ll/s1e;


# direct methods
.method public constructor <init>(Ll/s1e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ij2;->b:Ll/s1e;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C(Ll/iam;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ij2;->a:Ll/iam;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/iam;->i1(Ll/k3m;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ij2;->a:Ll/iam;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public duringCreated(Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ij2;->b:Ll/s1e;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/s1e;->duringCreated(Lrx/c;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
