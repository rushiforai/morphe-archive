.class public Ltech/sud/runtime/component/c/i;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltech/sud/runtime/component/c/i$b;,
        Ltech/sud/runtime/component/c/i$a;
    }
.end annotation


# instance fields
.field private a:Ltech/sud/runtime/core/b;

.field private b:Landroid/hardware/SensorManager;

.field private c:Ltech/sud/runtime/component/c/i$a;

.field private d:Ltech/sud/runtime/component/c/i$a;

.field private e:Ltech/sud/runtime/component/c/i$a;

.field private f:Ltech/sud/runtime/component/c/i$a;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/core/b;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 6
    .line 7
    iput-object v0, p0, Ltech/sud/runtime/component/c/i;->c:Ltech/sud/runtime/component/c/i$a;

    .line 8
    .line 9
    iput-object v0, p0, Ltech/sud/runtime/component/c/i;->d:Ltech/sud/runtime/component/c/i$a;

    .line 10
    .line 11
    iput-object v0, p0, Ltech/sud/runtime/component/c/i;->e:Ltech/sud/runtime/component/c/i$a;

    .line 12
    .line 13
    iput-object v0, p0, Ltech/sud/runtime/component/c/i;->f:Ltech/sud/runtime/component/c/i$a;

    .line 14
    .line 15
    iput-object p1, p0, Ltech/sud/runtime/component/c/i;->a:Ltech/sud/runtime/core/b;

    .line 16
    .line 17
    return-void
.end method

.method private static b(I)I
    .locals 1

    .line 40
    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    const/4 v0, 0x2

    if-eq p0, v0, :cond_0

    const/4 p0, 0x3

    return p0

    :cond_0
    return v0
.end method


