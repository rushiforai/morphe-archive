.class public final Lrx/subscriptions/RefCountSubscription$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/subscriptions/RefCountSubscription;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Z

.field public final b:I


# direct methods
.method public constructor <init>(ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lrx/subscriptions/RefCountSubscription$a;->a:Z

    .line 5
    .line 6
    iput p2, p0, Lrx/subscriptions/RefCountSubscription$a;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Lrx/subscriptions/RefCountSubscription$a;
    .locals 2

    .line 1
    new-instance v0, Lrx/subscriptions/RefCountSubscription$a;

    .line 2
    .line 3
    iget-boolean v1, p0, Lrx/subscriptions/RefCountSubscription$a;->a:Z

    .line 4
    .line 5
    iget p0, p0, Lrx/subscriptions/RefCountSubscription$a;->b:I

    .line 6
    .line 7
    add-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-direct {v0, v1, p0}, Lrx/subscriptions/RefCountSubscription$a;-><init>(ZI)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public b()Lrx/subscriptions/RefCountSubscription$a;
    .locals 2

    .line 1
    new-instance v0, Lrx/subscriptions/RefCountSubscription$a;

    .line 2
    .line 3
    iget-boolean v1, p0, Lrx/subscriptions/RefCountSubscription$a;->a:Z

    .line 4
    .line 5
    iget p0, p0, Lrx/subscriptions/RefCountSubscription$a;->b:I

    .line 6
    .line 7
    add-int/lit8 p0, p0, -0x1

    .line 8
    .line 9
    invoke-direct {v0, v1, p0}, Lrx/subscriptions/RefCountSubscription$a;-><init>(ZI)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public c()Lrx/subscriptions/RefCountSubscription$a;
    .locals 2

    .line 1
    new-instance v0, Lrx/subscriptions/RefCountSubscription$a;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iget p0, p0, Lrx/subscriptions/RefCountSubscription$a;->b:I

    .line 5
    .line 6
    invoke-direct {v0, v1, p0}, Lrx/subscriptions/RefCountSubscription$a;-><init>(ZI)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method
