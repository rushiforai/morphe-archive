.class public final synthetic Ll/k2i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/m2i;

.field public final synthetic b:Lcom/p1/mobile/putong/data/BubbleInfo;


# direct methods
.method public synthetic constructor <init>(Ll/m2i;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k2i;->a:Ll/m2i;

    iput-object p2, p0, Ll/k2i;->b:Lcom/p1/mobile/putong/data/BubbleInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k2i;->a:Ll/m2i;

    iget-object p0, p0, Ll/k2i;->b:Lcom/p1/mobile/putong/data/BubbleInfo;

    invoke-static {v0, p0, p1}, Ll/m2i;->E(Ll/m2i;Lcom/p1/mobile/putong/data/BubbleInfo;Landroid/view/View;)V

    return-void
.end method
