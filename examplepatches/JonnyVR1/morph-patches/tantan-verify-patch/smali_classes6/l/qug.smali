.class public final synthetic Ll/qug;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;

.field public final synthetic b:Landroid/text/SpannableStringBuilder;

.field public final synthetic c:[Landroid/text/style/URLSpan;

.field public final synthetic d:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;Landroid/text/SpannableStringBuilder;[Landroid/text/style/URLSpan;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qug;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;

    iput-object p2, p0, Ll/qug;->b:Landroid/text/SpannableStringBuilder;

    iput-object p3, p0, Ll/qug;->c:[Landroid/text/style/URLSpan;

    iput-object p4, p0, Ll/qug;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qug;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;

    iget-object v1, p0, Ll/qug;->b:Landroid/text/SpannableStringBuilder;

    iget-object v2, p0, Ll/qug;->c:[Landroid/text/style/URLSpan;

    iget-object p0, p0, Ll/qug;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->p(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;Landroid/text/SpannableStringBuilder;[Landroid/text/style/URLSpan;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method
