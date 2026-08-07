.class public final synthetic Ll/wgf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/zgf;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/UserTagData;


# direct methods
.method public synthetic constructor <init>(Ll/zgf;Lcom/p1/mobile/putong/core/data/UserTagData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wgf;->a:Ll/zgf;

    iput-object p2, p0, Ll/wgf;->b:Lcom/p1/mobile/putong/core/data/UserTagData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wgf;->a:Ll/zgf;

    iget-object p0, p0, Ll/wgf;->b:Lcom/p1/mobile/putong/core/data/UserTagData;

    invoke-static {v0, p0, p1}, Ll/zgf;->W(Ll/zgf;Lcom/p1/mobile/putong/core/data/UserTagData;Landroid/view/View;)V

    return-void
.end method
