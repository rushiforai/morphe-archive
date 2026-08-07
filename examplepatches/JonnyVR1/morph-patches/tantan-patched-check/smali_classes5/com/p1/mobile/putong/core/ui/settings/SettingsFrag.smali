.class public Lcom/p1/mobile/putong/core/ui/settings/SettingsFrag;
.super Lcom/p1/mobile/putong/app/PutongMvpFrag;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public M4()Ll/ar2;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/settings/a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/settings/a;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public N4()Ll/iam;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/settings/b;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/a;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->b3()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public onHiddenChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_settings_view"

    .line 2
    .line 3
    return-object p0
.end method
