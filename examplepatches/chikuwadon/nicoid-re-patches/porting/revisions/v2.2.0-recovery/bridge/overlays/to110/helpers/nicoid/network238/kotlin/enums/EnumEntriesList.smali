.class final Lnicoid/network238/kotlin/enums/EnumEntriesList;
.super Lnicoid/network238/kotlin/collections/AbstractList;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/enums/EnumEntries;
.implements Ljava/io/Serializable;


# instance fields
.field private final entries:[Ljava/lang/Enum;


# direct methods
.method public constructor <init>([Ljava/lang/Enum;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/AbstractList;-><init>()V

    iput-object p1, p0, Lnicoid/network238/kotlin/enums/EnumEntriesList;->entries:[Ljava/lang/Enum;

    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Enum;)Z
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    iget-object v0, p0, Lnicoid/network238/kotlin/enums/EnumEntriesList;->entries:[Ljava/lang/Enum;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/collections/ArraysKt;->getOrNull([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Enum;

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final bridge contains(Ljava/lang/Object;)Z
    .registers 3

    .line 45
    instance-of v0, p1, Ljava/lang/Enum;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    check-cast p1, Ljava/lang/Enum;

    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/enums/EnumEntriesList;->contains(Ljava/lang/Enum;)Z

    move-result p1

    return p1
.end method

.method public get(I)Ljava/lang/Enum;
    .registers 4

    .line 56
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    iget-object v1, p0, Lnicoid/network238/kotlin/enums/EnumEntriesList;->entries:[Ljava/lang/Enum;

    array-length v1, v1

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkElementIndex$kotlin_stdlib(II)V

    .line 57
    iget-object v0, p0, Lnicoid/network238/kotlin/enums/EnumEntriesList;->entries:[Ljava/lang/Enum;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 2

    .line 45
    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/enums/EnumEntriesList;->get(I)Ljava/lang/Enum;

    move-result-object p1

    return-object p1
.end method

.method public getSize()I
    .registers 2

    .line 53
    iget-object v0, p0, Lnicoid/network238/kotlin/enums/EnumEntriesList;->entries:[Ljava/lang/Enum;

    array-length v0, v0

    return v0
.end method

.method public indexOf(Ljava/lang/Enum;)I
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 75
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    .line 76
    iget-object v1, p0, Lnicoid/network238/kotlin/enums/EnumEntriesList;->entries:[Ljava/lang/Enum;

    invoke-static {v1, v0}, Lnicoid/network238/kotlin/collections/ArraysKt;->getOrNull([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Enum;

    if-ne v1, p1, :cond_0

    return v0

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final bridge indexOf(Ljava/lang/Object;)I
    .registers 3

    .line 45
    instance-of v0, p1, Ljava/lang/Enum;

    if-nez v0, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    check-cast p1, Ljava/lang/Enum;

    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/enums/EnumEntriesList;->indexOf(Ljava/lang/Enum;)I

    move-result p1

    return p1
.end method

.method public lastIndexOf(Ljava/lang/Enum;)I
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/enums/EnumEntriesList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public final bridge lastIndexOf(Ljava/lang/Object;)I
    .registers 3

    .line 45
    instance-of v0, p1, Ljava/lang/Enum;

    if-nez v0, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    check-cast p1, Ljava/lang/Enum;

    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/enums/EnumEntriesList;->lastIndexOf(Ljava/lang/Enum;)I

    move-result p1

    return p1
.end method
