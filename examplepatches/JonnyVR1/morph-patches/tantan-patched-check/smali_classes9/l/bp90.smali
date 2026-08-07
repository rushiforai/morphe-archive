.class public final synthetic Ll/bp90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ep90;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/ep90;Landroid/view/View;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bp90;->a:Ll/ep90;

    iput-object p2, p0, Ll/bp90;->b:Landroid/view/View;

    iput-object p3, p0, Ll/bp90;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bp90;->a:Ll/ep90;

    iget-object v1, p0, Ll/bp90;->b:Landroid/view/View;

    iget-object p0, p0, Ll/bp90;->c:Ll/x20;

    invoke-static {v0, v1, p0, p1}, Ll/ep90;->A(Ll/ep90;Landroid/view/View;Ll/x20;Landroid/view/View;)V

    return-void
.end method
