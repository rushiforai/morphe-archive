.class public final synthetic Ll/i2r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;


# direct methods
.method public synthetic constructor <init>(ILl/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/i2r;->a:I

    iput-object p2, p0, Ll/i2r;->b:Ll/y20;

    iput-object p3, p0, Ll/i2r;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/i2r;->a:I

    iget-object v1, p0, Ll/i2r;->b:Ll/y20;

    iget-object p0, p0, Ll/i2r;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongItem;->h0(ILl/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;Landroid/view/View;)V

    return-void
.end method
