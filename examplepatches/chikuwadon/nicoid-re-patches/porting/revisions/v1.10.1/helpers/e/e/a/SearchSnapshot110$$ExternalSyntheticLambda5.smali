.class public final synthetic Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:Landroid/content/SharedPreferences;

.field public final synthetic f$2:Ljava/lang/Runnable;

.field public final synthetic f$3:[I


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Landroid/content/SharedPreferences;Ljava/lang/Runnable;[I)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda5;->f$0:Landroid/content/Context;

    iput-object p2, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda5;->f$1:Landroid/content/SharedPreferences;

    iput-object p3, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda5;->f$2:Ljava/lang/Runnable;

    iput-object p4, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda5;->f$3:[I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda5;->f$0:Landroid/content/Context;

    iget-object v1, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda5;->f$1:Landroid/content/SharedPreferences;

    iget-object v2, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda5;->f$2:Ljava/lang/Runnable;

    iget-object v3, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda5;->f$3:[I

    invoke-static {v0, v1, v2, v3, p1}, Le/e/a/SearchSnapshot110;->lambda$4(Landroid/content/Context;Landroid/content/SharedPreferences;Ljava/lang/Runnable;[ILandroid/view/View;)V

    return-void
.end method
