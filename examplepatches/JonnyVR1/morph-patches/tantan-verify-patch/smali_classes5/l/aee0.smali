.class public final synthetic Ll/aee0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/d;

.field public final synthetic b:Ll/dee0;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/d;Ll/dee0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aee0;->a:Lcom/p1/mobile/putong/core/ui/purchase/d;

    iput-object p2, p0, Ll/aee0;->b:Ll/dee0;

    iput p3, p0, Ll/aee0;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/aee0;->a:Lcom/p1/mobile/putong/core/ui/purchase/d;

    iget-object v1, p0, Ll/aee0;->b:Ll/dee0;

    iget p0, p0, Ll/aee0;->c:I

    invoke-static {v0, v1, p0, p1}, Ll/dee0;->y(Lcom/p1/mobile/putong/core/ui/purchase/d;Ll/dee0;ILandroid/view/View;)V

    return-void
.end method
