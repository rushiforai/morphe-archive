.class public final synthetic Ll/hef;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Ll/ief;


# direct methods
.method public synthetic constructor <init>(Ll/ief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hef;->a:Ll/ief;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hef;->a:Ll/ief;

    invoke-static {p0, p1}, Ll/ief;->S(Ll/ief;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
