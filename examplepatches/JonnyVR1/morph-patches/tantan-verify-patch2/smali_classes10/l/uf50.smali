.class public final synthetic Ll/uf50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Landroid/view/animation/LinearInterpolator;

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;Ll/x20;Landroid/view/animation/LinearInterpolator;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uf50;->a:Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;

    iput-object p2, p0, Ll/uf50;->b:Ll/x20;

    iput-object p3, p0, Ll/uf50;->c:Landroid/view/animation/LinearInterpolator;

    iput-object p4, p0, Ll/uf50;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uf50;->a:Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;

    iget-object v1, p0, Ll/uf50;->b:Ll/x20;

    iget-object v2, p0, Ll/uf50;->c:Landroid/view/animation/LinearInterpolator;

    iget-object p0, p0, Ll/uf50;->d:Ll/x20;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;->e(Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;Ll/x20;Landroid/view/animation/LinearInterpolator;Ll/x20;)V

    return-void
.end method
