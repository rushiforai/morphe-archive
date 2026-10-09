.class public final synthetic Le/e/a/ContentFilter$$ExternalSyntheticLambda11;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/json/JSONArray;

.field public final synthetic f$1:I

.field public final synthetic f$2:Landroid/preference/PreferenceActivity;

.field public final synthetic f$3:[Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONArray;ILandroid/preference/PreferenceActivity;[Ljava/lang/Runnable;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda11;->f$0:Lorg/json/JSONArray;

    iput p2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda11;->f$1:I

    iput-object p3, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda11;->f$2:Landroid/preference/PreferenceActivity;

    iput-object p4, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda11;->f$3:[Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 9

    .line 0
    iget-object v0, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda11;->f$0:Lorg/json/JSONArray;

    iget v1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda11;->f$1:I

    iget-object v2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda11;->f$2:Landroid/preference/PreferenceActivity;

    iget-object v3, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda11;->f$3:[Ljava/lang/Runnable;

    move-object v4, p1

    move v5, p2

    invoke-static/range {v0 .. v5}, Le/e/a/ContentFilter;->lambda$4(Lorg/json/JSONArray;ILandroid/preference/PreferenceActivity;[Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V

    return-void
.end method
