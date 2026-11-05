.class public final synthetic Le/e/a/LoginSupport$1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/LoginSupport;"
    method = "lambda$open$4"
    proto = "(Landroid/app/AlertDialog;Landroid/app/Activity;Landroid/view/View;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/app/AlertDialog;

.field public final synthetic f$1:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Landroid/app/AlertDialog;Landroid/app/Activity;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LoginSupport$1;->f$0:Landroid/app/AlertDialog;

    iput-object p2, p0, Le/e/a/LoginSupport$1;->f$1:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/LoginSupport$1;->f$0:Landroid/app/AlertDialog;

    iget-object v1, p0, Le/e/a/LoginSupport$1;->f$1:Landroid/app/Activity;

    invoke-static {v0, v1, p1}, Le/e/a/LoginSupport;->lambda$open$4(Landroid/app/AlertDialog;Landroid/app/Activity;Landroid/view/View;)V

    return-void
.end method
