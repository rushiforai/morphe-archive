.class public final synthetic Ll/x9f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/aaf;

.field public final synthetic b:Landroid/widget/ImageButton;

.field public final synthetic c:Landroid/widget/ImageButton;


# direct methods
.method public synthetic constructor <init>(Ll/aaf;Landroid/widget/ImageButton;Landroid/widget/ImageButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x9f;->a:Ll/aaf;

    iput-object p2, p0, Ll/x9f;->b:Landroid/widget/ImageButton;

    iput-object p3, p0, Ll/x9f;->c:Landroid/widget/ImageButton;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x9f;->a:Ll/aaf;

    iget-object v1, p0, Ll/x9f;->b:Landroid/widget/ImageButton;

    iget-object p0, p0, Ll/x9f;->c:Landroid/widget/ImageButton;

    invoke-static {v0, v1, p0, p1}, Ll/aaf;->j(Ll/aaf;Landroid/widget/ImageButton;Landroid/widget/ImageButton;Landroid/view/View;)V

    return-void
.end method
