.class public final synthetic Ll/d0k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;

.field public final synthetic b:Ll/coj;

.field public final synthetic c:Ll/pcj;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;Ll/coj;Ll/pcj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d0k;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;

    iput-object p2, p0, Ll/d0k;->b:Ll/coj;

    iput-object p3, p0, Ll/d0k;->c:Ll/pcj;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d0k;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;

    iget-object v1, p0, Ll/d0k;->b:Ll/coj;

    iget-object p0, p0, Ll/d0k;->c:Ll/pcj;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;->n0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;Ll/coj;Ll/pcj;Landroid/view/View;)V

    return-void
.end method
