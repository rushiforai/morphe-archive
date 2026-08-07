.class public final synthetic Ll/wqp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/zqp;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;


# direct methods
.method public synthetic constructor <init>(Ll/zqp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wqp;->a:Ll/zqp;

    iput-object p2, p0, Ll/wqp;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wqp;->a:Ll/zqp;

    iget-object p0, p0, Ll/wqp;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;

    invoke-static {v0, p0, p1}, Ll/zqp;->n0(Ll/zqp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;Landroid/view/View;)V

    return-void
.end method
