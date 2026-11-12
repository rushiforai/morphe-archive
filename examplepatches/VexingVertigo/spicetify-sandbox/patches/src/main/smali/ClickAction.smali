.class public final Lapp/spicetify/extension/spotify/settings/nativebridge/ClickAction;
.super Lp/hab0;
.implements Lp/iu30;

.field private final activity:Landroid/app/Activity;

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1
    const/4 v0, 0x1
    invoke-direct {p0, v0}, Lp/hab0;-><init>(I)V
    iput-object p1, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/ClickAction;->activity:Landroid/app/Activity;
    return-void
.end method

.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/ClickAction;->activity:Landroid/app/Activity;
    invoke-static {v0}, Lapp/spicetify/extension/spotify/settings/SpicetifySettingsScreen;->open(Landroid/app/Activity;)V
    sget-object v0, Lp/rih1;->a:Lp/rih1;
    return-object v0
.end method
