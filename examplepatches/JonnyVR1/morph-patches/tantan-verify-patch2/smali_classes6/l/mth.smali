.class public final synthetic Ll/mth;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mth;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;

    iput-boolean p2, p0, Ll/mth;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mth;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;

    iget-boolean p0, p0, Ll/mth;->b:Z

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->p(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;Z)V

    return-void
.end method
