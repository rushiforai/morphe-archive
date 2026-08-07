.class public final synthetic Ll/fw00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;

.field public final synthetic b:[I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;[I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fw00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;

    iput-object p2, p0, Ll/fw00;->b:[I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fw00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;

    iget-object p0, p0, Ll/fw00;->b:[I

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->a(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;[ILandroid/graphics/Bitmap;)V

    return-void
.end method
