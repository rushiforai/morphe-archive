.class public final synthetic Ll/f63;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/LiteraturesComments;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f63;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;

    iput-object p2, p0, Ll/f63;->b:Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f63;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;

    iget-object p0, p0, Ll/f63;->b:Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->p(Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;Lcom/p1/mobile/putong/core/data/LiteraturesComments;Landroid/view/View;)V

    return-void
.end method
