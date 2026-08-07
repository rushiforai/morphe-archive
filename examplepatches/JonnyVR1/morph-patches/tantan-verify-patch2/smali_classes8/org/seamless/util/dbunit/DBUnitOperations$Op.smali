.class public abstract Lorg/seamless/util/dbunit/DBUnitOperations$Op;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/seamless/util/dbunit/DBUnitOperations;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Op"
.end annotation


# instance fields
.field dataSet:Lorg/dbunit/dataset/ReplacementDataSet;

.field operation:Lorg/dbunit/operation/DatabaseOperation;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x0

    .line 57
    sget-object v1, Lorg/dbunit/operation/DatabaseOperation;->CLEAN_INSERT:Lorg/dbunit/operation/DatabaseOperation;

    invoke-direct {p0, p1, v0, v1}, Lorg/seamless/util/dbunit/DBUnitOperations$Op;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/dbunit/operation/DatabaseOperation;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 56
    sget-object v0, Lorg/dbunit/operation/DatabaseOperation;->CLEAN_INSERT:Lorg/dbunit/operation/DatabaseOperation;

    invoke-direct {p0, p1, p2, v0}, Lorg/seamless/util/dbunit/DBUnitOperations$Op;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/dbunit/operation/DatabaseOperation;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/dbunit/operation/DatabaseOperation;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    :try_start_0
    new-instance v1, Lorg/dbunit/dataset/ReplacementDataSet;

    .line 8
    .line 9
    new-instance v2, Lorg/dbunit/dataset/xml/FlatXmlDataSet;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lorg/seamless/util/dbunit/DBUnitOperations$Op;->openStream(Ljava/lang/String;)Ljava/io/InputStream;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p2}, Lorg/seamless/util/dbunit/DBUnitOperations$Op;->openStream(Ljava/lang/String;)Ljava/io/InputStream;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-direct {v2, p1, p2}, Lorg/dbunit/dataset/xml/FlatXmlDataSet;-><init>(Ljava/io/InputStream;Ljava/io/InputStream;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {v1, v2}, Lorg/dbunit/dataset/ReplacementDataSet;-><init>(Lorg/dbunit/dataset/IDataSet;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catch_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    new-instance v1, Lorg/dbunit/dataset/ReplacementDataSet;

    .line 29
    .line 30
    new-instance p2, Lorg/dbunit/dataset/xml/FlatXmlDataSet;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lorg/seamless/util/dbunit/DBUnitOperations$Op;->openStream(Ljava/lang/String;)Ljava/io/InputStream;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-direct {p2, p1}, Lorg/dbunit/dataset/xml/FlatXmlDataSet;-><init>(Ljava/io/InputStream;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {v1, p2}, Lorg/dbunit/dataset/ReplacementDataSet;-><init>(Lorg/dbunit/dataset/IDataSet;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    iput-object v1, p0, Lorg/seamless/util/dbunit/DBUnitOperations$Op;->dataSet:Lorg/dbunit/dataset/ReplacementDataSet;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    const-string p1, "[NULL]"

    .line 45
    .line 46
    invoke-virtual {v1, p1, v0}, Lorg/dbunit/dataset/ReplacementDataSet;->addReplacementObject(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    iput-object p3, p0, Lorg/seamless/util/dbunit/DBUnitOperations$Op;->operation:Lorg/dbunit/operation/DatabaseOperation;

    .line 50
    .line 51
    return-void

    .line 52
    :goto_1
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    throw v0
.end method


# virtual methods
.method public execute(Lorg/dbunit/database/IDatabaseConnection;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lorg/seamless/util/dbunit/DBUnitOperations$Op;->operation:Lorg/dbunit/operation/DatabaseOperation;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/seamless/util/dbunit/DBUnitOperations$Op;->dataSet:Lorg/dbunit/dataset/ReplacementDataSet;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p0}, Lorg/dbunit/operation/DatabaseOperation;->execute(Lorg/dbunit/database/IDatabaseConnection;Lorg/dbunit/dataset/IDataSet;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public getDataSet()Lorg/dbunit/dataset/IDataSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/dbunit/DBUnitOperations$Op;->dataSet:Lorg/dbunit/dataset/ReplacementDataSet;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOperation()Lorg/dbunit/operation/DatabaseOperation;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/dbunit/DBUnitOperations$Op;->operation:Lorg/dbunit/operation/DatabaseOperation;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract openStream(Ljava/lang/String;)Ljava/io/InputStream;
.end method
