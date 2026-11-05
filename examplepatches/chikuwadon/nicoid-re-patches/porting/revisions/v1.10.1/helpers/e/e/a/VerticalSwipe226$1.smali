.class Le/e/a/VerticalSwipe226$1;
.super Ljava/lang/Object;
.source "VerticalSwipe226.java"

# interfaces
.implements Landroid/content/DialogInterface$OnMultiChoiceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/VerticalSwipe226;->show(Landroid/preference/PreferenceActivity;)Landroid/app/AlertDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$checked:[Z

.field private final synthetic val$prefs:Landroid/content/SharedPreferences;


# direct methods
.method constructor <init>([ZLandroid/content/SharedPreferences;)V
    .registers 3

    .line 17
    iput-object p1, p0, Le/e/a/VerticalSwipe226$1;->val$checked:[Z

    iput-object p2, p0, Le/e/a/VerticalSwipe226$1;->val$prefs:Landroid/content/SharedPreferences;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;IZ)V
    .registers 7

    .line 18
    iget-object v0, p0, Le/e/a/VerticalSwipe226$1;->val$checked:[Z

    aput-boolean p3, v0, p2

    iget-object v0, p0, Le/e/a/VerticalSwipe226$1;->val$prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget-object v1, Le/e/a/VerticalSwipe226;->KEYS:[Ljava/lang/String;

    aget-object v1, v1, p2

    invoke-interface {v0, v1, p3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz p3, :cond_31

    if-eqz p2, :cond_1a

    const/4 p3, 0x1

    if-ne p2, p3, :cond_31

    :cond_1a
    rsub-int/lit8 p3, p2, 0x1

    .line 19
    iget-object v2, p0, Le/e/a/VerticalSwipe226$1;->val$checked:[Z

    aput-boolean v1, v2, p3

    sget-object v2, Le/e/a/VerticalSwipe226;->KEYS:[Ljava/lang/String;

    aget-object p3, v2, p3

    invoke-interface {v0, p3, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    sget-object v2, Le/e/a/VerticalSwipe226;->KEYS:[Ljava/lang/String;

    aget-object p2, v2, p2

    const-string v2, "gesture_swipe_down_last"

    invoke-interface {p3, v2, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 20
    :cond_31
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 21
    instance-of p2, p1, Landroid/app/AlertDialog;

    if-eqz p2, :cond_5d

    check-cast p1, Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object p1

    :goto_3e
    iget-object p2, p0, Le/e/a/VerticalSwipe226$1;->val$checked:[Z

    array-length p3, p2

    if-lt v1, p3, :cond_55

    invoke-virtual {p1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p2

    instance-of p2, p2, Landroid/widget/BaseAdapter;

    if-eqz p2, :cond_5d

    invoke-virtual {p1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    check-cast p1, Landroid/widget/BaseAdapter;

    invoke-virtual {p1}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    goto :goto_5d

    :cond_55
    aget-boolean p2, p2, v1

    invoke-virtual {p1, v1, p2}, Landroid/widget/ListView;->setItemChecked(IZ)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_3e

    :cond_5d
    :goto_5d
    return-void
.end method
