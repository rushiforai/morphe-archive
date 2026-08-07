.class public final synthetic Ll/z5w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Landroid/widget/CheckBox;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Z

.field public final synthetic d:Ll/l4g0;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/CheckBox;Ll/x20;ZLl/l4g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z5w;->a:Landroid/widget/CheckBox;

    iput-object p2, p0, Ll/z5w;->b:Ll/x20;

    iput-boolean p3, p0, Ll/z5w;->c:Z

    iput-object p4, p0, Ll/z5w;->d:Ll/l4g0;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/z5w;->a:Landroid/widget/CheckBox;

    iget-object v1, p0, Ll/z5w;->b:Ll/x20;

    iget-boolean v2, p0, Ll/z5w;->c:Z

    iget-object p0, p0, Ll/z5w;->d:Ll/l4g0;

    invoke-static {v0, v1, v2, p0, p1}, Ll/c6w;->b(Landroid/widget/CheckBox;Ll/x20;ZLl/l4g0;Landroid/content/DialogInterface;)V

    return-void
.end method
