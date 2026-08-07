.class public final Ll/p460;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/p460$b;
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


# instance fields
.field public final a:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-ltz p1, :cond_0

    .line 5
    .line 6
    iput p1, p0, Ll/p460;->a:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "count cannot be negative"

    .line 10
    .line 11
    invoke-static {p0}, Ll/kym;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    throw p0
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 2
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
    new-instance v0, Ll/p460$b;

    .line 2
    .line 3
    iget v1, p0, Ll/p460;->a:I

    .line 4
    .line 5
    invoke-direct {v0, p1, v1}, Ll/p460$b;-><init>(Ll/gcg0;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ll/p460$a;

    .line 12
    .line 13
    invoke-direct {v1, p0, v0}, Ll/p460$a;-><init>(Ll/p460;Ll/p460$b;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v1}, Ll/gcg0;->f(Ll/vk90;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p460;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
