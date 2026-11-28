.class public final synthetic Le/e/a/BulkVideoActions215$5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/BulkVideoActions215;"
    method = "lambda$menu$7"
    proto = "(Landroid/app/Activity;Ljava/lang/Object;Landroid/view/MenuItem;)Z"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/BulkVideoActions215$5;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/BulkVideoActions215$5;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/BulkVideoActions215$5;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/BulkVideoActions215$5;->f$1:Ljava/lang/Object;

    invoke-static {v0, v1, p1}, Le/e/a/BulkVideoActions215;->lambda$menu$7(Landroid/app/Activity;Ljava/lang/Object;Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method
