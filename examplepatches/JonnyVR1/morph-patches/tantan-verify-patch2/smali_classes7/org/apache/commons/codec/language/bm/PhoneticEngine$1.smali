.class final Lorg/apache/commons/codec/language/bm/PhoneticEngine$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/CharSequence;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/commons/codec/language/bm/PhoneticEngine;->cacheSubSequence(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field final synthetic val$cache:[[Ljava/lang/CharSequence;

.field final synthetic val$cached:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;[[Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/commons/codec/language/bm/PhoneticEngine$1;->val$cached:Ljava/lang/CharSequence;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/apache/commons/codec/language/bm/PhoneticEngine$1;->val$cache:[[Ljava/lang/CharSequence;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public charAt(I)C
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/codec/language/bm/PhoneticEngine$1;->val$cached:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public length()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/codec/language/bm/PhoneticEngine$1;->val$cached:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .locals 2

    .line 1
    if-ne p1, p2, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/codec/language/bm/PhoneticEngine$1;->val$cache:[[Ljava/lang/CharSequence;

    .line 7
    .line 8
    aget-object v0, v0, p1

    .line 9
    .line 10
    add-int/lit8 v1, p2, -0x1

    .line 11
    .line 12
    aget-object v0, v0, v1

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lorg/apache/commons/codec/language/bm/PhoneticEngine$1;->val$cached:Ljava/lang/CharSequence;

    .line 17
    .line 18
    invoke-interface {v0, p1, p2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    iget-object p0, p0, Lorg/apache/commons/codec/language/bm/PhoneticEngine$1;->val$cache:[[Ljava/lang/CharSequence;

    .line 23
    .line 24
    aget-object p0, p0, p1

    .line 25
    .line 26
    aput-object p2, p0, v1

    .line 27
    .line 28
    return-object p2

    .line 29
    :cond_1
    return-object v0
.end method
