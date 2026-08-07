.class Lorg/eclipse/jetty/util/StringMap$Node;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Map$Entry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/util/StringMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Node"
.end annotation


# instance fields
.field _char:[C

.field _children:[Lorg/eclipse/jetty/util/StringMap$Node;

.field _key:Ljava/lang/String;

.field _next:Lorg/eclipse/jetty/util/StringMap$Node;

.field _ochar:[C

.field _value:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(ZLjava/lang/String;I)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    sub-int/2addr v0, p3

    .line 9
    new-array v1, v0, [C

    .line 10
    .line 11
    iput-object v1, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_char:[C

    .line 12
    .line 13
    new-array v1, v0, [C

    .line 14
    .line 15
    iput-object v1, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_ochar:[C

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    :goto_0
    if-ge v1, v0, :cond_3

    .line 19
    .line 20
    add-int v2, p3, v1

    .line 21
    .line 22
    invoke-virtual {p2, v2}, Ljava/lang/String;->charAt(I)C

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    iget-object v3, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_char:[C

    .line 27
    .line 28
    aput-char v2, v3, v1

    .line 29
    .line 30
    if-eqz p1, :cond_2

    .line 31
    .line 32
    invoke-static {v2}, Ljava/lang/Character;->isUpperCase(C)Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-eqz v3, :cond_0

    .line 37
    .line 38
    invoke-static {v2}, Ljava/lang/Character;->toLowerCase(C)C

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    invoke-static {v2}, Ljava/lang/Character;->isLowerCase(C)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    invoke-static {v2}, Ljava/lang/Character;->toUpperCase(C)C

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    :cond_1
    :goto_1
    iget-object v3, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_ochar:[C

    .line 54
    .line 55
    aput-char v2, v3, v1

    .line 56
    .line 57
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    return-void
.end method

.method private toString(Ljava/lang/StringBuilder;)V
    .locals 4

    .line 1
    const-string v0, "{["

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_char:[C

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/16 v0, 0x2d

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    move v0, v1

    .line 18
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_char:[C

    .line 19
    .line 20
    array-length v3, v2

    .line 21
    if-ge v0, v3, :cond_1

    .line 22
    .line 23
    aget-char v2, v2, v0

    .line 24
    .line 25
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    add-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    :goto_1
    const/16 v0, 0x3a

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_key:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const/16 v0, 0x3d

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_value:Ljava/lang/Object;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const/16 v0, 0x5d

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_children:[Lorg/eclipse/jetty/util/StringMap$Node;

    .line 57
    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    :goto_2
    iget-object v0, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_children:[Lorg/eclipse/jetty/util/StringMap$Node;

    .line 61
    .line 62
    array-length v0, v0

    .line 63
    if-ge v1, v0, :cond_3

    .line 64
    .line 65
    const/16 v0, 0x7c

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_children:[Lorg/eclipse/jetty/util/StringMap$Node;

    .line 71
    .line 72
    aget-object v0, v0, v1

    .line 73
    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    invoke-direct {v0, p1}, Lorg/eclipse/jetty/util/StringMap$Node;->toString(Ljava/lang/StringBuilder;)V

    .line 77
    .line 78
    .line 79
    goto :goto_3

    .line 80
    :cond_2
    const-string v0, "-"

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    :goto_3
    add-int/lit8 v1, v1, 0x1

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_3
    const/16 v0, 0x7d

    .line 89
    .line 90
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_next:Lorg/eclipse/jetty/util/StringMap$Node;

    .line 94
    .line 95
    if-eqz v0, :cond_4

    .line 96
    .line 97
    const-string v0, ",\n"

    .line 98
    .line 99
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_next:Lorg/eclipse/jetty/util/StringMap$Node;

    .line 103
    .line 104
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/util/StringMap$Node;->toString(Ljava/lang/StringBuilder;)V

    .line 105
    .line 106
    .line 107
    :cond_4
    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_key:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_value:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_value:Ljava/lang/Object;

    .line 2
    .line 3
    iput-object p1, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_value:Ljava/lang/Object;

    .line 4
    .line 5
    return-object v0
.end method

.method public split(Lorg/eclipse/jetty/util/StringMap;I)Lorg/eclipse/jetty/util/StringMap$Node;
    .locals 5

    .line 1
    new-instance v0, Lorg/eclipse/jetty/util/StringMap$Node;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/eclipse/jetty/util/StringMap$Node;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_char:[C

    .line 7
    .line 8
    array-length v2, v1

    .line 9
    sub-int/2addr v2, p2

    .line 10
    new-array v3, p2, [C

    .line 11
    .line 12
    iput-object v3, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_char:[C

    .line 13
    .line 14
    new-array v3, v2, [C

    .line 15
    .line 16
    iput-object v3, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_char:[C

    .line 17
    .line 18
    iget-object v3, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_char:[C

    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    invoke-static {v1, v4, v3, v4, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 22
    .line 23
    .line 24
    iget-object v3, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_char:[C

    .line 25
    .line 26
    invoke-static {v1, p2, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_ochar:[C

    .line 30
    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    new-array v3, p2, [C

    .line 34
    .line 35
    iput-object v3, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_ochar:[C

    .line 36
    .line 37
    new-array v3, v2, [C

    .line 38
    .line 39
    iput-object v3, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_ochar:[C

    .line 40
    .line 41
    iget-object v3, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_ochar:[C

    .line 42
    .line 43
    invoke-static {v1, v4, v3, v4, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    .line 45
    .line 46
    iget-object v3, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_ochar:[C

    .line 47
    .line 48
    invoke-static {v1, p2, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 49
    .line 50
    .line 51
    :cond_0
    iget-object p2, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_key:Ljava/lang/String;

    .line 52
    .line 53
    iput-object p2, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_key:Ljava/lang/String;

    .line 54
    .line 55
    iget-object p2, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_value:Ljava/lang/Object;

    .line 56
    .line 57
    iput-object p2, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_value:Ljava/lang/Object;

    .line 58
    .line 59
    const/4 p2, 0x0

    .line 60
    iput-object p2, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_key:Ljava/lang/String;

    .line 61
    .line 62
    iput-object p2, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_value:Ljava/lang/Object;

    .line 63
    .line 64
    iget-object p2, p1, Lorg/eclipse/jetty/util/StringMap;->_entrySet:Ljava/util/HashSet;

    .line 65
    .line 66
    invoke-virtual {p2, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    if-eqz p2, :cond_1

    .line 71
    .line 72
    iget-object p2, p1, Lorg/eclipse/jetty/util/StringMap;->_entrySet:Ljava/util/HashSet;

    .line 73
    .line 74
    invoke-virtual {p2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    :cond_1
    iget-object p2, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_children:[Lorg/eclipse/jetty/util/StringMap$Node;

    .line 78
    .line 79
    iput-object p2, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_children:[Lorg/eclipse/jetty/util/StringMap$Node;

    .line 80
    .line 81
    iget p1, p1, Lorg/eclipse/jetty/util/StringMap;->_width:I

    .line 82
    .line 83
    new-array p2, p1, [Lorg/eclipse/jetty/util/StringMap$Node;

    .line 84
    .line 85
    iput-object p2, p0, Lorg/eclipse/jetty/util/StringMap$Node;->_children:[Lorg/eclipse/jetty/util/StringMap$Node;

    .line 86
    .line 87
    iget-object p0, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_char:[C

    .line 88
    .line 89
    aget-char p0, p0, v4

    .line 90
    .line 91
    rem-int/2addr p0, p1

    .line 92
    aput-object v0, p2, p0

    .line 93
    .line 94
    iget-object p0, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_ochar:[C

    .line 95
    .line 96
    if-eqz p0, :cond_2

    .line 97
    .line 98
    aget-char p0, p0, v4

    .line 99
    .line 100
    rem-int v1, p0, p1

    .line 101
    .line 102
    aget-object v1, p2, v1

    .line 103
    .line 104
    if-eq v1, v0, :cond_2

    .line 105
    .line 106
    rem-int/2addr p0, p1

    .line 107
    aput-object v0, p2, p0

    .line 108
    .line 109
    :cond_2
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 109
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/util/StringMap$Node;->toString(Ljava/lang/StringBuilder;)V

    .line 110
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
