.class public final synthetic Ll/jfy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroid/widget/ImageView;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/ImageView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jfy;->a:Landroid/widget/ImageView;

    iput-object p2, p0, Ll/jfy;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jfy;->a:Landroid/widget/ImageView;

    iget-object p0, p0, Ll/jfy;->b:Landroid/view/View;

    check-cast p1, Ll/bkj0;

    invoke-static {v0, p0, p1}, Ll/lfy;->l(Landroid/widget/ImageView;Landroid/view/View;Ll/bkj0;)V

    return-void
.end method
