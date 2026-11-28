.class public final synthetic Le/e/a/BulkVideoActions215$16;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/BulkVideoActions215;"
    method = "lambda$chooseAction$0"
    proto = "(Landroid/app/Activity;Ljava/util/ArrayList;Landroid/content/DialogInterface;I)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Ljava/util/ArrayList;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/BulkVideoActions215$16;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/BulkVideoActions215$16;->f$1:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/BulkVideoActions215$16;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/BulkVideoActions215$16;->f$1:Ljava/util/ArrayList;

    invoke-static {v0, v1, p1, p2}, Le/e/a/BulkVideoActions215;->lambda$chooseAction$0(Landroid/app/Activity;Ljava/util/ArrayList;Landroid/content/DialogInterface;I)V

    return-void
.end method
