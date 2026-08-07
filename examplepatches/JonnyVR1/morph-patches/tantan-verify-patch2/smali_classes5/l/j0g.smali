.class public final synthetic Ll/j0g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/l0g$a;

.field public final synthetic b:Ll/l0g;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/l0g$a;Ll/l0g;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j0g;->a:Ll/l0g$a;

    iput-object p2, p0, Ll/j0g;->b:Ll/l0g;

    iput p3, p0, Ll/j0g;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j0g;->a:Ll/l0g$a;

    iget-object v1, p0, Ll/j0g;->b:Ll/l0g;

    iget p0, p0, Ll/j0g;->c:I

    invoke-static {v0, v1, p0, p1}, Ll/l0g;->E(Ll/l0g$a;Ll/l0g;ILandroid/view/View;)V

    return-void
.end method
