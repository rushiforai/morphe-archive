.class public final synthetic Le/e/a/AccountPage$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Le/e/a/NetworkTask;

.field public final synthetic f$2:Landroid/app/Activity;

.field public final synthetic f$3:Landroid/widget/LinearLayout;

.field public final synthetic f$4:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/TextView;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/AccountPage$$ExternalSyntheticLambda2;->f$0:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/AccountPage$$ExternalSyntheticLambda2;->f$1:Le/e/a/NetworkTask;

    iput-object p3, p0, Le/e/a/AccountPage$$ExternalSyntheticLambda2;->f$2:Landroid/app/Activity;

    iput-object p4, p0, Le/e/a/AccountPage$$ExternalSyntheticLambda2;->f$3:Landroid/widget/LinearLayout;

    iput-object p5, p0, Le/e/a/AccountPage$$ExternalSyntheticLambda2;->f$4:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/AccountPage$$ExternalSyntheticLambda2;->f$0:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/AccountPage$$ExternalSyntheticLambda2;->f$1:Le/e/a/NetworkTask;

    iget-object v2, p0, Le/e/a/AccountPage$$ExternalSyntheticLambda2;->f$2:Landroid/app/Activity;

    iget-object v3, p0, Le/e/a/AccountPage$$ExternalSyntheticLambda2;->f$3:Landroid/widget/LinearLayout;

    iget-object v4, p0, Le/e/a/AccountPage$$ExternalSyntheticLambda2;->f$4:Landroid/widget/TextView;

    invoke-static {v0, v1, v2, v3, v4}, Le/e/a/AccountPage;->lambda$1(Ljava/lang/String;Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/TextView;)V

    return-void
.end method
