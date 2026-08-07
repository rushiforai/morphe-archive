.class public Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView$a;
.super Ll/dpf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;->j(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;Ll/ue4;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic c:Ll/ue4;

.field public final synthetic d:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;Ll/nxl;Ll/ue4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView$a;->d:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView$a;->c:Ll/ue4;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ll/dpf0;-><init>(Ll/nxl;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/dpf0;->e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string p1, "onReceivedErrorX message = "

    .line 7
    .line 8
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "[live]campaign"

    .line 19
    .line 20
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p2, p3, p4, p0}, Ll/awr;->b(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public f(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/dpf0;->f(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "about:blank"

    .line 5
    .line 6
    invoke-static {p2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView$a;->c:Ll/ue4;

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    invoke-virtual {p0, p1}, Ll/ue4;->N4(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
