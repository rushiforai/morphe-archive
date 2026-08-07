.class public final synthetic Ll/l2i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/m2i;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/data/BubbleInfo;


# direct methods
.method public synthetic constructor <init>(Ll/m2i;ILcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l2i;->a:Ll/m2i;

    iput p2, p0, Ll/l2i;->b:I

    iput-object p3, p0, Ll/l2i;->c:Lcom/p1/mobile/putong/data/BubbleInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l2i;->a:Ll/m2i;

    iget v1, p0, Ll/l2i;->b:I

    iget-object p0, p0, Ll/l2i;->c:Lcom/p1/mobile/putong/data/BubbleInfo;

    invoke-static {v0, v1, p0, p1}, Ll/m2i;->F(Ll/m2i;ILcom/p1/mobile/putong/data/BubbleInfo;Landroid/view/View;)V

    return-void
.end method
