.class public final Lwwd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpxh;


# direct methods
.method public constructor <init>(Lpxh;I)V
    .registers 3

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_b

    new-instance p1, Lqxh;

    const-string p2, ""

    invoke-direct {p1, p2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    :cond_b
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwwd;->a:Lpxh;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lwwd;

    if-eqz v1, :cond_14

    check-cast p1, Lwwd;

    iget-object p0, p0, Lwwd;->a:Lpxh;

    iget-object p1, p1, Lwwd;->a:Lpxh;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_16

    :cond_14
    const/4 p0, 0x0

    return p0

    :cond_16
    return v0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lwwd;->a:Lpxh;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4d5

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
