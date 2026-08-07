.class public final synthetic Ll/es00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/MomentView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Ll/qo00;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/feed/data/Moment;Ll/qo00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/es00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentView;

    iput-object p2, p0, Ll/es00;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p3, p0, Ll/es00;->c:Ll/qo00;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/es00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentView;

    iget-object v1, p0, Ll/es00;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object p0, p0, Ll/es00;->c:Ll/qo00;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->n(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/feed/data/Moment;Ll/qo00;Landroid/view/View;)V

    return-void
.end method
