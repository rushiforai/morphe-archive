.class public final synthetic Ll/bwf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/swf0;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/swf0;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bwf0;->a:Ll/swf0;

    iput-object p2, p0, Ll/bwf0;->b:Landroid/view/View;

    iput-object p3, p0, Ll/bwf0;->c:Landroid/view/View;

    iput-object p4, p0, Ll/bwf0;->d:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bwf0;->a:Ll/swf0;

    iget-object v1, p0, Ll/bwf0;->b:Landroid/view/View;

    iget-object v2, p0, Ll/bwf0;->c:Landroid/view/View;

    iget-object p0, p0, Ll/bwf0;->d:Landroid/view/View;

    invoke-static {v0, v1, v2, p0, p1}, Ll/swf0;->k(Ll/swf0;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
