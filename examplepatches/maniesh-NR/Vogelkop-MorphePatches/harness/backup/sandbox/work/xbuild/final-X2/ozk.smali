.class public abstract Lozk;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/Set;


# direct methods
.method static constructor <clinit>()V
    .registers 20

    const-string v18, "vi"

    const-string v19, "zh"

    const-string v1, "ar"

    const-string v2, "be"

    const-string v3, "bg"

    const-string v4, "bn"

    const-string v5, "el"

    const-string v6, "fa"

    const-string v7, "he"

    const-string v8, "hi"

    const-string v9, "ja"

    const-string v10, "ko"

    const-string v11, "mu"

    const-string v12, "ru"

    const-string v13, "si"

    const-string v14, "ta"

    const-string v15, "th"

    const-string v16, "uk"

    const-string v17, "ur"

    filled-new-array/range {v1 .. v19}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lozk;->a:Ljava/util/Set;

    return-void
.end method

.method public static final a(Landroid/content/res/Resources$Theme;Z)V
    .registers 3

    if-nez p1, :cond_19

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lozk;->a:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_19

    const p1, 0x7f150696

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    :cond_19
    return-void
.end method

.method public static final b(Landroid/content/Context;)Z
    .registers 4

    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p0

    const v1, 0x7f040971

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p0

    if-eqz p0, :cond_18

    iget p0, v0, Landroid/util/TypedValue;->resourceId:I

    if-nez p0, :cond_18

    return v2

    :cond_18
    const/4 p0, 0x0

    return p0
.end method
