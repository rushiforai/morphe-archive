.class public final synthetic Ll/yr60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/as60;

.field public final synthetic b:Landroid/app/Activity;

.field public final synthetic c:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/as60;Landroid/app/Activity;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yr60;->a:Ll/as60;

    iput-object p2, p0, Ll/yr60;->b:Landroid/app/Activity;

    iput-object p3, p0, Ll/yr60;->c:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yr60;->a:Ll/as60;

    iget-object v1, p0, Ll/yr60;->b:Landroid/app/Activity;

    iget-object p0, p0, Ll/yr60;->c:Landroid/view/View;

    invoke-static {v0, v1, p0}, Ll/as60;->a(Ll/as60;Landroid/app/Activity;Landroid/view/View;)V

    return-void
.end method
