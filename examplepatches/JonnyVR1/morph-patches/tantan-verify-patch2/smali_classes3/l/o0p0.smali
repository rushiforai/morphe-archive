.class public final synthetic Ll/o0p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o0p0;->a:Ll/y20;

    iput-object p2, p0, Ll/o0p0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o0p0;->a:Ll/y20;

    iget-object p0, p0, Ll/o0p0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->i0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;Landroid/view/View;)V

    return-void
.end method
