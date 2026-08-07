.class public final synthetic Ll/onp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Landroid/view/ViewGroup;

.field public final synthetic c:Lv/VConstraintTextView;

.field public final synthetic d:I

.field public final synthetic e:I

.field public final synthetic f:I

.field public final synthetic g:Z

.field public final synthetic h:Landroid/view/ViewGroup$LayoutParams;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Landroid/view/ViewGroup;Lv/VConstraintTextView;IIIZLandroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/onp0;->a:Landroid/view/View;

    iput-object p2, p0, Ll/onp0;->b:Landroid/view/ViewGroup;

    iput-object p3, p0, Ll/onp0;->c:Lv/VConstraintTextView;

    iput p4, p0, Ll/onp0;->d:I

    iput p5, p0, Ll/onp0;->e:I

    iput p6, p0, Ll/onp0;->f:I

    iput-boolean p7, p0, Ll/onp0;->g:Z

    iput-object p8, p0, Ll/onp0;->h:Landroid/view/ViewGroup$LayoutParams;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/onp0;->a:Landroid/view/View;

    iget-object v1, p0, Ll/onp0;->b:Landroid/view/ViewGroup;

    iget-object v2, p0, Ll/onp0;->c:Lv/VConstraintTextView;

    iget v3, p0, Ll/onp0;->d:I

    iget v4, p0, Ll/onp0;->e:I

    iget v5, p0, Ll/onp0;->f:I

    iget-boolean v6, p0, Ll/onp0;->g:Z

    iget-object v7, p0, Ll/onp0;->h:Landroid/view/ViewGroup$LayoutParams;

    move-object v8, p1

    check-cast v8, Ll/pf60;

    invoke-static/range {v0 .. v8}, Ll/qnp0;->V0(Landroid/view/View;Landroid/view/ViewGroup;Lv/VConstraintTextView;IIIZLandroid/view/ViewGroup$LayoutParams;Ll/pf60;)V

    return-void
.end method
