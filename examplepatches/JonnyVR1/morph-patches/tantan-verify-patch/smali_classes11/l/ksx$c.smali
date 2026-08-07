.class public final Ll/ksx$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ksx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(ILjava/lang/String;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/ksx$c;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/ksx$c;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput p3, p0, Ll/ksx$c;->c:I

    .line 9
    .line 10
    iput p4, p0, Ll/ksx$c;->d:I

    .line 11
    .line 12
    return-void
.end method

.method public static a(Ljava/lang/String;)Ll/ksx$c;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    const-string v0, " "

    .line 2
    .line 3
    invoke-static {p0, v0}, Ll/bmk0;->b1(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    array-length v0, p0

    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    const/4 v3, 0x2

    .line 11
    if-ne v0, v3, :cond_0

    .line 12
    .line 13
    move v0, v2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v0, v1

    .line 16
    :goto_0
    invoke-static {v0}, Ll/w11;->a(Z)V

    .line 17
    .line 18
    .line 19
    aget-object v0, p0, v1

    .line 20
    .line 21
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/h;->h(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    aget-object p0, p0, v2

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v4, "/"

    .line 32
    .line 33
    invoke-static {p0, v4}, Ll/bmk0;->a1(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    array-length v4, p0

    .line 38
    if-lt v4, v3, :cond_1

    .line 39
    .line 40
    move v4, v2

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    move v4, v1

    .line 43
    :goto_1
    invoke-static {v4}, Ll/w11;->a(Z)V

    .line 44
    .line 45
    .line 46
    aget-object v2, p0, v2

    .line 47
    .line 48
    invoke-static {v2}, Lcom/google/android/exoplayer2/source/rtsp/h;->h(Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    array-length v4, p0

    .line 53
    const/4 v5, 0x3

    .line 54
    if-ne v4, v5, :cond_2

    .line 55
    .line 56
    aget-object v3, p0, v3

    .line 57
    .line 58
    invoke-static {v3}, Lcom/google/android/exoplayer2/source/rtsp/h;->h(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    goto :goto_2

    .line 63
    :cond_2
    const/4 v3, -0x1

    .line 64
    :goto_2
    new-instance v4, Ll/ksx$c;

    .line 65
    .line 66
    aget-object p0, p0, v1

    .line 67
    .line 68
    invoke-direct {v4, v0, p0, v2, v3}, Ll/ksx$c;-><init>(ILjava/lang/String;II)V

    .line 69
    .line 70
    .line 71
    return-object v4
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    const-class v2, Ll/ksx$c;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    if-eq v2, v3, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    check-cast p1, Ll/ksx$c;

    .line 18
    .line 19
    iget v2, p0, Ll/ksx$c;->a:I

    .line 20
    .line 21
    iget v3, p1, Ll/ksx$c;->a:I

    .line 22
    .line 23
    if-ne v2, v3, :cond_2

    .line 24
    .line 25
    iget-object v2, p0, Ll/ksx$c;->b:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v3, p1, Ll/ksx$c;->b:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_2

    .line 34
    .line 35
    iget v2, p0, Ll/ksx$c;->c:I

    .line 36
    .line 37
    iget v3, p1, Ll/ksx$c;->c:I

    .line 38
    .line 39
    if-ne v2, v3, :cond_2

    .line 40
    .line 41
    iget p0, p0, Ll/ksx$c;->d:I

    .line 42
    .line 43
    iget p1, p1, Ll/ksx$c;->d:I

    .line 44
    .line 45
    if-ne p0, p1, :cond_2

    .line 46
    .line 47
    return v0

    .line 48
    :cond_2
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 1
    const/16 v0, 0xd9

    .line 2
    .line 3
    iget v1, p0, Ll/ksx$c;->a:I

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    mul-int/lit8 v0, v0, 0x1f

    .line 7
    .line 8
    iget-object v1, p0, Ll/ksx$c;->b:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x1f

    .line 16
    .line 17
    iget v1, p0, Ll/ksx$c;->c:I

    .line 18
    .line 19
    add-int/2addr v0, v1

    .line 20
    mul-int/lit8 v0, v0, 0x1f

    .line 21
    .line 22
    iget p0, p0, Ll/ksx$c;->d:I

    .line 23
    .line 24
    add-int/2addr v0, p0

    .line 25
    return v0
.end method
