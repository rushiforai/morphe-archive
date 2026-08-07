.class public final synthetic Ll/qcs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;

.field public final synthetic b:F


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qcs;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;

    iput p2, p0, Ll/qcs;->b:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qcs;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;

    iget p0, p0, Ll/qcs;->b:F

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->c(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;F)V

    return-void
.end method
