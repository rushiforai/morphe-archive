.class public final synthetic Le/e/a/ContentFilter$$ExternalSyntheticLambda10;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic f$0:[Z

.field public final synthetic f$1:Ljava/util/Set;

.field public final synthetic f$2:I

.field public final synthetic f$3:[Ljava/lang/Runnable;

.field public final synthetic f$4:Landroid/content/Context;

.field public final synthetic f$5:Lorg/json/JSONObject;

.field public final synthetic f$6:Lorg/json/JSONArray;

.field public final synthetic f$7:Landroid/preference/PreferenceActivity;


# direct methods
.method public synthetic constructor <init>([ZLjava/util/Set;I[Ljava/lang/Runnable;Landroid/content/Context;Lorg/json/JSONObject;Lorg/json/JSONArray;Landroid/preference/PreferenceActivity;)V
    .registers 9

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda10;->f$0:[Z

    iput-object p2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda10;->f$1:Ljava/util/Set;

    iput p3, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda10;->f$2:I

    iput-object p4, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda10;->f$3:[Ljava/lang/Runnable;

    iput-object p5, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda10;->f$4:Landroid/content/Context;

    iput-object p6, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda10;->f$5:Lorg/json/JSONObject;

    iput-object p7, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda10;->f$6:Lorg/json/JSONArray;

    iput-object p8, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda10;->f$7:Landroid/preference/PreferenceActivity;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .registers 11

    .line 0
    iget-object v0, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda10;->f$0:[Z

    iget-object v1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda10;->f$1:Ljava/util/Set;

    iget v2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda10;->f$2:I

    iget-object v3, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda10;->f$3:[Ljava/lang/Runnable;

    iget-object v4, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda10;->f$4:Landroid/content/Context;

    iget-object v5, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda10;->f$5:Lorg/json/JSONObject;

    iget-object v6, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda10;->f$6:Lorg/json/JSONArray;

    iget-object v7, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda10;->f$7:Landroid/preference/PreferenceActivity;

    move-object v8, p1

    invoke-static/range {v0 .. v8}, Le/e/a/ContentFilter;->lambda$3([ZLjava/util/Set;I[Ljava/lang/Runnable;Landroid/content/Context;Lorg/json/JSONObject;Lorg/json/JSONArray;Landroid/preference/PreferenceActivity;Landroid/view/View;)Z

    move-result p1

    return p1
.end method
