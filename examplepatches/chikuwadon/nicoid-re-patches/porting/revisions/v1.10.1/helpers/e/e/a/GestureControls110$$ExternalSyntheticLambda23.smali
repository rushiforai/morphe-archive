.class public final synthetic Le/e/a/GestureControls110$$ExternalSyntheticLambda23;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:Landroid/widget/Button;

.field public final synthetic f$2:Landroid/app/Activity;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Landroid/widget/Button;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda23;->f$0:Landroid/content/Context;

    iput-object p2, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda23;->f$1:Landroid/widget/Button;

    iput-object p3, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda23;->f$2:Landroid/app/Activity;

    iput-object p4, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda23;->f$3:Ljava/lang/String;

    iput-object p5, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda23;->f$4:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 8

    .line 0
    iget-object v0, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda23;->f$0:Landroid/content/Context;

    iget-object v1, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda23;->f$1:Landroid/widget/Button;

    iget-object v2, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda23;->f$2:Landroid/app/Activity;

    iget-object v3, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda23;->f$3:Ljava/lang/String;

    iget-object v4, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda23;->f$4:Ljava/lang/String;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Le/e/a/GestureControls110;->lambda$7(Landroid/content/Context;Landroid/widget/Button;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
