.class public final synthetic Ll/v1g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Ll/z1g;


# direct methods
.method public synthetic constructor <init>(Ll/z1g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v1g;->a:Ll/z1g;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v1g;->a:Ll/z1g;

    invoke-static {p0, p1}, Ll/z1g;->j(Ll/z1g;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
