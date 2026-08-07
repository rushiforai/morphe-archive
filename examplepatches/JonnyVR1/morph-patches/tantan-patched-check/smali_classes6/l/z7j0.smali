.class public final synthetic Ll/z7j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/a8j0;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/TopicCategorie;


# direct methods
.method public synthetic constructor <init>(Ll/a8j0;Lcom/p1/mobile/putong/feed/data/TopicCategorie;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z7j0;->a:Ll/a8j0;

    iput-object p2, p0, Ll/z7j0;->b:Lcom/p1/mobile/putong/feed/data/TopicCategorie;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z7j0;->a:Ll/a8j0;

    iget-object p0, p0, Ll/z7j0;->b:Lcom/p1/mobile/putong/feed/data/TopicCategorie;

    invoke-static {v0, p0, p1}, Ll/a8j0;->E(Ll/a8j0;Lcom/p1/mobile/putong/feed/data/TopicCategorie;Landroid/view/View;)V

    return-void
.end method
