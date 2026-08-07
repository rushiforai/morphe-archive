.class public final synthetic Ll/ytj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


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

    iput-object p1, p0, Ll/ytj;->a:Ll/guj;

    iput-object p2, p0, Ll/ytj;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    iput-object p3, p0, Ll/ytj;->c:Ll/jjs;

    iput p4, p0, Ll/ytj;->d:I

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ytj;->a:Ll/guj;

    iget-object v1, p0, Ll/ytj;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    iget-object v2, p0, Ll/ytj;->c:Ll/jjs;

    iget p0, p0, Ll/ytj;->d:I

    invoke-static {v0, v1, v2, p0, p1}, Ll/guj;->d(Ll/guj;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;ILandroid/view/View;)Z

    move-result p0

    return p0
.end method
