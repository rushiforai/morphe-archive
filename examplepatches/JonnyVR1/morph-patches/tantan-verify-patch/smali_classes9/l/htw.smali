.class public final synthetic Ll/htw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/itw;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;


# direct methods
.method public synthetic constructor <init>(Ll/itw;ILcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/htw;->a:Ll/itw;

    iput p2, p0, Ll/htw;->b:I

    iput-object p3, p0, Ll/htw;->c:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/htw;->a:Ll/itw;

    iget v1, p0, Ll/htw;->b:I

    iget-object p0, p0, Ll/htw;->c:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    invoke-static {v0, v1, p0, p1}, Ll/itw;->G(Ll/itw;ILcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;Landroid/view/View;)V

    return-void
.end method
