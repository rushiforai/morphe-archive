.class public Ll/csj0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/tantanapp/common/data/ValueObject;Lcom/tantanapp/common/data/ValueObject;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/ValueObject;->hasCopyId()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ValueObject;->hasCopyId()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tantanapp/common/data/ValueObject;->getCopyId()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-virtual {p1, v0, v1}, Lcom/tantanapp/common/data/ValueObject;->setCopyId(J)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static b(Ljava/util/List;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            "O:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/util/List<",
            "TO;>;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/fg00;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/fg00;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/fg00;->f(Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static c(Lcom/tantanapp/common/data/ValueObject;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            "O:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(TO;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-virtual {p0}, Lcom/tantanapp/common/data/ValueObject;->createTransValue()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tantanapp/common/data/ValueObject;->toJson()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    :try_start_0
    invoke-virtual {p1, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/tantanapp/common/data/ValueObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    :try_start_1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/ValueObject;->getExtList()Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Lcom/tantanapp/common/data/ValueObject;->setExtList(Ljava/util/ArrayList;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->copyTransValue(Lcom/tantanapp/common/data/ValueObject;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p0, p1}, Ll/csj0;->a(Lcom/tantanapp/common/data/ValueObject;Lcom/tantanapp/common/data/ValueObject;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 31
    .line 32
    .line 33
    return-object p1

    .line 34
    :catch_0
    move-exception p0

    .line 35
    move-object v0, p1

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    return-object p1

    .line 38
    :catch_1
    move-exception p0

    .line 39
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    return-object v0
.end method
