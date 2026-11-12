.class public final Ljlc;
.super Lllc;
.source "SourceFile"


# instance fields
.field public final a:Lklc;

.field public final b:J


# direct methods
.method public constructor <init>(Lklc;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljlc;->a:Lklc;

    sget-object v0, Lykc;->b:[Lykc;

    iget-object p1, p1, Lklc;->a:Lwmc;

    iget-object p1, p1, Lwmc;->a:Llmc;

    iget-wide v0, p1, Llmc;->a:J

    iput-wide v0, p0, Ljlc;->b:J

    return-void
.end method


# virtual methods
.method public final a()J
    .registers 3

    iget-wide v0, p0, Ljlc;->b:J

    return-wide v0
.end method

.method public final b(Lllc;)Z
    .registers 3

    instance-of v0, p1, Ljlc;

    if-eqz v0, :cond_12

    check-cast p1, Ljlc;

    iget-object p1, p1, Ljlc;->a:Lklc;

    iget-object p0, p0, Ljlc;->a:Lklc;

    invoke-virtual {p0, p1}, Lklc;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method
