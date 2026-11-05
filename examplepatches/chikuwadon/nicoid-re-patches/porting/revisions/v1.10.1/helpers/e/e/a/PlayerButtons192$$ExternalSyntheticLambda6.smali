.class public final synthetic Le/e/a/PlayerButtons192$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Ljava/util/List;

.field public final synthetic f$1:Ljava/util/Set;

.field public final synthetic f$2:Landroid/content/SharedPreferences;

.field public final synthetic f$3:[Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ljava/util/Set;Landroid/content/SharedPreferences;[Ljava/lang/Runnable;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda6;->f$0:Ljava/util/List;

    iput-object p2, p0, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda6;->f$1:Ljava/util/Set;

    iput-object p3, p0, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda6;->f$2:Landroid/content/SharedPreferences;

    iput-object p4, p0, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda6;->f$3:[Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda6;->f$0:Ljava/util/List;

    iget-object v1, p0, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda6;->f$1:Ljava/util/Set;

    iget-object v2, p0, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda6;->f$2:Landroid/content/SharedPreferences;

    iget-object v3, p0, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda6;->f$3:[Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, v3, p1}, Le/e/a/PlayerButtons192;->lambda$5(Ljava/util/List;Ljava/util/Set;Landroid/content/SharedPreferences;[Ljava/lang/Runnable;Landroid/view/View;)V

    return-void
.end method
