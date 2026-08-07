.class public Ll/l5d0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:J

.field public g:Ljava/lang/String;


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

.method public static a(Ljava/lang/String;)Ll/l5d0;
    .locals 6

    .line 1
    const/16 v0, 0x3a

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    const/4 v2, 0x1

    .line 9
    const/4 v3, 0x0

    .line 10
    const-string v4, ""

    .line 11
    .line 12
    if-ne v1, v0, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    if-lt v0, v5, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    add-int/2addr v0, v2

    .line 27
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    :goto_0
    move-object p0, v1

    .line 32
    :goto_1
    const-string v0, "|"

    .line 33
    .line 34
    invoke-static {v0}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {p0, v0}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    array-length v0, p0

    .line 43
    const/4 v1, 0x6

    .line 44
    if-lt v0, v1, :cond_2

    .line 45
    .line 46
    new-instance v0, Ll/l5d0;

    .line 47
    .line 48
    invoke-direct {v0}, Ll/l5d0;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v4, v0, Ll/l5d0;->g:Ljava/lang/String;

    .line 52
    .line 53
    aget-object v1, p0, v3

    .line 54
    .line 55
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    iput v1, v0, Ll/l5d0;->a:I

    .line 60
    .line 61
    aget-object v1, p0, v2

    .line 62
    .line 63
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    iput v1, v0, Ll/l5d0;->b:I

    .line 68
    .line 69
    const/4 v1, 0x2

    .line 70
    aget-object v1, p0, v1

    .line 71
    .line 72
    iput-object v1, v0, Ll/l5d0;->c:Ljava/lang/String;

    .line 73
    .line 74
    const/4 v1, 0x3

    .line 75
    aget-object v1, p0, v1

    .line 76
    .line 77
    iput-object v1, v0, Ll/l5d0;->d:Ljava/lang/String;

    .line 78
    .line 79
    const/4 v1, 0x4

    .line 80
    aget-object v1, p0, v1

    .line 81
    .line 82
    iput-object v1, v0, Ll/l5d0;->e:Ljava/lang/String;

    .line 83
    .line 84
    const/4 v1, 0x5

    .line 85
    aget-object p0, p0, v1

    .line 86
    .line 87
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 88
    .line 89
    .line 90
    move-result-wide v1

    .line 91
    iput-wide v1, v0, Ll/l5d0;->f:J

    .line 92
    .line 93
    return-object v0

    .line 94
    :cond_2
    const-string p0, "Wrong number of fields."

    .line 95
    .line 96
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    const/4 p0, 0x0

    .line 100
    return-object p0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 8

    .line 1
    iget v0, p0, Ll/l5d0;->a:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget v0, p0, Ll/l5d0;->b:I

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v3, p0, Ll/l5d0;->c:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v4, p0, Ll/l5d0;->d:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v5, p0, Ll/l5d0;->e:Ljava/lang/String;

    .line 18
    .line 19
    iget-wide v6, p0, Ll/l5d0;->f:J

    .line 20
    .line 21
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    filled-new-array/range {v1 .. v6}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "|"

    .line 30
    .line 31
    invoke-static {v0, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method
