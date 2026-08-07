.class public final Ll/ko50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ko50$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final a:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final b:Ll/rcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/rcj<",
            "TT;TT;TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/c;Ll/rcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "TT;>;",
            "Ll/rcj<",
            "TT;TT;TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ko50;->a:Lrx/c;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ko50;->b:Ll/rcj;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ko50$b;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ko50;->b:Ll/rcj;

    .line 4
    .line 5
    invoke-direct {v0, p1, v1}, Ll/ko50$b;-><init>(Ll/gcg0;Ll/rcj;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ll/ko50$a;

    .line 12
    .line 13
    invoke-direct {v1, p0, v0}, Ll/ko50$a;-><init>(Ll/ko50;Ll/ko50$b;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v1}, Ll/gcg0;->f(Ll/vk90;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/ko50;->a:Lrx/c;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ko50;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
