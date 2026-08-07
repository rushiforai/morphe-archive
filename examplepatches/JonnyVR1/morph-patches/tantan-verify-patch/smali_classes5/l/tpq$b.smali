.class public Ll/tpq$b;
.super Lcom/tantanapp/common/data/orm/Filter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tpq;->e(Lcom/tantanapp/common/data/DbObject;)Lcom/tantanapp/common/data/orm/Filter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/orm/Filter<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/DbObject;

.field public final synthetic b:Ll/tpq;


# direct methods
.method public constructor <init>(Ll/tpq;Lcom/tantanapp/common/data/DbObject;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 2
    .line 3
    iput-object p2, p0, Ll/tpq$b;->a:Lcom/tantanapp/common/data/DbObject;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/common/data/orm/Filter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public emit()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/tpq$b;->a:Lcom/tantanapp/common/data/DbObject;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/orm/Order;->GT(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 10
    .line 11
    invoke-static {v0}, Ll/tpq;->a(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/tpq$b;->a:Lcom/tantanapp/common/data/DbObject;

    .line 18
    .line 19
    iget-object v1, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 20
    .line 21
    iget-object v1, v1, Ll/tpq;->c:Ljava/lang/Class;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/ValueObject;->getExtTabData(Ljava/lang/Class;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/tantanapp/common/data/DbObject;

    .line 28
    .line 29
    new-instance v1, Ljava/lang/StringBuffer;

    .line 30
    .line 31
    const-string v2, "( t2."

    .line 32
    .line 33
    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 37
    .line 38
    invoke-static {v2}, Ll/tpq;->a(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v2}, Lcom/tantanapp/common/data/orm/Order;->column()Lcom/tantanapp/common/data/orm/Column;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 49
    .line 50
    .line 51
    const-string v2, " > ? AND  t1."

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 57
    .line 58
    invoke-static {v2}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2}, Lcom/tantanapp/common/data/orm/Order;->column()Lcom/tantanapp/common/data/orm/Column;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 69
    .line 70
    .line 71
    const-string v2, " = ? ) OR  t1."

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 77
    .line 78
    invoke-static {v2}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v2}, Lcom/tantanapp/common/data/orm/Order;->column()Lcom/tantanapp/common/data/orm/Column;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    iget-object v2, v2, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 89
    .line 90
    .line 91
    const-string v2, " > ?"

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    iget-object v2, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 101
    .line 102
    invoke-static {v2}, Ll/tpq;->a(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-virtual {v2}, Lcom/tantanapp/common/data/orm/Order;->column()Lcom/tantanapp/common/data/orm/Column;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {v2, v0}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget-object v2, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 119
    .line 120
    invoke-static {v2}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-virtual {v2}, Lcom/tantanapp/common/data/orm/Order;->column()Lcom/tantanapp/common/data/orm/Column;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    iget-object v3, p0, Ll/tpq$b;->a:Lcom/tantanapp/common/data/DbObject;

    .line 129
    .line 130
    invoke-virtual {v2, v3}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    iget-object v3, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 139
    .line 140
    invoke-static {v3}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-virtual {v3}, Lcom/tantanapp/common/data/orm/Order;->column()Lcom/tantanapp/common/data/orm/Column;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    iget-object p0, p0, Ll/tpq$b;->a:Lcom/tantanapp/common/data/DbObject;

    .line 149
    .line 150
    invoke-virtual {v3, p0}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    filled-new-array {v0, v2, p0}, [Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    new-instance v0, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 163
    .line 164
    invoke-direct {v0, v1, p0}, Lcom/tantanapp/common/data/orm/SqlSegment;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    return-object v0

    .line 168
    :cond_0
    iget-object v0, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 169
    .line 170
    invoke-static {v0}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 174
    .line 175
    invoke-static {v0}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    iget-object p0, p0, Ll/tpq$b;->a:Lcom/tantanapp/common/data/DbObject;

    .line 180
    .line 181
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/orm/Order;->GT_EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/Filter;->emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    return-object p0
.end method

.method public filter(Lcom/tantanapp/common/data/DbObject;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 10
    .line 11
    invoke-static {v0}, Ll/tpq;->a(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    iget-object v0, p0, Ll/tpq$b;->a:Lcom/tantanapp/common/data/DbObject;

    .line 18
    .line 19
    iget-object v1, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 20
    .line 21
    iget-object v1, v1, Ll/tpq;->c:Ljava/lang/Class;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/ValueObject;->getExtTabData(Ljava/lang/Class;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/tantanapp/common/data/DbObject;

    .line 28
    .line 29
    iget-object v1, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 30
    .line 31
    iget-object v1, v1, Ll/tpq;->c:Ljava/lang/Class;

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Lcom/tantanapp/common/data/ValueObject;->getExtTabData(Ljava/lang/Class;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/tantanapp/common/data/DbObject;

    .line 38
    .line 39
    iget-object v2, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 40
    .line 41
    invoke-static {v2}, Ll/tpq;->a(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v2, v0}, Lcom/tantanapp/common/data/orm/Order;->GT_EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    iget-object v0, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 56
    .line 57
    invoke-static {v0}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v1, p0, Ll/tpq$b;->a:Lcom/tantanapp/common/data/DbObject;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/orm/Order;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_1

    .line 72
    .line 73
    :cond_0
    iget-object v0, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 74
    .line 75
    invoke-static {v0}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iget-object p0, p0, Ll/tpq$b;->a:Lcom/tantanapp/common/data/DbObject;

    .line 80
    .line 81
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/orm/Order;->GT(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_2

    .line 90
    .line 91
    :cond_1
    const/4 p0, 0x1

    .line 92
    return p0

    .line 93
    :cond_2
    const/4 p0, 0x0

    .line 94
    return p0

    .line 95
    :cond_3
    iget-object v0, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 96
    .line 97
    invoke-static {v0}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    if-nez v0, :cond_4

    .line 102
    .line 103
    iget-object v0, p0, Ll/tpq$b;->a:Lcom/tantanapp/common/data/DbObject;

    .line 104
    .line 105
    iget-object v1, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 106
    .line 107
    iget-object v1, v1, Ll/tpq;->c:Ljava/lang/Class;

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/ValueObject;->getExtTabData(Ljava/lang/Class;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    check-cast v0, Lcom/tantanapp/common/data/DbObject;

    .line 114
    .line 115
    iget-object v1, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 116
    .line 117
    iget-object v1, v1, Ll/tpq;->c:Ljava/lang/Class;

    .line 118
    .line 119
    invoke-virtual {p1, v1}, Lcom/tantanapp/common/data/ValueObject;->getExtTabData(Ljava/lang/Class;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    .line 124
    .line 125
    iget-object p0, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 126
    .line 127
    invoke-static {p0}, Ll/tpq;->a(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/orm/Order;->GT_EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    return p0

    .line 140
    :cond_4
    iget-object v0, p0, Ll/tpq$b;->b:Ll/tpq;

    .line 141
    .line 142
    invoke-static {v0}, Ll/tpq;->b(Ll/tpq;)Lcom/tantanapp/common/data/orm/Order;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iget-object p0, p0, Ll/tpq$b;->a:Lcom/tantanapp/common/data/DbObject;

    .line 147
    .line 148
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/orm/Order;->GT_EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    return p0
.end method

.method public bridge synthetic filter(Ljava/lang/Object;)Z
    .locals 0

    .line 157
    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    invoke-virtual {p0, p1}, Ll/tpq$b;->filter(Lcom/tantanapp/common/data/DbObject;)Z

    move-result p0

    return p0
.end method
