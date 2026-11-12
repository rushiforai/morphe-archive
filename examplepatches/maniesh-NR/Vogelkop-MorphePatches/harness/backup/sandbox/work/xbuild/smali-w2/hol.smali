.class public final Lhol;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lfol;

.field public final b:Lbwg;

.field public final c:Lzyk;

.field public final d:Lzyk;

.field public final e:Lzyk;


# direct methods
.method public constructor <init>(Lfol;Lbwg;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhol;->a:Lfol;

    iput-object p2, p0, Lhol;->b:Lbwg;

    new-instance p1, Lgol;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lgol;-><init>(Lhol;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lhol;->c:Lzyk;

    new-instance p1, Lgol;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lgol;-><init>(Lhol;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lhol;->d:Lzyk;

    new-instance p1, Lgol;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Lgol;-><init>(Lhol;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lhol;->e:Lzyk;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1e

    instance-of v0, p1, Lhol;

    if-eqz v0, :cond_1c

    check-cast p1, Lhol;

    iget-object v0, p0, Lhol;->a:Lfol;

    iget-object v1, p1, Lhol;->a:Lfol;

    invoke-virtual {v0, v1}, Lfol;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object p0, p0, Lhol;->b:Lbwg;

    iget-object p1, p1, Lhol;->b:Lbwg;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    :cond_1c
    const/4 p0, 0x0

    return p0

    :cond_1e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lhol;->a:Lfol;

    invoke-virtual {v0}, Lfol;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lhol;->b:Lbwg;

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
