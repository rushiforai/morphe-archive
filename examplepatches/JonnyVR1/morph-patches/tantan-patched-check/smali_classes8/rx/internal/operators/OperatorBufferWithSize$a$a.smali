.class public Lrx/internal/operators/OperatorBufferWithSize$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vk90;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorBufferWithSize$a;->h()Ll/vk90;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lrx/internal/operators/OperatorBufferWithSize$a;


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorBufferWithSize$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/operators/OperatorBufferWithSize$a$a;->a:Lrx/internal/operators/OperatorBufferWithSize$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_1

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lrx/internal/operators/OperatorBufferWithSize$a$a;->a:Lrx/internal/operators/OperatorBufferWithSize$a;

    .line 10
    .line 11
    iget v0, v0, Lrx/internal/operators/OperatorBufferWithSize$a;->f:I

    .line 12
    .line 13
    int-to-long v0, v0

    .line 14
    invoke-static {p1, p2, v0, v1}, Ll/rc2;->c(JJ)J

    .line 15
    .line 16
    .line 17
    move-result-wide p1

    .line 18
    iget-object p0, p0, Lrx/internal/operators/OperatorBufferWithSize$a$a;->a:Lrx/internal/operators/OperatorBufferWithSize$a;

    .line 19
    .line 20
    invoke-static {p0, p1, p2}, Lrx/internal/operators/OperatorBufferWithSize$a;->g(Lrx/internal/operators/OperatorBufferWithSize$a;J)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void

    .line 24
    :cond_1
    const-string p0, "n >= required but it was "

    .line 25
    .line 26
    invoke-static {p0, p1, p2}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
