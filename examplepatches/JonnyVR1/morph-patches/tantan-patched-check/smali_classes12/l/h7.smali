.class public abstract Ll/h7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/azk;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c(Ljava/lang/CharSequence;)Ll/azk;
    .locals 3

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_0

    .line 7
    .line 8
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    invoke-virtual {p0, v2}, Ll/h7;->k(C)Ll/azk;

    .line 13
    .line 14
    .line 15
    add-int/lit8 v1, v1, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-object p0
.end method

.method public bridge synthetic c(Ljava/lang/CharSequence;)Ll/su80;
    .locals 0

    .line 19
    invoke-virtual {p0, p1}, Ll/h7;->c(Ljava/lang/CharSequence;)Ll/azk;

    move-result-object p0

    return-object p0
.end method

.method public d(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Ll/azk;
    .locals 0

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/h7;->j([B)Ll/azk;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public bridge synthetic d(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Ll/su80;
    .locals 0

    .line 14
    invoke-virtual {p0, p1, p2}, Ll/h7;->d(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Ll/azk;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic f([B)Ll/su80;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h7;->j([B)Ll/azk;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public g(Ljava/lang/Object;Lcom/google/common/hash/Funnel;)Ll/azk;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/google/common/hash/Funnel<",
            "-TT;>;)",
            "Ll/azk;"
        }
    .end annotation

    .line 1
    invoke-interface {p2, p1, p0}, Lcom/google/common/hash/Funnel;->funnel(Ljava/lang/Object;Ll/su80;)V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public abstract h([BII)Ll/azk;
.end method

.method public j([B)Ll/azk;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    array-length v1, p1

    .line 3
    invoke-virtual {p0, p1, v0, v1}, Ll/h7;->h([BII)Ll/azk;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public abstract k(C)Ll/azk;
.end method
