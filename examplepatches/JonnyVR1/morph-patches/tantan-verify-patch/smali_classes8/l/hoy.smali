.class public final synthetic Ll/hoy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/loy;


# direct methods
.method public synthetic constructor <init>(Ll/loy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hoy;->a:Ll/loy;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hoy;->a:Ll/loy;

    invoke-static {p0, p1}, Ll/loy;->B(Ll/loy;Landroid/view/View;)V

    return-void
.end method
