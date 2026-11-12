.class public final Lcom/opera/android/browser/TabInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:J

.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(IIJJ)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p3, p0, Lcom/opera/android/browser/TabInfo;->a:J

    iput-wide p5, p0, Lcom/opera/android/browser/TabInfo;->b:J

    iput p1, p0, Lcom/opera/android/browser/TabInfo;->c:I

    iput p2, p0, Lcom/opera/android/browser/TabInfo;->d:I

    return-void
.end method

.method public static a(Lcom/opera/android/browser/TabInfo;JIII)Lcom/opera/android/browser/TabInfo;
    .registers 13

    iget-wide v3, p0, Lcom/opera/android/browser/TabInfo;->a:J

    and-int/lit8 v0, p5, 0x2

    if-eqz v0, :cond_8

    iget-wide p1, p0, Lcom/opera/android/browser/TabInfo;->b:J

    :cond_8
    move-wide v5, p1

    and-int/lit8 p1, p5, 0x4

    if-eqz p1, :cond_f

    iget p3, p0, Lcom/opera/android/browser/TabInfo;->c:I

    :cond_f
    move v1, p3

    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_16

    iget p4, p0, Lcom/opera/android/browser/TabInfo;->d:I

    :cond_16
    move v2, p4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lcom/opera/android/browser/TabInfo;

    invoke-direct/range {v0 .. v6}, Lcom/opera/android/browser/TabInfo;-><init>(IIJJ)V

    return-object v0
.end method

.method public static final b()Lcom/opera/android/browser/TabInfo;
    .registers 7

    new-instance v0, Lcom/opera/android/browser/TabInfo;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/opera/android/browser/TabInfo;-><init>(IIJJ)V

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 9

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lcom/opera/android/browser/TabInfo;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lcom/opera/android/browser/TabInfo;

    iget-wide v3, p0, Lcom/opera/android/browser/TabInfo;->a:J

    iget-wide v5, p1, Lcom/opera/android/browser/TabInfo;->a:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_15

    return v2

    :cond_15
    iget-wide v3, p0, Lcom/opera/android/browser/TabInfo;->b:J

    iget-wide v5, p1, Lcom/opera/android/browser/TabInfo;->b:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_1e

    return v2

    :cond_1e
    iget v1, p0, Lcom/opera/android/browser/TabInfo;->c:I

    iget v3, p1, Lcom/opera/android/browser/TabInfo;->c:I

    if-eq v1, v3, :cond_25

    return v2

    :cond_25
    iget p0, p0, Lcom/opera/android/browser/TabInfo;->d:I

    iget p1, p1, Lcom/opera/android/browser/TabInfo;->d:I

    if-eq p0, p1, :cond_2c

    return v2

    :cond_2c
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/browser/TabInfo;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-wide v2, p0, Lcom/opera/android/browser/TabInfo;->b:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget v2, p0, Lcom/opera/android/browser/TabInfo;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget p0, p0, Lcom/opera/android/browser/TabInfo;->d:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
