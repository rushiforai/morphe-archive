.class public final synthetic Le/e/a/BulkVideoActions215$22;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/BulkVideoActions215;"
    method = "lambda$accountAdd$0"
    proto = "(Landroid/app/Activity;Ljava/util/ArrayList;Ljava/lang/String;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Ljava/util/ArrayList;

.field public final synthetic f$2:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Ljava/util/ArrayList;Ljava/lang/String;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/BulkVideoActions215$22;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/BulkVideoActions215$22;->f$1:Ljava/util/ArrayList;

    iput-object p3, p0, Le/e/a/BulkVideoActions215$22;->f$2:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/BulkVideoActions215$22;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/BulkVideoActions215$22;->f$1:Ljava/util/ArrayList;

    iget-object v2, p0, Le/e/a/BulkVideoActions215$22;->f$2:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Le/e/a/BulkVideoActions215;->lambda$accountAdd$0(Landroid/app/Activity;Ljava/util/ArrayList;Ljava/lang/String;)V

    return-void
.end method
