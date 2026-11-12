.class public final Ld2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll2;


# static fields
.field public static final b:Ld2;

.field public static final c:Ljava/lang/String;

.field public static final d:Ljava/lang/String;

.field public static final e:Ls15;

.field public static final f:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ld2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ld2;->b:Ld2;

    const-string v0, "1"

    invoke-static {v0}, Lx1;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Ld2;->c:Ljava/lang/String;

    const-string v0, "0"

    invoke-static {v0}, Lx1;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Ld2;->d:Ljava/lang/String;

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    sput-object v0, Ld2;->e:Ls15;

    const-string v0, "bool"

    sput-object v0, Ld2;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final b(Ljava/lang/String;)Lz1;
    .registers 6

    const/16 p0, 0x40

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Lz1;

    sget-object v2, Ld2;->c:Ljava/lang/String;

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1b

    const/4 v0, 0x1

    goto :goto_21

    :cond_1b
    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_29

    :goto_21
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-direct {v1, p1, p0}, Lz1;-><init>(Ljava/lang/Object;I)V

    return-object v1

    :cond_29
    const-string p0, "Boolean is malformed: "

    invoke-static {p0, p1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final c(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_b

    sget-object p0, Ld2;->c:Ljava/lang/String;

    return-object p0

    :cond_b
    sget-object p0, Ld2;->d:Ljava/lang/String;

    return-object p0
.end method

.method public final d()Ls15;
    .registers 1

    sget-object p0, Ld2;->e:Ls15;

    return-object p0
.end method

.method public final e(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_b

    sget-object p0, Ld2;->c:Ljava/lang/String;

    return-object p0

    :cond_b
    sget-object p0, Ld2;->d:Ljava/lang/String;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Ld2;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final getName()Ljava/lang/String;
    .registers 1

    sget-object p0, Ld2;->f:Ljava/lang/String;

    return-object p0
.end method

.method public final hashCode()I
    .registers 1

    const p0, 0x4454156c

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, "Bool"

    return-object p0
.end method
