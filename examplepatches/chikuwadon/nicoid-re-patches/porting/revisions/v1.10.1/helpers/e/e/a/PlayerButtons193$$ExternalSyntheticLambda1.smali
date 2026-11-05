.class public final synthetic Le/e/a/PlayerButtons193$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/widget/LinearLayout;

.field public final synthetic f$1:Ljava/util/List;

.field public final synthetic f$2:Landroid/content/Context;

.field public final synthetic f$3:Ljava/util/Set;

.field public final synthetic f$4:[Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/LinearLayout;Ljava/util/List;Landroid/content/Context;Ljava/util/Set;[Ljava/lang/Runnable;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda1;->f$0:Landroid/widget/LinearLayout;

    iput-object p2, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda1;->f$1:Ljava/util/List;

    iput-object p3, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda1;->f$2:Landroid/content/Context;

    iput-object p4, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda1;->f$3:Ljava/util/Set;

    iput-object p5, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda1;->f$4:[Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda1;->f$0:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda1;->f$1:Ljava/util/List;

    iget-object v2, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda1;->f$2:Landroid/content/Context;

    iget-object v3, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda1;->f$3:Ljava/util/Set;

    iget-object v4, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda1;->f$4:[Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, v3, v4}, Le/e/a/PlayerButtons193;->lambda$0(Landroid/widget/LinearLayout;Ljava/util/List;Landroid/content/Context;Ljava/util/Set;[Ljava/lang/Runnable;)V

    return-void
.end method
