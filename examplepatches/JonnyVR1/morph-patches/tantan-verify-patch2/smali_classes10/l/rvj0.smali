.class public Ll/rvj0;
.super Ll/ouj0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ouj0<",
        "Ll/svj0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lv/VFrame;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Lv/VFrame;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/ouj0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/svj0;

    .line 5
    .line 6
    invoke-direct {p1, p2}, Ll/svj0;-><init>(Lv/VFrame;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
