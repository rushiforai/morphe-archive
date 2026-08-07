.class public Lcom/xiaomi/push/go;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/xiaomi/push/hq;
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/xiaomi/push/hq<",
        "Lcom/xiaomi/push/go;",
        "Ljava/lang/Object;",
        ">;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# static fields
.field private static final a:Ll/m3r0;

.field private static final a:Ll/z3r0;

.field private static final b:Ll/m3r0;

.field private static final c:Ll/m3r0;


# instance fields
.field public a:I

.field public a:Lcom/xiaomi/push/gl;

.field private a:Ljava/util/BitSet;

.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/xiaomi/push/gq;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Ll/z3r0;

    .line 2
    .line 3
    const-string v1, "NormalConfig"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/z3r0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/xiaomi/push/go;->a:Ll/z3r0;

    .line 9
    .line 10
    new-instance v0, Ll/m3r0;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    const-string v2, ""

    .line 14
    .line 15
    const/16 v3, 0x8

    .line 16
    .line 17
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/xiaomi/push/go;->a:Ll/m3r0;

    .line 21
    .line 22
    new-instance v0, Ll/m3r0;

    .line 23
    .line 24
    const/16 v1, 0xf

    .line 25
    .line 26
    const/4 v4, 0x2

    .line 27
    invoke-direct {v0, v2, v1, v4}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/xiaomi/push/go;->b:Ll/m3r0;

    .line 31
    .line 32
    new-instance v0, Ll/m3r0;

    .line 33
    .line 34
    const/4 v1, 0x3

    .line 35
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 36
    .line 37
    .line 38
    sput-object v0, Lcom/xiaomi/push/go;->c:Ll/m3r0;

    .line 39
    .line 40
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/BitSet;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/xiaomi/push/go;->a:Ljava/util/BitSet;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 168
    iget p0, p0, Lcom/xiaomi/push/go;->a:I

    return p0
.end method

