.class Lcom/tantanapp/common/data/orm/Filter$3;
.super Lcom/tantanapp/common/data/orm/Filter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/common/data/orm/Filter;->OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;
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
.field final synthetic val$filters:[Lcom/tantanapp/common/data/orm/Filter;


# direct methods
.method public constructor <init>([Lcom/tantanapp/common/data/orm/Filter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/Filter$3;->val$filters:[Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantanapp/common/data/orm/Filter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/Filter;->emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/SqlSegment;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    sget-object p0, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    const-string v0, "("

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/orm/SqlSegment;->prepend(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, ")"

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/orm/SqlSegment;->append(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public static synthetic b(Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/SqlSegment;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    sget-object p0, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    const-string v0, "("

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/orm/SqlSegment;->prepend(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, ")"

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/orm/SqlSegment;->append(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method


# virtual methods
.method public emit()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/Filter$3;->val$filters:[Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    new-instance v0, Lcom/tantanapp/common/data/orm/h;

    .line 4
    .line 5
    invoke-direct {v0}, Lcom/tantanapp/common/data/orm/h;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->R([Ljava/lang/Object;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string v0, " OR "

    .line 13
    .line 14
    invoke-static {p0, v0}, Lcom/tantanapp/common/data/orm/SqlSegment;->concat(Ljava/util/List;Ljava/lang/String;)Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget-object v0, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 19
    .line 20
    if-eq p0, v0, :cond_0

    .line 21
    .line 22
    const-string v0, "("

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/orm/SqlSegment;->prepend(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, ")"

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/orm/SqlSegment;->append(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    return-object p0
.end method

.method public emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/Filter$3;->val$filters:[Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    new-instance v0, Lcom/tantanapp/common/data/orm/g;

    .line 4
    .line 5
    invoke-direct {v0}, Lcom/tantanapp/common/data/orm/g;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->R([Ljava/lang/Object;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string v0, " OR "

    .line 13
    .line 14
    invoke-static {p0, v0}, Lcom/tantanapp/common/data/orm/SqlSegment;->concat(Ljava/util/List;Ljava/lang/String;)Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget-object v0, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 19
    .line 20
    if-eq p0, v0, :cond_0

    .line 21
    .line 22
    const-string v0, "("

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/orm/SqlSegment;->prepend(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, ")"

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/orm/SqlSegment;->append(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    return-object p0
.end method

.method public filter(Ljava/lang/Object;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/Filter$3;->val$filters:[Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v2, v0, :cond_1

    .line 7
    .line 8
    aget-object v3, p0, v2

    .line 9
    .line 10
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/orm/Filter;->filter(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    return v1
.end method
