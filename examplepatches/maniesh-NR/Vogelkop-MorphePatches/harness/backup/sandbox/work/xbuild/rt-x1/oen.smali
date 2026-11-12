.class public final Loen;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Loen;


# instance fields
.field public final a:Ljava/lang/Integer;

.field public final b:Ljava/lang/CharSequence;

.field public final c:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Loen;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v1, v2}, Loen;-><init>(Ljava/lang/Integer;Ljava/lang/CharSequence;Z)V

    sput-object v0, Loen;->d:Loen;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/CharSequence;Z)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Loen;->a:Ljava/lang/Integer;

    iput-object p2, p0, Loen;->b:Ljava/lang/CharSequence;

    iput-boolean p3, p0, Loen;->c:Z

    return-void
.end method

.method public static a(Loen;Ljava/lang/Integer;Ljava/lang/CharSequence;I)Loen;
    .registers 5

    and-int/lit8 v0, p3, 0x1

    if-eqz v0, :cond_6

    iget-object p1, p0, Loen;->a:Ljava/lang/Integer;

    :cond_6
    and-int/lit8 v0, p3, 0x2

    if-eqz v0, :cond_c

    iget-object p2, p0, Loen;->b:Ljava/lang/CharSequence;

    :cond_c
    and-int/lit8 p3, p3, 0x4

    if-eqz p3, :cond_13

    iget-boolean p3, p0, Loen;->c:Z

    goto :goto_14

    :cond_13
    const/4 p3, 0x1

    :goto_14
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Loen;

    invoke-direct {p0, p1, p2, p3}, Loen;-><init>(Ljava/lang/Integer;Ljava/lang/CharSequence;Z)V

    return-object p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_24

    instance-of v0, p1, Loen;

    if-eqz v0, :cond_22

    check-cast p1, Loen;

    iget-object v0, p0, Loen;->a:Ljava/lang/Integer;

    iget-object v1, p1, Loen;->a:Ljava/lang/Integer;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object v0, p0, Loen;->b:Ljava/lang/CharSequence;

    iget-object v1, p1, Loen;->b:Ljava/lang/CharSequence;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-boolean p0, p0, Loen;->c:Z

    iget-boolean p1, p1, Loen;->c:Z

    if-eq p0, p1, :cond_24

    :cond_22
    const/4 p0, 0x0

    return p0

    :cond_24
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    const/4 v0, 0x0

    iget-object v1, p0, Loen;->a:Ljava/lang/Integer;

    if-nez v1, :cond_7

    move v1, v0

    goto :goto_b

    :cond_7
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_b
    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Loen;->b:Ljava/lang/CharSequence;

    if-eqz v2, :cond_15

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :cond_15
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-boolean p0, p0, Loen;->c:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
