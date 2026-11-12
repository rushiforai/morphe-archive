.class public final Lhrj;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final f:I


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lgrj;

.field public final c:I

.field public d:Lsc;

.field public e:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    sget-object v0, Lfrj;->d:Ldrj;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lfrj;->i:Lh58;

    invoke-virtual {v0}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfrj;

    iget-byte v2, v2, Lfrj;->c:B

    or-int/2addr v1, v2

    goto :goto_c

    :cond_1c
    sput v1, Lhrj;->f:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lgrj;I)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhrj;->a:Landroid/content/Context;

    iput-object p2, p0, Lhrj;->b:Lgrj;

    iput p3, p0, Lhrj;->c:I

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Lbrj;
    .registers 5

    const v0, 0x7f1404d6

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    iget-object p0, p0, Lhrj;->a:Landroid/content/Context;

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/opera/android/IntentDispatcherActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    sget-object v1, Lp6l;->a:Lp6l;

    const/4 v1, 0x0

    const/16 v2, 0x8

    invoke-static {p1, v1, v2}, Leti;->a(Ljava/lang/String;Lshf;I)Lorg/chromium/url/GURL;

    move-result-object p1

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object p1

    new-instance v0, Lbrj;

    const v1, 0x7f1404d5

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f0804ab

    invoke-static {v2, p0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-direct {v0, p1, v1, p0}, Lsc;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method public final b(Ljava/lang/String;)Lcrj;
    .registers 9

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    sget-object v0, Lfrj;->d:Ldrj;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Laik;->a:[Ljava/lang/String;

    if-nez v0, :cond_13

    const-string v0, ""

    :cond_13
    const-string v1, "geo"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1e

    sget-object v0, Lfrj;->g:Lerj;

    goto :goto_36

    :cond_1e
    const-string v1, "tel"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_29

    sget-object v0, Lfrj;->f:Lfrj;

    goto :goto_36

    :cond_29
    const-string v1, "mailto"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_34

    sget-object v0, Lfrj;->e:Lfrj;

    goto :goto_36

    :cond_34
    sget-object v0, Lfrj;->g:Lerj;

    :goto_36
    iget v1, v0, Lfrj;->b:I

    iget-object p0, p0, Lhrj;->a:Landroid/content/Context;

    invoke-virtual {v0, p0, p1}, Lfrj;->d(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object p1

    sget-object v2, Lfrj;->g:Lerj;

    if-ne v0, v2, :cond_53

    new-instance v2, Lcrj;

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v3, 0x7f0804ab

    invoke-static {v3, p0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-direct {v2, p1, v1, p0, v0}, Lcrj;-><init>(Landroid/content/Intent;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Lfrj;)V

    return-object v2

    :cond_53
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v3

    const/4 v4, 0x0

    if-eqz v3, :cond_93

    iget-object v5, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v5, :cond_93

    iget-object v5, v5, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    const-string v6, "android"

    invoke-virtual {v6, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_77

    new-instance v2, Lcrj;

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, p1, p0, v4, v0}, Lcrj;-><init>(Landroid/content/Intent;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Lfrj;)V

    return-object v2

    :cond_77
    new-instance p0, Lcrj;

    iget-object v1, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageItemInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v4, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    invoke-virtual {v4, v2}, Landroid/content/pm/PackageItemInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-nez v4, :cond_8f

    invoke-virtual {v3, v2}, Landroid/content/pm/ResolveInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    :cond_8f
    invoke-direct {p0, p1, v1, v4, v0}, Lcrj;-><init>(Landroid/content/Intent;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Lfrj;)V

    return-object p0

    :cond_93
    return-object v4
.end method
