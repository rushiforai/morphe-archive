.class public final Lrx/internal/operators/OperatorGroupBy$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vk90;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorGroupBy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:Lrx/internal/operators/OperatorGroupBy$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorGroupBy$c<",
            "***>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorGroupBy$c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorGroupBy$c<",
            "***>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/OperatorGroupBy$b;->a:Lrx/internal/operators/OperatorGroupBy$c;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/operators/OperatorGroupBy$b;->a:Lrx/internal/operators/OperatorGroupBy$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lrx/internal/operators/OperatorGroupBy$c;->m(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
