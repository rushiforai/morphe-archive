.class public Lcom/xiaomi/push/gx;
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
        "Lcom/xiaomi/push/gx;",
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


# instance fields
.field public a:I

.field private a:Ljava/util/BitSet;

.field public b:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll/z3r0;

    .line 2
    .line 3
    const-string v1, "XmPushActionCheckClientInfo"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/z3r0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/xiaomi/push/gx;->a:Ll/z3r0;

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
    sput-object v0, Lcom/xiaomi/push/gx;->a:Ll/m3r0;

    .line 21
    .line 22
    new-instance v0, Ll/m3r0;

    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 26
    .line 27
    .line 28
    sput-object v0, Lcom/xiaomi/push/gx;->b:Ll/m3r0;

    .line 29
    .line 30
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
    const/4 v1, 0x2

    .line 7
    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/xiaomi/push/gx;->a:Ljava/util/BitSet;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Lcom/xiaomi/push/gx;)I
    .locals 2

    .line 134
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 135
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p0

    return p0

    .line 136
    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/gx;->a()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p1}, Lcom/xiaomi/push/gx;->a()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    move-result v0

    if-eqz v0, :cond_1

    return v0

    .line 137
    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/gx;->a()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 138
    iget v0, p0, Lcom/xiaomi/push/gx;->a:I

    iget v1, p1, Lcom/xiaomi/push/gx;->a:I

    invoke-static {v0, v1}, Ll/k3r0;->b(II)I

    move-result v0

    if-eqz v0, :cond_2

    return v0

    .line 139
    :cond_2
    invoke-virtual {p0}, Lcom/xiaomi/push/gx;->b()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p1}, Lcom/xiaomi/push/gx;->b()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    move-result v0

    if-eqz v0, :cond_3

    return v0

    .line 140
    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/gx;->b()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 141
    iget p0, p0, Lcom/xiaomi/push/gx;->b:I

    iget p1, p1, Lcom/xiaomi/push/gx;->b:I

    invoke-static {p0, p1}, Ll/k3r0;->b(II)I

    move-result p0

    if-eqz p0, :cond_4

    return p0

    :cond_4
    const/4 p0, 0x0

    return p0
.end method

.method public a(I)Lcom/xiaomi/push/gx;
    .locals 0

    .line 128
    iput p1, p0, Lcom/xiaomi/push/gx;->a:I

    const/4 p1, 0x1

    .line 129
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/gx;->a(Z)V

    return-object p0
.end method

.method public a()V
    .locals 0

    .line 142
    return-void
.end method

