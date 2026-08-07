.class public final Ll/m460;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/m460$c;,
        Ll/m460$d;,
        Ll/m460$b;,
        Ll/m460$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "TT;",
        "Lrx/c<",
        "+TT;>;>;"
    }
.end annotation


# instance fields
.field public final a:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/m460;->a:Z

    .line 5
    .line 6
    return-void
.end method

.method public static b(Z)Ll/m460;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(Z)",
            "Ll/m460<",
            "TT;>;"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Ll/m460$b;->INSTANCE:Ll/m460;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    sget-object p0, Ll/m460$a;->INSTANCE:Ll/m460;

    .line 7
    .line 8
    return-object p0
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
            "-",
            "Lrx/c<",
            "+TT;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/m460$d;

    .line 2
    .line 3
    iget-boolean p0, p0, Ll/m460;->a:Z

    .line 4
    .line 5
    invoke-direct {v0, p1, p0}, Ll/m460$d;-><init>(Ll/gcg0;Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ll/m460$d;->n()V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m460;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
