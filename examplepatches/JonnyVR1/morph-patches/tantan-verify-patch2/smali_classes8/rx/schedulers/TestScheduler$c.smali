.class public final Lrx/schedulers/TestScheduler$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/schedulers/TestScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# instance fields
.field public final a:J

.field public final b:Ll/x20;

.field public final c:Ll/f2e0$a;

.field public final d:J


# direct methods
.method public constructor <init>(Ll/f2e0$a;JLl/x20;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-wide v0, Lrx/schedulers/TestScheduler;->d:J

    .line 5
    .line 6
    const-wide/16 v2, 0x1

    .line 7
    .line 8
    add-long/2addr v2, v0

    .line 9
    sput-wide v2, Lrx/schedulers/TestScheduler;->d:J

    .line 10
    .line 11
    iput-wide v0, p0, Lrx/schedulers/TestScheduler$c;->d:J

    .line 12
    .line 13
    iput-wide p2, p0, Lrx/schedulers/TestScheduler$c;->a:J

    .line 14
    .line 15
    iput-object p4, p0, Lrx/schedulers/TestScheduler$c;->b:Ll/x20;

    .line 16
    .line 17
    iput-object p1, p0, Lrx/schedulers/TestScheduler$c;->c:Ll/f2e0$a;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic a(Lrx/schedulers/TestScheduler$c;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lrx/schedulers/TestScheduler$c;->d:J

    .line 2
    .line 3
    return-wide v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-wide v0, p0, Lrx/schedulers/TestScheduler$c;->a:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lrx/schedulers/TestScheduler$c;->b:Ll/x20;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "TimedAction(time = %d, action = %s)"

    .line 18
    .line 19
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method
