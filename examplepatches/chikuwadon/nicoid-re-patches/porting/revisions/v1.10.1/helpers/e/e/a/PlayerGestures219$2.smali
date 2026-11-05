.class Le/e/a/PlayerGestures219$2;
.super Ljava/lang/Object;
.source "PlayerGestures219.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/PlayerGestures219;->settings(Landroid/preference/PreferenceActivity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$a:Landroid/preference/PreferenceActivity;


# direct methods
.method constructor <init>(Landroid/preference/PreferenceActivity;)V
    .registers 2

    .line 77
    iput-object p1, p0, Le/e/a/PlayerGestures219$2;->val$a:Landroid/preference/PreferenceActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 2

    .line 77
    iget-object p1, p0, Le/e/a/PlayerGestures219$2;->val$a:Landroid/preference/PreferenceActivity;

    invoke-static {p1}, Le/e/a/PlayerGestures219;->swipeOptions(Landroid/preference/PreferenceActivity;)V

    const/4 p1, 0x1

    return p1
.end method
