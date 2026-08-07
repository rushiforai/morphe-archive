.class public final synthetic Ll/rjo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/qjo$b;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/TribeSubsetContent;


# direct methods
.method public synthetic constructor <init>(Ll/qjo$b;Lcom/p1/mobile/putong/core/data/TribeSubsetContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rjo;->a:Ll/qjo$b;

    iput-object p2, p0, Ll/rjo;->b:Lcom/p1/mobile/putong/core/data/TribeSubsetContent;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rjo;->a:Ll/qjo$b;

    iget-object p0, p0, Ll/rjo;->b:Lcom/p1/mobile/putong/core/data/TribeSubsetContent;

    invoke-static {v0, p0, p1}, Ll/qjo$b;->E(Ll/qjo$b;Lcom/p1/mobile/putong/core/data/TribeSubsetContent;Landroid/view/View;)V

    return-void
.end method
