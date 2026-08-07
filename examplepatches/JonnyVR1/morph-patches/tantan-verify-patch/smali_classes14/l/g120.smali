.class public final synthetic Ll/g120;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/i120;

.field public final synthetic b:Z

.field public final synthetic c:Ll/w020;


# direct methods
.method public synthetic constructor <init>(Ll/i120;ZLl/w020;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g120;->a:Ll/i120;

    iput-boolean p2, p0, Ll/g120;->b:Z

    iput-object p3, p0, Ll/g120;->c:Ll/w020;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g120;->a:Ll/i120;

    iget-boolean v1, p0, Ll/g120;->b:Z

    iget-object p0, p0, Ll/g120;->c:Ll/w020;

    invoke-static {v0, v1, p0, p1}, Ll/i120;->b(Ll/i120;ZLl/w020;Landroid/view/View;)V

    return-void
.end method
