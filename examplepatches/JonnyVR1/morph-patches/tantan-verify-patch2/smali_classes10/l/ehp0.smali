.class public final synthetic Ll/ehp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/nhp0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;


# direct methods
.method public synthetic constructor <init>(Ll/nhp0;Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ehp0;->a:Ll/nhp0;

    iput-object p2, p0, Ll/ehp0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ehp0;->a:Ll/nhp0;

    iget-object p0, p0, Ll/ehp0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    invoke-static {v0, p0, p1}, Ll/nhp0;->N(Ll/nhp0;Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;Landroid/view/View;)V

    return-void
.end method
