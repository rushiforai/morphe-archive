.class public final synthetic Ll/vjf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic a:Ll/rkf0;


# direct methods
.method public synthetic constructor <init>(Ll/rkf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vjf0;->a:Ll/rkf0;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vjf0;->a:Ll/rkf0;

    invoke-static {p0, p1}, Ll/rkf0;->l(Ll/rkf0;Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method
