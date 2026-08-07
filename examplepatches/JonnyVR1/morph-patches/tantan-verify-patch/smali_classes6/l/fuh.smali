.class public final synthetic Ll/fuh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fuh;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    iput-object p2, p0, Ll/fuh;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fuh;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    iget-object p0, p0, Ll/fuh;->b:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->i0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
