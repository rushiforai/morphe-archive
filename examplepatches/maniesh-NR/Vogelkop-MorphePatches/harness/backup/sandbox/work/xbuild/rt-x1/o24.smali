.class public final Lo24;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpc;

.field public final b:Ljf;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-byte v0, Ljf;->g:B

    return-void
.end method

.method public constructor <init>(Lpc;Ljf;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lo24;->a:Lpc;

    iput-object p2, p0, Lo24;->b:Ljf;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lo24;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lo24;

    iget-object v1, p0, Lo24;->a:Lpc;

    iget-object v3, p1, Lo24;->a:Lpc;

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object p0, p0, Lo24;->b:Ljf;

    iget-object p1, p1, Lo24;->b:Ljf;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    return v2

    :cond_1e
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lo24;->a:Lpc;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lo24;->b:Ljf;

    invoke-virtual {p0}, Ljf;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
