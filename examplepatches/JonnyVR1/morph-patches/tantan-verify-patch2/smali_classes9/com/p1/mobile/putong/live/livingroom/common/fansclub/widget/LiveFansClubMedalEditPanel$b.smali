.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->Z(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel$b;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel$b;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->t:Landroid/widget/ScrollView;

    .line 4
    .line 5
    const/16 v0, 0x21

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/ScrollView;->fullScroll(I)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method
