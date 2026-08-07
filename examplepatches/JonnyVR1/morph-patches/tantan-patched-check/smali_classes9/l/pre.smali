.class public Ll/pre;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/pre$a;
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Z

.field public final c:I

.field public d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/pre$a;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/pre;->d:Ljava/util/Map;

    .line 10
    .line 11
    invoke-static {p1}, Ll/pre$a;->j(Ll/pre$a;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/pre;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1}, Ll/pre$a;->h(Ll/pre$a;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput-boolean v0, p0, Ll/pre;->b:Z

    .line 22
    .line 23
    invoke-static {p1}, Ll/pre$a;->d(Ll/pre$a;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Ll/pre;->c:I

    .line 28
    .line 29
    iget-object v0, p0, Ll/pre;->d:Ljava/util/Map;

    .line 30
    .line 31
    const-string v1, "unique_id"

    .line 32
    .line 33
    invoke-static {p1}, Ll/pre$a;->k(Ll/pre$a;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/pre;->d:Ljava/util/Map;

    .line 41
    .line 42
    invoke-static {p1}, Ll/pre$a;->c(Ll/pre$a;)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const-string v2, "giftId"

    .line 51
    .line 52
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/pre;->d:Ljava/util/Map;

    .line 56
    .line 57
    const-string v1, "gift_resource_id"

    .line 58
    .line 59
    invoke-static {p1}, Ll/pre$a;->f(Ll/pre$a;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/pre;->d:Ljava/util/Map;

    .line 67
    .line 68
    const-string v1, "actor_user_id"

    .line 69
    .line 70
    invoke-static {p1}, Ll/pre$a;->j(Ll/pre$a;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/pre;->d:Ljava/util/Map;

    .line 78
    .line 79
    const-string v1, "anchorId"

    .line 80
    .line 81
    invoke-static {p1}, Ll/pre$a;->a(Ll/pre$a;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/pre;->d:Ljava/util/Map;

    .line 89
    .line 90
    const-string v1, "giftName"

    .line 91
    .line 92
    invoke-static {p1}, Ll/pre$a;->e(Ll/pre$a;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Ll/pre;->d:Ljava/util/Map;

    .line 100
    .line 101
    const-string v1, "liveId"

    .line 102
    .line 103
    invoke-static {p1}, Ll/pre$a;->i(Ll/pre$a;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Ll/pre;->d:Ljava/util/Map;

    .line 111
    .line 112
    const-string v1, "gift_effect_type"

    .line 113
    .line 114
    invoke-static {p1}, Ll/pre$a;->b(Ll/pre$a;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    iget-object p0, p0, Ll/pre;->d:Ljava/util/Map;

    .line 122
    .line 123
    invoke-static {p1}, Ll/pre$a;->g(Ll/pre$a;)I

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    const-string v0, "gift_source"

    .line 132
    .line 133
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public synthetic constructor <init>(Ll/pre$a;Ll/qre;)V
    .locals 0

    .line 137
    invoke-direct {p0, p1}, Ll/pre;-><init>(Ll/pre$a;)V

    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/pre;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pre;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pre;->d:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pre;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public e(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pre;->d:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p1, "success"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p1, "fail"

    .line 9
    .line 10
    :goto_0
    const-string v0, "process_status"

    .line 11
    .line 12
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method
