.class public final Ll/ylw0;
.super Ll/vmw0;
.source "SourceFile"


# instance fields
.field public a:Landroid/os/IBinder;

.field public b:Ljava/lang/String;

.field public c:I

.field public d:F

.field public e:I

.field public f:Ljava/lang/String;

.field public g:B


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/vmw0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Ll/vmw0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ylw0;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Ljava/lang/String;)Ll/vmw0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ylw0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(I)Ll/vmw0;
    .locals 0

    .line 1
    iget-byte p1, p0, Ll/ylw0;->g:B

    .line 2
    .line 3
    or-int/lit8 p1, p1, 0x8

    .line 4
    .line 5
    int-to-byte p1, p1

    .line 6
    iput-byte p1, p0, Ll/ylw0;->g:B

    .line 7
    .line 8
    return-object p0
.end method

.method public final d(I)Ll/vmw0;
    .locals 0

    .line 1
    iput p1, p0, Ll/ylw0;->c:I

    .line 2
    .line 3
    iget-byte p1, p0, Ll/ylw0;->g:B

    .line 4
    .line 5
    or-int/lit8 p1, p1, 0x2

    .line 6
    .line 7
    int-to-byte p1, p1

    .line 8
    iput-byte p1, p0, Ll/ylw0;->g:B

    .line 9
    .line 10
    return-object p0
.end method

.method public final e(F)Ll/vmw0;
    .locals 0

    .line 1
    iput p1, p0, Ll/ylw0;->d:F

    .line 2
    .line 3
    iget-byte p1, p0, Ll/ylw0;->g:B

    .line 4
    .line 5
    or-int/lit8 p1, p1, 0x4

    .line 6
    .line 7
    int-to-byte p1, p1

    .line 8
    iput-byte p1, p0, Ll/ylw0;->g:B

    .line 9
    .line 10
    return-object p0
.end method

.method public final f(Z)Ll/vmw0;
    .locals 0

    .line 1
    iget-byte p1, p0, Ll/ylw0;->g:B

    .line 2
    .line 3
    or-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    int-to-byte p1, p1

    .line 6
    iput-byte p1, p0, Ll/ylw0;->g:B

    .line 7
    .line 8
    return-object p0
.end method

.method public final g(Landroid/os/IBinder;)Ll/vmw0;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/ylw0;->a:Landroid/os/IBinder;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null windowToken"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final h(I)Ll/vmw0;
    .locals 0

    .line 1
    iput p1, p0, Ll/ylw0;->e:I

    .line 2
    .line 3
    iget-byte p1, p0, Ll/ylw0;->g:B

    .line 4
    .line 5
    or-int/lit8 p1, p1, 0x10

    .line 6
    .line 7
    int-to-byte p1, p1

    .line 8
    iput-byte p1, p0, Ll/ylw0;->g:B

    .line 9
    .line 10
    return-object p0
.end method

.method public final i()Ll/wmw0;
    .locals 15

    .line 1
    iget-byte v0, p0, Ll/ylw0;->g:B

    .line 2
    .line 3
    const/16 v1, 0x1f

    .line 4
    .line 5
    if-ne v0, v1, :cond_1

    .line 6
    .line 7
    iget-object v3, p0, Ll/ylw0;->a:Landroid/os/IBinder;

    .line 8
    .line 9
    if-nez v3, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v2, Ll/amw0;

    .line 13
    .line 14
    iget-object v5, p0, Ll/ylw0;->b:Ljava/lang/String;

    .line 15
    .line 16
    iget v6, p0, Ll/ylw0;->c:I

    .line 17
    .line 18
    iget v7, p0, Ll/ylw0;->d:F

    .line 19
    .line 20
    iget v10, p0, Ll/ylw0;->e:I

    .line 21
    .line 22
    iget-object v12, p0, Ll/ylw0;->f:Ljava/lang/String;

    .line 23
    .line 24
    const/4 v13, 0x0

    .line 25
    const/4 v14, 0x0

    .line 26
    const/4 v4, 0x0

    .line 27
    const/4 v8, 0x0

    .line 28
    const/4 v9, 0x0

    .line 29
    const/4 v11, 0x0

    .line 30
    invoke-direct/range {v2 .. v14}, Ll/amw0;-><init>(Landroid/os/IBinder;ZLjava/lang/String;IFILjava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/zlw0;)V

    .line 31
    .line 32
    .line 33
    return-object v2

    .line 34
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/ylw0;->a:Landroid/os/IBinder;

    .line 40
    .line 41
    if-nez v1, :cond_2

    .line 42
    .line 43
    const-string v1, " windowToken"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    :cond_2
    iget-byte v1, p0, Ll/ylw0;->g:B

    .line 49
    .line 50
    and-int/lit8 v1, v1, 0x1

    .line 51
    .line 52
    if-nez v1, :cond_3

    .line 53
    .line 54
    const-string v1, " stableSessionToken"

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-byte v1, p0, Ll/ylw0;->g:B

    .line 60
    .line 61
    and-int/lit8 v1, v1, 0x2

    .line 62
    .line 63
    if-nez v1, :cond_4

    .line 64
    .line 65
    const-string v1, " layoutGravity"

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    :cond_4
    iget-byte v1, p0, Ll/ylw0;->g:B

    .line 71
    .line 72
    and-int/lit8 v1, v1, 0x4

    .line 73
    .line 74
    if-nez v1, :cond_5

    .line 75
    .line 76
    const-string v1, " layoutVerticalMargin"

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    :cond_5
    iget-byte v1, p0, Ll/ylw0;->g:B

    .line 82
    .line 83
    and-int/lit8 v1, v1, 0x8

    .line 84
    .line 85
    if-nez v1, :cond_6

    .line 86
    .line 87
    const-string v1, " displayMode"

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    :cond_6
    iget-byte p0, p0, Ll/ylw0;->g:B

    .line 93
    .line 94
    and-int/lit8 p0, p0, 0x10

    .line 95
    .line 96
    if-nez p0, :cond_7

    .line 97
    .line 98
    const-string p0, " windowWidthPx"

    .line 99
    .line 100
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    :cond_7
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-string v0, "Missing required properties:"

    .line 108
    .line 109
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    const/4 p0, 0x0

    .line 117
    return-object p0
.end method
