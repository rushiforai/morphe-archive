.class public Lcom/sauzask/nicoid/NicoidUserVideoListActivity;
.super Lcom/sauzask/nicoid/NicoidActivity;
.source ""


# instance fields
.field public A:Landroid/widget/RelativeLayout;

.field public B:Ljava/lang/String;

.field public C:Lcom/sauzask/nicoid/NicoidUserVideoListFragment;

.field public D:Lcom/google/android/gms/ads/AdView;

.field public y:Landroidx/appcompat/app/ActionBar;

.field public z:Landroid/widget/LinearLayout;


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 4

    const/4 p1, 0x0

    invoke-static {p0}, Le/e/a/FeedbackFixes;->prepareTheme(Landroid/app/Activity;)V

    invoke-super {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {}, Le/e/a/v0;->a()I

    const p1, 0x7f1000a2

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    invoke-static {p0}, Le/e/a/DynamicTheme;->apply(Landroid/app/Activity;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v0, "main_rotation"

    const-string v1, "1"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/v0;->a(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setRequestedOrientation(I)V

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setVolumeControlStream(I)V

    const v0, 0x7f0b0036

    invoke-virtual {p0, v0}, Lcom/sauzask/nicoid/NicoidActivity;->setContentView(I)V

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidUserVideoListActivity;->B:Ljava/lang/String;

    const v0, 0x7f080040

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-static {p0, v0, p1}, Le/e/a/v0;->a(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/content/SharedPreferences;)Lcom/google/android/gms/ads/AdView;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListActivity;->D:Lcom/google/android/gms/ads/AdView;

    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->n()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    invoke-static {p1}, Le/e/a/v0;->a(Landroidx/appcompat/app/ActionBar;)Landroidx/appcompat/app/ActionBar;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListActivity;->y:Landroidx/appcompat/app/ActionBar;

    const p1, 0x7f0801d2

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListActivity;->z:Landroid/widget/LinearLayout;

    const p1, 0x7f0801d6

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListActivity;->A:Landroid/widget/RelativeLayout;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListActivity;->A:Landroid/widget/RelativeLayout;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListActivity;->z:Landroid/widget/LinearLayout;

    new-instance v0, Lcom/sauzask/nicoid/NicoidUserVideoListActivity$a;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidUserVideoListActivity$a;-><init>(Lcom/sauzask/nicoid/NicoidUserVideoListActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
