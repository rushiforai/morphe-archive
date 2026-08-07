.class public final synthetic Ll/gqc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/hqc0;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/RecommendUsers;


# direct methods
.method public synthetic constructor <init>(Ll/hqc0;Lcom/p1/mobile/putong/feed/data/RecommendUsers;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gqc0;->a:Ll/hqc0;

    iput-object p2, p0, Ll/gqc0;->b:Lcom/p1/mobile/putong/feed/data/RecommendUsers;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gqc0;->a:Ll/hqc0;

    iget-object p0, p0, Ll/gqc0;->b:Lcom/p1/mobile/putong/feed/data/RecommendUsers;

    invoke-static {v0, p0, p1}, Ll/hqc0;->E(Ll/hqc0;Lcom/p1/mobile/putong/feed/data/RecommendUsers;Landroid/view/View;)V

    return-void
.end method
