.class public final synthetic Ll/k800;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/q800;

.field public final synthetic b:[Z

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/q800;[ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k800;->a:Ll/q800;

    iput-object p2, p0, Ll/k800;->b:[Z

    iput-object p3, p0, Ll/k800;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k800;->a:Ll/q800;

    iget-object v1, p0, Ll/k800;->b:[Z

    iget-object p0, p0, Ll/k800;->c:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Ll/q800;->o(Ll/q800;[ZLcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