.method public a(Lcom/xiaomi/push/go;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/go;->a()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p1}, Lcom/xiaomi/push/go;->a()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    return v0

    .line 59
    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/go;->a()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    iget v0, p0, Lcom/xiaomi/push/go;->a:I

    .line 66
    .line 67
    iget v1, p1, Lcom/xiaomi/push/go;->a:I

    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/k3r0;->b(II)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    return v0

    .line 76
    :cond_2
    invoke-virtual {p0}, Lcom/xiaomi/push/go;->b()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p1}, Lcom/xiaomi/push/go;->b()Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_3

    .line 97
    .line 98
    return v0

    .line 99
    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/go;->b()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_4

    .line 104
    .line 105
    iget-object v0, p0, Lcom/xiaomi/push/go;->a:Ljava/util/List;

    .line 106
    .line 107
    iget-object v1, p1, Lcom/xiaomi/push/go;->a:Ljava/util/List;

    .line 108
    .line 109
    invoke-static {v0, v1}, Ll/k3r0;->g(Ljava/util/List;Ljava/util/List;)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_4

    .line 114
    .line 115
    return v0

    .line 116
    :cond_4
    invoke-virtual {p0}, Lcom/xiaomi/push/go;->c()Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {p1}, Lcom/xiaomi/push/go;->c()Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_5

    .line 137
    .line 138
    return v0

    .line 139
    :cond_5
    invoke-virtual {p0}, Lcom/xiaomi/push/go;->c()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_6

    .line 144
    .line 145
    iget-object p0, p0, Lcom/xiaomi/push/go;->a:Lcom/xiaomi/push/gl;

    .line 146
    .line 147
    iget-object p1, p1, Lcom/xiaomi/push/go;->a:Lcom/xiaomi/push/gl;

    .line 148
    .line 149
    invoke-static {p0, p1}, Ll/k3r0;->d(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    if-eqz p0, :cond_6

    .line 154
    .line 155
    return p0

    .line 156
    :cond_6
    const/4 p0, 0x0

    .line 157
    return p0
.end method

.method public a()Lcom/xiaomi/push/gl;
    .locals 0

    .line 160
    iget-object p0, p0, Lcom/xiaomi/push/go;->a:Lcom/xiaomi/push/gl;

    return-object p0
.end method

.method public a()V
    .locals 3

    .line 192
    iget-object v0, p0, Lcom/xiaomi/push/go;->a:Ljava/util/List;

    if-eqz v0, :cond_0

    return-void

    .line 193
    :cond_0
    new-instance v0, Lcom/xiaomi/push/ib;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Required field \'configItems\' was not present! Struct: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xiaomi/push/go;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/xiaomi/push/ib;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public a(Ll/w3r0;)V
    .locals 4

    .line 169
    invoke-virtual {p1}, Ll/w3r0;->k()Ll/z3r0;

    .line 170
    :goto_0
    invoke-virtual {p1}, Ll/w3r0;->g()Ll/m3r0;

    move-result-object v0

    .line 171
    iget-byte v1, v0, Ll/m3r0;->b:B

    if-nez v1, :cond_1

    .line 172
    invoke-virtual {p1}, Ll/w3r0;->D()V

    .line 173
    invoke-virtual {p0}, Lcom/xiaomi/push/go;->a()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 174
    invoke-virtual {p0}, Lcom/xiaomi/push/go;->a()V

    return-void

    .line 175
    :cond_0
    new-instance p1, Lcom/xiaomi/push/ib;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Required field \'version\' was not found in serialized data! Struct: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xiaomi/push/go;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lcom/xiaomi/push/ib;-><init>(Ljava/lang/String;)V

    throw p1

    .line 176
    :cond_1
    iget-short v0, v0, Ll/m3r0;->c:S

    const/16 v2, 0x8

    const/4 v3, 0x1

    if-eq v0, v3, :cond_7

    const/4 v3, 0x2

    if-eq v0, v3, :cond_4

    const/4 v3, 0x3

    if-eq v0, v3, :cond_2

    .line 177
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :cond_2
    if-ne v1, v2, :cond_3

    .line 178
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    invoke-static {v0}, Lcom/xiaomi/push/gl;->a(I)Lcom/xiaomi/push/gl;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/go;->a:Lcom/xiaomi/push/gl;

    goto :goto_2

    .line 179
    :cond_3
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :cond_4
    const/16 v0, 0xf

    if-ne v1, v0, :cond_6

    .line 180
    invoke-virtual {p1}, Ll/w3r0;->h()Ll/n3r0;

    move-result-object v0

    .line 181
    new-instance v1, Ljava/util/ArrayList;

    iget v2, v0, Ll/n3r0;->b:I

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lcom/xiaomi/push/go;->a:Ljava/util/List;

    const/4 v1, 0x0

    .line 182
    :goto_1
    iget v2, v0, Ll/n3r0;->b:I

    if-ge v1, v2, :cond_5

    .line 183
    new-instance v2, Lcom/xiaomi/push/gq;

    invoke-direct {v2}, Lcom/xiaomi/push/gq;-><init>()V

    .line 184
    invoke-virtual {v2, p1}, Lcom/xiaomi/push/gq;->a(Ll/w3r0;)V

    .line 185
    iget-object v3, p0, Lcom/xiaomi/push/go;->a:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 186
    :cond_5
    invoke-virtual {p1}, Ll/w3r0;->G()V

    goto :goto_2

    .line 187
    :cond_6
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :cond_7
    if-ne v1, v2, :cond_8

    .line 188
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/push/go;->a:I

    .line 189
    invoke-virtual {p0, v3}, Lcom/xiaomi/push/go;->a(Z)V

    goto :goto_2

    .line 190
    :cond_8
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    .line 191
    :goto_2
    invoke-virtual {p1}, Ll/w3r0;->E()V

    goto/16 :goto_0
.end method

.method public a(Z)V
    .locals 1

    .line 159
    iget-object p0, p0, Lcom/xiaomi/push/go;->a:Ljava/util/BitSet;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public a()Z
    .locals 1

    .line 158
    iget-object p0, p0, Lcom/xiaomi/push/go;->a:Ljava/util/BitSet;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    move-result p0

    return p0
.end method

.method public a(Lcom/xiaomi/push/go;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 161
    :cond_0
    iget v1, p0, Lcom/xiaomi/push/go;->a:I

    iget v2, p1, Lcom/xiaomi/push/go;->a:I

    if-eq v1, v2, :cond_1

    return v0

    .line 162
    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/go;->b()Z

    move-result v1

    .line 163
    invoke-virtual {p1}, Lcom/xiaomi/push/go;->b()Z

    move-result v2

    if-nez v1, :cond_2

    if-eqz v2, :cond_4

    :cond_2
    if-eqz v1, :cond_8

    if-nez v2, :cond_3

    goto :goto_0

    .line 164
    :cond_3
    iget-object v1, p0, Lcom/xiaomi/push/go;->a:Ljava/util/List;

    iget-object v2, p1, Lcom/xiaomi/push/go;->a:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v0

    .line 165
    :cond_4
    invoke-virtual {p0}, Lcom/xiaomi/push/go;->c()Z

    move-result v1

    .line 166
    invoke-virtual {p1}, Lcom/xiaomi/push/go;->c()Z

    move-result v2

    if-nez v1, :cond_5

    if-eqz v2, :cond_7

    :cond_5
    if-eqz v1, :cond_8

    if-nez v2, :cond_6

    goto :goto_0

    .line 167
    :cond_6
    iget-object p0, p0, Lcom/xiaomi/push/go;->a:Lcom/xiaomi/push/gl;

    iget-object p1, p1, Lcom/xiaomi/push/go;->a:Lcom/xiaomi/push/gl;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7

    return v0

    :cond_7
    const/4 p0, 0x1

    return p0

    :cond_8
    :goto_0
    return v0
.end method

.method public b(Ll/w3r0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/go;->a()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/xiaomi/push/go;->a:Ll/z3r0;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/w3r0;->v(Ll/z3r0;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/xiaomi/push/go;->a:Ll/m3r0;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Lcom/xiaomi/push/go;->a:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ll/w3r0;->o(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/xiaomi/push/go;->a:Ljava/util/List;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    sget-object v0, Lcom/xiaomi/push/go;->b:Ll/m3r0;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/n3r0;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/xiaomi/push/go;->a:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    const/16 v2, 0xc

    .line 40
    .line 41
    invoke-direct {v0, v2, v1}, Ll/n3r0;-><init>(BI)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ll/w3r0;->t(Ll/n3r0;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/xiaomi/push/go;->a:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_0

    .line 58
    .line 59
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    check-cast v1, Lcom/xiaomi/push/gq;

    .line 64
    .line 65
    invoke-virtual {v1, p1}, Lcom/xiaomi/push/gq;->b(Ll/w3r0;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    invoke-virtual {p1}, Ll/w3r0;->C()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 73
    .line 74
    .line 75
    :cond_1
    iget-object v0, p0, Lcom/xiaomi/push/go;->a:Lcom/xiaomi/push/gl;

    .line 76
    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/xiaomi/push/go;->c()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_2

    .line 84
    .line 85
    sget-object v0, Lcom/xiaomi/push/go;->c:Ll/m3r0;

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Lcom/xiaomi/push/go;->a:Lcom/xiaomi/push/gl;

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/xiaomi/push/gl;->a()I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    invoke-virtual {p1, p0}, Ll/w3r0;->o(I)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 100
    .line 101
    .line 102
    :cond_2
    invoke-virtual {p1}, Ll/w3r0;->A()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1}, Ll/w3r0;->m()V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public b()Z
    .locals 0

    .line 109
    iget-object p0, p0, Lcom/xiaomi/push/go;->a:Ljava/util/List;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/go;->a:Lcom/xiaomi/push/gl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/xiaomi/push/go;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/go;->a(Lcom/xiaomi/push/go;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/xiaomi/push/go;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    check-cast p1, Lcom/xiaomi/push/go;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/go;->a(Lcom/xiaomi/push/go;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_1
    return v0
.end method

.method public hashCode()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "NormalConfig(version:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/xiaomi/push/go;->a:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v2, "configItems:"

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Lcom/xiaomi/push/go;->a:Ljava/util/List;

    .line 24
    .line 25
    const-string v3, "null"

    .line 26
    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    :goto_0
    invoke-virtual {p0}, Lcom/xiaomi/push/go;->c()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_2

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v1, "type:"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/xiaomi/push/go;->a:Lcom/xiaomi/push/gl;

    .line 51
    .line 52
    if-nez p0, :cond_1

    .line 53
    .line 54
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    :cond_2
    :goto_1
    const-string p0, ")"

    .line 62
    .line 63
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method
