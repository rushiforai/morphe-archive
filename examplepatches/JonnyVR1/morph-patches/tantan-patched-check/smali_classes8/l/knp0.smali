.class public final synthetic Ll/knp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/VConstraintTextView;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Landroid/view/ViewGroup;

.field public final synthetic d:I

.field public final synthetic e:I

.field public final synthetic f:I

.field public final synthetic g:Z

.field public final synthetic h:Landroid/view/ViewGroup$LayoutParams;

.field public final synthetic i:Landroid/view/View;

.field public final synthetic j:I

.field public final synthetic k:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lv/VConstraintTextView;Landroid/view/View;Landroid/view/ViewGroup;IIIZLandroid/view/ViewGroup$LayoutParams;Landroid/view/View;ILl/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/knp0;->a:Lv/VConstraintTextView;

    iput-object p2, p0, Ll/knp0;->b:Landroid/view/View;

    iput-object p3, p0, Ll/knp0;->c:Landroid/view/ViewGroup;

    iput p4, p0, Ll/knp0;->d:I

    iput p5, p0, Ll/knp0;->e:I

    iput p6, p0, Ll/knp0;->f:I

    iput-boolean p7, p0, Ll/knp0;->g:Z

    iput-object p8, p0, Ll/knp0;->h:Landroid/view/ViewGroup$LayoutParams;

    iput-object p9, p0, Ll/knp0;->i:Landroid/view/View;

    iput p10, p0, Ll/knp0;->j:I

    iput-object p11, p0, Ll/knp0;->k:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/knp0;->a:Lv/VConstraintTextView;

    iget-object v1, p0, Ll/knp0;->b:Landroid/view/View;

    iget-object v2, p0, Ll/knp0;->c:Landroid/view/ViewGroup;

    iget v3, p0, Ll/knp0;->d:I

    iget v4, p0, Ll/knp0;->e:I

    iget v5, p0, Ll/knp0;->f:I

    iget-boolean v6, p0, Ll/knp0;->g:Z

    iget-object v7, p0, Ll/knp0;->h:Landroid/view/ViewGroup$LayoutParams;

    iget-object v8, p0, Ll/knp0;->i:Landroid/view/View;

    iget v9, p0, Ll/knp0;->j:I

    iget-object v10, p0, Ll/knp0;->k:Ll/x20;

    invoke-static/range {v0 .. v10}, Ll/qnp0;->T0(Lv/VConstraintTextView;Landroid/view/View;Landroid/view/ViewGroup;IIIZLandroid/view/ViewGroup$LayoutParams;Landroid/view/View;ILl/x20;)V

    return-void
.end method
