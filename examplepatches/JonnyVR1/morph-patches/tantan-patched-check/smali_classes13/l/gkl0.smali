.class public interface abstract Ll/gkl0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/gkl0$b;,
        Ll/gkl0$c;
    }
.end annotation


# virtual methods
.method public abstract a(JLl/gkl0$c;II)V
.end method

.method public abstract b(JI)V
.end method

.method public c(JLl/gkl0$b;II)V
    .locals 1

    .line 1
    move-object v0, p3

    .line 2
    new-instance p3, Ll/gkl0$a;

    .line 3
    .line 4
    invoke-direct {p3, p0, v0}, Ll/gkl0$a;-><init>(Ll/gkl0;Ll/gkl0$b;)V

    .line 5
    .line 6
    .line 7
    invoke-interface/range {p0 .. p5}, Ll/gkl0;->a(JLl/gkl0$c;II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
