.class public final synthetic Ll/oyj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pyj;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;


# direct methods
.method public synthetic constructor <init>(Ll/pyj;Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oyj;->a:Ll/pyj;

    iput-object p2, p0, Ll/oyj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oyj;->a:Ll/pyj;

    iget-object p0, p0, Ll/oyj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    invoke-static {v0, p0, p1}, Ll/pyj;->w(Ll/pyj;Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;Landroid/view/View;)V

    return-void
.end method
