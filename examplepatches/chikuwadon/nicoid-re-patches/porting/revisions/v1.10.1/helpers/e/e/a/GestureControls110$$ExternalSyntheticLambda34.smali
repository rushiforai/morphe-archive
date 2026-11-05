.class public final synthetic Le/e/a/GestureControls110$$ExternalSyntheticLambda34;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/widget/LinearLayout;

.field public final synthetic f$1:Landroid/app/Activity;

.field public final synthetic f$2:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/LinearLayout;Landroid/app/Activity;Landroid/content/Context;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda34;->f$0:Landroid/widget/LinearLayout;

    iput-object p2, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda34;->f$1:Landroid/app/Activity;

    iput-object p3, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda34;->f$2:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda34;->f$0:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda34;->f$1:Landroid/app/Activity;

    iget-object v2, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda34;->f$2:Landroid/content/Context;

    invoke-static {v0, v1, v2}, Le/e/a/GestureControls110;->lambda$5(Landroid/widget/LinearLayout;Landroid/app/Activity;Landroid/content/Context;)V

    return-void
.end method
