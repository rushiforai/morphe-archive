.class public Ll/rsm;
.super Ll/dk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dk2<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/dk2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a([Ll/y1f;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rsm;->e([Ll/y1f;)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "in"

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Lcom/tantanapp/engine/FunctionResultType;
    .locals 0

    .line 1
    sget-object p0, Lcom/tantanapp/engine/FunctionResultType;->Boolean:Lcom/tantanapp/engine/FunctionResultType;

    .line 2
    .line 3
    return-object p0
.end method

.method public varargs e([Ll/y1f;)Ljava/lang/Boolean;
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v1, p1, v0

    .line 3
    .line 4
    iget-object v1, v1, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 5
    .line 6
    sget-object v2, Lcom/tantanapp/engine/EngineType;->Number:Lcom/tantanapp/engine/EngineType;

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    if-ne v1, v2, :cond_1

    .line 10
    .line 11
    aget-object v2, p1, v3

    .line 12
    .line 13
    iget-object v4, v2, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 14
    .line 15
    sget-object v5, Lcom/tantanapp/engine/EngineType;->NumberParamsList:Lcom/tantanapp/engine/EngineType;

    .line 16
    .line 17
    if-ne v4, v5, :cond_1

    .line 18
    .line 19
    iget-object v1, v2, Ll/y1f;->b:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_3

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Ll/y1f;

    .line 38
    .line 39
    iget-object v2, v2, Ll/y1f;->b:Ljava/lang/Object;

    .line 40
    .line 41
    invoke-virtual {p0, v2}, Ll/dk2;->b(Ljava/lang/Object;)D

    .line 42
    .line 43
    .line 44
    move-result-wide v2

    .line 45
    aget-object v4, p1, v0

    .line 46
    .line 47
    iget-object v4, v4, Ll/y1f;->b:Ljava/lang/Object;

    .line 48
    .line 49
    invoke-virtual {p0, v4}, Ll/dk2;->b(Ljava/lang/Object;)D

    .line 50
    .line 51
    .line 52
    move-result-wide v4

    .line 53
    cmpl-double v2, v2, v4

    .line 54
    .line 55
    if-nez v2, :cond_0

    .line 56
    .line 57
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_1
    sget-object p0, Lcom/tantanapp/engine/EngineType;->String:Lcom/tantanapp/engine/EngineType;

    .line 61
    .line 62
    if-ne v1, p0, :cond_3

    .line 63
    .line 64
    aget-object p0, p1, v3

    .line 65
    .line 66
    iget-object v1, p0, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 67
    .line 68
    sget-object v2, Lcom/tantanapp/engine/EngineType;->StringParamsList:Lcom/tantanapp/engine/EngineType;

    .line 69
    .line 70
    if-ne v1, v2, :cond_3

    .line 71
    .line 72
    iget-object p0, p0, Ll/y1f;->b:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast p0, Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eqz v1, :cond_3

    .line 85
    .line 86
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    check-cast v1, Ll/y1f;

    .line 91
    .line 92
    iget-object v1, v1, Ll/y1f;->b:Ljava/lang/Object;

    .line 93
    .line 94
    check-cast v1, Ljava/lang/String;

    .line 95
    .line 96
    aget-object v2, p1, v0

    .line 97
    .line 98
    iget-object v2, v2, Ll/y1f;->b:Ljava/lang/Object;

    .line 99
    .line 100
    check-cast v2, Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_2

    .line 107
    .line 108
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 109
    .line 110
    return-object p0

    .line 111
    :cond_3
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 112
    .line 113
    return-object p0
.end method
