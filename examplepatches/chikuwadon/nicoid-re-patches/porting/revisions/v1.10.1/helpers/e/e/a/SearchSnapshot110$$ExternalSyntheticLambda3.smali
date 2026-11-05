.class public final synthetic Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/content/SharedPreferences;

.field public final synthetic f$1:Landroid/content/Context;

.field public final synthetic f$2:Landroid/widget/Button;


# direct methods
.method public synthetic constructor <init>(Landroid/content/SharedPreferences;Landroid/content/Context;Landroid/widget/Button;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda3;->f$0:Landroid/content/SharedPreferences;

    iput-object p2, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda3;->f$1:Landroid/content/Context;

    iput-object p3, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda3;->f$2:Landroid/widget/Button;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda3;->f$0:Landroid/content/SharedPreferences;

    iget-object v1, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda3;->f$1:Landroid/content/Context;

    iget-object v2, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda3;->f$2:Landroid/widget/Button;

    invoke-static {v0, v1, v2}, Le/e/a/SearchSnapshot110;->lambda$2(Landroid/content/SharedPreferences;Landroid/content/Context;Landroid/widget/Button;)V

    return-void
.end method