.method public a(Ll/w3r0;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ll/w3r0;->k()Ll/z3r0;

    .line 2
    .line 3
    .line 4
    :goto_0
    invoke-virtual {p1}, Ll/w3r0;->g()Ll/m3r0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-byte v1, v0, Ll/m3r0;->b:B

    .line 9
    .line 10
    if-nez v1, :cond_2

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/w3r0;->D()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/xiaomi/push/gx;->a()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/xiaomi/push/gx;->b()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/xiaomi/push/gx;->a()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    new-instance p1, Lcom/xiaomi/push/ib;

    .line 32
    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v1, "Required field \'pluginConfigVersion\' was not found in serialized data! Struct: "

    .line 36
    .line 37
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/xiaomi/push/gx;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-direct {p1, p0}, Lcom/xiaomi/push/ib;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw p1

    .line 55
    :cond_1
    new-instance p1, Lcom/xiaomi/push/ib;

    .line 56
    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v1, "Required field \'miscConfigVersion\' was not found in serialized data! Struct: "

    .line 60
    .line 61
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/xiaomi/push/gx;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-direct {p1, p0}, Lcom/xiaomi/push/ib;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    throw p1

    .line 79
    :cond_2
    iget-short v0, v0, Ll/m3r0;->c:S

    .line 80
    .line 81
    const/16 v2, 0x8

    .line 82
    .line 83
    const/4 v3, 0x1

    .line 84
    if-eq v0, v3, :cond_5

    .line 85
    .line 86
    const/4 v4, 0x2

    .line 87
    if-eq v0, v4, :cond_3

    .line 88
    .line 89
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_3
    if-ne v1, v2, :cond_4

    .line 94
    .line 95
    invoke-virtual {p1}, Ll/w3r0;->c()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iput v0, p0, Lcom/xiaomi/push/gx;->b:I

    .line 100
    .line 101
    invoke-virtual {p0, v3}, Lcom/xiaomi/push/gx;->b(Z)V

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_4
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_5
    if-ne v1, v2, :cond_6

    .line 110
    .line 111
    invoke-virtual {p1}, Ll/w3r0;->c()I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    iput v0, p0, Lcom/xiaomi/push/gx;->a:I

    .line 116
    .line 117
    invoke-virtual {p0, v3}, Lcom/xiaomi/push/gx;->a(Z)V

    .line 118
    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_6
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    .line 122
    .line 123
    .line 124
    :goto_1
    invoke-virtual {p1}, Ll/w3r0;->E()V

    .line 125
    .line 126
    .line 127
    goto :goto_0
.end method

.method public a(Z)V
    .locals 1

    .line 131
    iget-object p0, p0, Lcom/xiaomi/push/gx;->a:Ljava/util/BitSet;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public a()Z
    .locals 1

    .line 130
    iget-object p0, p0, Lcom/xiaomi/push/gx;->a:Ljava/util/BitSet;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    move-result p0

    return p0
.end method

.method public a(Lcom/xiaomi/push/gx;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 132
    :cond_0
    iget v1, p0, Lcom/xiaomi/push/gx;->a:I

    iget v2, p1, Lcom/xiaomi/push/gx;->a:I

    if-eq v1, v2, :cond_1

    return v0

    .line 133
    :cond_1
    iget p0, p0, Lcom/xiaomi/push/gx;->b:I

    iget p1, p1, Lcom/xiaomi/push/gx;->b:I

    if-eq p0, p1, :cond_2

    return v0

    :cond_2
    const/4 p0, 0x1

    return p0
.end method

.method public b(I)Lcom/xiaomi/push/gx;
    .locals 0

    .line 44
    iput p1, p0, Lcom/xiaomi/push/gx;->b:I

    const/4 p1, 0x1

    .line 45
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/gx;->b(Z)V

    return-object p0
.end method

.method public b(Ll/w3r0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/gx;->a()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/xiaomi/push/gx;->a:Ll/z3r0;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/w3r0;->v(Ll/z3r0;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/xiaomi/push/gx;->a:Ll/m3r0;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Lcom/xiaomi/push/gx;->a:I

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
    sget-object v0, Lcom/xiaomi/push/gx;->b:Ll/m3r0;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 25
    .line 26
    .line 27
    iget p0, p0, Lcom/xiaomi/push/gx;->b:I

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Ll/w3r0;->o(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ll/w3r0;->A()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ll/w3r0;->m()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public b(Z)V
    .locals 1

    .line 43
    iget-object p0, p0, Lcom/xiaomi/push/gx;->a:Ljava/util/BitSet;

    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public b()Z
    .locals 1

    .line 42
    iget-object p0, p0, Lcom/xiaomi/push/gx;->a:Ljava/util/BitSet;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    move-result p0

    return p0
.end method

.method public synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/xiaomi/push/gx;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/gx;->a(Lcom/xiaomi/push/gx;)I

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
    instance-of v1, p1, Lcom/xiaomi/push/gx;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    check-cast p1, Lcom/xiaomi/push/gx;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/gx;->a(Lcom/xiaomi/push/gx;)Z

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
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "XmPushActionCheckClientInfo(miscConfigVersion:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/xiaomi/push/gx;->a:I

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
    const-string v1, "pluginConfigVersion:"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget p0, p0, Lcom/xiaomi/push/gx;->b:I

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p0, ")"

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method
