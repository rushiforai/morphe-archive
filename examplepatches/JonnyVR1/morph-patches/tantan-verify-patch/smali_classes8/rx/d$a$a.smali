.class public Lrx/d$a$a;
.super Ll/oqf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/d$a;->a(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/oqf0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final synthetic b:Lrx/internal/producers/SingleDelayedProducer;

.field public final synthetic c:Ll/gcg0;

.field public final synthetic d:Lrx/d$a;


# direct methods
.method public constructor <init>(Lrx/d$a;Lrx/internal/producers/SingleDelayedProducer;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/d$a$a;->d:Lrx/d$a;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/d$a$a;->b:Lrx/internal/producers/SingleDelayedProducer;

    .line 4
    .line 5
    iput-object p3, p0, Lrx/d$a$a;->c:Ll/gcg0;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/oqf0;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/d$a$a;->c:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lrx/d$a$a;->b:Lrx/internal/producers/SingleDelayedProducer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/producers/SingleDelayedProducer;->setValue(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
