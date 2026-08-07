.class public final synthetic Ll/ysa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ysa0;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;

    iput-object p2, p0, Ll/ysa0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;

    return-void
.end method


# virtual methods
.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ysa0;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;

    iget-object v1, p0, Ll/ysa0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-wide v5, p4

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->Z1(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method
