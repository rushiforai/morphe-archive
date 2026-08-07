.class public final synthetic Ll/xsa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xsa0;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;

    iput-object p2, p0, Ll/xsa0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;

    iput-boolean p3, p0, Ll/xsa0;->c:Z

    iput-object p4, p0, Ll/xsa0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/xsa0;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;

    iget-object v1, p0, Ll/xsa0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;

    iget-boolean v2, p0, Ll/xsa0;->c:Z

    iget-object v3, p0, Ll/xsa0;->d:Ljava/lang/String;

    move-object v4, p1

    move-object v5, p2

    move v6, p3

    move-wide v7, p4

    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->Y1(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;ZLjava/lang/String;Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method
