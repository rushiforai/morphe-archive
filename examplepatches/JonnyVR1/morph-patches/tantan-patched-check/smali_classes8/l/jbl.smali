.class public final synthetic Ll/jbl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/VirtualCardType;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/home/virtualcard/HomeNewBizCardView;

.field public final synthetic c:Ll/x0m;

.field public final synthetic d:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/VirtualCardType;Lcom/p1/mobile/putong/core/ui/home/virtualcard/HomeNewBizCardView;Ll/x0m;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jbl;->a:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    iput-object p2, p0, Ll/jbl;->b:Lcom/p1/mobile/putong/core/ui/home/virtualcard/HomeNewBizCardView;

    iput-object p3, p0, Ll/jbl;->c:Ll/x0m;

    iput-object p4, p0, Ll/jbl;->d:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jbl;->a:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    iget-object v1, p0, Ll/jbl;->b:Lcom/p1/mobile/putong/core/ui/home/virtualcard/HomeNewBizCardView;

    iget-object v2, p0, Ll/jbl;->c:Ll/x0m;

    iget-object p0, p0, Ll/jbl;->d:Lkotlin/jvm/functions/Function0;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/home/virtualcard/HomeNewBizCardView;->b(Lcom/p1/mobile/putong/core/data/VirtualCardType;Lcom/p1/mobile/putong/core/ui/home/virtualcard/HomeNewBizCardView;Ll/x0m;Lkotlin/jvm/functions/Function0;Landroid/view/View;)V

    return-void
.end method
