.class public final synthetic Le/e/a/PopupOverlay$1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/PopupOverlay;"
    method = "lambda$attach$1"
    proto = "(Landroid/view/View;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PopupOverlay$1;->f$0:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/PopupOverlay$1;->f$0:Landroid/view/View;

    invoke-static {v0}, Le/e/a/PopupOverlay;->lambda$attach$1(Landroid/view/View;)V

    return-void
.end method
