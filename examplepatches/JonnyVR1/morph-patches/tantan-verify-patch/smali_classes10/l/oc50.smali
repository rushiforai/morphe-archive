.class public final synthetic Ll/oc50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pc50;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;


# direct methods
.method public synthetic constructor <init>(Ll/pc50;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oc50;->a:Ll/pc50;

    iput-object p2, p0, Ll/oc50;->b:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oc50;->a:Ll/pc50;

    iget-object p0, p0, Ll/oc50;->b:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    invoke-static {v0, p0, p1}, Ll/pc50;->F(Ll/pc50;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;Landroid/view/View;)V

    return-void
.end method
