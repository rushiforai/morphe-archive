.class public abstract Lorg/seamless/util/dbunit/H2DBUnitOperations;
.super Lorg/seamless/util/dbunit/DBUnitOperations;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/seamless/util/dbunit/DBUnitOperations;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public disableReferentialIntegrity(Lorg/dbunit/database/IDatabaseConnection;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-interface {p1}, Lorg/dbunit/database/IDatabaseConnection;->getConnection()Ljava/sql/Connection;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "set referential_integrity FALSE"

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ljava/sql/Connection;->prepareStatement(Ljava/lang/String;)Ljava/sql/PreparedStatement;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/sql/PreparedStatement;->execute()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception p0

    .line 16
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public editConfig(Lorg/dbunit/database/DatabaseConfig;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lorg/seamless/util/dbunit/DBUnitOperations;->editConfig(Lorg/dbunit/database/DatabaseConfig;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/seamless/util/dbunit/H2DBUnitOperations$1;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lorg/seamless/util/dbunit/H2DBUnitOperations$1;-><init>(Lorg/seamless/util/dbunit/H2DBUnitOperations;)V

    .line 7
    .line 8
    .line 9
    const-string p0, "http://www.dbunit.org/properties/datatypeFactory"

    .line 10
    .line 11
    invoke-virtual {p1, p0, v0}, Lorg/dbunit/database/DatabaseConfig;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public enableReferentialIntegrity(Lorg/dbunit/database/IDatabaseConnection;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-interface {p1}, Lorg/dbunit/database/IDatabaseConnection;->getConnection()Ljava/sql/Connection;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "set referential_integrity TRUE"

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ljava/sql/Connection;->prepareStatement(Ljava/lang/String;)Ljava/sql/PreparedStatement;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/sql/PreparedStatement;->execute()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception p0

    .line 16
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
