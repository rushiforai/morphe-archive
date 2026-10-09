.class public final synthetic Le/e/a/ModernShorts$21;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/ModernShorts;"
    method = "lambda$install$19"
    proto = "(Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/widget/LinearLayout;)Z"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Le/e/a/ModernShorts$State;

.field public final synthetic f$2:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/widget/LinearLayout;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernShorts$21;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/ModernShorts$21;->f$1:Le/e/a/ModernShorts$State;

    iput-object p3, p0, Le/e/a/ModernShorts$21;->f$2:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final onPreDraw()Z
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/ModernShorts$21;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/ModernShorts$21;->f$1:Le/e/a/ModernShorts$State;

    iget-object v2, p0, Le/e/a/ModernShorts$21;->f$2:Landroid/widget/LinearLayout;

    invoke-static {v0, v1, v2}, Le/e/a/ModernShorts;->lambda$install$19(Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/widget/LinearLayout;)Z

    move-result v0

    return v0
.end method
