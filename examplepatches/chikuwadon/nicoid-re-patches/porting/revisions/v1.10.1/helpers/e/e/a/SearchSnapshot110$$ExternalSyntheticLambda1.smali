.class public final synthetic Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/content/SharedPreferences;

.field public final synthetic f$1:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/Runnable;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda1;->f$0:Landroid/content/SharedPreferences;

    iput-object p2, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda1;->f$0:Landroid/content/SharedPreferences;

    iget-object v1, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Runnable;

    invoke-static {v0, v1, p1, p2}, Le/e/a/SearchSnapshot110;->lambda$5(Landroid/content/SharedPreferences;Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V

    return-void
.end method
