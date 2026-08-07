.class public final synthetic Ll/sgh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public final synthetic e:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sgh;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;

    iput-object p2, p0, Ll/sgh;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p3, p0, Ll/sgh;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/sgh;->d:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iput-object p5, p0, Ll/sgh;->e:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/sgh;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;

    iget-object v1, p0, Ll/sgh;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v2, p0, Ll/sgh;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/sgh;->d:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iget-object v4, p0, Ll/sgh;->e:Lcom/p1/mobile/android/app/Act;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->d(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
