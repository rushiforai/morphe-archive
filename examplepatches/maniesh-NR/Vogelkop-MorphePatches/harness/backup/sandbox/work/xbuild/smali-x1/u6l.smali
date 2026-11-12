.class public final Lu6l;
.super Lw6l;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:Lcom/opera/android/browser/TabInfo;


# direct methods
.method public constructor <init>(ILjava/lang/String;Lcom/opera/android/browser/TabInfo;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lu6l;->a:I

    iput-object p2, p0, Lu6l;->b:Ljava/lang/String;

    iput-object p3, p0, Lu6l;->c:Lcom/opera/android/browser/TabInfo;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 1

    iget p0, p0, Lu6l;->a:I

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lu6l;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lu6l;

    iget v1, p0, Lu6l;->a:I

    iget v3, p1, Lu6l;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object v1, p0, Lu6l;->b:Ljava/lang/String;

    iget-object v3, p1, Lu6l;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    return v2

    :cond_1e
    iget-object p0, p0, Lu6l;->c:Lcom/opera/android/browser/TabInfo;

    iget-object p1, p1, Lu6l;->c:Lcom/opera/android/browser/TabInfo;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_29

    return v2

    :cond_29
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lu6l;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lu6l;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object p0, p0, Lu6l;->c:Lcom/opera/android/browser/TabInfo;

    invoke-virtual {p0}, Lcom/opera/android/browser/TabInfo;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
