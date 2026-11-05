.class public final synthetic Le/e/a/GestureControls110$$ExternalSyntheticLambda30;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic f$0:Le/e/a/GestureControls110$Trace;

.field public final synthetic f$1:Landroid/widget/TextView;

.field public final synthetic f$2:Landroid/content/Context;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Landroid/app/Activity;

.field public final synthetic f$5:Ljava/lang/String;

.field public final synthetic f$6:[Ljava/lang/String;

.field public final synthetic f$7:Landroid/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Le/e/a/GestureControls110$Trace;Landroid/widget/TextView;Landroid/content/Context;Ljava/lang/String;Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;Landroid/app/AlertDialog;)V
    .registers 9

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda30;->f$0:Le/e/a/GestureControls110$Trace;

    iput-object p2, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda30;->f$1:Landroid/widget/TextView;

    iput-object p3, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda30;->f$2:Landroid/content/Context;

    iput-object p4, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda30;->f$3:Ljava/lang/String;

    iput-object p5, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda30;->f$4:Landroid/app/Activity;

    iput-object p6, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda30;->f$5:Ljava/lang/String;

    iput-object p7, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda30;->f$6:[Ljava/lang/String;

    iput-object p8, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda30;->f$7:Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 13

    .line 0
    iget-object v0, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda30;->f$0:Le/e/a/GestureControls110$Trace;

    iget-object v1, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda30;->f$1:Landroid/widget/TextView;

    iget-object v2, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda30;->f$2:Landroid/content/Context;

    iget-object v3, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda30;->f$3:Ljava/lang/String;

    iget-object v4, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda30;->f$4:Landroid/app/Activity;

    iget-object v5, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda30;->f$5:Ljava/lang/String;

    iget-object v6, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda30;->f$6:[Ljava/lang/String;

    iget-object v7, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda30;->f$7:Landroid/app/AlertDialog;

    move-object v8, p1

    move-object v9, p2

    invoke-static/range {v0 .. v9}, Le/e/a/GestureControls110;->lambda$18(Le/e/a/GestureControls110$Trace;Landroid/widget/TextView;Landroid/content/Context;Ljava/lang/String;Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;Landroid/app/AlertDialog;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method
