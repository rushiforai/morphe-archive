.class final Le/e/a/SettingsTools$Node;
.super Ljava/lang/Object;
.source "SettingsTools.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/SettingsTools;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Node"
.end annotation


# instance fields
.field final fold:Le/e/a/SettingsFold119;


# direct methods
.method constructor <init>(Landroid/preference/PreferenceGroup;)V
    .registers 3

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Le/e/a/SettingsFold119;

    invoke-direct {v0, p1}, Le/e/a/SettingsFold119;-><init>(Landroid/preference/PreferenceGroup;)V

    iput-object v0, p0, Le/e/a/SettingsTools$Node;->fold:Le/e/a/SettingsFold119;

    return-void
.end method


# virtual methods
.method restore(Ljava/lang/String;Z)Z
    .registers 3

    .line 16
    iget-object p2, p0, Le/e/a/SettingsTools$Node;->fold:Le/e/a/SettingsFold119;

    invoke-virtual {p2, p1}, Le/e/a/SettingsFold119;->search(Ljava/lang/String;)V

    iget-object p1, p0, Le/e/a/SettingsTools$Node;->fold:Le/e/a/SettingsFold119;

    invoke-virtual {p1}, Le/e/a/SettingsFold119;->getCount()I

    move-result p1

    if-lez p1, :cond_f

    const/4 p1, 0x1

    return p1

    :cond_f
    const/4 p1, 0x0

    return p1
.end method
