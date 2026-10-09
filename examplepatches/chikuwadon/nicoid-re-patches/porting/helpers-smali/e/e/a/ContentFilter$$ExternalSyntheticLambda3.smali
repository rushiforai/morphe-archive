.class public final synthetic Le/e/a/ContentFilter$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/preference/PreferenceActivity;

.field public final synthetic f$1:Lorg/json/JSONArray;

.field public final synthetic f$2:[I

.field public final synthetic f$3:[Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Landroid/preference/PreferenceActivity;Lorg/json/JSONArray;[I[Ljava/lang/Runnable;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda3;->f$0:Landroid/preference/PreferenceActivity;

    iput-object p2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda3;->f$1:Lorg/json/JSONArray;

    iput-object p3, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda3;->f$2:[I

    iput-object p4, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda3;->f$3:[Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda3;->f$0:Landroid/preference/PreferenceActivity;

    iget-object v1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda3;->f$1:Lorg/json/JSONArray;

    iget-object v2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda3;->f$2:[I

    iget-object v3, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda3;->f$3:[Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, v3, p1}, Le/e/a/ContentFilter;->lambda$7(Landroid/preference/PreferenceActivity;Lorg/json/JSONArray;[I[Ljava/lang/Runnable;Landroid/view/View;)V

    return-void
.end method
