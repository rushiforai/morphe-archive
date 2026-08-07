.class public Lrx/internal/operators/BufferUntilSubscriber$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/BufferUntilSubscriber$b;->a(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lrx/internal/operators/BufferUntilSubscriber$b;


# direct methods
.method public constructor <init>(Lrx/internal/operators/BufferUntilSubscriber$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/operators/BufferUntilSubscriber$b$a;->a:Lrx/internal/operators/BufferUntilSubscriber$b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .line 1
    iget-object p0, p0, Lrx/internal/operators/BufferUntilSubscriber$b$a;->a:Lrx/internal/operators/BufferUntilSubscriber$b;

    .line 2
    .line 3
    iget-object p0, p0, Lrx/internal/operators/BufferUntilSubscriber$b;->a:Lrx/internal/operators/BufferUntilSubscriber$State;

    .line 4
    .line 5
    sget-object v0, Lrx/internal/operators/BufferUntilSubscriber;->c:Ll/bb50;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
