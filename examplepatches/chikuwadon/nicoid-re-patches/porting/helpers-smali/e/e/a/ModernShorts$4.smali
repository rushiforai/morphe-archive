.class public final synthetic Le/e/a/ModernShorts$4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/ModernShorts;"
    method = "lambda$renderHome$10"
    proto = "(Landroid/app/Activity;Le/e/a/ModernShorts$State;ILandroid/view/View;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Le/e/a/ModernShorts$State;

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernShorts$4;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/ModernShorts$4;->f$1:Le/e/a/ModernShorts$State;

    iput p3, p0, Le/e/a/ModernShorts$4;->f$2:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/ModernShorts$4;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/ModernShorts$4;->f$1:Le/e/a/ModernShorts$State;

    iget v2, p0, Le/e/a/ModernShorts$4;->f$2:I

    invoke-static {v0, v1, v2, p1}, Le/e/a/ModernShorts;->lambda$renderHome$10(Landroid/app/Activity;Le/e/a/ModernShorts$State;ILandroid/view/View;)V

    return-void
.end method
