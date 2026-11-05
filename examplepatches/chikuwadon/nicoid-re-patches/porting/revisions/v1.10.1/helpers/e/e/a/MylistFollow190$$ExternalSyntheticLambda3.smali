.class public final synthetic Le/e/a/MylistFollow190$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/Button;

.field public final synthetic f$1:[Le/e/a/NetworkTask;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Z

.field public final synthetic f$4:Landroid/app/Activity;

.field public final synthetic f$5:Landroid/app/AlertDialog;

.field public final synthetic f$6:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/Button;[Le/e/a/NetworkTask;Ljava/lang/String;ZLandroid/app/Activity;Landroid/app/AlertDialog;Landroid/widget/TextView;)V
    .registers 8

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda3;->f$0:Landroid/widget/Button;

    iput-object p2, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda3;->f$1:[Le/e/a/NetworkTask;

    iput-object p3, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda3;->f$2:Ljava/lang/String;

    iput-boolean p4, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda3;->f$3:Z

    iput-object p5, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda3;->f$4:Landroid/app/Activity;

    iput-object p6, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda3;->f$5:Landroid/app/AlertDialog;

    iput-object p7, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda3;->f$6:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 10

    .line 0
    iget-object v0, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda3;->f$0:Landroid/widget/Button;

    iget-object v1, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda3;->f$1:[Le/e/a/NetworkTask;

    iget-object v2, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda3;->f$2:Ljava/lang/String;

    iget-boolean v3, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda3;->f$3:Z

    iget-object v4, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda3;->f$4:Landroid/app/Activity;

    iget-object v5, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda3;->f$5:Landroid/app/AlertDialog;

    iget-object v6, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda3;->f$6:Landroid/widget/TextView;

    move-object v7, p1

    invoke-static/range {v0 .. v7}, Le/e/a/MylistFollow190;->lambda$5(Landroid/widget/Button;[Le/e/a/NetworkTask;Ljava/lang/String;ZLandroid/app/Activity;Landroid/app/AlertDialog;Landroid/widget/TextView;Landroid/view/View;)V

    return-void
.end method