# virtual methods
.method public a()V
    .locals 3

    const/4 v0, 0x0

    .line 132
    iput-object v0, p0, Ltech/sud/runtime/component/c/i;->a:Ltech/sud/runtime/core/b;

    .line 133
    iget-object v1, p0, Ltech/sud/runtime/component/c/i;->c:Ltech/sud/runtime/component/c/i$a;

    if-eqz v1, :cond_0

    .line 134
    iget-object v2, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    invoke-static {v1, v2}, Ltech/sud/runtime/component/c/i$a;->a(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 135
    iput-object v0, p0, Ltech/sud/runtime/component/c/i;->c:Ltech/sud/runtime/component/c/i$a;

    .line 136
    :cond_0
    iget-object v1, p0, Ltech/sud/runtime/component/c/i;->d:Ltech/sud/runtime/component/c/i$a;

    if-eqz v1, :cond_1

    .line 137
    iget-object v2, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    invoke-static {v1, v2}, Ltech/sud/runtime/component/c/i$a;->a(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 138
    iput-object v0, p0, Ltech/sud/runtime/component/c/i;->d:Ltech/sud/runtime/component/c/i$a;

    .line 139
    :cond_1
    iget-object v1, p0, Ltech/sud/runtime/component/c/i;->e:Ltech/sud/runtime/component/c/i$a;

    if-eqz v1, :cond_2

    .line 140
    iget-object v2, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    invoke-static {v1, v2}, Ltech/sud/runtime/component/c/i$a;->a(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 141
    iput-object v0, p0, Ltech/sud/runtime/component/c/i;->e:Ltech/sud/runtime/component/c/i$a;

    .line 142
    :cond_2
    iget-object v1, p0, Ltech/sud/runtime/component/c/i;->f:Ltech/sud/runtime/component/c/i$a;

    if-eqz v1, :cond_3

    .line 143
    iget-object v2, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    invoke-static {v1, v2}, Ltech/sud/runtime/component/c/i$a;->a(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 144
    iput-object v0, p0, Ltech/sud/runtime/component/c/i;->f:Ltech/sud/runtime/component/c/i$a;

    .line 145
    :cond_3
    iput-object v0, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    return-void
.end method

.method public a(I)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eq p1, v0, :cond_3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 146
    :cond_0
    iget-object p1, p0, Ltech/sud/runtime/component/c/i;->e:Ltech/sud/runtime/component/c/i$a;

    if-eqz p1, :cond_4

    .line 147
    iget-object v0, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    invoke-static {p1, v0}, Ltech/sud/runtime/component/c/i$a;->a(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 148
    iput-object v1, p0, Ltech/sud/runtime/component/c/i;->e:Ltech/sud/runtime/component/c/i$a;

    return-void

    .line 149
    :cond_1
    iget-object p1, p0, Ltech/sud/runtime/component/c/i;->f:Ltech/sud/runtime/component/c/i$a;

    if-eqz p1, :cond_4

    .line 150
    iget-object v0, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    invoke-static {p1, v0}, Ltech/sud/runtime/component/c/i$a;->a(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 151
    iput-object v1, p0, Ltech/sud/runtime/component/c/i;->f:Ltech/sud/runtime/component/c/i$a;

    return-void

    .line 152
    :cond_2
    iget-object p1, p0, Ltech/sud/runtime/component/c/i;->d:Ltech/sud/runtime/component/c/i$a;

    if-eqz p1, :cond_4

    .line 153
    iget-object v0, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    invoke-static {p1, v0}, Ltech/sud/runtime/component/c/i$a;->a(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 154
    iput-object v1, p0, Ltech/sud/runtime/component/c/i;->d:Ltech/sud/runtime/component/c/i$a;

    return-void

    .line 155
    :cond_3
    iget-object p1, p0, Ltech/sud/runtime/component/c/i;->c:Ltech/sud/runtime/component/c/i$a;

    if-eqz p1, :cond_4

    .line 156
    iget-object v0, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    invoke-static {p1, v0}, Ltech/sud/runtime/component/c/i$a;->a(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 157
    iput-object v1, p0, Ltech/sud/runtime/component/c/i;->c:Ltech/sud/runtime/component/c/i$a;

    :cond_4
    :goto_0
    return-void
.end method

.method public a(II)V
    .locals 7

    .line 1
    iget-object v1, p0, Ltech/sud/runtime/component/c/i;->a:Ltech/sud/runtime/core/b;

    .line 2
    .line 3
    if-nez v1, :cond_0

    .line 4
    .line 5
    goto/16 :goto_0

    .line 6
    .line 7
    :cond_0
    invoke-virtual {v1}, Ltech/sud/runtime/core/b;->d()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_1
    iget-object v2, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 16
    .line 17
    if-nez v2, :cond_2

    .line 18
    .line 19
    const-string v2, "sensor"

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroid/hardware/SensorManager;

    .line 26
    .line 27
    iput-object v0, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 28
    .line 29
    :cond_2
    invoke-static {p2}, Ltech/sud/runtime/component/c/i;->b(I)I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    const/4 p2, 0x1

    .line 34
    if-eq p1, p2, :cond_6

    .line 35
    .line 36
    const/4 p2, 0x2

    .line 37
    if-eq p1, p2, :cond_5

    .line 38
    .line 39
    const/4 p2, 0x3

    .line 40
    if-eq p1, p2, :cond_4

    .line 41
    .line 42
    const/4 p2, 0x4

    .line 43
    if-eq p1, p2, :cond_3

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_3
    iget-object p1, p0, Ltech/sud/runtime/component/c/i;->e:Ltech/sud/runtime/component/c/i$a;

    .line 47
    .line 48
    if-nez p1, :cond_7

    .line 49
    .line 50
    new-instance v0, Ltech/sud/runtime/component/c/i$a;

    .line 51
    .line 52
    iget-object v2, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 53
    .line 54
    const/4 v3, 0x4

    .line 55
    const/4 v5, 0x0

    .line 56
    invoke-direct/range {v0 .. v5}, Ltech/sud/runtime/component/c/i$a;-><init>(Ltech/sud/runtime/core/b;Landroid/hardware/SensorManager;IILtech/sud/runtime/component/c/i$1;)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Ltech/sud/runtime/component/c/i;->e:Ltech/sud/runtime/component/c/i$a;

    .line 60
    .line 61
    iget-object p0, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 62
    .line 63
    invoke-static {v0, p0}, Ltech/sud/runtime/component/c/i$a;->b(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_4
    iget-object p1, p0, Ltech/sud/runtime/component/c/i;->f:Ltech/sud/runtime/component/c/i$a;

    .line 68
    .line 69
    if-nez p1, :cond_7

    .line 70
    .line 71
    new-instance v0, Ltech/sud/runtime/component/c/i$a;

    .line 72
    .line 73
    iget-object v2, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 74
    .line 75
    const/4 v5, 0x3

    .line 76
    const/4 v6, 0x0

    .line 77
    const/4 v3, 0x3

    .line 78
    invoke-direct/range {v0 .. v6}, Ltech/sud/runtime/component/c/i$a;-><init>(Ltech/sud/runtime/core/b;Landroid/hardware/SensorManager;IIILtech/sud/runtime/component/c/i$1;)V

    .line 79
    .line 80
    .line 81
    iput-object v0, p0, Ltech/sud/runtime/component/c/i;->f:Ltech/sud/runtime/component/c/i$a;

    .line 82
    .line 83
    iget-object p0, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 84
    .line 85
    invoke-static {v0, p0}, Ltech/sud/runtime/component/c/i$a;->b(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_5
    iget-object p1, p0, Ltech/sud/runtime/component/c/i;->d:Ltech/sud/runtime/component/c/i$a;

    .line 90
    .line 91
    if-nez p1, :cond_7

    .line 92
    .line 93
    new-instance v0, Ltech/sud/runtime/component/c/i$a;

    .line 94
    .line 95
    iget-object v2, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 96
    .line 97
    const/4 v4, 0x3

    .line 98
    const/4 v5, 0x0

    .line 99
    const/4 v3, 0x3

    .line 100
    invoke-direct/range {v0 .. v5}, Ltech/sud/runtime/component/c/i$a;-><init>(Ltech/sud/runtime/core/b;Landroid/hardware/SensorManager;IILtech/sud/runtime/component/c/i$1;)V

    .line 101
    .line 102
    .line 103
    iput-object v0, p0, Ltech/sud/runtime/component/c/i;->d:Ltech/sud/runtime/component/c/i$a;

    .line 104
    .line 105
    iget-object p0, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 106
    .line 107
    invoke-static {v0, p0}, Ltech/sud/runtime/component/c/i$a;->b(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_6
    iget-object p1, p0, Ltech/sud/runtime/component/c/i;->c:Ltech/sud/runtime/component/c/i$a;

    .line 112
    .line 113
    if-nez p1, :cond_7

    .line 114
    .line 115
    new-instance v0, Ltech/sud/runtime/component/c/i$a;

    .line 116
    .line 117
    iget-object v2, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 118
    .line 119
    const/4 v3, 0x1

    .line 120
    const/4 v5, 0x0

    .line 121
    invoke-direct/range {v0 .. v5}, Ltech/sud/runtime/component/c/i$a;-><init>(Ltech/sud/runtime/core/b;Landroid/hardware/SensorManager;IILtech/sud/runtime/component/c/i$1;)V

    .line 122
    .line 123
    .line 124
    iput-object v0, p0, Ltech/sud/runtime/component/c/i;->c:Ltech/sud/runtime/component/c/i$a;

    .line 125
    .line 126
    iget-object p0, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 127
    .line 128
    invoke-static {v0, p0}, Ltech/sud/runtime/component/c/i$a;->b(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 129
    .line 130
    .line 131
    :cond_7
    :goto_0
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v1, p0, Ltech/sud/runtime/component/c/i;->c:Ltech/sud/runtime/component/c/i$a;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static {v1, v0}, Ltech/sud/runtime/component/c/i$a;->a(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/component/c/i;->d:Ltech/sud/runtime/component/c/i$a;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ltech/sud/runtime/component/c/i$a;->a(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Ltech/sud/runtime/component/c/i;->e:Ltech/sud/runtime/component/c/i$a;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v1, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 26
    .line 27
    invoke-static {v0, v1}, Ltech/sud/runtime/component/c/i$a;->a(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 28
    .line 29
    .line 30
    :cond_2
    iget-object v0, p0, Ltech/sud/runtime/component/c/i;->f:Ltech/sud/runtime/component/c/i$a;

    .line 31
    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    iget-object p0, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 35
    .line 36
    invoke-static {v0, p0}, Ltech/sud/runtime/component/c/i$a;->a(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v1, p0, Ltech/sud/runtime/component/c/i;->c:Ltech/sud/runtime/component/c/i$a;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static {v1, v0}, Ltech/sud/runtime/component/c/i$a;->b(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/component/c/i;->d:Ltech/sud/runtime/component/c/i$a;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ltech/sud/runtime/component/c/i$a;->b(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Ltech/sud/runtime/component/c/i;->e:Ltech/sud/runtime/component/c/i$a;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v1, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 26
    .line 27
    invoke-static {v0, v1}, Ltech/sud/runtime/component/c/i$a;->b(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 28
    .line 29
    .line 30
    :cond_2
    iget-object v0, p0, Ltech/sud/runtime/component/c/i;->f:Ltech/sud/runtime/component/c/i$a;

    .line 31
    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    iget-object p0, p0, Ltech/sud/runtime/component/c/i;->b:Landroid/hardware/SensorManager;

    .line 35
    .line 36
    invoke-static {v0, p0}, Ltech/sud/runtime/component/c/i$a;->b(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    return-void
.end method
