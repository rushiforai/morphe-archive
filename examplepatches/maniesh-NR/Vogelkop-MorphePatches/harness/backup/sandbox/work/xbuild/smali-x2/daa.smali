.class public final Ldaa;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lh58;


# direct methods
.method public constructor <init>(Lh58;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldaa;->a:Lh58;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    if-eq p0, p1, :cond_14

    instance-of v0, p1, Ldaa;

    if-eqz v0, :cond_12

    check-cast p1, Ldaa;

    iget-object p0, p0, Ldaa;->a:Lh58;

    iget-object p1, p1, Ldaa;->a:Lh58;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    :cond_12
    const/4 p0, 0x0

    return p0

    :cond_14
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Ldaa;->a:Lh58;

    invoke-virtual {p0}, Lz4;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
