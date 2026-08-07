.class public final Ll/fo50$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fo50;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fo50$b$a;
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
.field public final a:Lrx/subscriptions/RefCountSubscription;

.field public final b:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/c;Lrx/subscriptions/RefCountSubscription;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "TT;>;",
            "Lrx/subscriptions/RefCountSubscription;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/fo50$b;->a:Lrx/subscriptions/RefCountSubscription;

    .line 5
    .line 6
    iput-object p1, p0, Ll/fo50$b;->b:Lrx/c;

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
    iget-object v0, p0, Ll/fo50$b;->a:Lrx/subscriptions/RefCountSubscription;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subscriptions/RefCountSubscription;->a()Ll/kcg0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/fo50$b$a;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1, v0}, Ll/fo50$b$a;-><init>(Ll/fo50$b;Ll/gcg0;Ll/kcg0;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/fo50$b;->b:Lrx/c;

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fo50$b;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
