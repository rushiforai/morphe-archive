.class public final synthetic Ll/sv2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/widget/a;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/a;ILcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sv2;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/a;

    iput p2, p0, Ll/sv2;->b:I

    iput-object p3, p0, Ll/sv2;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sv2;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/a;

    iget v1, p0, Ll/sv2;->b:I

    iget-object p0, p0, Ll/sv2;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/a;->E(Lcom/p1/mobile/putong/feed/newui/camera/widget/a;ILcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;Landroid/view/View;)V

    return-void
.end method
