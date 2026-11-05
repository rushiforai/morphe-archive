.class public final synthetic Le/e/a/MylistFollow190$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Le/e/a/NetworkTask;

.field public final synthetic f$3:Landroid/app/Activity;

.field public final synthetic f$4:Landroid/app/AlertDialog;

.field public final synthetic f$5:Landroid/widget/Button;

.field public final synthetic f$6:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;ZLe/e/a/NetworkTask;Landroid/app/Activity;Landroid/app/AlertDialog;Landroid/widget/Button;Landroid/widget/TextView;)V
    .registers 8

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda7;->f$0:Ljava/lang/String;

    iput-boolean p2, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda7;->f$1:Z

    iput-object p3, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda7;->f$2:Le/e/a/NetworkTask;

    iput-object p4, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda7;->f$3:Landroid/app/Activity;

    iput-object p5, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda7;->f$4:Landroid/app/AlertDialog;

    iput-object p6, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda7;->f$5:Landroid/widget/Button;

    iput-object p7, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda7;->f$6:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    .line 0
    iget-object v0, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda7;->f$0:Ljava/lang/String;

    iget-boolean v1, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda7;->f$1:Z

    iget-object v2, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda7;->f$2:Le/e/a/NetworkTask;

    iget-object v3, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda7;->f$3:Landroid/app/Activity;

    iget-object v4, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda7;->f$4:Landroid/app/AlertDialog;

    iget-object v5, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda7;->f$5:Landroid/widget/Button;

    iget-object v6, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda7;->f$6:Landroid/widget/TextView;

    invoke-static/range {v0 .. v6}, Le/e/a/MylistFollow190;->lambda$6(Ljava/lang/String;ZLe/e/a/NetworkTask;Landroid/app/Activity;Landroid/app/AlertDialog;Landroid/widget/Button;Landroid/widget/TextView;)V

    return-void
.end method
