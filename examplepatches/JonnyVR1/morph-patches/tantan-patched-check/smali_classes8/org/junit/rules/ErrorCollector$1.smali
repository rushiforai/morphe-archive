.class Lorg/junit/rules/ErrorCollector$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/rules/ErrorCollector;->checkThat(Ljava/lang/String;Ljava/lang/Object;Lorg/hamcrest/Matcher;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/rules/ErrorCollector;

.field final synthetic val$matcher:Lorg/hamcrest/Matcher;

.field final synthetic val$reason:Ljava/lang/String;

.field final synthetic val$value:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lorg/junit/rules/ErrorCollector;Ljava/lang/String;Ljava/lang/Object;Lorg/hamcrest/Matcher;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/junit/rules/ErrorCollector$1;->this$0:Lorg/junit/rules/ErrorCollector;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/junit/rules/ErrorCollector$1;->val$reason:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lorg/junit/rules/ErrorCollector$1;->val$value:Ljava/lang/Object;

    .line 6
    .line 7
    iput-object p4, p0, Lorg/junit/rules/ErrorCollector$1;->val$matcher:Lorg/hamcrest/Matcher;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/junit/rules/ErrorCollector$1;->val$reason:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/junit/rules/ErrorCollector$1;->val$value:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object v2, p0, Lorg/junit/rules/ErrorCollector$1;->val$matcher:Lorg/hamcrest/Matcher;

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Lorg/junit/Assert;->assertThat(Ljava/lang/String;Ljava/lang/Object;Lorg/hamcrest/Matcher;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lorg/junit/rules/ErrorCollector$1;->val$value:Ljava/lang/Object;

    .line 11
    .line 12
    return-object p0
.end method
