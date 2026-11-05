.class public final synthetic Le/e/a/GestureControls110$$ExternalSyntheticLambda22;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda22;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda22;->f$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda22;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda22;->f$1:Ljava/lang/String;

    invoke-static {v0, v1, p1, p2}, Le/e/a/GestureControls110;->lambda$6(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/CompoundButton;Z)V

    return-void
.end method
