.class public final Ll/x460;
.super Ll/y460;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/y460<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(JLjava/util/concurrent/TimeUnit;Lrx/c;Ll/f2e0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/c<",
            "+TT;>;",
            "Ll/f2e0;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/x460$a;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3}, Ll/x460$a;-><init>(JLjava/util/concurrent/TimeUnit;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/x460$b;

    .line 7
    .line 8
    invoke-direct {v1, p1, p2, p3}, Ll/x460$b;-><init>(JLjava/util/concurrent/TimeUnit;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0, v1, p4, p5}, Ll/y460;-><init>(Ll/y460$a;Ll/y460$b;Lrx/c;Ll/f2e0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/gcg0;)Ll/gcg0;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/y460;->a(Ll/gcg0;)Ll/gcg0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
