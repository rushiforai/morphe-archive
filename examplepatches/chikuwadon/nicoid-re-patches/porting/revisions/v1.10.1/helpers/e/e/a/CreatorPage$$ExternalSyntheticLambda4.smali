.class public final synthetic Le/e/a/CreatorPage$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/CheckBox;

.field public final synthetic f$1:Landroid/content/SharedPreferences;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Landroid/widget/CheckBox;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/CheckBox;Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/widget/CheckBox;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda4;->f$0:Landroid/widget/CheckBox;

    iput-object p2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda4;->f$1:Landroid/content/SharedPreferences;

    iput-object p3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda4;->f$2:Ljava/lang/String;

    iput-object p4, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda4;->f$3:Landroid/widget/CheckBox;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 9

    .line 0
    iget-object v0, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda4;->f$0:Landroid/widget/CheckBox;

    iget-object v1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda4;->f$1:Landroid/content/SharedPreferences;

    iget-object v2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda4;->f$2:Ljava/lang/String;

    iget-object v3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda4;->f$3:Landroid/widget/CheckBox;

    move-object v4, p1

    move v5, p2

    invoke-static/range {v0 .. v5}, Le/e/a/CreatorPage;->lambda$15(Landroid/widget/CheckBox;Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/widget/CheckBox;Landroid/widget/CompoundButton;Z)V

    return-void
.end method
