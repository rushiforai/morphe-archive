.class public Ll/z460;
.super Ll/y460;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ll/y460<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/pcj;Ll/qcj;Lrx/c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "+",
            "Lrx/c<",
            "TU;>;>;",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "TV;>;>;",
            "Lrx/c<",
            "+TT;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/z460$a;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/z460$a;-><init>(Ll/pcj;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/z460$b;

    .line 7
    .line 8
    invoke-direct {p1, p2}, Ll/z460$b;-><init>(Ll/qcj;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lrx/schedulers/Schedulers;->immediate()Ll/f2e0;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-direct {p0, v0, p1, p3, p2}, Ll/y460;-><init>(Ll/y460$a;Ll/y460$b;Lrx/c;Ll/f2e0;)V

    .line 16
    .line 17
    .line 18
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
