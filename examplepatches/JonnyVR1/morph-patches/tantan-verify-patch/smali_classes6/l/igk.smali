.class public final synthetic Ll/igk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jgk;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Group;


# direct methods
.method public synthetic constructor <init>(Ll/jgk;Lcom/p1/mobile/putong/feed/data/Group;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/igk;->a:Ll/jgk;

    iput-object p2, p0, Ll/igk;->b:Lcom/p1/mobile/putong/feed/data/Group;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/igk;->a:Ll/jgk;

    iget-object p0, p0, Ll/igk;->b:Lcom/p1/mobile/putong/feed/data/Group;

    invoke-static {v0, p0, p1}, Ll/jgk;->E(Ll/jgk;Lcom/p1/mobile/putong/feed/data/Group;Landroid/view/View;)V

    return-void
.end method
