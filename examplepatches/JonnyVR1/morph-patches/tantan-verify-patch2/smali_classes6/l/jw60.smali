.class public final synthetic Ll/jw60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/vw60;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/vw60;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jw60;->a:Ll/vw60;

    iput-object p2, p0, Ll/jw60;->b:Lcom/p1/mobile/putong/data/User;

    iput-boolean p3, p0, Ll/jw60;->c:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jw60;->a:Ll/vw60;

    iget-object v1, p0, Ll/jw60;->b:Lcom/p1/mobile/putong/data/User;

    iget-boolean p0, p0, Ll/jw60;->c:Z

    invoke-static {v0, v1, p0, p1}, Ll/vw60;->n(Ll/vw60;Lcom/p1/mobile/putong/data/User;ZLandroid/view/View;)V

    return-void
.end method
