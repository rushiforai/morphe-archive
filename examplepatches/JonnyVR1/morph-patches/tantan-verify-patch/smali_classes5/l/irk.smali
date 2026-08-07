.class public final synthetic Ll/irk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Landroid/widget/LinearLayout;

.field public final synthetic b:Landroid/widget/TextView;

.field public final synthetic c:Lv/VButton;

.field public final synthetic d:Landroid/widget/LinearLayout;

.field public final synthetic e:Landroid/view/View;

.field public final synthetic f:Z


# direct methods
.method public synthetic constructor <init>(Landroid/widget/LinearLayout;Landroid/widget/TextView;Lv/VButton;Landroid/widget/LinearLayout;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/irk;->a:Landroid/widget/LinearLayout;

    iput-object p2, p0, Ll/irk;->b:Landroid/widget/TextView;

    iput-object p3, p0, Ll/irk;->c:Lv/VButton;

    iput-object p4, p0, Ll/irk;->d:Landroid/widget/LinearLayout;

    iput-object p5, p0, Ll/irk;->e:Landroid/view/View;

    iput-boolean p6, p0, Ll/irk;->f:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/irk;->a:Landroid/widget/LinearLayout;

    iget-object v1, p0, Ll/irk;->b:Landroid/widget/TextView;

    iget-object v2, p0, Ll/irk;->c:Lv/VButton;

    iget-object v3, p0, Ll/irk;->d:Landroid/widget/LinearLayout;

    iget-object v4, p0, Ll/irk;->e:Landroid/view/View;

    iget-boolean v5, p0, Ll/irk;->f:Z

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Ll/qtk;->x(Landroid/widget/LinearLayout;Landroid/widget/TextView;Lv/VButton;Landroid/widget/LinearLayout;Landroid/view/View;ZLandroid/view/View;)V

    return-void
.end method
