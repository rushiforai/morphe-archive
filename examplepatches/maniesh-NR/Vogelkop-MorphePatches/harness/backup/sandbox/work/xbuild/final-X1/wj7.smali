.class public final Lwj7;
.super Lxj7;
.source "SourceFile"


# instance fields
.field public final a:Lpc;

.field public final b:Lpc;

.field public final c:Ltf;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget v0, Ltf;->i:I

    return-void
.end method

.method public constructor <init>(Lpc;Lpc;Ltf;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwj7;->a:Lpc;

    iput-object p2, p0, Lwj7;->b:Lpc;

    iput-object p3, p0, Lwj7;->c:Ltf;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_20

    instance-of v0, p1, Lwj7;

    if-eqz v0, :cond_1e

    check-cast p1, Lwj7;

    iget-object v0, p0, Lwj7;->a:Lpc;

    iget-object v1, p1, Lwj7;->a:Lpc;

    if-ne v0, v1, :cond_1e

    iget-object v0, p0, Lwj7;->b:Lpc;

    iget-object v1, p1, Lwj7;->b:Lpc;

    if-ne v0, v1, :cond_1e

    iget-object p0, p0, Lwj7;->c:Ltf;

    iget-object p1, p1, Lwj7;->c:Ltf;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20

    :cond_1e
    const/4 p0, 0x0

    return p0

    :cond_20
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lwj7;->a:Lpc;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    const/4 v1, 0x0

    iget-object v2, p0, Lwj7;->b:Lpc;

    if-nez v2, :cond_f

    move v2, v1

    goto :goto_13

    :cond_f
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_13
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lwj7;->c:Ltf;

    if-eqz p0, :cond_1e

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :cond_1e
    add-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
