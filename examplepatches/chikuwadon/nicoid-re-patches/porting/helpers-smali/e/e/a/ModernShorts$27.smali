.class public final synthetic Le/e/a/ModernShorts$27;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/ModernShorts;"
    method = "lambda$bootstrap$6"
    proto = "(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Le/e/a/ModernShorts$State;

.field public final synthetic f$2:Le/e/a/ModernShorts$Home;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernShorts$27;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/ModernShorts$27;->f$1:Le/e/a/ModernShorts$State;

    iput-object p3, p0, Le/e/a/ModernShorts$27;->f$2:Le/e/a/ModernShorts$Home;

    return-void
.end method


# virtual methods
.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 10

    .line 0
    iget-object v0, p0, Le/e/a/ModernShorts$27;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/ModernShorts$27;->f$1:Le/e/a/ModernShorts$State;

    iget-object v2, p0, Le/e/a/ModernShorts$27;->f$2:Le/e/a/ModernShorts$Home;

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Le/e/a/ModernShorts;->lambda$bootstrap$6(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method
