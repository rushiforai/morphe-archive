.class public Ll/a2f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/dk2;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/m1l0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

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
    iput-object v0, p0, Ll/a2f;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/a2f;->b:Ljava/util/HashMap;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;Z)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;Z)",
            "Ljava/util/ArrayList;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/y1f;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/y1f;-><init>()V

    .line 23
    .line 24
    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    sget-object v2, Lcom/tantanapp/engine/EngineType;->String:Lcom/tantanapp/engine/EngineType;

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    sget-object v2, Lcom/tantanapp/engine/EngineType;->Number:Lcom/tantanapp/engine/EngineType;

    .line 31
    .line 32
    :goto_1
    iput-object v2, v1, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 33
    .line 34
    iput-object v0, v1, Ll/y1f;->b:Ljava/lang/Object;

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return-object p0
.end method

.method public final b(Ljava/lang/String;Ll/y1f;Ljava/util/ArrayList;)Ll/y1f;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y1f;",
            "Ljava/util/ArrayList<",
            "Ll/y1f;",
            ">;)",
            "Ll/y1f;"
        }
    .end annotation

    .line 1
    if-eqz p3, :cond_2

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_2

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    invoke-virtual {p3, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Ll/y1f;

    .line 15
    .line 16
    iput-object p3, p2, Ll/y1f;->b:Ljava/lang/Object;

    .line 17
    .line 18
    iget-object p0, p0, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 19
    .line 20
    sget-object p1, Lcom/tantanapp/engine/EngineType;->String:Lcom/tantanapp/engine/EngineType;

    .line 21
    .line 22
    if-ne p0, p1, :cond_0

    .line 23
    .line 24
    sget-object p0, Lcom/tantanapp/engine/EngineType;->StringParamsList:Lcom/tantanapp/engine/EngineType;

    .line 25
    .line 26
    iput-object p0, p2, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 27
    .line 28
    return-object p2

    .line 29
    :cond_0
    sget-object p1, Lcom/tantanapp/engine/EngineType;->Number:Lcom/tantanapp/engine/EngineType;

    .line 30
    .line 31
    if-ne p0, p1, :cond_1

    .line 32
    .line 33
    sget-object p0, Lcom/tantanapp/engine/EngineType;->NumberParamsList:Lcom/tantanapp/engine/EngineType;

    .line 34
    .line 35
    iput-object p0, p2, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 36
    .line 37
    return-object p2

    .line 38
    :cond_1
    sget-object p0, Lcom/tantanapp/engine/EngineType;->NestedList:Lcom/tantanapp/engine/EngineType;

    .line 39
    .line 40
    iput-object p0, p2, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 41
    .line 42
    return-object p2

    .line 43
    :cond_2
    const-string p3, "\""

    .line 44
    .line 45
    invoke-virtual {p1, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_3

    .line 50
    .line 51
    sget-object p0, Lcom/tantanapp/engine/EngineType;->String:Lcom/tantanapp/engine/EngineType;

    .line 52
    .line 53
    iput-object p0, p2, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 54
    .line 55
    const-string p0, ""

    .line 56
    .line 57
    invoke-virtual {p1, p3, p0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iput-object p0, p2, Ll/y1f;->b:Ljava/lang/Object;

    .line 62
    .line 63
    return-object p2

    .line 64
    :cond_3
    :try_start_0
    invoke-static {p1}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    sget-object v0, Lcom/tantanapp/engine/EngineType;->Number:Lcom/tantanapp/engine/EngineType;

    .line 69
    .line 70
    iput-object v0, p2, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 71
    .line 72
    iput-object p3, p2, Ll/y1f;->b:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    return-object p2

    .line 75
    :catch_0
    iput-object p1, p2, Ll/y1f;->b:Ljava/lang/Object;

    .line 76
    .line 77
    iget-object p0, p0, Ll/a2f;->a:Ljava/util/HashMap;

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-eqz p0, :cond_4

    .line 84
    .line 85
    sget-object p0, Lcom/tantanapp/engine/EngineType;->Function:Lcom/tantanapp/engine/EngineType;

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_4
    sget-object p0, Lcom/tantanapp/engine/EngineType;->Key:Lcom/tantanapp/engine/EngineType;

    .line 89
    .line 90
    :goto_0
    iput-object p0, p2, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 91
    .line 92
    return-object p2
.end method

.method public c(Ll/y1f;)Ll/y1f;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_6

    .line 3
    .line 4
    iget-object v1, p1, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 5
    .line 6
    sget-object v2, Lcom/tantanapp/engine/EngineType;->NestedList:Lcom/tantanapp/engine/EngineType;

    .line 7
    .line 8
    if-ne v1, v2, :cond_5

    .line 9
    .line 10
    iget-object p1, p1, Ll/y1f;->b:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p1, Ljava/util/ArrayList;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ll/y1f;

    .line 20
    .line 21
    iget-object v2, v1, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 22
    .line 23
    sget-object v3, Lcom/tantanapp/engine/EngineType;->Function:Lcom/tantanapp/engine/EngineType;

    .line 24
    .line 25
    if-ne v2, v3, :cond_4

    .line 26
    .line 27
    iget-object v2, p0, Ll/a2f;->a:Ljava/util/HashMap;

    .line 28
    .line 29
    iget-object v3, v1, Ll/y1f;->b:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v3, Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Ll/dk2;

    .line 38
    .line 39
    if-eqz v2, :cond_3

    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    const/4 v3, 0x1

    .line 46
    sub-int/2addr v1, v3

    .line 47
    new-array v1, v1, [Ll/y1f;

    .line 48
    .line 49
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-ge v3, v4, :cond_2

    .line 54
    .line 55
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    check-cast v4, Ll/y1f;

    .line 60
    .line 61
    iget-object v5, v4, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 62
    .line 63
    sget-object v6, Lcom/tantanapp/engine/EngineType;->Key:Lcom/tantanapp/engine/EngineType;

    .line 64
    .line 65
    if-ne v5, v6, :cond_0

    .line 66
    .line 67
    add-int/lit8 v5, v3, -0x1

    .line 68
    .line 69
    iget-object v4, v4, Ll/y1f;->b:Ljava/lang/Object;

    .line 70
    .line 71
    check-cast v4, Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {p0, v4}, Ll/a2f;->d(Ljava/lang/String;)Ll/y1f;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    aput-object v4, v1, v5

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_0
    sget-object v6, Lcom/tantanapp/engine/EngineType;->NestedList:Lcom/tantanapp/engine/EngineType;

    .line 81
    .line 82
    if-ne v5, v6, :cond_1

    .line 83
    .line 84
    add-int/lit8 v5, v3, -0x1

    .line 85
    .line 86
    invoke-virtual {p0, v4}, Ll/a2f;->c(Ll/y1f;)Ll/y1f;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    aput-object v4, v1, v5

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_1
    add-int/lit8 v5, v3, -0x1

    .line 94
    .line 95
    aput-object v4, v1, v5

    .line 96
    .line 97
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_2
    new-instance p1, Ll/y1f;

    .line 101
    .line 102
    invoke-direct {p1}, Ll/y1f;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v2}, Ll/dk2;->d()Lcom/tantanapp/engine/FunctionResultType;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    aget-object v0, v1, v0

    .line 110
    .line 111
    invoke-virtual {p0, v3, v0}, Ll/a2f;->f(Lcom/tantanapp/engine/FunctionResultType;Ll/y1f;)Lcom/tantanapp/engine/EngineType;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    iput-object p0, p1, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 116
    .line 117
    invoke-virtual {v2, v1}, Ll/dk2;->a([Ll/y1f;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    iput-object p0, p1, Ll/y1f;->b:Ljava/lang/Object;

    .line 122
    .line 123
    return-object p1

    .line 124
    :cond_3
    new-instance p0, Ljava/lang/Exception;

    .line 125
    .line 126
    iget-object p1, v1, Ll/y1f;->b:Ljava/lang/Object;

    .line 127
    .line 128
    check-cast p1, Ljava/lang/String;

    .line 129
    .line 130
    new-instance v0, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    const-string v1, "doFunction function is not exits: err_function = "

    .line 133
    .line 134
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    throw p0

    .line 148
    :cond_4
    new-instance p0, Ljava/lang/Exception;

    .line 149
    .line 150
    iget-object p1, v1, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 151
    .line 152
    new-instance v0, Ljava/lang/StringBuilder;

    .line 153
    .line 154
    const-string v1, "doFunction mode type is not function: type = "

    .line 155
    .line 156
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    throw p0

    .line 170
    :cond_5
    const-string p0, "doFunction mode type is not NestedList"

    .line 171
    .line 172
    invoke-static {p0}, Ll/brq0;->a(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    return-object v0

    .line 176
    :cond_6
    const-string p0, "doFunction mode is null"

    .line 177
    .line 178
    invoke-static {p0}, Ll/brq0;->a(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    return-object v0
.end method

.method public final d(Ljava/lang/String;)Ll/y1f;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/y1f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/y1f;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/a2f;->b:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ll/m1l0;

    .line 13
    .line 14
    if-eqz v1, :cond_7

    .line 15
    .line 16
    invoke-interface {v1}, Ll/m1l0;->a()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    instance-of v1, p1, Ljava/util/ArrayList;

    .line 21
    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    move-object v1, p1

    .line 25
    check-cast v1, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-lez v2, :cond_6

    .line 32
    .line 33
    const/4 p1, 0x0

    .line 34
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    instance-of v2, v2, Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    sget-object v2, Lcom/tantanapp/engine/EngineType;->StringParamsList:Lcom/tantanapp/engine/EngineType;

    .line 43
    .line 44
    iput-object v2, v0, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    sget-object v2, Lcom/tantanapp/engine/EngineType;->NumberParamsList:Lcom/tantanapp/engine/EngineType;

    .line 48
    .line 49
    iput-object v2, v0, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 50
    .line 51
    :goto_0
    iget-object v2, v0, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 52
    .line 53
    sget-object v3, Lcom/tantanapp/engine/EngineType;->StringParamsList:Lcom/tantanapp/engine/EngineType;

    .line 54
    .line 55
    if-ne v2, v3, :cond_1

    .line 56
    .line 57
    const/4 p1, 0x1

    .line 58
    :cond_1
    invoke-virtual {p0, v1, p1}, Ll/a2f;->a(Ljava/util/List;Z)Ljava/util/ArrayList;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    move-object p1, p0

    .line 63
    goto :goto_2

    .line 64
    :cond_2
    instance-of p0, p1, Ljava/lang/Integer;

    .line 65
    .line 66
    if-nez p0, :cond_5

    .line 67
    .line 68
    instance-of p0, p1, Ljava/lang/Long;

    .line 69
    .line 70
    if-nez p0, :cond_5

    .line 71
    .line 72
    instance-of p0, p1, Ljava/lang/Float;

    .line 73
    .line 74
    if-nez p0, :cond_5

    .line 75
    .line 76
    instance-of p0, p1, Ljava/lang/Double;

    .line 77
    .line 78
    if-nez p0, :cond_5

    .line 79
    .line 80
    instance-of p0, p1, Ljava/lang/Byte;

    .line 81
    .line 82
    if-eqz p0, :cond_3

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_3
    instance-of p0, p1, Ljava/lang/Boolean;

    .line 86
    .line 87
    if-eqz p0, :cond_4

    .line 88
    .line 89
    sget-object p0, Lcom/tantanapp/engine/EngineType;->Boolean:Lcom/tantanapp/engine/EngineType;

    .line 90
    .line 91
    iput-object p0, v0, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_4
    sget-object p0, Lcom/tantanapp/engine/EngineType;->String:Lcom/tantanapp/engine/EngineType;

    .line 95
    .line 96
    iput-object p0, v0, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_5
    :goto_1
    sget-object p0, Lcom/tantanapp/engine/EngineType;->Number:Lcom/tantanapp/engine/EngineType;

    .line 100
    .line 101
    iput-object p0, v0, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 102
    .line 103
    :cond_6
    :goto_2
    iput-object p1, v0, Ll/y1f;->b:Ljava/lang/Object;

    .line 104
    .line 105
    return-object v0

    .line 106
    :cond_7
    new-instance p0, Ljava/lang/Exception;

    .line 107
    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    const-string v1, "variable is not fount err_key = "

    .line 111
    .line 112
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    throw p0
.end method

.method public e(Ljava/lang/String;)Ll/y1f;
    .locals 10

    .line 1
    new-instance v0, Ljava/util/Stack;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/Stack;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/Stack;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x0

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    return-object v3

    .line 19
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance v2, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    move-object v6, v3

    .line 30
    move v5, v4

    .line 31
    :goto_0
    array-length v7, p1

    .line 32
    if-ge v4, v7, :cond_b

    .line 33
    .line 34
    aget-char v7, p1, v4

    .line 35
    .line 36
    const/16 v8, 0xa

    .line 37
    .line 38
    if-eq v7, v8, :cond_8

    .line 39
    .line 40
    const/16 v8, 0x20

    .line 41
    .line 42
    if-eq v7, v8, :cond_8

    .line 43
    .line 44
    const/16 v8, 0x22

    .line 45
    .line 46
    if-eq v7, v8, :cond_7

    .line 47
    .line 48
    const/16 v8, 0x28

    .line 49
    .line 50
    if-eq v7, v8, :cond_5

    .line 51
    .line 52
    const/16 v8, 0x29

    .line 53
    .line 54
    if-eq v7, v8, :cond_1

    .line 55
    .line 56
    invoke-static {v7}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto/16 :goto_1

    .line 64
    .line 65
    :cond_1
    if-nez v5, :cond_4

    .line 66
    .line 67
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 68
    .line 69
    .line 70
    move-result v7

    .line 71
    if-lez v7, :cond_2

    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v7

    .line 77
    check-cast v7, Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-static {v2}, Ll/b2f;->a(Ljava/util/List;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v8

    .line 83
    new-instance v9, Ll/y1f;

    .line 84
    .line 85
    invoke-direct {v9}, Ll/y1f;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, v8, v9, v3}, Ll/a2f;->b(Ljava/lang/String;Ll/y1f;Ljava/util/ArrayList;)Ll/y1f;

    .line 89
    .line 90
    .line 91
    move-result-object v8

    .line 92
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    :cond_2
    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v7

    .line 99
    check-cast v7, Ll/y1f;

    .line 100
    .line 101
    invoke-virtual {v1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v8

    .line 105
    check-cast v8, Ljava/util/ArrayList;

    .line 106
    .line 107
    const-string v9, ""

    .line 108
    .line 109
    invoke-virtual {p0, v9, v7, v8}, Ll/a2f;->b(Ljava/lang/String;Ll/y1f;Ljava/util/ArrayList;)Ll/y1f;

    .line 110
    .line 111
    .line 112
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->size()I

    .line 116
    .line 117
    .line 118
    move-result v8

    .line 119
    if-lez v8, :cond_3

    .line 120
    .line 121
    invoke-virtual {v1}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v8

    .line 125
    check-cast v8, Ljava/util/ArrayList;

    .line 126
    .line 127
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_3
    move-object v6, v7

    .line 132
    goto :goto_1

    .line 133
    :cond_4
    invoke-static {v7}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 134
    .line 135
    .line 136
    move-result-object v7

    .line 137
    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_5
    if-nez v5, :cond_6

    .line 142
    .line 143
    new-instance v7, Ll/y1f;

    .line 144
    .line 145
    invoke-direct {v7}, Ll/y1f;-><init>()V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0, v7}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    new-instance v7, Ljava/util/ArrayList;

    .line 152
    .line 153
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v1, v7}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_6
    invoke-static {v7}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 161
    .line 162
    .line 163
    move-result-object v7

    .line 164
    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    goto :goto_1

    .line 168
    :cond_7
    xor-int/lit8 v5, v5, 0x1

    .line 169
    .line 170
    invoke-static {v7}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 171
    .line 172
    .line 173
    move-result-object v7

    .line 174
    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    goto :goto_1

    .line 178
    :cond_8
    if-nez v5, :cond_9

    .line 179
    .line 180
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 181
    .line 182
    .line 183
    move-result v7

    .line 184
    if-lez v7, :cond_a

    .line 185
    .line 186
    invoke-virtual {v1}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v7

    .line 190
    check-cast v7, Ljava/util/ArrayList;

    .line 191
    .line 192
    invoke-static {v2}, Ll/b2f;->a(Ljava/util/List;)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v8

    .line 196
    new-instance v9, Ll/y1f;

    .line 197
    .line 198
    invoke-direct {v9}, Ll/y1f;-><init>()V

    .line 199
    .line 200
    .line 201
    invoke-virtual {p0, v8, v9, v3}, Ll/a2f;->b(Ljava/lang/String;Ll/y1f;Ljava/util/ArrayList;)Ll/y1f;

    .line 202
    .line 203
    .line 204
    move-result-object v8

    .line 205
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 209
    .line 210
    .line 211
    goto :goto_1

    .line 212
    :cond_9
    invoke-static {v7}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 213
    .line 214
    .line 215
    move-result-object v7

    .line 216
    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    :cond_a
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 220
    .line 221
    goto/16 :goto_0

    .line 222
    .line 223
    :cond_b
    return-object v6
.end method

.method public final f(Lcom/tantanapp/engine/FunctionResultType;Ll/y1f;)Lcom/tantanapp/engine/EngineType;
    .locals 0

    .line 1
    sget-object p0, Ll/a2f$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p0, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    if-eq p0, p1, :cond_4

    .line 11
    .line 12
    const/4 p1, 0x2

    .line 13
    if-eq p0, p1, :cond_3

    .line 14
    .line 15
    const/4 p1, 0x3

    .line 16
    if-eq p0, p1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object p0, p2, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 20
    .line 21
    sget-object p1, Lcom/tantanapp/engine/EngineType;->String:Lcom/tantanapp/engine/EngineType;

    .line 22
    .line 23
    if-ne p0, p1, :cond_1

    .line 24
    .line 25
    sget-object p0, Lcom/tantanapp/engine/EngineType;->StringParamsList:Lcom/tantanapp/engine/EngineType;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_1
    sget-object p1, Lcom/tantanapp/engine/EngineType;->Number:Lcom/tantanapp/engine/EngineType;

    .line 29
    .line 30
    if-ne p0, p1, :cond_2

    .line 31
    .line 32
    sget-object p0, Lcom/tantanapp/engine/EngineType;->NumberParamsList:Lcom/tantanapp/engine/EngineType;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_2
    :goto_0
    sget-object p0, Lcom/tantanapp/engine/EngineType;->String:Lcom/tantanapp/engine/EngineType;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_3
    sget-object p0, Lcom/tantanapp/engine/EngineType;->Boolean:Lcom/tantanapp/engine/EngineType;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_4
    sget-object p0, Lcom/tantanapp/engine/EngineType;->Number:Lcom/tantanapp/engine/EngineType;

    .line 42
    .line 43
    return-object p0
.end method

.method public varargs g([Ll/dk2;)V
    .locals 5

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    if-ge v1, v0, :cond_1

    .line 4
    .line 5
    aget-object v2, p1, v1

    .line 6
    .line 7
    iget-object v3, p0, Ll/a2f;->a:Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/dk2;->c()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-nez v3, :cond_0

    .line 18
    .line 19
    iget-object v3, p0, Ll/a2f;->a:Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/dk2;->c()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {v2}, Ll/dk2;->c()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "is already exist"

    .line 36
    .line 37
    const-string v0, "function :"

    .line 38
    .line 39
    invoke-static {v0, p0, p1}, Ll/zzq0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public varargs h([Ll/m1l0;)V
    .locals 5

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    if-ge v1, v0, :cond_1

    .line 4
    .line 5
    aget-object v2, p1, v1

    .line 6
    .line 7
    iget-object v3, p0, Ll/a2f;->b:Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-interface {v2}, Ll/m1l0;->key()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-nez v3, :cond_0

    .line 18
    .line 19
    iget-object v3, p0, Ll/a2f;->b:Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-interface {v2}, Ll/m1l0;->key()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-interface {v2}, Ll/m1l0;->key()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "is already exist"

    .line 36
    .line 37
    const-string v0, "field :"

    .line 38
    .line 39
    invoke-static {v0, p0, p1}, Ll/zzq0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method
