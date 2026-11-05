.class Le/e/a/SettingsFold119$1;
.super Landroid/database/DataSetObserver;
.source "SettingsFold119.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/SettingsFold119;-><init>(Landroid/preference/PreferenceGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Le/e/a/SettingsFold119;


# direct methods
.method constructor <init>(Le/e/a/SettingsFold119;)V
    .registers 2

    .line 6
    iput-object p1, p0, Le/e/a/SettingsFold119$1;->this$0:Le/e/a/SettingsFold119;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 2

    .line 6
    iget-object v0, p0, Le/e/a/SettingsFold119$1;->this$0:Le/e/a/SettingsFold119;

    invoke-virtual {v0}, Le/e/a/SettingsFold119;->rebuild()V

    return-void
.end method

.method public onInvalidated()V
    .registers 2

    .line 6
    iget-object v0, p0, Le/e/a/SettingsFold119$1;->this$0:Le/e/a/SettingsFold119;

    invoke-virtual {v0}, Le/e/a/SettingsFold119;->rebuild()V

    return-void
.end method
