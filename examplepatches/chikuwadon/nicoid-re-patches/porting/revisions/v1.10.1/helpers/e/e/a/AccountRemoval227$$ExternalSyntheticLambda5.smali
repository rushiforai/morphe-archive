.class public final synthetic Le/e/a/AccountRemoval227$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/util/ArrayList;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Ljava/lang/Object;

.field public final synthetic f$4:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/Object;Landroid/app/Activity;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/AccountRemoval227$$ExternalSyntheticLambda5;->f$0:Ljava/util/ArrayList;

    iput-boolean p2, p0, Le/e/a/AccountRemoval227$$ExternalSyntheticLambda5;->f$1:Z

    iput-object p3, p0, Le/e/a/AccountRemoval227$$ExternalSyntheticLambda5;->f$2:Ljava/lang/String;

    iput-object p4, p0, Le/e/a/AccountRemoval227$$ExternalSyntheticLambda5;->f$3:Ljava/lang/Object;

    iput-object p5, p0, Le/e/a/AccountRemoval227$$ExternalSyntheticLambda5;->f$4:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/AccountRemoval227$$ExternalSyntheticLambda5;->f$0:Ljava/util/ArrayList;

    iget-boolean v1, p0, Le/e/a/AccountRemoval227$$ExternalSyntheticLambda5;->f$1:Z

    iget-object v2, p0, Le/e/a/AccountRemoval227$$ExternalSyntheticLambda5;->f$2:Ljava/lang/String;

    iget-object v3, p0, Le/e/a/AccountRemoval227$$ExternalSyntheticLambda5;->f$3:Ljava/lang/Object;

    iget-object v4, p0, Le/e/a/AccountRemoval227$$ExternalSyntheticLambda5;->f$4:Landroid/app/Activity;

    invoke-static {v0, v1, v2, v3, v4}, Le/e/a/AccountRemoval227;->lambda$0(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/Object;Landroid/app/Activity;)V

    return-void
.end method
