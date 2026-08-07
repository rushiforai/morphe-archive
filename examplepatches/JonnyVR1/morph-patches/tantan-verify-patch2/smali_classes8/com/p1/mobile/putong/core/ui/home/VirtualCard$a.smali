.class public Lcom/p1/mobile/putong/core/ui/home/VirtualCard$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->J0(Lcom/p1/mobile/putong/core/card/VSwipeCard;ILcom/p1/mobile/putong/core/data/VirtualCardType;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/home/VirtualCard;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/home/VirtualCard;Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard$a;->b:Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard$a;->b:Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->B(Lcom/p1/mobile/putong/core/ui/home/VirtualCard;)Ll/sxl0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 8
    .line 9
    invoke-interface {v0, v1}, Ll/sxl0;->b(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->l1(Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
