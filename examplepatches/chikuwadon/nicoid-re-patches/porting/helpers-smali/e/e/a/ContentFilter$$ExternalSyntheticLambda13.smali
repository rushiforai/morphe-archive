.class public final synthetic Le/e/a/ContentFilter$$ExternalSyntheticLambda13;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Ljava/util/Set;

.field public final synthetic f$1:Lorg/json/JSONArray;

.field public final synthetic f$2:Landroid/preference/PreferenceActivity;

.field public final synthetic f$3:[Z

.field public final synthetic f$4:[Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Set;Lorg/json/JSONArray;Landroid/preference/PreferenceActivity;[Z[Ljava/lang/Runnable;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda13;->f$0:Ljava/util/Set;

    iput-object p2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda13;->f$1:Lorg/json/JSONArray;

    iput-object p3, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda13;->f$2:Landroid/preference/PreferenceActivity;

    iput-object p4, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda13;->f$3:[Z

    iput-object p5, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda13;->f$4:[Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 10

    .line 0
    iget-object v0, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda13;->f$0:Ljava/util/Set;

    iget-object v1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda13;->f$1:Lorg/json/JSONArray;

    iget-object v2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda13;->f$2:Landroid/preference/PreferenceActivity;

    iget-object v3, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda13;->f$3:[Z

    iget-object v4, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda13;->f$4:[Ljava/lang/Runnable;

    move-object v5, p1

    move v6, p2

    invoke-static/range {v0 .. v6}, Le/e/a/ContentFilter;->lambda$10(Ljava/util/Set;Lorg/json/JSONArray;Landroid/preference/PreferenceActivity;[Z[Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V

    return-void
.end method
