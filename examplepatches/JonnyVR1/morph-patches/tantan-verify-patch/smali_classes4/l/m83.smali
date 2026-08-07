.class public final synthetic Ll/m83;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/l83;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;


# direct methods
.method public synthetic constructor <init>(Ll/l83;Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m83;->a:Ll/l83;

    iput-object p2, p0, Ll/m83;->b:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m83;->a:Ll/l83;

    iget-object p0, p0, Ll/m83;->b:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/boost/BoostGuideCardView;->b(Ll/l83;Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Landroid/view/View;)V

    return-void
.end method
