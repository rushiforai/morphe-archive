.class public final synthetic Ll/wwb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic a:Ll/gxb;


# direct methods
.method public synthetic constructor <init>(Ll/gxb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wwb;->a:Ll/gxb;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wwb;->a:Ll/gxb;

    invoke-static {p0, p1}, Ll/gxb;->e0(Ll/gxb;Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method
