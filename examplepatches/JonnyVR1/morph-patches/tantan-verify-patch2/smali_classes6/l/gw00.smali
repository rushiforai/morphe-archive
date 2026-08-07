.class public final synthetic Ll/gw00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;

.field public final synthetic b:Landroid/graphics/Bitmap;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gw00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;

    iput-object p2, p0, Ll/gw00;->b:Landroid/graphics/Bitmap;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gw00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;

    iget-object p0, p0, Ll/gw00;->b:Landroid/graphics/Bitmap;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->l(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;Landroid/graphics/Bitmap;)V

    return-void
.end method
