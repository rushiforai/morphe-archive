.class public final synthetic Ll/h2r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h2r;->a:Ll/y20;

    iput-object p2, p0, Ll/h2r;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h2r;->a:Ll/y20;

    iget-object p0, p0, Ll/h2r;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->i0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;Landroid/view/View;)V

    return-void
.end method
