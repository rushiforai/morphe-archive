.class public final synthetic Ll/mbo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/xbo0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;


# direct methods
.method public synthetic constructor <init>(Ll/xbo0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mbo0;->a:Ll/xbo0;

    iput-object p2, p0, Ll/mbo0;->b:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mbo0;->a:Ll/xbo0;

    iget-object p0, p0, Ll/mbo0;->b:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;

    invoke-static {v0, p0, p1}, Ll/xbo0;->I(Ll/xbo0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;Landroid/view/View;)V

    return-void
.end method
