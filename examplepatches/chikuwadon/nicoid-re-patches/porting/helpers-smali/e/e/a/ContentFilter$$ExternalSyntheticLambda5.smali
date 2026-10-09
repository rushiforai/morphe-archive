.class public final synthetic Le/e/a/ContentFilter$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:Ljava/util/Set;

.field public final synthetic f$2:Lorg/json/JSONArray;

.field public final synthetic f$3:Landroid/preference/PreferenceActivity;

.field public final synthetic f$4:[Z

.field public final synthetic f$5:[Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ljava/util/Set;Lorg/json/JSONArray;Landroid/preference/PreferenceActivity;[Z[Ljava/lang/Runnable;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda5;->f$0:Landroid/content/Context;

    iput-object p2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda5;->f$1:Ljava/util/Set;

    iput-object p3, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda5;->f$2:Lorg/json/JSONArray;

    iput-object p4, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda5;->f$3:Landroid/preference/PreferenceActivity;

    iput-object p5, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda5;->f$4:[Z

    iput-object p6, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda5;->f$5:[Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 9

    .line 0
    iget-object v0, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda5;->f$0:Landroid/content/Context;

    iget-object v1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda5;->f$1:Ljava/util/Set;

    iget-object v2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda5;->f$2:Lorg/json/JSONArray;

    iget-object v3, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda5;->f$3:Landroid/preference/PreferenceActivity;

    iget-object v4, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda5;->f$4:[Z

    iget-object v5, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda5;->f$5:[Ljava/lang/Runnable;

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Le/e/a/ContentFilter;->lambda$9(Landroid/content/Context;Ljava/util/Set;Lorg/json/JSONArray;Landroid/preference/PreferenceActivity;[Z[Ljava/lang/Runnable;Landroid/view/View;)V

    return-void
.end method
