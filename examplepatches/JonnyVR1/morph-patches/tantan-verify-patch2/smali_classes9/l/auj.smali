.class public final synthetic Ll/auj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/guj;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

.field public final synthetic c:Ll/jjs;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ll/guj;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/auj;->a:Ll/guj;

    iput-object p2, p0, Ll/auj;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    iput-object p3, p0, Ll/auj;->c:Ll/jjs;

    iput p4, p0, Ll/auj;->d:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/auj;->a:Ll/guj;

    iget-object v1, p0, Ll/auj;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    iget-object v2, p0, Ll/auj;->c:Ll/jjs;

    iget p0, p0, Ll/auj;->d:I

    invoke-static {v0, v1, v2, p0, p1}, Ll/guj;->b(Ll/guj;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;ILandroid/view/View;)V

    return-void
.end method
