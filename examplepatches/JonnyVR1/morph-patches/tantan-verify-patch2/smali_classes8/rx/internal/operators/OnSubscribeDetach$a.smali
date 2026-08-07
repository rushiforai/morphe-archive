.class public final Lrx/internal/operators/OnSubscribeDetach$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vk90;
.implements Ll/kcg0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OnSubscribeDetach;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/vk90;",
        "Ll/kcg0;"
    }
.end annotation


# instance fields
.field public final a:Lrx/internal/operators/OnSubscribeDetach$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OnSubscribeDetach$b<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/internal/operators/OnSubscribeDetach$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OnSubscribeDetach$b<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/OnSubscribeDetach$a;->a:Lrx/internal/operators/OnSubscribeDetach$b;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/operators/OnSubscribeDetach$a;->a:Lrx/internal/operators/OnSubscribeDetach$b;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gcg0;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public request(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/operators/OnSubscribeDetach$a;->a:Lrx/internal/operators/OnSubscribeDetach$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lrx/internal/operators/OnSubscribeDetach$b;->g(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public unsubscribe()V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/operators/OnSubscribeDetach$a;->a:Lrx/internal/operators/OnSubscribeDetach$b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/internal/operators/OnSubscribeDetach$b;->h()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
