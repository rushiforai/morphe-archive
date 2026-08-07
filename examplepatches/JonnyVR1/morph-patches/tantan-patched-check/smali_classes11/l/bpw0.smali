.class public abstract Ll/bpw0;
.super Ll/vnw0;
.source "SourceFile"


# instance fields
.field public final c:Ljava/lang/CharSequence;

.field public final d:Ll/bow0;

.field public e:I

.field public f:I


# direct methods
.method public constructor <init>(Ll/dpw0;Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/vnw0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/bpw0;->e:I

    .line 6
    .line 7
    invoke-static {p1}, Ll/dpw0;->a(Ll/dpw0;)Ll/bow0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/bpw0;->d:Ll/bow0;

    .line 12
    .line 13
    const p1, 0x7fffffff

    .line 14
    .line 15
    .line 16
    iput p1, p0, Ll/bpw0;->f:I

    .line 17
    .line 18
    iput-object p2, p0, Ll/bpw0;->c:Ljava/lang/CharSequence;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public abstract b(I)I
.end method

.method public abstract c(I)I
.end method

.method public final bridge synthetic zza()Ljava/lang/Object;
    .locals 5

    .line 1
    iget v0, p0, Ll/bpw0;->e:I

    .line 2
    .line 3
    :cond_0
    :goto_0
    iget v1, p0, Ll/bpw0;->e:I

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    if-eq v1, v2, :cond_7

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Ll/bpw0;->c(I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-ne v1, v2, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Ll/bpw0;->c:Ljava/lang/CharSequence;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iput v2, p0, Ll/bpw0;->e:I

    .line 21
    .line 22
    move v3, v2

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    invoke-virtual {p0, v1}, Ll/bpw0;->b(I)I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    iput v3, p0, Ll/bpw0;->e:I

    .line 29
    .line 30
    :goto_1
    if-ne v3, v0, :cond_2

    .line 31
    .line 32
    add-int/lit8 v3, v3, 0x1

    .line 33
    .line 34
    iput v3, p0, Ll/bpw0;->e:I

    .line 35
    .line 36
    iget-object v1, p0, Ll/bpw0;->c:Ljava/lang/CharSequence;

    .line 37
    .line 38
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-le v3, v1, :cond_0

    .line 43
    .line 44
    iput v2, p0, Ll/bpw0;->e:I

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    if-ge v0, v1, :cond_3

    .line 48
    .line 49
    iget-object v3, p0, Ll/bpw0;->c:Ljava/lang/CharSequence;

    .line 50
    .line 51
    invoke-interface {v3, v0}, Ljava/lang/CharSequence;->charAt(I)C

    .line 52
    .line 53
    .line 54
    :cond_3
    if-ge v0, v1, :cond_4

    .line 55
    .line 56
    iget-object v3, p0, Ll/bpw0;->c:Ljava/lang/CharSequence;

    .line 57
    .line 58
    add-int/lit8 v4, v1, -0x1

    .line 59
    .line 60
    invoke-interface {v3, v4}, Ljava/lang/CharSequence;->charAt(I)C

    .line 61
    .line 62
    .line 63
    :cond_4
    iget v3, p0, Ll/bpw0;->f:I

    .line 64
    .line 65
    const/4 v4, 0x1

    .line 66
    if-ne v3, v4, :cond_5

    .line 67
    .line 68
    iget-object v1, p0, Ll/bpw0;->c:Ljava/lang/CharSequence;

    .line 69
    .line 70
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    iput v2, p0, Ll/bpw0;->e:I

    .line 75
    .line 76
    if-le v1, v0, :cond_6

    .line 77
    .line 78
    iget-object v2, p0, Ll/bpw0;->c:Ljava/lang/CharSequence;

    .line 79
    .line 80
    add-int/lit8 v3, v1, -0x1

    .line 81
    .line 82
    invoke-interface {v2, v3}, Ljava/lang/CharSequence;->charAt(I)C

    .line 83
    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_5
    add-int/2addr v3, v2

    .line 87
    iput v3, p0, Ll/bpw0;->f:I

    .line 88
    .line 89
    :cond_6
    :goto_2
    iget-object p0, p0, Ll/bpw0;->c:Ljava/lang/CharSequence;

    .line 90
    .line 91
    invoke-interface {p0, v0, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0

    .line 100
    :cond_7
    invoke-virtual {p0}, Ll/vnw0;->a()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    const/4 p0, 0x0

    .line 104
    return-object p0
.end method
