.class public final synthetic Ll/sya0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Ll/tya0;


# direct methods
.method public synthetic constructor <init>(Ll/tya0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sya0;->a:Ll/tya0;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sya0;->a:Ll/tya0;

    invoke-static {p0, p1}, Ll/tya0;->R(Ll/tya0;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
