.class public Lorg/eclipse/jetty/util/StringMap;
.super Ljava/util/AbstractMap;
.source "SourceFile"

# interfaces
.implements Ljava/io/Externalizable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/util/StringMap$NullEntry;,
        Lorg/eclipse/jetty/util/StringMap$Node;
    }
.end annotation


# static fields
.field public static final CASE_INSENSTIVE:Z = true

.field protected static final __HASH_WIDTH:I = 0x11


# instance fields
.field protected _entrySet:Ljava/util/HashSet;

.field protected _ignoreCase:Z

.field protected _nullEntry:Lorg/eclipse/jetty/util/StringMap$NullEntry;

.field protected _nullValue:Ljava/lang/Object;

.field protected _root:Lorg/eclipse/jetty/util/StringMap$Node;

.field protected _umEntrySet:Ljava/util/Set;

.field protected _width:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x11

    .line 5
    .line 6
    iput v0, p0, Lorg/eclipse/jetty/util/StringMap;->_width:I

    .line 7
    .line 8
    new-instance v0, Lorg/eclipse/jetty/util/StringMap$Node;

    .line 9
    .line 10
    invoke-direct {v0}, Lorg/eclipse/jetty/util/StringMap$Node;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lorg/eclipse/jetty/util/StringMap;->_root:Lorg/eclipse/jetty/util/StringMap$Node;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/StringMap;->_ignoreCase:Z

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lorg/eclipse/jetty/util/StringMap;->_nullEntry:Lorg/eclipse/jetty/util/StringMap$NullEntry;

    .line 20
    .line 21
    iput-object v0, p0, Lorg/eclipse/jetty/util/StringMap;->_nullValue:Ljava/lang/Object;

    .line 22
    .line 23
    new-instance v0, Ljava/util/HashSet;

    .line 24
    .line 25
    const/4 v1, 0x3

    .line 26
    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lorg/eclipse/jetty/util/StringMap;->_entrySet:Ljava/util/HashSet;

    .line 30
    .line 31
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lorg/eclipse/jetty/util/StringMap;->_umEntrySet:Ljava/util/Set;

    .line 36
    .line 37
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    .line 38
    invoke-direct {p0}, Lorg/eclipse/jetty/util/StringMap;-><init>()V

    .line 39
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/StringMap;->_ignoreCase:Z

    return-void
.end method

.method public constructor <init>(ZI)V
    .locals 0

    .line 40
    invoke-direct {p0}, Lorg/eclipse/jetty/util/StringMap;-><init>()V

    .line 41
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/StringMap;->_ignoreCase:Z

    .line 42
    iput p2, p0, Lorg/eclipse/jetty/util/StringMap;->_width:I

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 1
    new-instance v0, Lorg/eclipse/jetty/util/StringMap$Node;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/eclipse/jetty/util/StringMap$Node;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lorg/eclipse/jetty/util/StringMap;->_root:Lorg/eclipse/jetty/util/StringMap$Node;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lorg/eclipse/jetty/util/StringMap;->_nullEntry:Lorg/eclipse/jetty/util/StringMap$NullEntry;

    .line 10
    .line 11
    iput-object v0, p0, Lorg/eclipse/jetty/util/StringMap;->_nullValue:Ljava/lang/Object;

    .line 12
    .line 13
    iget-object p0, p0, Lorg/eclipse/jetty/util/StringMap;->_entrySet:Ljava/util/HashSet;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lorg/eclipse/jetty/util/StringMap;->_nullEntry:Lorg/eclipse/jetty/util/StringMap$NullEntry;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    return v1

    .line 11
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {p0, v2, v1, p1}, Lorg/eclipse/jetty/util/StringMap;->getEntry(Ljava/lang/String;II)Ljava/util/Map$Entry;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    return v0

    .line 30
    :cond_2
    return v1
.end method

