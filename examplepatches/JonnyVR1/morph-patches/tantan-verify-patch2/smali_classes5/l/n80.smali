.class public final synthetic Ll/n80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic a:Ll/q80;


# direct methods
.method public synthetic constructor <init>(Ll/q80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n80;->a:Ll/q80;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n80;->a:Ll/q80;

    invoke-static {p0, p1}, Ll/q80;->f0(Ll/q80;Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method
