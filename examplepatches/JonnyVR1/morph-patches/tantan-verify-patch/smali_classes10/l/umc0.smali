.class public Ll/umc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ur4;


# instance fields
.field public a:I

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/bzm;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/yc60;

.field public d:Ll/qy3;

.field public e:Ll/smc0;


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


# virtual methods
.method public a(Ll/yc60;)Ll/ur4;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/umc0;->d:Ll/qy3;

    .line 2
    .line 3
    instance-of v1, v0, Ll/rme0;

    .line 4
    .line 5
    if-eqz v1, :cond_2

    .line 6
    .line 7
    iget v0, p0, Ll/umc0;->a:I

    .line 8
    .line 9
    iget-object v1, p0, Ll/umc0;->b:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-lt v0, v1, :cond_0

    .line 16
    .line 17
    move-object v1, p0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Ll/umc0;->b:Ljava/util/List;

    .line 20
    .line 21
    iget v1, p0, Ll/umc0;->a:I

    .line 22
    .line 23
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/bzm;

    .line 28
    .line 29
    iget-object v2, p0, Ll/umc0;->e:Ll/smc0;

    .line 30
    .line 31
    iget-object v3, p0, Ll/umc0;->b:Ljava/util/List;

    .line 32
    .line 33
    iget v1, p0, Ll/umc0;->a:I

    .line 34
    .line 35
    add-int/lit8 v4, v1, 0x1

    .line 36
    .line 37
    iget-object v6, p0, Ll/umc0;->d:Ll/qy3;

    .line 38
    .line 39
    move-object v1, p0

    .line 40
    move-object v5, p1

    .line 41
    invoke-virtual/range {v1 .. v6}, Ll/umc0;->d(Ll/smc0;Ljava/util/List;ILl/yc60;Ll/qy3;)Ll/umc0;

    .line 42
    .line 43
    .line 44
    iget-object p0, v1, Ll/umc0;->d:Ll/qy3;

    .line 45
    .line 46
    instance-of p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/a;

    .line 47
    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    iget-object p0, v1, Ll/umc0;->e:Ll/smc0;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/smc0;->m()Ll/vzv;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    const-string v2, ":interceptSend"

    .line 65
    .line 66
    invoke-virtual {p1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p0, p1}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    invoke-virtual {v0, v1}, Ll/bzm;->b(Ll/ur4;)V

    .line 74
    .line 75
    .line 76
    return-object v1

    .line 77
    :cond_2
    move-object v1, p0

    .line 78
    move-object v5, p1

    .line 79
    instance-of p0, v0, Ll/tnc0;

    .line 80
    .line 81
    if-eqz p0, :cond_4

    .line 82
    .line 83
    iget p0, v1, Ll/umc0;->a:I

    .line 84
    .line 85
    if-gez p0, :cond_3

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_3
    iget-object p1, v1, Ll/umc0;->b:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    check-cast p0, Ll/bzm;

    .line 95
    .line 96
    iget-object v8, v1, Ll/umc0;->e:Ll/smc0;

    .line 97
    .line 98
    iget-object v9, v1, Ll/umc0;->b:Ljava/util/List;

    .line 99
    .line 100
    iget p1, v1, Ll/umc0;->a:I

    .line 101
    .line 102
    add-int/lit8 v10, p1, -0x1

    .line 103
    .line 104
    iget-object v12, v1, Ll/umc0;->d:Ll/qy3;

    .line 105
    .line 106
    move-object v7, v1

    .line 107
    move-object v11, v5

    .line 108
    invoke-virtual/range {v7 .. v12}, Ll/umc0;->d(Ll/smc0;Ljava/util/List;ILl/yc60;Ll/qy3;)Ll/umc0;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0, v1}, Ll/bzm;->a(Ll/ur4;)V

    .line 112
    .line 113
    .line 114
    :cond_4
    :goto_0
    return-object v1
.end method

.method public b()Ll/smc0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umc0;->e:Ll/smc0;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ll/yc60;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umc0;->c:Ll/yc60;

    .line 2
    .line 3
    return-object p0
.end method

.method public call()Ll/qy3;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umc0;->d:Ll/qy3;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/smc0;Ljava/util/List;ILl/yc60;Ll/qy3;)Ll/umc0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/smc0;",
            "Ljava/util/List<",
            "Ll/bzm;",
            ">;I",
            "Ll/yc60;",
            "Ll/qy3;",
            ")",
            "Ll/umc0;"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/umc0;->b:Ljava/util/List;

    .line 2
    .line 3
    iput p3, p0, Ll/umc0;->a:I

    .line 4
    .line 5
    iput-object p4, p0, Ll/umc0;->c:Ll/yc60;

    .line 6
    .line 7
    iput-object p5, p0, Ll/umc0;->d:Ll/qy3;

    .line 8
    .line 9
    iput-object p1, p0, Ll/umc0;->e:Ll/smc0;

    .line 10
    .line 11
    return-object p0
.end method
