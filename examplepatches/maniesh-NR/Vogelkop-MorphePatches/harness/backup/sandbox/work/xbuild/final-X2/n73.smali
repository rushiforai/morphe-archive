.class public final Ln73;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcll;


# instance fields
.field public final synthetic a:Lo73;


# direct methods
.method public constructor <init>(Lo73;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln73;->a:Lo73;

    return-void
.end method


# virtual methods
.method public final K()V
    .registers 6

    iget-object p0, p0, Ln73;->a:Lo73;

    iget-object v0, p0, Lo73;->b:Ldkf;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Lo73;->b:Ldkf;

    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    const v3, 0x7f0406f1

    const/4 v4, 0x1

    invoke-virtual {v0, v3, v2, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v0, v2, Landroid/util/TypedValue;->resourceId:I

    invoke-static {p0, v1, v0}, Lu8n;->i(Landroid/content/Context;Landroid/content/res/Resources$Theme;I)V

    return-void
.end method
