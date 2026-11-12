.class public final Lh78;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpxh;

.field public final b:Le78;

.field public final c:Lg78;


# direct methods
.method public constructor <init>()V
    .registers 4

    new-instance v0, Lrxh;

    const v1, 0x7f1406d0

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    sget-object v1, Lg78;->a:Lg78;

    const/4 v2, 0x0

    invoke-direct {p0, v0, v2, v1}, Lh78;-><init>(Lpxh;Le78;Lg78;)V

    return-void
.end method

.method public constructor <init>(Lpxh;Le78;Lg78;)V
    .registers 4

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lh78;->a:Lpxh;

    .line 17
    iput-object p2, p0, Lh78;->b:Le78;

    .line 18
    iput-object p3, p0, Lh78;->c:Lg78;

    return-void
.end method

.method public static a(Lh78;Lpxh;I)Lh78;
    .registers 4

    and-int/lit8 p2, p2, 0x2

    if-eqz p2, :cond_7

    iget-object p2, p0, Lh78;->b:Le78;

    goto :goto_8

    :cond_7
    const/4 p2, 0x0

    :goto_8
    iget-object v0, p0, Lh78;->c:Lg78;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lh78;

    invoke-direct {p0, p1, p2, v0}, Lh78;-><init>(Lpxh;Le78;Lg78;)V

    return-object p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lh78;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lh78;

    iget-object v1, p0, Lh78;->a:Lpxh;

    iget-object v3, p1, Lh78;->a:Lpxh;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lh78;->b:Le78;

    iget-object v3, p1, Lh78;->b:Le78;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object p0, p0, Lh78;->c:Lg78;

    iget-object p1, p1, Lh78;->c:Lg78;

    if-eq p0, p1, :cond_29

    return v2

    :cond_29
    return v0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lh78;->a:Lpxh;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lh78;->b:Le78;

    if-nez v1, :cond_e

    const/4 v1, 0x0

    goto :goto_12

    :cond_e
    invoke-virtual {v1}, Le78;->hashCode()I

    move-result v1

    :goto_12
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lh78;->c:Lg78;

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
