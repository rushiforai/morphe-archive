.class public final Lblc;
.super Lllc;
.source "SourceFile"


# instance fields
.field public final a:Lclc;

.field public final b:J


# direct methods
.method public constructor <init>(Lclc;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lblc;->a:Lclc;

    sget-object v0, Lykc;->b:[Lykc;

    iget-object p1, p1, Lclc;->a:Lkmc;

    iget-object p1, p1, Lkmc;->a:Llmc;

    iget-wide v0, p1, Llmc;->a:J

    const-wide/high16 v2, 0x300000000000000L    # 3.13151306251402E-294

    or-long/2addr v2, v0

    iput-wide v2, p0, Lblc;->b:J

    return-void
.end method


# virtual methods
.method public final a()J
    .registers 3

    iget-wide v0, p0, Lblc;->b:J

    return-wide v0
.end method

.method public final b(Lllc;)Z
    .registers 3

    instance-of v0, p1, Lblc;

    if-eqz v0, :cond_12

    check-cast p1, Lblc;

    iget-object p1, p1, Lblc;->a:Lclc;

    iget-object p0, p0, Lblc;->a:Lclc;

    invoke-virtual {p0, p1}, Lclc;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method
