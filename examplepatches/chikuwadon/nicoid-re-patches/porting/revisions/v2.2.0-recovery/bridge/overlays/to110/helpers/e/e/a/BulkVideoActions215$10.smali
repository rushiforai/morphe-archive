.class public final synthetic Le/e/a/BulkVideoActions215$10;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/BulkVideoActions215;"
    method = "lambda$accountChooser$1"
    proto = "(Landroid/app/Activity;ZLjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Ljava/util/ArrayList;

.field public final synthetic f$3:Ljava/util/ArrayList;

.field public final synthetic f$4:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;ZLjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/BulkVideoActions215$10;->f$0:Landroid/app/Activity;

    iput-boolean p2, p0, Le/e/a/BulkVideoActions215$10;->f$1:Z

    iput-object p3, p0, Le/e/a/BulkVideoActions215$10;->f$2:Ljava/util/ArrayList;

    iput-object p4, p0, Le/e/a/BulkVideoActions215$10;->f$3:Ljava/util/ArrayList;

    iput-object p5, p0, Le/e/a/BulkVideoActions215$10;->f$4:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/BulkVideoActions215$10;->f$0:Landroid/app/Activity;

    iget-boolean v1, p0, Le/e/a/BulkVideoActions215$10;->f$1:Z

    iget-object v2, p0, Le/e/a/BulkVideoActions215$10;->f$2:Ljava/util/ArrayList;

    iget-object v3, p0, Le/e/a/BulkVideoActions215$10;->f$3:Ljava/util/ArrayList;

    iget-object v4, p0, Le/e/a/BulkVideoActions215$10;->f$4:Ljava/util/ArrayList;

    invoke-static {v0, v1, v2, v3, v4}, Le/e/a/BulkVideoActions215;->lambda$accountChooser$1(Landroid/app/Activity;ZLjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    return-void
.end method
