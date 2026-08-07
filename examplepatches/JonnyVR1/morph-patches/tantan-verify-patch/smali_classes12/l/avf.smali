.class public Ll/avf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jtl;


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/avf;->a:I

    .line 6
    .line 7
    const/16 v1, 0x64

    .line 8
    .line 9
    iput v1, p0, Ll/avf;->b:I

    .line 10
    .line 11
    iput v1, p0, Ll/avf;->c:I

    .line 12
    .line 13
    iput v0, p0, Ll/avf;->d:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(Lcom/immomo/components/interfaces/IProcessOutput;)Z
    .locals 3

    .line 1
    iget v0, p0, Ll/avf;->b:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-gtz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-interface {p1}, Lcom/immomo/components/interfaces/IProcessOutput;->a()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v0, 0x0

    .line 12
    if-lez p1, :cond_2

    .line 13
    .line 14
    iget p1, p0, Ll/avf;->a:I

    .line 15
    .line 16
    iget v2, p0, Ll/avf;->b:I

    .line 17
    .line 18
    rem-int v2, p1, v2

    .line 19
    .line 20
    if-nez v2, :cond_1

    .line 21
    .line 22
    iput v1, p0, Ll/avf;->a:I

    .line 23
    .line 24
    return v0

    .line 25
    :cond_1
    add-int/2addr p1, v1

    .line 26
    iput p1, p0, Ll/avf;->a:I

    .line 27
    .line 28
    iput v0, p0, Ll/avf;->d:I

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    iget p1, p0, Ll/avf;->d:I

    .line 32
    .line 33
    add-int/2addr p1, v1

    .line 34
    iput p1, p0, Ll/avf;->d:I

    .line 35
    .line 36
    iget v2, p0, Ll/avf;->c:I

    .line 37
    .line 38
    if-ne p1, v2, :cond_3

    .line 39
    .line 40
    iput v0, p0, Ll/avf;->d:I

    .line 41
    .line 42
    return v0

    .line 43
    :cond_3
    :goto_0
    return v1
.end method
