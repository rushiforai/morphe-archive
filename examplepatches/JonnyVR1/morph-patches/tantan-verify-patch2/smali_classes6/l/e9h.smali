.class public final synthetic Ll/e9h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Ll/g9h;


# direct methods
.method public synthetic constructor <init>(Ll/g9h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e9h;->a:Ll/g9h;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e9h;->a:Ll/g9h;

    invoke-static {p0, p1}, Ll/g9h;->c(Ll/g9h;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
