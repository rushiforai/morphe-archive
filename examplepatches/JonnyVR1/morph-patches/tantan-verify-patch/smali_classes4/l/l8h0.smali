.class public final synthetic Ll/l8h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Landroid/widget/LinearLayout;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Dimensions;

.field public final synthetic c:Ll/m8h0;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/core/data/Dimensions;Ll/m8h0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l8h0;->a:Landroid/widget/LinearLayout;

    iput-object p2, p0, Ll/l8h0;->b:Lcom/p1/mobile/putong/core/data/Dimensions;

    iput-object p3, p0, Ll/l8h0;->c:Ll/m8h0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l8h0;->a:Landroid/widget/LinearLayout;

    iget-object v1, p0, Ll/l8h0;->b:Lcom/p1/mobile/putong/core/data/Dimensions;

    iget-object p0, p0, Ll/l8h0;->c:Ll/m8h0;

    invoke-static {v0, v1, p0, p1}, Ll/m8h0;->a(Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/core/data/Dimensions;Ll/m8h0;Landroid/view/View;)V

    return-void
.end method
