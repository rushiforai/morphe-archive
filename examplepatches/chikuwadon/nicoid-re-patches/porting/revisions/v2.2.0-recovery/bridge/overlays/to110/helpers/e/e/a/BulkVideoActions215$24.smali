.class public final synthetic Le/e/a/BulkVideoActions215$24;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/BulkVideoActions215;"
    method = "lambda$installSort$0"
    proto = "(Ljava/lang/Runnable;Landroid/app/Activity;Landroid/view/View;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/lang/Runnable;

.field public final synthetic f$1:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;Landroid/app/Activity;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/BulkVideoActions215$24;->f$0:Ljava/lang/Runnable;

    iput-object p2, p0, Le/e/a/BulkVideoActions215$24;->f$1:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/BulkVideoActions215$24;->f$0:Ljava/lang/Runnable;

    iget-object v1, p0, Le/e/a/BulkVideoActions215$24;->f$1:Landroid/app/Activity;

    invoke-static {v0, v1, p1}, Le/e/a/BulkVideoActions215;->lambda$installSort$0(Ljava/lang/Runnable;Landroid/app/Activity;Landroid/view/View;)V

    return-void
.end method
