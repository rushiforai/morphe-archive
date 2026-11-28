.class final Lcom/google/common/collect/HashBiMap$EntryForValue;
.super Lcom/google/common/collect/AbstractMapEntry;
.source "HashBiMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/HashBiMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "EntryForValue"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/AbstractMapEntry<",
        "TV;TK;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x27fba1a399c7f5a8L


# instance fields
.field index:I

.field final obverse:Lcom/google/common/collect/HashBiMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/HashBiMap<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field final obverseValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/collect/HashBiMap;I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "obverse",
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/HashBiMap<",
            "TK;TV;>;I)V"
        }
    .end annotation

    .line 1121
    invoke-direct {p0}, Lcom/google/common/collect/AbstractMapEntry;-><init>()V

    .line 1122
    iput-object p1, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->obverse:Lcom/google/common/collect/HashBiMap;

    .line 1124
    # getter for: Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;
    invoke-static {p1}, Lcom/google/common/collect/HashBiMap;->access$800(Lcom/google/common/collect/HashBiMap;)[Ljava/lang/Object;

    move-result-object p1

    aget-object p1, p1, p2

    invoke-static {p1}, Lcom/google/common/collect/NullnessCasts;->uncheckedCastNullableTToT(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->obverseValue:Ljava/lang/Object;

    .line 1125
    iput p2, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->index:I

    return-void
.end method

.method private updateIndex()V
    .registers 4

    .line 1129
    iget v0, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->index:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget-object v1, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->obverse:Lcom/google/common/collect/HashBiMap;

    .line 1130
    # getter for: Lcom/google/common/collect/HashBiMap;->size:I
    invoke-static {v1}, Lcom/google/common/collect/HashBiMap;->access$200(Lcom/google/common/collect/HashBiMap;)I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->obverseValue:Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->obverse:Lcom/google/common/collect/HashBiMap;

    .line 1131
    # getter for: Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/common/collect/HashBiMap;->access$800(Lcom/google/common/collect/HashBiMap;)[Ljava/lang/Object;

    move-result-object v1

    iget v2, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->index:I

    aget-object v1, v1, v2

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 1132
    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->obverse:Lcom/google/common/collect/HashBiMap;

    iget-object v1, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->obverseValue:Ljava/lang/Object;

    # invokes: Lcom/google/common/collect/HashBiMap;->findEntryByValue(Ljava/lang/Object;)I
    invoke-static {v0, v1}, Lcom/google/common/collect/HashBiMap;->access$1600(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;)I

    move-result v0

    iput v0, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->index:I

    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .line 1139
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->obverseValue:Ljava/lang/Object;

    return-object p0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 1145
    invoke-direct {p0}, Lcom/google/common/collect/HashBiMap$EntryForValue;->updateIndex()V

    .line 1147
    iget v0, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->index:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/google/common/collect/NullnessCasts;->unsafeNull()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->obverse:Lcom/google/common/collect/HashBiMap;

    # getter for: Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;
    invoke-static {v0}, Lcom/google/common/collect/HashBiMap;->access$500(Lcom/google/common/collect/HashBiMap;)[Ljava/lang/Object;

    move-result-object v0

    iget p0, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->index:I

    aget-object p0, v0, p0

    invoke-static {p0}, Lcom/google/common/collect/NullnessCasts;->uncheckedCastNullableTToT(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TK;"
        }
    .end annotation

    .line 1154
    invoke-direct {p0}, Lcom/google/common/collect/HashBiMap$EntryForValue;->updateIndex()V

    .line 1155
    iget v0, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->index:I

    .line 1159
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->obverse:Lcom/google/common/collect/HashBiMap;

    const/4 v2, 0x0

    const/4 v3, -0x1

    if-ne v0, v3, :cond_0

    .line 1156
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->obverseValue:Ljava/lang/Object;

    # invokes: Lcom/google/common/collect/HashBiMap;->putInverse(Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;
    invoke-static {v1, p0, p1, v2}, Lcom/google/common/collect/HashBiMap;->access$1300(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;

    .line 1157
    invoke-static {}, Lcom/google/common/collect/NullnessCasts;->unsafeNull()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 1160
    :cond_0
    # getter for: Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/common/collect/HashBiMap;->access$500(Lcom/google/common/collect/HashBiMap;)[Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->index:I

    aget-object v0, v0, v1

    invoke-static {v0}, Lcom/google/common/collect/NullnessCasts;->uncheckedCastNullableTToT(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1161
    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    return-object p1

    .line 1164
    :cond_1
    iget-object v1, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->obverse:Lcom/google/common/collect/HashBiMap;

    iget p0, p0, Lcom/google/common/collect/HashBiMap$EntryForValue;->index:I

    # invokes: Lcom/google/common/collect/HashBiMap;->replaceKeyInEntry(ILjava/lang/Object;Z)V
    invoke-static {v1, p0, p1, v2}, Lcom/google/common/collect/HashBiMap;->access$1700(Lcom/google/common/collect/HashBiMap;ILjava/lang/Object;Z)V

    return-object v0
.end method
