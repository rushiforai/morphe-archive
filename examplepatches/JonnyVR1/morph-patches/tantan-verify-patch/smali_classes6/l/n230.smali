.class public final synthetic Ll/n230;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/r230$g;


# instance fields
.field public final synthetic a:Ll/r230;

.field public final synthetic b:Lcom/facebook/drawee/view/SimpleDraweeView;


# direct methods
.method public synthetic constructor <init>(Ll/r230;Lcom/facebook/drawee/view/SimpleDraweeView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n230;->a:Ll/r230;

    iput-object p2, p0, Ll/n230;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    return-void
.end method


# virtual methods
.method public final a(Ll/q3d0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n230;->a:Ll/r230;

    iget-object p0, p0, Ll/n230;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    invoke-static {v0, p0, p1}, Ll/r230;->b(Ll/r230;Lcom/facebook/drawee/view/SimpleDraweeView;Ll/q3d0;)V

    return-void
.end method
