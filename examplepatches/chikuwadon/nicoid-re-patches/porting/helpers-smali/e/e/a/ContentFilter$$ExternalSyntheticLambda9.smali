.class public final synthetic Le/e/a/ContentFilter$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:[Z

.field public final synthetic f$1:Ljava/util/Set;

.field public final synthetic f$2:I

.field public final synthetic f$3:[Ljava/lang/Runnable;

.field public final synthetic f$4:Landroid/preference/PreferenceActivity;

.field public final synthetic f$5:Lorg/json/JSONArray;

.field public final synthetic f$6:[I


# direct methods
.method public synthetic constructor <init>([ZLjava/util/Set;I[Ljava/lang/Runnable;Landroid/preference/PreferenceActivity;Lorg/json/JSONArray;[I)V
    .registers 8

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda9;->f$0:[Z

    iput-object p2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda9;->f$1:Ljava/util/Set;

    iput p3, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda9;->f$2:I

    iput-object p4, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda9;->f$3:[Ljava/lang/Runnable;

    iput-object p5, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda9;->f$4:Landroid/preference/PreferenceActivity;

    iput-object p6, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda9;->f$5:Lorg/json/JSONArray;

    iput-object p7, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda9;->f$6:[I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 10

    .line 0
    iget-object v0, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda9;->f$0:[Z

    iget-object v1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda9;->f$1:Ljava/util/Set;

    iget v2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda9;->f$2:I

    iget-object v3, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda9;->f$3:[Ljava/lang/Runnable;

    iget-object v4, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda9;->f$4:Landroid/preference/PreferenceActivity;

    iget-object v5, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda9;->f$5:Lorg/json/JSONArray;

    iget-object v6, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda9;->f$6:[I

    move-object v7, p1

    invoke-static/range {v0 .. v7}, Le/e/a/ContentFilter;->lambda$2([ZLjava/util/Set;I[Ljava/lang/Runnable;Landroid/preference/PreferenceActivity;Lorg/json/JSONArray;[ILandroid/view/View;)V

    return-void
.end method
