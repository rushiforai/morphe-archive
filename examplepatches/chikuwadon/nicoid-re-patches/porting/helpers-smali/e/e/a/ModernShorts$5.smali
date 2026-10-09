.class public final synthetic Le/e/a/ModernShorts$5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/ModernShorts;"
    method = "lambda$showList$21"
    proto = "(Landroid/app/AlertDialog;ILe/e/a/ModernShorts$State;Landroid/app/Activity;Landroid/view/View;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/app/AlertDialog;

.field public final synthetic f$1:I

.field public final synthetic f$2:Le/e/a/ModernShorts$State;

.field public final synthetic f$3:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Landroid/app/AlertDialog;ILe/e/a/ModernShorts$State;Landroid/app/Activity;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernShorts$5;->f$0:Landroid/app/AlertDialog;

    iput p2, p0, Le/e/a/ModernShorts$5;->f$1:I

    iput-object p3, p0, Le/e/a/ModernShorts$5;->f$2:Le/e/a/ModernShorts$State;

    iput-object p4, p0, Le/e/a/ModernShorts$5;->f$3:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/ModernShorts$5;->f$0:Landroid/app/AlertDialog;

    iget v1, p0, Le/e/a/ModernShorts$5;->f$1:I

    iget-object v2, p0, Le/e/a/ModernShorts$5;->f$2:Le/e/a/ModernShorts$State;

    iget-object v3, p0, Le/e/a/ModernShorts$5;->f$3:Landroid/app/Activity;

    invoke-static {v0, v1, v2, v3, p1}, Le/e/a/ModernShorts;->lambda$showList$21(Landroid/app/AlertDialog;ILe/e/a/ModernShorts$State;Landroid/app/Activity;Landroid/view/View;)V

    return-void
.end method
