.class public final synthetic Ll/wu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/zu;

.field public final synthetic b:I

.field public final synthetic c:Ll/zu$b;


# direct methods
.method public synthetic constructor <init>(Ll/zu;ILl/zu$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wu;->a:Ll/zu;

    iput p2, p0, Ll/wu;->b:I

    iput-object p3, p0, Ll/wu;->c:Ll/zu$b;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wu;->a:Ll/zu;

    iget v1, p0, Ll/wu;->b:I

    iget-object p0, p0, Ll/wu;->c:Ll/zu$b;

    invoke-static {v0, v1, p0, p1}, Ll/zu;->A(Ll/zu;ILl/zu$b;Landroid/view/View;)V

    return-void
.end method
