.class public final synthetic Le/e/a/GestureControls110$$ExternalSyntheticLambda19;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda19;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda19;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda19;->f$2:Ljava/lang/String;

    iput-object p4, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda19;->f$3:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 9

    .line 0
    iget-object v0, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda19;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda19;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda19;->f$2:Ljava/lang/String;

    iget-object v3, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda19;->f$3:Landroid/content/Context;

    move-object v4, p1

    move v5, p2

    invoke-static/range {v0 .. v5}, Le/e/a/GestureControls110;->lambda$16(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/content/DialogInterface;I)V

    return-void
.end method
