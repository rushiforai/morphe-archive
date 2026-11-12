.class public final La2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll2;


# static fields
.field public static final b:La2;

.field public static final c:Ls15;

.field public static final d:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, La2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, La2;->b:La2;

    const-class v0, Lwv;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    sput-object v0, La2;->c:Ls15;

    const-string v0, "address"

    sput-object v0, La2;->d:Ljava/lang/String;

    return-void
.end method

.method public static f(Lwv;)Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Lle3;->b:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x40

    if-gt v0, v1, :cond_f

    invoke-static {v1, p0}, Lkotlin/text/StringsKt;->S(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_f
    const-string v0, "Can\'t pad \'"

    const-string v1, "\' as it\'s longer than 64 already."

    invoke-static {v0, p0, v1}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lbxl;->d(Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final a()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final b(Ljava/lang/String;)Lz1;
    .registers 4

    const/16 p0, 0x40

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lz1;

    sget-object v1, Lwv;->Companion:Luv;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Luv;->b(Ljava/lang/String;)Lwv;

    move-result-object p1

    invoke-direct {v0, p1, p0}, Lz1;-><init>(Ljava/lang/Object;I)V

    return-object v0
.end method

.method public final c(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    check-cast p1, Lwv;

    invoke-static {p1}, La2;->f(Lwv;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final d()Ls15;
    .registers 1

    sget-object p0, La2;->c:Ls15;

    return-object p0
.end method

.method public final bridge synthetic e(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    check-cast p1, Lwv;

    invoke-static {p1}, La2;->f(Lwv;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, La2;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final getName()Ljava/lang/String;
    .registers 1

    sget-object p0, La2;->d:Ljava/lang/String;

    return-object p0
.end method

.method public final hashCode()I
    .registers 1

    const p0, 0x44537673

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, "Addr"

    return-object p0
.end method
