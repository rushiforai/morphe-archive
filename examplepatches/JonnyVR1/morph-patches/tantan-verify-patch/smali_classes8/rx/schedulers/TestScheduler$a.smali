.class public final Lrx/schedulers/TestScheduler$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/schedulers/TestScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lrx/schedulers/TestScheduler$c;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lrx/schedulers/TestScheduler$c;Lrx/schedulers/TestScheduler$c;)I
    .locals 7

    .line 1
    iget-wide v0, p1, Lrx/schedulers/TestScheduler$c;->a:J

    .line 2
    .line 3
    iget-wide v2, p2, Lrx/schedulers/TestScheduler$c;->a:J

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    const/4 v4, 0x0

    .line 8
    const/4 v5, 0x1

    .line 9
    const/4 v6, -0x1

    .line 10
    if-nez p0, :cond_2

    .line 11
    .line 12
    invoke-static {p1}, Lrx/schedulers/TestScheduler$c;->a(Lrx/schedulers/TestScheduler$c;)J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    invoke-static {p2}, Lrx/schedulers/TestScheduler$c;->a(Lrx/schedulers/TestScheduler$c;)J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    cmp-long p0, v0, v2

    .line 21
    .line 22
    if-gez p0, :cond_0

    .line 23
    .line 24
    return v6

    .line 25
    :cond_0
    invoke-static {p1}, Lrx/schedulers/TestScheduler$c;->a(Lrx/schedulers/TestScheduler$c;)J

    .line 26
    .line 27
    .line 28
    move-result-wide p0

    .line 29
    invoke-static {p2}, Lrx/schedulers/TestScheduler$c;->a(Lrx/schedulers/TestScheduler$c;)J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    cmp-long p0, p0, v0

    .line 34
    .line 35
    if-lez p0, :cond_1

    .line 36
    .line 37
    return v5

    .line 38
    :cond_1
    return v4

    .line 39
    :cond_2
    cmp-long p0, v0, v2

    .line 40
    .line 41
    if-gez p0, :cond_3

    .line 42
    .line 43
    return v6

    .line 44
    :cond_3
    cmp-long p0, v0, v2

    .line 45
    .line 46
    if-lez p0, :cond_4

    .line 47
    .line 48
    return v5

    .line 49
    :cond_4
    return v4
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lrx/schedulers/TestScheduler$c;

    .line 2
    .line 3
    check-cast p2, Lrx/schedulers/TestScheduler$c;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lrx/schedulers/TestScheduler$a;->a(Lrx/schedulers/TestScheduler$c;Lrx/schedulers/TestScheduler$c;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
