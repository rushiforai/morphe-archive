.class public final synthetic Ll/hbn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Ll/qbn;

.field public final synthetic b:Ll/fzq;


# direct methods
.method public synthetic constructor <init>(Ll/qbn;Ll/fzq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hbn;->a:Ll/qbn;

    iput-object p2, p0, Ll/hbn;->b:Ll/fzq;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hbn;->a:Ll/qbn;

    iget-object p0, p0, Ll/hbn;->b:Ll/fzq;

    invoke-static {v0, p0, p1}, Ll/qbn;->N(Ll/qbn;Ll/fzq;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
