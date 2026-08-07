.class public Lorg/seamless/util/dbunit/DBUnitOperations$FileOp;
.super Lorg/seamless/util/dbunit/DBUnitOperations$Op;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/seamless/util/dbunit/DBUnitOperations;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FileOp"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/seamless/util/dbunit/DBUnitOperations;


# direct methods
.method public constructor <init>(Lorg/seamless/util/dbunit/DBUnitOperations;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/seamless/util/dbunit/DBUnitOperations$FileOp;->this$0:Lorg/seamless/util/dbunit/DBUnitOperations;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lorg/seamless/util/dbunit/DBUnitOperations$Op;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Lorg/seamless/util/dbunit/DBUnitOperations;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 7
    iput-object p1, p0, Lorg/seamless/util/dbunit/DBUnitOperations$FileOp;->this$0:Lorg/seamless/util/dbunit/DBUnitOperations;

    .line 8
    invoke-direct {p0, p2, p3}, Lorg/seamless/util/dbunit/DBUnitOperations$Op;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lorg/seamless/util/dbunit/DBUnitOperations;Ljava/lang/String;Ljava/lang/String;Lorg/dbunit/operation/DatabaseOperation;)V
    .locals 0

    .line 9
    iput-object p1, p0, Lorg/seamless/util/dbunit/DBUnitOperations$FileOp;->this$0:Lorg/seamless/util/dbunit/DBUnitOperations;

    .line 10
    invoke-direct {p0, p2, p3, p4}, Lorg/seamless/util/dbunit/DBUnitOperations$Op;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/dbunit/operation/DatabaseOperation;)V

    return-void
.end method


# virtual methods
.method public openStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 0

    .line 1
    :try_start_0
    new-instance p0, Ljava/io/FileInputStream;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-object p0

    .line 7
    :catch_0
    move-exception p0

    .line 8
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method
