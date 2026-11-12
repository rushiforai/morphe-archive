.class public final Lf18;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public final b:Lgtj;

.field public final c:Le18;

.field public d:Loml;

.field public final e:Lig;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lgtj;Le18;Loml;Lig;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf18;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iput-object p2, p0, Lf18;->b:Lgtj;

    iput-object p3, p0, Lf18;->c:Le18;

    iput-object p4, p0, Lf18;->d:Loml;

    iput-object p5, p0, Lf18;->e:Lig;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lf18;

    const/4 v2, 0x0

    if-eqz v1, :cond_2a

    check-cast p1, Lf18;

    iget-object v1, p0, Lf18;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v3, p1, Lf18;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eq v1, v3, :cond_12

    return v2

    :cond_12
    iget-object v1, p0, Lf18;->b:Lgtj;

    iget-object v3, p1, Lf18;->b:Lgtj;

    if-eq v1, v3, :cond_19

    return v2

    :cond_19
    iget-object v1, p0, Lf18;->c:Le18;

    iget-object v3, p1, Lf18;->c:Le18;

    if-eq v1, v3, :cond_20

    return v2

    :cond_20
    iget-object v1, p0, Lf18;->d:Loml;

    iget-object v3, p1, Lf18;->d:Loml;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2b

    :cond_2a
    return v2

    :cond_2b
    iget-object p0, p0, Lf18;->e:Lig;

    iget-object p1, p1, Lf18;->e:Lig;

    if-eq p0, p1, :cond_32

    return v2

    :cond_32
    return v0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lf18;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lf18;->b:Lgtj;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lf18;->c:Le18;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lf18;->d:Loml;

    if-nez v1, :cond_20

    const/4 v1, 0x0

    goto :goto_24

    :cond_20
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_24
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lf18;->e:Lig;

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
