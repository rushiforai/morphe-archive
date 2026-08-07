.class public Ll/n5y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/h5y;


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:I


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/n5y;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Ll/n5y;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/n5y;->c:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Ll/n5y;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Ll/n5y;

    .line 12
    .line 13
    iget v1, p0, Ll/n5y;->b:I

    .line 14
    .line 15
    if-ltz v1, :cond_4

    .line 16
    .line 17
    iget v1, p1, Ll/n5y;->b:I

    .line 18
    .line 19
    if-gez v1, :cond_2

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_2
    iget-object v1, p0, Ll/n5y;->a:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v3, p1, Ll/n5y;->a:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_3

    .line 31
    .line 32
    iget v1, p0, Ll/n5y;->b:I

    .line 33
    .line 34
    iget v3, p1, Ll/n5y;->b:I

    .line 35
    .line 36
    if-ne v1, v3, :cond_3

    .line 37
    .line 38
    iget p0, p0, Ll/n5y;->c:I

    .line 39
    .line 40
    iget p1, p1, Ll/n5y;->c:I

    .line 41
    .line 42
    if-ne p0, p1, :cond_3

    .line 43
    .line 44
    return v0

    .line 45
    :cond_3
    return v2

    .line 46
    :cond_4
    :goto_0
    iget-object v1, p0, Ll/n5y;->a:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v3, p1, Ll/n5y;->a:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_5

    .line 55
    .line 56
    iget p0, p0, Ll/n5y;->c:I

    .line 57
    .line 58
    iget p1, p1, Ll/n5y;->c:I

    .line 59
    .line 60
    if-ne p0, p1, :cond_5

    .line 61
    .line 62
    return v0

    .line 63
    :cond_5
    return v2
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n5y;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget p0, p0, Ll/n5y;->c:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/l950;->b([Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method
