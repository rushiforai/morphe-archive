.class public final Li55;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lcom/opera/android/suggestion/Suggestion;

.field public final c:Lcom/opera/android/suggestion/Suggestion;

.field public final d:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/opera/android/suggestion/Suggestion;Lcom/opera/android/suggestion/Suggestion;Z)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Li55;->a:Ljava/lang/String;

    iput-object p2, p0, Li55;->b:Lcom/opera/android/suggestion/Suggestion;

    iput-object p3, p0, Li55;->c:Lcom/opera/android/suggestion/Suggestion;

    iput-boolean p4, p0, Li55;->d:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_2e

    instance-of v0, p1, Li55;

    if-eqz v0, :cond_2c

    check-cast p1, Li55;

    iget-object v0, p0, Li55;->a:Ljava/lang/String;

    iget-object v1, p1, Li55;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-object v0, p0, Li55;->b:Lcom/opera/android/suggestion/Suggestion;

    iget-object v1, p1, Li55;->b:Lcom/opera/android/suggestion/Suggestion;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-object v0, p0, Li55;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-object v1, p1, Li55;->c:Lcom/opera/android/suggestion/Suggestion;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-boolean p0, p0, Li55;->d:Z

    iget-boolean p1, p1, Li55;->d:Z

    if-eq p0, p1, :cond_2e

    :cond_2c
    const/4 p0, 0x0

    return p0

    :cond_2e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Li55;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    const/4 v1, 0x0

    iget-object v2, p0, Li55;->b:Lcom/opera/android/suggestion/Suggestion;

    if-nez v2, :cond_f

    move v2, v1

    goto :goto_13

    :cond_f
    invoke-virtual {v2}, Lcom/opera/android/suggestion/Suggestion;->hashCode()I

    move-result v2

    :goto_13
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Li55;->c:Lcom/opera/android/suggestion/Suggestion;

    if-eqz v2, :cond_1e

    invoke-virtual {v2}, Lcom/opera/android/suggestion/Suggestion;->hashCode()I

    move-result v1

    :cond_1e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean p0, p0, Li55;->d:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
