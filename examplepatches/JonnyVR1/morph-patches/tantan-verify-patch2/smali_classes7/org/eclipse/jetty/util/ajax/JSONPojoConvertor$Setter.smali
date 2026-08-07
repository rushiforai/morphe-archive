.class public Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Setter"
.end annotation


# instance fields
.field protected _componentType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field protected _numberType:Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$NumberType;

.field protected _propertyName:Ljava/lang/String;

.field protected _setter:Ljava/lang/reflect/Method;

.field protected _type:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/reflect/Method;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_propertyName:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_setter:Ljava/lang/reflect/Method;

    .line 7
    .line 8
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/4 p2, 0x0

    .line 13
    aget-object p1, p1, p2

    .line 14
    .line 15
    iput-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_type:Ljava/lang/Class;

    .line 16
    .line 17
    invoke-static {}, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor;->access$000()Ljava/util/Map;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p2, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_type:Ljava/lang/Class;

    .line 22
    .line 23
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$NumberType;

    .line 28
    .line 29
    iput-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_numberType:Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$NumberType;

    .line 30
    .line 31
    if-nez p1, :cond_0

    .line 32
    .line 33
    iget-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_type:Ljava/lang/Class;

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    iget-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_type:Ljava/lang/Class;

    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_componentType:Ljava/lang/Class;

    .line 48
    .line 49
    invoke-static {}, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor;->access$000()Ljava/util/Map;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-object p2, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_componentType:Ljava/lang/Class;

    .line 54
    .line 55
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$NumberType;

    .line 60
    .line 61
    iput-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_numberType:Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$NumberType;

    .line 62
    .line 63
    :cond_0
    return-void
.end method


# virtual methods
.method public getComponentType()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_componentType:Ljava/lang/Class;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMethod()Ljava/lang/reflect/Method;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_setter:Ljava/lang/reflect/Method;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNumberType()Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$NumberType;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_numberType:Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$NumberType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPropertyName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_propertyName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_type:Ljava/lang/Class;

    .line 2
    .line 3
    return-object p0
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_setter:Ljava/lang/reflect/Method;

    .line 4
    .line 5
    sget-object p2, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor;->NULL_ARG:[Ljava/lang/Object;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->invokeObject(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public invokeObject(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_type:Ljava/lang/Class;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->isEnum()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    instance-of v0, p2, Ljava/lang/Enum;

    .line 10
    .line 11
    iget-object v1, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_setter:Ljava/lang/reflect/Method;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v1, p1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_type:Ljava/lang/Class;

    .line 24
    .line 25
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-static {p0, p2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v1, p1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_numberType:Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$NumberType;

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    instance-of v1, p2, Ljava/lang/Number;

    .line 46
    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_setter:Ljava/lang/reflect/Method;

    .line 50
    .line 51
    check-cast p2, Ljava/lang/Number;

    .line 52
    .line 53
    invoke-interface {v0, p2}, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$NumberType;->getActualValue(Ljava/lang/Number;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    .line 66
    .line 67
    iget-object v1, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_type:Ljava/lang/Class;

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    const/4 v1, 0x0

    .line 74
    if-nez v0, :cond_7

    .line 75
    .line 76
    const-class v0, Ljava/lang/Character;

    .line 77
    .line 78
    iget-object v2, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_type:Ljava/lang/Class;

    .line 79
    .line 80
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_3

    .line 85
    .line 86
    goto/16 :goto_2

    .line 87
    .line 88
    :cond_3
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_componentType:Ljava/lang/Class;

    .line 89
    .line 90
    if-eqz v0, :cond_6

    .line 91
    .line 92
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_6

    .line 101
    .line 102
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_numberType:Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$NumberType;

    .line 103
    .line 104
    if-nez v0, :cond_4

    .line 105
    .line 106
    invoke-static {p2}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iget-object v2, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_componentType:Ljava/lang/Class;

    .line 111
    .line 112
    invoke-static {v2, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    :try_start_0
    invoke-static {p2, v1, v2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    .line 118
    .line 119
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_setter:Ljava/lang/reflect/Method;

    .line 120
    .line 121
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :catch_0
    move-exception v0

    .line 130
    invoke-static {}, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 135
    .line 136
    .line 137
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_setter:Ljava/lang/reflect/Method;

    .line 138
    .line 139
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_4
    move-object v0, p2

    .line 148
    check-cast v0, [Ljava/lang/Object;

    .line 149
    .line 150
    iget-object v2, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_componentType:Ljava/lang/Class;

    .line 151
    .line 152
    array-length v3, v0

    .line 153
    invoke-static {v2, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    :goto_0
    :try_start_1
    array-length v3, v0

    .line 158
    if-ge v1, v3, :cond_5

    .line 159
    .line 160
    iget-object v3, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_numberType:Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$NumberType;

    .line 161
    .line 162
    aget-object v4, v0, v1

    .line 163
    .line 164
    check-cast v4, Ljava/lang/Number;

    .line 165
    .line 166
    invoke-interface {v3, v4}, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$NumberType;->getActualValue(Ljava/lang/Number;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    invoke-static {v2, v1, v3}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 171
    .line 172
    .line 173
    add-int/lit8 v1, v1, 0x1

    .line 174
    .line 175
    goto :goto_0

    .line 176
    :catch_1
    move-exception v0

    .line 177
    goto :goto_1

    .line 178
    :cond_5
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_setter:Ljava/lang/reflect/Method;

    .line 179
    .line 180
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :goto_1
    invoke-static {}, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 193
    .line 194
    .line 195
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_setter:Ljava/lang/reflect/Method;

    .line 196
    .line 197
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object p2

    .line 201
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    return-void

    .line 205
    :cond_6
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_setter:Ljava/lang/reflect/Method;

    .line 206
    .line 207
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object p2

    .line 211
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :cond_7
    :goto_2
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_setter:Ljava/lang/reflect/Method;

    .line 216
    .line 217
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p2

    .line 221
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    .line 222
    .line 223
    .line 224
    move-result p2

    .line 225
    invoke-static {p2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 226
    .line 227
    .line 228
    move-result-object p2

    .line 229
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object p2

    .line 233
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    return-void
.end method

.method public isPropertyNumber()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$Setter;->_numberType:Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor$NumberType;

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
