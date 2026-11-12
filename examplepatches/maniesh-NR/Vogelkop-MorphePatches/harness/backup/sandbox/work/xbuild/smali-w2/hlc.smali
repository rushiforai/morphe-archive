.class public final Lhlc;
.super Lllc;
.source "SourceFile"


# instance fields
.field public final a:Lilc;

.field public final b:J


# direct methods
.method public constructor <init>(Lilc;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhlc;->a:Lilc;

    sget-object v0, Lykc;->b:[Lykc;

    iget-object p1, p1, Lilc;->a:Lqmc;

    iget-object p1, p1, Lqmc;->a:Llmc;

    iget-wide v0, p1, Llmc;->a:J

    const-wide/high16 v2, 0x100000000000000L

    or-long/2addr v2, v0

    iput-wide v2, p0, Lhlc;->b:J

    return-void
.end method


# virtual methods
.method public final a()J
    .registers 3

    iget-wide v0, p0, Lhlc;->b:J

    return-wide v0
.end method

.method public final b(Lllc;)Z
    .registers 3

    instance-of v0, p1, Lhlc;

    if-eqz v0, :cond_12

    check-cast p1, Lhlc;

    iget-object p1, p1, Lhlc;->a:Lilc;

    iget-object p0, p0, Lhlc;->a:Lilc;

    invoke-virtual {p0, p1}, Lilc;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method
