.class public final synthetic Le/e/a/Review181$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/preference/PreferenceActivity;


# direct methods
.method public synthetic constructor <init>(Landroid/preference/PreferenceActivity;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Review181$$ExternalSyntheticLambda4;->f$0:Landroid/preference/PreferenceActivity;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/Review181$$ExternalSyntheticLambda4;->f$0:Landroid/preference/PreferenceActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->recreate()V

    return-void
.end method
