.class Lorg/seamless/util/dbunit/H2DBUnitOperations$1;
.super Lorg/dbunit/dataset/datatype/DefaultDataTypeFactory;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/seamless/util/dbunit/H2DBUnitOperations;->editConfig(Lorg/dbunit/database/DatabaseConfig;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/seamless/util/dbunit/H2DBUnitOperations;


# direct methods
.method public constructor <init>(Lorg/seamless/util/dbunit/H2DBUnitOperations;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/seamless/util/dbunit/H2DBUnitOperations$1;->this$0:Lorg/seamless/util/dbunit/H2DBUnitOperations;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/dbunit/dataset/datatype/DefaultDataTypeFactory;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public createDataType(ILjava/lang/String;)Lorg/dbunit/dataset/datatype/DataType;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dbunit/dataset/datatype/DataTypeException;
        }
    .end annotation

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lorg/dbunit/dataset/datatype/DataType;->BOOLEAN:Lorg/dbunit/dataset/datatype/DataType;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/dbunit/dataset/datatype/DefaultDataTypeFactory;->createDataType(ILjava/lang/String;)Lorg/dbunit/dataset/datatype/DataType;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
