.class public final synthetic Ll/t2z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/d3z;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;

.field public final synthetic c:I

.field public final synthetic d:I

.field public final synthetic e:Landroid/widget/PopupWindow;


# direct methods
.method public synthetic constructor <init>(Ll/d3z;Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;IILandroid/widget/PopupWindow;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t2z;->a:Ll/d3z;

    iput-object p2, p0, Ll/t2z;->b:Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;

    iput p3, p0, Ll/t2z;->c:I

    iput p4, p0, Ll/t2z;->d:I

    iput-object p5, p0, Ll/t2z;->e:Landroid/widget/PopupWindow;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/t2z;->a:Ll/d3z;

    iget-object v1, p0, Ll/t2z;->b:Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;

    iget v2, p0, Ll/t2z;->c:I

    iget v3, p0, Ll/t2z;->d:I

    iget-object v4, p0, Ll/t2z;->e:Landroid/widget/PopupWindow;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Ll/d3z;->G(Ll/d3z;Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;IILandroid/widget/PopupWindow;Landroid/view/View;)V

    return-void
.end method
