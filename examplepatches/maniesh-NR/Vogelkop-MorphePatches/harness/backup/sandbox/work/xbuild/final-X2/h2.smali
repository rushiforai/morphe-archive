.class public final Lh2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll2;


# static fields
.field public static final b:Lh2;

.field public static final c:Ls15;

.field public static final d:Ljava/lang/String;

.field public static final e:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lh2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lh2;->b:Lh2;

    const-class v0, Ljava/lang/String;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    sput-object v0, Lh2;->c:Ls15;

    const-string v0, "string"

    sput-object v0, Lh2;->d:Ljava/lang/String;

    const/4 v0, 0x1

    sput-boolean v0, Lh2;->e:Z

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    sget-boolean p0, Lh2;->e:Z

    return p0
.end method

.method public final b(Ljava/lang/String;)Lz1;
    .registers 3

    new-instance p0, Le2;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Le2;-><init>(Ljava/lang/Integer;)V

    invoke-virtual {p0, p1}, Le2;->b(Ljava/lang/String;)Lz1;

    move-result-object p0

    new-instance p1, Lz1;

    iget-object v0, p0, Lz1;->a:Ljava/lang/Object;

    check-cast v0, [B

    invoke-static {v0}, Lkotlin/text/c;->i([B)Ljava/lang/String;

    move-result-object v0

    iget p0, p0, Lz1;->b:I

    invoke-direct {p1, v0, p0}, Lz1;-><init>(Ljava/lang/Object;I)V

    return-object p1
.end method

.method public final c(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    check-cast p1, Ljava/lang/String;

    const-class p0, [B

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    sget-object p0, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, p0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    sget-object p1, Ll2;->a:Lf2;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lf2;->b:Lk2;

    array-length v0, p0

    invoke-static {v0}, Lmkh;->D(I)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {p1, v0}, Lc2;->f(Ljava/math/BigInteger;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0}, Le2;->g([B)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final d()Ls15;
    .registers 1

    sget-object p0, Lh2;->c:Ls15;

    return-object p0
.end method

.method public final e(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    check-cast p1, Ljava/lang/String;

    const-class p0, [B

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    sget-object p0, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, p0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    sget-object p1, Ll2;->a:Lf2;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lf2;->b:Lk2;

    array-length v0, p0

    invoke-static {v0}, Lmkh;->D(I)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {p1, v0}, Lc2;->f(Ljava/math/BigInteger;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0}, Le2;->g([B)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Lh2;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final getName()Ljava/lang/String;
    .registers 1

    sget-object p0, Lh2;->d:Ljava/lang/String;

    return-object p0
.end method

.method public final hashCode()I
    .registers 1

    const p0, -0x79aa7491

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, "Str"

    return-object p0
.end method
