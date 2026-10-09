.class public final synthetic Le/e/a/ContentFilter$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic f$0:Landroid/preference/PreferenceActivity;

.field public final synthetic f$1:Lorg/json/JSONArray;

.field public final synthetic f$2:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/preference/PreferenceActivity;Lorg/json/JSONArray;Landroid/content/Context;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda6;->f$0:Landroid/preference/PreferenceActivity;

    iput-object p2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda6;->f$1:Lorg/json/JSONArray;

    iput-object p3, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda6;->f$2:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda6;->f$0:Landroid/preference/PreferenceActivity;

    iget-object v1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda6;->f$1:Lorg/json/JSONArray;

    iget-object v2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda6;->f$2:Landroid/content/Context;

    invoke-static {v0, v1, v2, p1}, Le/e/a/ContentFilter;->lambda$11(Landroid/preference/PreferenceActivity;Lorg/json/JSONArray;Landroid/content/Context;Landroid/content/DialogInterface;)V

    return-void
.end method
