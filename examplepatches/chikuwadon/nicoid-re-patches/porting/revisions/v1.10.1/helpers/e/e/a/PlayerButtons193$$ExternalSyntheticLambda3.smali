.class public final synthetic Le/e/a/PlayerButtons193$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/content/SharedPreferences;

.field public final synthetic f$1:Ljava/util/List;

.field public final synthetic f$2:Ljava/util/Set;

.field public final synthetic f$3:Landroid/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Landroid/content/SharedPreferences;Ljava/util/List;Ljava/util/Set;Landroid/app/Dialog;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda3;->f$0:Landroid/content/SharedPreferences;

    iput-object p2, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda3;->f$1:Ljava/util/List;

    iput-object p3, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda3;->f$2:Ljava/util/Set;

    iput-object p4, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda3;->f$3:Landroid/app/Dialog;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda3;->f$0:Landroid/content/SharedPreferences;

    iget-object v1, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda3;->f$1:Ljava/util/List;

    iget-object v2, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda3;->f$2:Ljava/util/Set;

    iget-object v3, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda3;->f$3:Landroid/app/Dialog;

    invoke-static {v0, v1, v2, v3}, Le/e/a/PlayerButtons193;->lambda$6(Landroid/content/SharedPreferences;Ljava/util/List;Ljava/util/Set;Landroid/app/Dialog;)V

    return-void
.end method
