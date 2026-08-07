.class public Ll/j7b0;
.super Ll/h9c;
.source "SourceFile"


# instance fields
.field public c:Ll/wzh0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/data/TableProviderInfo;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/TableProviderInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/h9c;-><init>()V

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
    iput-object v0, p0, Ll/j7b0;->d:Ljava/util/HashMap;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public c()I
    .locals 0

    .line 1
    const/16 p0, 0xd5

    .line 2
    .line 3
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public f()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/wzh0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ll/h9c;->f()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public g()V
    .locals 0

    .line 1
    return-void
.end method

.method public h()V
    .locals 6

    .line 1
    new-instance v0, Ll/wzh0;

    .line 2
    .line 3
    sget-object v3, Lcom/p1/mobile/putong/data/TableProviderInfo;->DB_ADAPTER:Ll/vzf0;

    .line 4
    .line 5
    const/4 v4, 0x0

    .line 6
    const/16 v5, 0x3e8

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const-string v2, "providerInfo"

    .line 10
    .line 11
    invoke-direct/range {v0 .. v5}, Ll/wzh0;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/j7b0;->c:Ll/wzh0;

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    iput-boolean p0, v0, Ll/wzh0;->f:Z

    .line 18
    .line 19
    return-void
.end method

.method public j(Lio/requery/android/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    .line 1
    return-void
.end method

.method public k()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j7b0;->d:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Lio/requery/android/database/sqlite/SQLiteDatabase;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/j7b0;->c:Ll/wzh0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/wzh0;->b:Ll/vzf0;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/vzf0;->CREATE_TABLE(Ll/wzh0;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public m()I
    .locals 0

    .line 1
    const/16 p0, 0xd4

    .line 2
    .line 3
    return p0
.end method

.method public n(Ljava/lang/String;)Lcom/p1/mobile/putong/data/TableProviderInfo;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/j7b0;->d:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/j7b0;->d:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/data/TableProviderInfo;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object v0, p0, Ll/j7b0;->c:Ll/wzh0;

    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/data/TableProviderInfo;->NAME:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 21
    .line 22
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/4 v2, 0x1

    .line 27
    const/4 v3, 0x0

    .line 28
    const/4 v4, 0x0

    .line 29
    invoke-virtual {v0, v1, v3, v2, v4}, Ll/wzh0;->z(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;IZ)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    return-object v3

    .line 40
    :cond_1
    iget-object p0, p0, Ll/j7b0;->d:Ljava/util/HashMap;

    .line 41
    .line 42
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Lcom/p1/mobile/putong/data/TableProviderInfo;

    .line 47
    .line 48
    invoke-virtual {p0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Lcom/p1/mobile/putong/data/TableProviderInfo;

    .line 56
    .line 57
    return-object p0
.end method

.method public o()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/j7b0;->c:Ll/wzh0;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x0

    .line 6
    invoke-virtual {v0, v3, v3, v1, v2}, Ll/wzh0;->z(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;IZ)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/data/TableProviderInfo;

    .line 27
    .line 28
    iget-object v2, p0, Ll/j7b0;->d:Ljava/util/HashMap;

    .line 29
    .line 30
    iget-object v3, v1, Lcom/p1/mobile/putong/data/TableProviderInfo;->name:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return-void
.end method

.method public p(Lio/requery/android/database/sqlite/SQLiteDatabase;Lcom/p1/mobile/putong/data/TableProviderInfo;Z)V
    .locals 2

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    new-instance p3, Landroid/content/ContentValues;

    .line 4
    .line 5
    invoke-direct {p3}, Landroid/content/ContentValues;-><init>()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/data/TableProviderInfo;->DB_ADAPTER:Ll/vzf0;

    .line 9
    .line 10
    invoke-virtual {v0, p2, p3}, Ll/vzf0;->write(Ljava/lang/Object;Landroid/content/ContentValues;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/j7b0;->c:Ll/wzh0;

    .line 14
    .line 15
    iget-object p0, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 16
    .line 17
    const/4 p2, 0x0

    .line 18
    invoke-virtual {p1, p0, p2, p3}, Lio/requery/android/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance p3, Landroid/content/ContentValues;

    .line 23
    .line 24
    invoke-direct {p3}, Landroid/content/ContentValues;-><init>()V

    .line 25
    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/data/TableProviderInfo;->DB_ADAPTER:Ll/vzf0;

    .line 28
    .line 29
    invoke-virtual {v0, p2, p3}, Ll/vzf0;->write(Ljava/lang/Object;Landroid/content/ContentValues;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/j7b0;->c:Ll/wzh0;

    .line 33
    .line 34
    iget-object p0, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 35
    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    sget-object v1, Lcom/tantanapp/common/data/DbObject;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, " = ?"

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 56
    .line 57
    filled-new-array {p2}, [Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-virtual {p1, p0, p3, v0, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    return-void
.end method
