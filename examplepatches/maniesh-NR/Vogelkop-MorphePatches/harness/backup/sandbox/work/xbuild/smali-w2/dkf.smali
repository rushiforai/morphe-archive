.class public Ldkf;
.super Landroid/view/ContextThemeWrapper;
.source "SourceFile"


# instance fields
.field public final a:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-static {p1}, Lozk;->b(Landroid/content/Context;)Z

    move-result p1

    iput-boolean p1, p0, Ldkf;->a:Z

    return-void
.end method


# virtual methods
.method public final onApplyThemeResource(Landroid/content/res/Resources$Theme;IZ)V
    .registers 4

    invoke-super {p0, p1, p2, p3}, Landroid/view/ContextThemeWrapper;->onApplyThemeResource(Landroid/content/res/Resources$Theme;IZ)V

    iget-boolean p0, p0, Ldkf;->a:Z

    invoke-static {p1, p0}, Lozk;->a(Landroid/content/res/Resources$Theme;Z)V

    return-void
.end method
