.class public abstract Lorg/seamless/util/dbunit/DBUnitOperations;
.super Ljava/util/ArrayList;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/seamless/util/dbunit/DBUnitOperations$FileOp;,
        Lorg/seamless/util/dbunit/DBUnitOperations$ClasspathOp;,
        Lorg/seamless/util/dbunit/DBUnitOperations$Op;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList<",
        "Lorg/seamless/util/dbunit/DBUnitOperations$Op;",
        ">;"
    }
.end annotation


# static fields
.field private static final log:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/seamless/util/dbunit/DBUnitOperations;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lorg/seamless/util/dbunit/DBUnitOperations;->log:Ljava/util/logging/Logger;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract disableReferentialIntegrity(Lorg/dbunit/database/IDatabaseConnection;)V
.end method

.method public editConfig(Lorg/dbunit/database/DatabaseConfig;)V
    .locals 0

    return-void
.end method

.method public abstract enableReferentialIntegrity(Lorg/dbunit/database/IDatabaseConnection;)V
.end method

.method public execute()V
    .locals 5

    .line 1
    const-string v0, "Failed to close connection after DBUnit operation: "

    .line 2
    .line 3
    sget-object v1, Lorg/seamless/util/dbunit/DBUnitOperations;->log:Ljava/util/logging/Logger;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "Executing DBUnit operations: "

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->size()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :try_start_0
    invoke-virtual {p0}, Lorg/seamless/util/dbunit/DBUnitOperations;->getConnection()Lorg/dbunit/database/IDatabaseConnection;

    .line 27
    .line 28
    .line 29
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 30
    :try_start_1
    invoke-virtual {p0, v1}, Lorg/seamless/util/dbunit/DBUnitOperations;->disableReferentialIntegrity(Lorg/dbunit/database/IDatabaseConnection;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_0

    .line 42
    .line 43
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Lorg/seamless/util/dbunit/DBUnitOperations$Op;

    .line 48
    .line 49
    invoke-virtual {v3, v1}, Lorg/seamless/util/dbunit/DBUnitOperations$Op;->execute(Lorg/dbunit/database/IDatabaseConnection;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception p0

    .line 54
    goto :goto_1

    .line 55
    :cond_0
    invoke-virtual {p0, v1}, Lorg/seamless/util/dbunit/DBUnitOperations;->enableReferentialIntegrity(Lorg/dbunit/database/IDatabaseConnection;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    .line 57
    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    :try_start_2
    invoke-interface {v1}, Lorg/dbunit/database/IDatabaseConnection;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :catch_0
    move-exception p0

    .line 65
    sget-object v1, Lorg/seamless/util/dbunit/DBUnitOperations;->log:Ljava/util/logging/Logger;

    .line 66
    .line 67
    sget-object v2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 68
    .line 69
    new-instance v3, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v1, v2, v0, p0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 82
    .line 83
    .line 84
    :cond_1
    return-void

    .line 85
    :catchall_1
    move-exception p0

    .line 86
    const/4 v1, 0x0

    .line 87
    :goto_1
    if-eqz v1, :cond_2

    .line 88
    .line 89
    :try_start_3
    invoke-interface {v1}, Lorg/dbunit/database/IDatabaseConnection;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 90
    .line 91
    .line 92
    goto :goto_2

    .line 93
    :catch_1
    move-exception v1

    .line 94
    sget-object v2, Lorg/seamless/util/dbunit/DBUnitOperations;->log:Ljava/util/logging/Logger;

    .line 95
    .line 96
    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 97
    .line 98
    new-instance v4, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v2, v3, v0, v1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 111
    .line 112
    .line 113
    :cond_2
    :goto_2
    throw p0
.end method

.method public getConnection()Lorg/dbunit/database/IDatabaseConnection;
    .locals 2

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lorg/seamless/util/dbunit/DBUnitOperations;->getDataSource()Ljavax/sql/DataSource;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljavax/sql/DataSource;->getConnection()Ljava/sql/Connection;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Lorg/dbunit/database/DatabaseConnection;

    .line 10
    .line 11
    invoke-direct {v1, v0}, Lorg/dbunit/database/DatabaseConnection;-><init>(Ljava/sql/Connection;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {v1}, Lorg/dbunit/database/IDatabaseConnection;->getConfig()Lorg/dbunit/database/DatabaseConfig;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Lorg/seamless/util/dbunit/DBUnitOperations;->editConfig(Lorg/dbunit/database/DatabaseConfig;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    return-object v1

    .line 22
    :catch_0
    move-exception p0

    .line 23
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public abstract getDataSource()Ljavax/sql/DataSource;
.end method
