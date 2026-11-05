.class public final synthetic Le/e/a/GestureControls110$$ExternalSyntheticLambda33;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/widget/TextView;

.field public final synthetic f$1:Landroid/content/Context;

.field public final synthetic f$2:Landroid/widget/SeekBar;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;Landroid/content/Context;Landroid/widget/SeekBar;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda33;->f$0:Landroid/widget/TextView;

    iput-object p2, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda33;->f$1:Landroid/content/Context;

    iput-object p3, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda33;->f$2:Landroid/widget/SeekBar;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda33;->f$0:Landroid/widget/TextView;

    iget-object v1, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda33;->f$1:Landroid/content/Context;

    iget-object v2, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda33;->f$2:Landroid/widget/SeekBar;

    invoke-static {v0, v1, v2}, Le/e/a/GestureControls110;->lambda$4(Landroid/widget/TextView;Landroid/content/Context;Landroid/widget/SeekBar;)V

    return-void
.end method
