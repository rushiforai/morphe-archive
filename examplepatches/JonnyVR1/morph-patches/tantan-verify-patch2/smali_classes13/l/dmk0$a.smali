.class public Ll/dmk0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dmk0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public a:J

.field public b:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILl/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/y20<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/dmk0$a;->a:J

    .line 7
    .line 8
    new-instance v0, Ll/xlk0;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1, p2}, Ll/xlk0;-><init>(Ll/dmk0$a;ILl/y20;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/dmk0$a;->b:Ll/y20;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a(Ll/dmk0$a;ILl/y20;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/dmk0$a;->b(ILl/y20;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final synthetic b(ILl/y20;Ljava/lang/Object;)V
    .locals 6

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/dmk0$a;->a:J

    .line 6
    .line 7
    int-to-long v4, p1

    .line 8
    add-long/2addr v2, v4

    .line 9
    cmp-long p1, v0, v2

    .line 10
    .line 11
    if-ltz p1, :cond_0

    .line 12
    .line 13
    invoke-interface {p2, p3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide p1

    .line 20
    iput-wide p1, p0, Ll/dmk0$a;->a:J

    .line 21
    .line 22
    :cond_0
    return-void
.end method
