.class public final synthetic Ll/y0r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/w0r$g;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/w0r$g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y0r;->a:Ll/w0r$g;

    iput-object p2, p0, Ll/y0r;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y0r;->a:Ll/w0r$g;

    iget-object p0, p0, Ll/y0r;->b:Landroid/view/View;

    invoke-static {v0, p0, p1}, Ll/w0r$g;->B(Ll/w0r$g;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
