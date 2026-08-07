.class public final synthetic Ll/i1r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/w0r$j;

.field public final synthetic b:Ll/oze$a;


# direct methods
.method public synthetic constructor <init>(Ll/w0r$j;Ll/oze$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i1r;->a:Ll/w0r$j;

    iput-object p2, p0, Ll/i1r;->b:Ll/oze$a;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i1r;->a:Ll/w0r$j;

    iget-object p0, p0, Ll/i1r;->b:Ll/oze$a;

    invoke-static {v0, p0, p1}, Ll/w0r$j;->y(Ll/w0r$j;Ll/oze$a;Landroid/view/View;)V

    return-void
.end method
