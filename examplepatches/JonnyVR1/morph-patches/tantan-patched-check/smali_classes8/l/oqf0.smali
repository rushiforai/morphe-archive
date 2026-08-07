.class public abstract Ll/oqf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kcg0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/kcg0;"
    }
.end annotation


# instance fields
.field public final a:Ll/ocg0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ocg0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ocg0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/oqf0;->a:Ll/ocg0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a(Ll/kcg0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oqf0;->a:Ll/ocg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ocg0;->a(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public abstract b(Ljava/lang/Throwable;)V
.end method

.method public abstract c(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public final isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oqf0;->a:Ll/ocg0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ocg0;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final unsubscribe()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oqf0;->a:Ll/ocg0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ocg0;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
