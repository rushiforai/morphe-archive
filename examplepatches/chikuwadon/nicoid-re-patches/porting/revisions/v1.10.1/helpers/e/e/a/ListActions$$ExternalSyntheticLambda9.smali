.class public final synthetic Le/e/a/ListActions$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ListActions$$ExternalSyntheticLambda9;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/ListActions$$ExternalSyntheticLambda9;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/ListActions$$ExternalSyntheticLambda9;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/ListActions$$ExternalSyntheticLambda9;->f$1:Ljava/lang/Object;

    invoke-static {v0, v1}, Le/e/a/ListActions;->lambda$8(Landroid/app/Activity;Ljava/lang/Object;)V

    return-void
.end method