.method public entrySet()Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/StringMap;->_umEntrySet:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/util/StringMap;->_nullValue:Ljava/lang/Object;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    instance-of v0, p1, Ljava/lang/String;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    check-cast p1, Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/StringMap;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/StringMap;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2

    if-nez p1, :cond_0

    .line 26
    iget-object p0, p0, Lorg/eclipse/jetty/util/StringMap;->_nullValue:Ljava/lang/Object;

    return-object p0

    :cond_0
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lorg/eclipse/jetty/util/StringMap;->getEntry(Ljava/lang/String;II)Ljava/util/Map$Entry;

    move-result-object p0

    if-nez p0, :cond_1

    const/4 p0, 0x0

    return-object p0

    .line 28
    :cond_1
    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public getBestEntry([BII)Ljava/util/Map$Entry;
    .locals 9

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/util/StringMap;->_nullEntry:Lorg/eclipse/jetty/util/StringMap$NullEntry;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/StringMap;->_root:Lorg/eclipse/jetty/util/StringMap$Node;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, -0x1

    .line 10
    move v3, v1

    .line 11
    move v4, v2

    .line 12
    :goto_0
    const/4 v5, 0x0

    .line 13
    if-ge v3, p3, :cond_9

    .line 14
    .line 15
    add-int v6, p2, v3

    .line 16
    .line 17
    aget-byte v6, p1, v6

    .line 18
    .line 19
    int-to-char v6, v6

    .line 20
    if-ne v4, v2, :cond_3

    .line 21
    .line 22
    iget-object v4, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_children:[Lorg/eclipse/jetty/util/StringMap$Node;

    .line 23
    .line 24
    if-nez v4, :cond_1

    .line 25
    .line 26
    move-object v4, v5

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iget v7, p0, Lorg/eclipse/jetty/util/StringMap;->_width:I

    .line 29
    .line 30
    rem-int v7, v6, v7

    .line 31
    .line 32
    aget-object v4, v4, v7

    .line 33
    .line 34
    :goto_1
    if-nez v4, :cond_2

    .line 35
    .line 36
    if-lez v3, :cond_2

    .line 37
    .line 38
    return-object v0

    .line 39
    :cond_2
    move-object v0, v4

    .line 40
    move v4, v1

    .line 41
    :cond_3
    :goto_2
    if-eqz v0, :cond_8

    .line 42
    .line 43
    iget-object v7, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_char:[C

    .line 44
    .line 45
    aget-char v8, v7, v4

    .line 46
    .line 47
    if-eq v8, v6, :cond_6

    .line 48
    .line 49
    iget-boolean v8, p0, Lorg/eclipse/jetty/util/StringMap;->_ignoreCase:Z

    .line 50
    .line 51
    if-eqz v8, :cond_4

    .line 52
    .line 53
    iget-object v8, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_ochar:[C

    .line 54
    .line 55
    aget-char v8, v8, v4

    .line 56
    .line 57
    if-ne v8, v6, :cond_4

    .line 58
    .line 59
    goto :goto_3

    .line 60
    :cond_4
    if-lez v4, :cond_5

    .line 61
    .line 62
    return-object v5

    .line 63
    :cond_5
    iget-object v0, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_next:Lorg/eclipse/jetty/util/StringMap$Node;

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_6
    :goto_3
    add-int/lit8 v4, v4, 0x1

    .line 67
    .line 68
    array-length v5, v7

    .line 69
    if-ne v4, v5, :cond_7

    .line 70
    .line 71
    move v4, v2

    .line 72
    :cond_7
    add-int/lit8 v3, v3, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_8
    return-object v5

    .line 76
    :cond_9
    if-lez v4, :cond_a

    .line 77
    .line 78
    return-object v5

    .line 79
    :cond_a
    if-eqz v0, :cond_b

    .line 80
    .line 81
    iget-object p0, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_key:Ljava/lang/String;

    .line 82
    .line 83
    if-nez p0, :cond_b

    .line 84
    .line 85
    return-object v5

    .line 86
    :cond_b
    return-object v0
.end method

.method public getEntry(Ljava/lang/String;II)Ljava/util/Map$Entry;
    .locals 9

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/util/StringMap;->_nullEntry:Lorg/eclipse/jetty/util/StringMap$NullEntry;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/StringMap;->_root:Lorg/eclipse/jetty/util/StringMap$Node;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, -0x1

    .line 10
    move v3, v1

    .line 11
    move v4, v2

    .line 12
    :goto_0
    const/4 v5, 0x0

    .line 13
    if-ge v3, p3, :cond_8

    .line 14
    .line 15
    add-int v6, p2, v3

    .line 16
    .line 17
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    if-ne v4, v2, :cond_2

    .line 22
    .line 23
    iget-object v0, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_children:[Lorg/eclipse/jetty/util/StringMap$Node;

    .line 24
    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    move-object v0, v5

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    iget v4, p0, Lorg/eclipse/jetty/util/StringMap;->_width:I

    .line 30
    .line 31
    rem-int v4, v6, v4

    .line 32
    .line 33
    aget-object v0, v0, v4

    .line 34
    .line 35
    :goto_1
    move v4, v1

    .line 36
    :cond_2
    :goto_2
    if-eqz v0, :cond_7

    .line 37
    .line 38
    iget-object v7, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_char:[C

    .line 39
    .line 40
    aget-char v8, v7, v4

    .line 41
    .line 42
    if-eq v8, v6, :cond_5

    .line 43
    .line 44
    iget-boolean v8, p0, Lorg/eclipse/jetty/util/StringMap;->_ignoreCase:Z

    .line 45
    .line 46
    if-eqz v8, :cond_3

    .line 47
    .line 48
    iget-object v8, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_ochar:[C

    .line 49
    .line 50
    aget-char v8, v8, v4

    .line 51
    .line 52
    if-ne v8, v6, :cond_3

    .line 53
    .line 54
    goto :goto_3

    .line 55
    :cond_3
    if-lez v4, :cond_4

    .line 56
    .line 57
    return-object v5

    .line 58
    :cond_4
    iget-object v0, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_next:Lorg/eclipse/jetty/util/StringMap$Node;

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_5
    :goto_3
    add-int/lit8 v4, v4, 0x1

    .line 62
    .line 63
    array-length v5, v7

    .line 64
    if-ne v4, v5, :cond_6

    .line 65
    .line 66
    move v4, v2

    .line 67
    :cond_6
    add-int/lit8 v3, v3, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_7
    return-object v5

    .line 71
    :cond_8
    if-lez v4, :cond_9

    .line 72
    .line 73
    return-object v5

    .line 74
    :cond_9
    if-eqz v0, :cond_a

    .line 75
    .line 76
    iget-object p0, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_key:Ljava/lang/String;

    .line 77
    .line 78
    if-nez p0, :cond_a

    .line 79
    .line 80
    return-object v5

    .line 81
    :cond_a
    return-object v0
.end method

.method public getEntry([CII)Ljava/util/Map$Entry;
    .locals 9

    if-nez p1, :cond_0

    .line 82
    iget-object p0, p0, Lorg/eclipse/jetty/util/StringMap;->_nullEntry:Lorg/eclipse/jetty/util/StringMap$NullEntry;

    return-object p0

    .line 83
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/StringMap;->_root:Lorg/eclipse/jetty/util/StringMap$Node;

    const/4 v1, 0x0

    const/4 v2, -0x1

    move v3, v1

    move v4, v2

    :goto_0
    const/4 v5, 0x0

    if-ge v3, p3, :cond_8

    add-int v6, p2, v3

    .line 84
    aget-char v6, p1, v6

    if-ne v4, v2, :cond_2

    .line 85
    iget-object v0, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_children:[Lorg/eclipse/jetty/util/StringMap$Node;

    if-nez v0, :cond_1

    move-object v0, v5

    goto :goto_1

    :cond_1
    iget v4, p0, Lorg/eclipse/jetty/util/StringMap;->_width:I

    rem-int v4, v6, v4

    aget-object v0, v0, v4

    :goto_1
    move v4, v1

    :cond_2
    :goto_2
    if-eqz v0, :cond_7

    .line 86
    iget-object v7, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_char:[C

    aget-char v8, v7, v4

    if-eq v8, v6, :cond_5

    iget-boolean v8, p0, Lorg/eclipse/jetty/util/StringMap;->_ignoreCase:Z

    if-eqz v8, :cond_3

    iget-object v8, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_ochar:[C

    aget-char v8, v8, v4

    if-ne v8, v6, :cond_3

    goto :goto_3

    :cond_3
    if-lez v4, :cond_4

    return-object v5

    .line 87
    :cond_4
    iget-object v0, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_next:Lorg/eclipse/jetty/util/StringMap$Node;

    goto :goto_2

    :cond_5
    :goto_3
    add-int/lit8 v4, v4, 0x1

    .line 88
    array-length v5, v7

    if-ne v4, v5, :cond_6

    move v4, v2

    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_7
    return-object v5

    :cond_8
    if-lez v4, :cond_9

    return-object v5

    :cond_9
    if-eqz v0, :cond_a

    .line 89
    iget-object p0, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_key:Ljava/lang/String;

    if-nez p0, :cond_a

    return-object v5

    :cond_a
    return-object v0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/util/StringMap;->_width:I

    .line 2
    .line 3
    return p0
.end method

.method public isEmpty()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/StringMap;->_entrySet:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashSet;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isIgnoreCase()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/StringMap;->_ignoreCase:Z

    .line 2
    .line 3
    return p0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 188
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 189
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_1

    .line 3
    .line 4
    iget-object p1, p0, Lorg/eclipse/jetty/util/StringMap;->_nullValue:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/eclipse/jetty/util/StringMap;->_nullValue:Ljava/lang/Object;

    .line 7
    .line 8
    iget-object p2, p0, Lorg/eclipse/jetty/util/StringMap;->_nullEntry:Lorg/eclipse/jetty/util/StringMap$NullEntry;

    .line 9
    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    new-instance p2, Lorg/eclipse/jetty/util/StringMap$NullEntry;

    .line 13
    .line 14
    invoke-direct {p2, p0, v0}, Lorg/eclipse/jetty/util/StringMap$NullEntry;-><init>(Lorg/eclipse/jetty/util/StringMap;Lorg/eclipse/jetty/util/StringMap$1;)V

    .line 15
    .line 16
    .line 17
    iput-object p2, p0, Lorg/eclipse/jetty/util/StringMap;->_nullEntry:Lorg/eclipse/jetty/util/StringMap$NullEntry;

    .line 18
    .line 19
    iget-object p0, p0, Lorg/eclipse/jetty/util/StringMap;->_entrySet:Ljava/util/HashSet;

    .line 20
    .line 21
    invoke-virtual {p0, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    :cond_0
    return-object p1

    .line 25
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jetty/util/StringMap;->_root:Lorg/eclipse/jetty/util/StringMap$Node;

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    const/4 v3, -0x1

    .line 29
    move-object v6, v0

    .line 30
    move-object v7, v6

    .line 31
    move v4, v2

    .line 32
    move v5, v3

    .line 33
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 34
    .line 35
    .line 36
    move-result v8

    .line 37
    if-ge v4, v8, :cond_e

    .line 38
    .line 39
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    .line 40
    .line 41
    .line 42
    move-result v8

    .line 43
    if-ne v5, v3, :cond_3

    .line 44
    .line 45
    iget-object v5, v1, Lorg/eclipse/jetty/util/StringMap$Node;->_children:[Lorg/eclipse/jetty/util/StringMap$Node;

    .line 46
    .line 47
    if-nez v5, :cond_2

    .line 48
    .line 49
    move-object v5, v0

    .line 50
    goto :goto_1

    .line 51
    :cond_2
    iget v6, p0, Lorg/eclipse/jetty/util/StringMap;->_width:I

    .line 52
    .line 53
    rem-int v6, v8, v6

    .line 54
    .line 55
    aget-object v5, v5, v6

    .line 56
    .line 57
    :goto_1
    move-object v6, v0

    .line 58
    move-object v7, v1

    .line 59
    move-object v1, v5

    .line 60
    move v5, v2

    .line 61
    :cond_3
    :goto_2
    if-eqz v1, :cond_8

    .line 62
    .line 63
    iget-object v9, v1, Lorg/eclipse/jetty/util/StringMap$Node;->_char:[C

    .line 64
    .line 65
    aget-char v10, v9, v5

    .line 66
    .line 67
    if-eq v10, v8, :cond_6

    .line 68
    .line 69
    iget-boolean v10, p0, Lorg/eclipse/jetty/util/StringMap;->_ignoreCase:Z

    .line 70
    .line 71
    if-eqz v10, :cond_4

    .line 72
    .line 73
    iget-object v10, v1, Lorg/eclipse/jetty/util/StringMap$Node;->_ochar:[C

    .line 74
    .line 75
    aget-char v10, v10, v5

    .line 76
    .line 77
    if-ne v10, v8, :cond_4

    .line 78
    .line 79
    goto :goto_4

    .line 80
    :cond_4
    if-nez v5, :cond_5

    .line 81
    .line 82
    iget-object v6, v1, Lorg/eclipse/jetty/util/StringMap$Node;->_next:Lorg/eclipse/jetty/util/StringMap$Node;

    .line 83
    .line 84
    move-object v11, v6

    .line 85
    move-object v6, v1

    .line 86
    move-object v1, v11

    .line 87
    goto :goto_2

    .line 88
    :cond_5
    invoke-virtual {v1, p0, v5}, Lorg/eclipse/jetty/util/StringMap$Node;->split(Lorg/eclipse/jetty/util/StringMap;I)Lorg/eclipse/jetty/util/StringMap$Node;

    .line 89
    .line 90
    .line 91
    add-int/lit8 v4, v4, -0x1

    .line 92
    .line 93
    :goto_3
    move v5, v3

    .line 94
    goto :goto_5

    .line 95
    :cond_6
    :goto_4
    add-int/lit8 v5, v5, 0x1

    .line 96
    .line 97
    array-length v6, v9

    .line 98
    if-ne v5, v6, :cond_7

    .line 99
    .line 100
    move-object v6, v0

    .line 101
    goto :goto_3

    .line 102
    :cond_7
    move-object v6, v0

    .line 103
    :goto_5
    add-int/lit8 v4, v4, 0x1

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_8
    new-instance v1, Lorg/eclipse/jetty/util/StringMap$Node;

    .line 107
    .line 108
    iget-boolean v3, p0, Lorg/eclipse/jetty/util/StringMap;->_ignoreCase:Z

    .line 109
    .line 110
    invoke-direct {v1, v3, p1, v4}, Lorg/eclipse/jetty/util/StringMap$Node;-><init>(ZLjava/lang/String;I)V

    .line 111
    .line 112
    .line 113
    if-eqz v6, :cond_9

    .line 114
    .line 115
    iput-object v1, v6, Lorg/eclipse/jetty/util/StringMap$Node;->_next:Lorg/eclipse/jetty/util/StringMap$Node;

    .line 116
    .line 117
    goto :goto_7

    .line 118
    :cond_9
    if-eqz v7, :cond_d

    .line 119
    .line 120
    iget-object v3, v7, Lorg/eclipse/jetty/util/StringMap$Node;->_children:[Lorg/eclipse/jetty/util/StringMap$Node;

    .line 121
    .line 122
    if-nez v3, :cond_a

    .line 123
    .line 124
    iget v3, p0, Lorg/eclipse/jetty/util/StringMap;->_width:I

    .line 125
    .line 126
    new-array v3, v3, [Lorg/eclipse/jetty/util/StringMap$Node;

    .line 127
    .line 128
    iput-object v3, v7, Lorg/eclipse/jetty/util/StringMap$Node;->_children:[Lorg/eclipse/jetty/util/StringMap$Node;

    .line 129
    .line 130
    :cond_a
    iget-object v3, v7, Lorg/eclipse/jetty/util/StringMap$Node;->_children:[Lorg/eclipse/jetty/util/StringMap$Node;

    .line 131
    .line 132
    iget v4, p0, Lorg/eclipse/jetty/util/StringMap;->_width:I

    .line 133
    .line 134
    rem-int/2addr v8, v4

    .line 135
    aput-object v1, v3, v8

    .line 136
    .line 137
    iget-object v6, v1, Lorg/eclipse/jetty/util/StringMap$Node;->_ochar:[C

    .line 138
    .line 139
    aget-char v7, v6, v2

    .line 140
    .line 141
    rem-int/2addr v7, v4

    .line 142
    if-eqz v6, :cond_e

    .line 143
    .line 144
    iget-object v6, v1, Lorg/eclipse/jetty/util/StringMap$Node;->_char:[C

    .line 145
    .line 146
    aget-char v2, v6, v2

    .line 147
    .line 148
    rem-int/2addr v2, v4

    .line 149
    if-eq v2, v7, :cond_e

    .line 150
    .line 151
    aget-object v2, v3, v7

    .line 152
    .line 153
    if-nez v2, :cond_b

    .line 154
    .line 155
    aput-object v1, v3, v7

    .line 156
    .line 157
    goto :goto_7

    .line 158
    :cond_b
    :goto_6
    iget-object v3, v2, Lorg/eclipse/jetty/util/StringMap$Node;->_next:Lorg/eclipse/jetty/util/StringMap$Node;

    .line 159
    .line 160
    if-eqz v3, :cond_c

    .line 161
    .line 162
    move-object v2, v3

    .line 163
    goto :goto_6

    .line 164
    :cond_c
    iput-object v1, v2, Lorg/eclipse/jetty/util/StringMap$Node;->_next:Lorg/eclipse/jetty/util/StringMap$Node;

    .line 165
    .line 166
    goto :goto_7

    .line 167
    :cond_d
    iput-object v1, p0, Lorg/eclipse/jetty/util/StringMap;->_root:Lorg/eclipse/jetty/util/StringMap$Node;

    .line 168
    .line 169
    :cond_e
    :goto_7
    if-eqz v1, :cond_10

    .line 170
    .line 171
    if-lez v5, :cond_f

    .line 172
    .line 173
    invoke-virtual {v1, p0, v5}, Lorg/eclipse/jetty/util/StringMap$Node;->split(Lorg/eclipse/jetty/util/StringMap;I)Lorg/eclipse/jetty/util/StringMap$Node;

    .line 174
    .line 175
    .line 176
    :cond_f
    iget-object v0, v1, Lorg/eclipse/jetty/util/StringMap$Node;->_value:Ljava/lang/Object;

    .line 177
    .line 178
    iput-object p1, v1, Lorg/eclipse/jetty/util/StringMap$Node;->_key:Ljava/lang/String;

    .line 179
    .line 180
    iput-object p2, v1, Lorg/eclipse/jetty/util/StringMap$Node;->_value:Ljava/lang/Object;

    .line 181
    .line 182
    iget-object p0, p0, Lorg/eclipse/jetty/util/StringMap;->_entrySet:Ljava/util/HashSet;

    .line 183
    .line 184
    invoke-virtual {p0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    :cond_10
    return-object v0
.end method

.method public readExternal(Ljava/io/ObjectInput;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/io/DataInput;->readBoolean()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/util/StringMap;->setIgnoreCase(Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/util/AbstractMap;->putAll(Ljava/util/Map;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 108
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/StringMap;->remove(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 109
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/StringMap;->remove(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public remove(Ljava/lang/String;)Ljava/lang/Object;
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_1

    .line 3
    .line 4
    iget-object p1, p0, Lorg/eclipse/jetty/util/StringMap;->_nullValue:Ljava/lang/Object;

    .line 5
    .line 6
    iget-object v1, p0, Lorg/eclipse/jetty/util/StringMap;->_nullEntry:Lorg/eclipse/jetty/util/StringMap$NullEntry;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-object v2, p0, Lorg/eclipse/jetty/util/StringMap;->_entrySet:Ljava/util/HashSet;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lorg/eclipse/jetty/util/StringMap;->_nullEntry:Lorg/eclipse/jetty/util/StringMap$NullEntry;

    .line 16
    .line 17
    iput-object v0, p0, Lorg/eclipse/jetty/util/StringMap;->_nullValue:Ljava/lang/Object;

    .line 18
    .line 19
    :cond_0
    return-object p1

    .line 20
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jetty/util/StringMap;->_root:Lorg/eclipse/jetty/util/StringMap$Node;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v3, -0x1

    .line 24
    move v4, v2

    .line 25
    move v5, v3

    .line 26
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 27
    .line 28
    .line 29
    move-result v6

    .line 30
    if-ge v4, v6, :cond_9

    .line 31
    .line 32
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    if-ne v5, v3, :cond_3

    .line 37
    .line 38
    iget-object v1, v1, Lorg/eclipse/jetty/util/StringMap$Node;->_children:[Lorg/eclipse/jetty/util/StringMap$Node;

    .line 39
    .line 40
    if-nez v1, :cond_2

    .line 41
    .line 42
    move-object v1, v0

    .line 43
    goto :goto_1

    .line 44
    :cond_2
    iget v5, p0, Lorg/eclipse/jetty/util/StringMap;->_width:I

    .line 45
    .line 46
    rem-int v5, v6, v5

    .line 47
    .line 48
    aget-object v1, v1, v5

    .line 49
    .line 50
    :goto_1
    move v5, v2

    .line 51
    :cond_3
    :goto_2
    if-eqz v1, :cond_8

    .line 52
    .line 53
    iget-object v7, v1, Lorg/eclipse/jetty/util/StringMap$Node;->_char:[C

    .line 54
    .line 55
    aget-char v8, v7, v5

    .line 56
    .line 57
    if-eq v8, v6, :cond_6

    .line 58
    .line 59
    iget-boolean v8, p0, Lorg/eclipse/jetty/util/StringMap;->_ignoreCase:Z

    .line 60
    .line 61
    if-eqz v8, :cond_4

    .line 62
    .line 63
    iget-object v8, v1, Lorg/eclipse/jetty/util/StringMap$Node;->_ochar:[C

    .line 64
    .line 65
    aget-char v8, v8, v5

    .line 66
    .line 67
    if-ne v8, v6, :cond_4

    .line 68
    .line 69
    goto :goto_3

    .line 70
    :cond_4
    if-lez v5, :cond_5

    .line 71
    .line 72
    return-object v0

    .line 73
    :cond_5
    iget-object v1, v1, Lorg/eclipse/jetty/util/StringMap$Node;->_next:Lorg/eclipse/jetty/util/StringMap$Node;

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_6
    :goto_3
    add-int/lit8 v5, v5, 0x1

    .line 77
    .line 78
    array-length v6, v7

    .line 79
    if-ne v5, v6, :cond_7

    .line 80
    .line 81
    move v5, v3

    .line 82
    :cond_7
    add-int/lit8 v4, v4, 0x1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_8
    return-object v0

    .line 86
    :cond_9
    if-lez v5, :cond_a

    .line 87
    .line 88
    return-object v0

    .line 89
    :cond_a
    if-eqz v1, :cond_b

    .line 90
    .line 91
    iget-object p1, v1, Lorg/eclipse/jetty/util/StringMap$Node;->_key:Ljava/lang/String;

    .line 92
    .line 93
    if-nez p1, :cond_b

    .line 94
    .line 95
    return-object v0

    .line 96
    :cond_b
    iget-object p1, v1, Lorg/eclipse/jetty/util/StringMap$Node;->_value:Ljava/lang/Object;

    .line 97
    .line 98
    iget-object p0, p0, Lorg/eclipse/jetty/util/StringMap;->_entrySet:Ljava/util/HashSet;

    .line 99
    .line 100
    invoke-virtual {p0, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    iput-object v0, v1, Lorg/eclipse/jetty/util/StringMap$Node;->_value:Ljava/lang/Object;

    .line 104
    .line 105
    iput-object v0, v1, Lorg/eclipse/jetty/util/StringMap$Node;->_key:Ljava/lang/String;

    .line 106
    .line 107
    return-object p1
.end method

.method public setIgnoreCase(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/StringMap;->_root:Lorg/eclipse/jetty/util/StringMap$Node;

    .line 2
    .line 3
    iget-object v0, v0, Lorg/eclipse/jetty/util/StringMap$Node;->_children:[Lorg/eclipse/jetty/util/StringMap$Node;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/StringMap;->_ignoreCase:Z

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const-string p0, "Must be set before first put"

    .line 11
    .line 12
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/util/StringMap;->_width:I

    .line 2
    .line 3
    return-void
.end method

.method public size()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/StringMap;->_entrySet:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashSet;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public writeExternal(Ljava/io/ObjectOutput;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 4
    .line 5
    .line 6
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/StringMap;->_ignoreCase:Z

    .line 7
    .line 8
    invoke-interface {p1, p0}, Ljava/io/DataOutput;->writeBoolean(Z)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
