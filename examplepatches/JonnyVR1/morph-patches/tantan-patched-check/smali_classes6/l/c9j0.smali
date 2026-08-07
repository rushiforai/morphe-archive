.class public final synthetic Ll/c9j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/TopicMoment;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c9j0;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;

    iput-object p2, p0, Ll/c9j0;->b:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    iput p3, p0, Ll/c9j0;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c9j0;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;

    iget-object v1, p0, Ll/c9j0;->b:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    iget p0, p0, Ll/c9j0;->c:I

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->F(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;Lcom/p1/mobile/putong/feed/data/TopicMoment;ILandroid/view/View;)V

    return-void
.end method
