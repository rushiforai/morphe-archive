.class public final synthetic Ll/lkh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/nkh;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/nkh;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lkh;->a:Ll/nkh;

    iput-object p2, p0, Ll/lkh;->b:Landroid/view/View;

    iput-object p3, p0, Ll/lkh;->c:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lkh;->a:Ll/nkh;

    iget-object v1, p0, Ll/lkh;->b:Landroid/view/View;

    iget-object p0, p0, Ll/lkh;->c:Landroid/view/View;

    invoke-static {v0, v1, p0}, Ll/nkh;->a(Ll/nkh;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
