.class public final Lbe;
.super Lfe;
.source "SourceFile"


# instance fields
.field public final a:Lu3l;

.field public final b:Ljava/util/List;

.field public final c:Llxh;

.field public final d:Lrxh;


# direct methods
.method public constructor <init>(Lu3l;)V
    .registers 3

    sget-object v0, Ll08;->a:Ll08;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbe;->a:Lu3l;

    iput-object v0, p0, Lbe;->b:Ljava/util/List;

    new-instance p1, Llxh;

    const v0, 0x7f0805eb

    invoke-direct {p1, v0}, Llxh;-><init>(I)V

    iput-object p1, p0, Lbe;->c:Llxh;

    new-instance p1, Lrxh;

    const v0, 0x7f140f24

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    iput-object p1, p0, Lbe;->d:Lrxh;

    return-void
.end method


# virtual methods
.method public final a()Lb8h;
    .registers 1

    iget-object p0, p0, Lbe;->c:Llxh;

    return-object p0
.end method

.method public final b()Lpxh;
    .registers 1

    iget-object p0, p0, Lbe;->d:Lrxh;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lbe;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lbe;

    iget-object v1, p0, Lbe;->a:Lu3l;

    iget-object v3, p1, Lbe;->a:Lu3l;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object p0, p0, Lbe;->b:Ljava/util/List;

    iget-object p1, p1, Lbe;->b:Ljava/util/List;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    return v2

    :cond_22
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lbe;->a:Lu3l;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lbe;->b:Ljava/util/List;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
