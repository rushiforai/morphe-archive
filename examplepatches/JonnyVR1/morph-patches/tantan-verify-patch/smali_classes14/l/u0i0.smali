.class public final synthetic Ll/u0i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y0i0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Landroidx/constraintlayout/widget/ConstraintLayout;


# direct methods
.method public synthetic constructor <init>(Ll/y0i0;Ljava/lang/String;Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u0i0;->a:Ll/y0i0;

    iput-object p2, p0, Ll/u0i0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/u0i0;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u0i0;->a:Ll/y0i0;

    iget-object v1, p0, Ll/u0i0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/u0i0;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-static {v0, v1, p0, p1}, Ll/y0i0;->m(Ll/y0i0;Ljava/lang/String;Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/view/View;)V

    return-void
.end method
