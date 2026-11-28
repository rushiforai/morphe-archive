.class public final synthetic Le/e/a/PopupSwitch216$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/PopupSwitch216;"
    method = "lambda$retry$0"
    proto = "(Landroid/content/Context;II)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:I

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;II)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PopupSwitch216$0;->f$0:Landroid/content/Context;

    iput p2, p0, Le/e/a/PopupSwitch216$0;->f$1:I

    iput p3, p0, Le/e/a/PopupSwitch216$0;->f$2:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    invoke-static {p0}, Le/e/a/PopupSwitch216;->claimRetry116(Le/e/a/PopupSwitch216$0;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/PopupSwitch216$0;->f$0:Landroid/content/Context;

    iget v1, p0, Le/e/a/PopupSwitch216$0;->f$1:I

    iget v2, p0, Le/e/a/PopupSwitch216$0;->f$2:I

    invoke-static {v0, v1, v2}, Le/e/a/PopupSwitch216;->lambda$retry$0(Landroid/content/Context;II)V

    :cond_0
    return-void
.end method
