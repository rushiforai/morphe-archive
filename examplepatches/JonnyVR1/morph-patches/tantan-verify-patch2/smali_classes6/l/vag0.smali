.class public final synthetic Ll/vag0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/widget/h;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/h;Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vag0;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/h;

    iput-object p2, p0, Ll/vag0;->b:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    iput p3, p0, Ll/vag0;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vag0;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/h;

    iget-object v1, p0, Ll/vag0;->b:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    iget p0, p0, Ll/vag0;->c:I

    check-cast p1, Ljava/io/File;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/h;->E(Lcom/p1/mobile/putong/feed/newui/camera/widget/h;Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;ILjava/io/File;)V

    return-void
.end method
