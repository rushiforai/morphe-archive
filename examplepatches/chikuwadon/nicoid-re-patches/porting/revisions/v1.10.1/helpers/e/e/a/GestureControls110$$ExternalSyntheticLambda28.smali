.class public final synthetic Le/e/a/GestureControls110$$ExternalSyntheticLambda28;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Le/e/a/GestureControls110$State;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Le/e/a/GestureControls110$State;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda28;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda28;->f$1:Le/e/a/GestureControls110$State;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda28;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda28;->f$1:Le/e/a/GestureControls110$State;

    invoke-static {v0, v1}, Le/e/a/GestureControls110;->lambda$19(Landroid/app/Activity;Le/e/a/GestureControls110$State;)V

    return-void
.end method
