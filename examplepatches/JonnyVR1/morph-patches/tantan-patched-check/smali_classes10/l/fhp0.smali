.class public final synthetic Ll/fhp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

.field public final synthetic b:Ll/nhp0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;Ll/nhp0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fhp0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    iput-object p2, p0, Ll/fhp0;->b:Ll/nhp0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fhp0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    iget-object p0, p0, Ll/fhp0;->b:Ll/nhp0;

    invoke-static {v0, p0, p1}, Ll/nhp0;->Q(Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;Ll/nhp0;Landroid/view/View;)V

    return-void
.end method
