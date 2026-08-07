.class public final Ll/vxy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/f2z0;


# instance fields
.field public final a:Ll/f2z0;

.field public b:Z

.field public final synthetic c:Ll/wxy0;


# direct methods
.method public constructor <init>(Ll/wxy0;Ll/f2z0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vxy0;->c:Ll/wxy0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/vxy0;->a:Ll/f2z0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(J)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vxy0;->c:Ll/wxy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wxy0;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, -0x3

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/vxy0;->a:Ll/f2z0;

    .line 12
    .line 13
    invoke-interface {p0, p1, p2}, Ll/f2z0;->a(J)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public final b(Ll/l9y0;Ll/evx0;I)I
    .locals 12

    .line 1
    iget-object v0, p0, Ll/vxy0;->c:Ll/wxy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wxy0;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, -0x3

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    return v2

    .line 11
    :cond_0
    iget-boolean v1, p0, Ll/vxy0;->b:Z

    .line 12
    .line 13
    const/4 v3, 0x4

    .line 14
    const/4 v4, -0x4

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p2, v3}, Ll/fux0;->c(I)V

    .line 18
    .line 19
    .line 20
    return v4

    .line 21
    :cond_1
    invoke-virtual {v0}, Ll/wxy0;->zzb()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    iget-object v5, p0, Ll/vxy0;->a:Ll/f2z0;

    .line 26
    .line 27
    invoke-interface {v5, p1, p2, p3}, Ll/f2z0;->b(Ll/l9y0;Ll/evx0;I)I

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    const/4 v5, -0x5

    .line 32
    const-wide/high16 v6, -0x8000000000000000L

    .line 33
    .line 34
    if-ne p3, v5, :cond_5

    .line 35
    .line 36
    iget-object p2, p1, Ll/l9y0;->a:Ll/sqr0;

    .line 37
    .line 38
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    iget p3, p2, Ll/sqr0;->B:I

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    if-nez p3, :cond_2

    .line 45
    .line 46
    iget p3, p2, Ll/sqr0;->C:I

    .line 47
    .line 48
    if-eqz p3, :cond_4

    .line 49
    .line 50
    move p3, v0

    .line 51
    :cond_2
    iget-object p0, p0, Ll/vxy0;->c:Ll/wxy0;

    .line 52
    .line 53
    iget-wide v1, p0, Ll/wxy0;->e:J

    .line 54
    .line 55
    cmp-long p0, v1, v6

    .line 56
    .line 57
    if-eqz p0, :cond_3

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    iget v0, p2, Ll/sqr0;->C:I

    .line 61
    .line 62
    :goto_0
    invoke-virtual {p2}, Ll/sqr0;->b()Ll/znr0;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0, p3}, Ll/znr0;->f(I)Ll/znr0;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v0}, Ll/znr0;->g(I)Ll/znr0;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/znr0;->D()Ll/sqr0;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    iput-object p0, p1, Ll/l9y0;->a:Ll/sqr0;

    .line 77
    .line 78
    :cond_4
    return v5

    .line 79
    :cond_5
    iget-object p1, p0, Ll/vxy0;->c:Ll/wxy0;

    .line 80
    .line 81
    iget-wide v8, p1, Ll/wxy0;->e:J

    .line 82
    .line 83
    cmp-long p1, v8, v6

    .line 84
    .line 85
    if-eqz p1, :cond_8

    .line 86
    .line 87
    if-ne p3, v4, :cond_6

    .line 88
    .line 89
    iget-wide v10, p2, Ll/evx0;->f:J

    .line 90
    .line 91
    cmp-long p1, v10, v8

    .line 92
    .line 93
    if-gez p1, :cond_7

    .line 94
    .line 95
    :cond_6
    if-ne p3, v2, :cond_8

    .line 96
    .line 97
    cmp-long p1, v0, v6

    .line 98
    .line 99
    if-nez p1, :cond_8

    .line 100
    .line 101
    iget-boolean p1, p2, Ll/evx0;->e:Z

    .line 102
    .line 103
    if-nez p1, :cond_8

    .line 104
    .line 105
    :cond_7
    invoke-virtual {p2}, Ll/fux0;->b()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p2, v3}, Ll/fux0;->c(I)V

    .line 109
    .line 110
    .line 111
    const/4 p1, 0x1

    .line 112
    iput-boolean p1, p0, Ll/vxy0;->b:Z

    .line 113
    .line 114
    return v4

    .line 115
    :cond_8
    return p3
.end method

.method public final c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/vxy0;->b:Z

    .line 3
    .line 4
    return-void
.end method

.method public final zzd()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vxy0;->a:Ll/f2z0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/f2z0;->zzd()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zze()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vxy0;->c:Ll/wxy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wxy0;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/vxy0;->a:Ll/f2z0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/f2z0;->zze()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method
