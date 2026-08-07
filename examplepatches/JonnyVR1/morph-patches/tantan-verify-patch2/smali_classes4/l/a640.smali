.class public final synthetic Ll/a640;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/b;

.field public final synthetic b:Landroid/view/ViewGroup;

.field public final synthetic c:Landroid/view/ViewGroup;

.field public final synthetic d:Ll/jl80;

.field public final synthetic e:Ll/y20;

.field public final synthetic f:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Ll/jl80;Ll/y20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a640;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    iput-object p2, p0, Ll/a640;->b:Landroid/view/ViewGroup;

    iput-object p3, p0, Ll/a640;->c:Landroid/view/ViewGroup;

    iput-object p4, p0, Ll/a640;->d:Ll/jl80;

    iput-object p5, p0, Ll/a640;->e:Ll/y20;

    iput-object p6, p0, Ll/a640;->f:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/a640;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    iget-object v1, p0, Ll/a640;->b:Landroid/view/ViewGroup;

    iget-object v2, p0, Ll/a640;->c:Landroid/view/ViewGroup;

    iget-object v3, p0, Ll/a640;->d:Ll/jl80;

    iget-object v4, p0, Ll/a640;->e:Ll/y20;

    iget-object v5, p0, Ll/a640;->f:Ll/x20;

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/home/b;->r0(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Ll/jl80;Ll/y20;Ll/x20;Landroid/view/View;)V

    return-void
.end method
