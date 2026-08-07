.class public Ll/q360;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/q360$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "TT;TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b()Ll/q360;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/q360<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/q360$b;->INSTANCE:Ll/q360;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/q360$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/q360$a;-><init>(Ll/q360;Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/q360;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
