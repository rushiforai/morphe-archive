.class public final synthetic Ll/cw60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/vw60;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Z

.field public final synthetic d:Ll/x20;

.field public final synthetic e:Z

.field public final synthetic f:Z


# direct methods
.method public synthetic constructor <init>(Ll/vw60;Lcom/p1/mobile/putong/data/User;ZLl/x20;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cw60;->a:Ll/vw60;

    iput-object p2, p0, Ll/cw60;->b:Lcom/p1/mobile/putong/data/User;

    iput-boolean p3, p0, Ll/cw60;->c:Z

    iput-object p4, p0, Ll/cw60;->d:Ll/x20;

    iput-boolean p5, p0, Ll/cw60;->e:Z

    iput-boolean p6, p0, Ll/cw60;->f:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/cw60;->a:Ll/vw60;

    iget-object v1, p0, Ll/cw60;->b:Lcom/p1/mobile/putong/data/User;

    iget-boolean v2, p0, Ll/cw60;->c:Z

    iget-object v3, p0, Ll/cw60;->d:Ll/x20;

    iget-boolean v4, p0, Ll/cw60;->e:Z

    iget-boolean v5, p0, Ll/cw60;->f:Z

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Ll/vw60;->i(Ll/vw60;Lcom/p1/mobile/putong/data/User;ZLl/x20;ZZLandroid/view/View;)V

    return-void
.end method
