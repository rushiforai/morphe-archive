.class public final synthetic Le/e/a/BulkVideoActions215$17;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/BulkVideoActions215;"
    method = "lambda$localAdd$0"
    proto = "(Ljava/util/ArrayList;Ljava/lang/String;[ILjava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/util/ArrayList;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:[I


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Ljava/lang/String;[I)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/BulkVideoActions215$17;->f$0:Ljava/util/ArrayList;

    iput-object p2, p0, Le/e/a/BulkVideoActions215$17;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/BulkVideoActions215$17;->f$2:[I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    .line 0
    iget-object v0, p0, Le/e/a/BulkVideoActions215$17;->f$0:Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/BulkVideoActions215$17;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/BulkVideoActions215$17;->f$2:[I

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Le/e/a/BulkVideoActions215;->lambda$localAdd$0(Ljava/util/ArrayList;Ljava/lang/String;[ILjava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
