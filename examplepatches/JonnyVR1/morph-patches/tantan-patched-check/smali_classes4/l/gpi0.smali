.class public final synthetic Ll/gpi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ipi0;


# direct methods
.method public synthetic constructor <init>(Ll/ipi0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gpi0;->a:Ll/ipi0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gpi0;->a:Ll/ipi0;

    invoke-static {p0, p1}, Ll/ipi0;->c(Ll/ipi0;Landroid/view/View;)V

    return-void
.end method
