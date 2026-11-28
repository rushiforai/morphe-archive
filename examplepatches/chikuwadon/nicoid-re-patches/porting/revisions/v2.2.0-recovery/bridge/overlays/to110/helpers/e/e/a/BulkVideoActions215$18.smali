.class public final synthetic Le/e/a/BulkVideoActions215$18;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/BulkVideoActions215;"
    method = "lambda$localAdd$1"
    proto = "(Landroid/app/Activity;[ILjava/lang/Boolean;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:[I


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;[I)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/BulkVideoActions215$18;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/BulkVideoActions215$18;->f$1:[I

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/BulkVideoActions215$18;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/BulkVideoActions215$18;->f$1:[I

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, v1, p1}, Le/e/a/BulkVideoActions215;->lambda$localAdd$1(Landroid/app/Activity;[ILjava/lang/Boolean;)V

    return-void
.end method
