.class public final synthetic Ll/pln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tln;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

.field public final synthetic c:Ll/jjs;

.field public final synthetic d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

.field public final synthetic e:Ll/y20;

.field public final synthetic f:I

.field public final synthetic g:Z


# direct methods
.method public synthetic constructor <init>(Ll/tln;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/y20;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pln;->a:Ll/tln;

    iput-object p2, p0, Ll/pln;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    iput-object p3, p0, Ll/pln;->c:Ll/jjs;

    iput-object p4, p0, Ll/pln;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    iput-object p5, p0, Ll/pln;->e:Ll/y20;

    iput p6, p0, Ll/pln;->f:I

    iput-boolean p7, p0, Ll/pln;->g:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/pln;->a:Ll/tln;

    iget-object v1, p0, Ll/pln;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    iget-object v2, p0, Ll/pln;->c:Ll/jjs;

    iget-object v3, p0, Ll/pln;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    iget-object v4, p0, Ll/pln;->e:Ll/y20;

    iget v5, p0, Ll/pln;->f:I

    iget-boolean v6, p0, Ll/pln;->g:Z

    move-object v7, p1

    check-cast v7, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    invoke-static/range {v0 .. v7}, Ll/tln;->K3(Ll/tln;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/y20;IZLcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method
