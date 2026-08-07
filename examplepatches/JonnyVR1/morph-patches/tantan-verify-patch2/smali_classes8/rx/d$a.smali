.class public Lrx/d$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/d;-><init>(Lrx/d$b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lrx/d$b;

.field public final synthetic b:Lrx/d;


# direct methods
.method public constructor <init>(Lrx/d;Lrx/d$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/d$a;->b:Lrx/d;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/d$a;->a:Lrx/d$b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
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
    new-instance v0, Lrx/internal/producers/SingleDelayedProducer;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lrx/internal/producers/SingleDelayedProducer;-><init>(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Lrx/d$a$a;

    .line 10
    .line 11
    invoke-direct {v1, p0, v0, p1}, Lrx/d$a$a;-><init>(Lrx/d$a;Lrx/internal/producers/SingleDelayedProducer;Ll/gcg0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lrx/d$a;->a:Lrx/d$b;

    .line 18
    .line 19
    invoke-interface {p0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/d$a;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
