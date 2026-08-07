.class public final synthetic Ll/nrm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Ll/qrm0;


# direct methods
.method public synthetic constructor <init>(Ll/qrm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nrm0;->a:Ll/qrm0;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nrm0;->a:Ll/qrm0;

    invoke-static {p0, p1}, Ll/qrm0;->K3(Ll/qrm0;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
