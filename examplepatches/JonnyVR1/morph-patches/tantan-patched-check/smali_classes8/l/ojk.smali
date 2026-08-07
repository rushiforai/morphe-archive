.class public final synthetic Ll/ojk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Ll/sjk;


# direct methods
.method public synthetic constructor <init>(Ll/sjk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ojk;->a:Ll/sjk;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ojk;->a:Ll/sjk;

    invoke-static {p0, p1}, Ll/sjk;->j(Ll/sjk;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
