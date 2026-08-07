.class public final synthetic Ll/g6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ohg;

.field public final synthetic b:Ll/acg;


# direct methods
.method public synthetic constructor <init>(Ll/ohg;Ll/acg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g6g;->a:Ll/ohg;

    iput-object p2, p0, Ll/g6g;->b:Ll/acg;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g6g;->a:Ll/ohg;

    iget-object p0, p0, Ll/g6g;->b:Ll/acg;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;->R(Ll/ohg;Ll/acg;Landroid/view/View;)V

    return-void
.end method
