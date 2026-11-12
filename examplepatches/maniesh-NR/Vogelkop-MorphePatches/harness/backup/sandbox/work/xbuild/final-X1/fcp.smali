.class public abstract Lfcp;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lzyk;

.field public static final b:Z

.field public static volatile c:Lc30;

.field public static volatile d:Ljava/lang/Boolean;

.field public static final e:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lxvo;->s:Lxvo;

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    sput-object v0, Lfcp;->a:Lzyk;

    const/4 v0, 0x1

    sput-boolean v0, Lfcp;->b:Z

    sget-object v0, Lxvo;->r:Lxvo;

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    sput-object v0, Lfcp;->e:Lzyk;

    return-void
.end method

.method public static final a(Lcn;)Lkotlin/Unit;
    .registers 3

    sget-boolean v0, Lfcp;->b:Z

    if-nez v0, :cond_f

    new-instance v0, Lxbp;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lxbp;-><init>(Lcn;B)V

    invoke-static {v0}, Lpfp;->a(Ljava/lang/Runnable;)V

    const/4 p0, 0x0

    return-object p0

    :cond_f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public static final b(Lcn;Landroid/content/Context;)Lkotlin/Unit;
    .registers 3

    invoke-static {p1}, Lfcp;->e(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_11

    new-instance p1, Lxbp;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Lxbp;-><init>(Lcn;B)V

    invoke-static {p1}, Lpfp;->a(Ljava/lang/Runnable;)V

    const/4 p0, 0x0

    return-object p0

    :cond_11
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public static final c(Lcn;Ljava/lang/String;)Lkotlin/Unit;
    .registers 3

    if-eqz p1, :cond_b

    invoke-static {p1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_b

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_b
    new-instance p1, Lxbp;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lxbp;-><init>(Lcn;B)V

    invoke-static {p1}, Lpfp;->a(Ljava/lang/Runnable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static final d()Lrpb;
    .registers 1

    sget-object v0, Lfcp;->e:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrpb;

    return-object v0
.end method

.method public static final e(Landroid/content/Context;)Z
    .registers 5

    sget-object v0, Ltlp;->a:Ljava/util/Set;

    const/4 v0, 0x0

    const/4 v1, 0x1

    :try_start_4
    sget-object v2, Lt0i;->b:Lp0i;

    invoke-static {p0}, Landroidx/webkit/WebViewCompat;->getCurrentWebViewPackage(Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    move-result-object p0

    if-eqz p0, :cond_e

    move p0, v1

    goto :goto_f

    :cond_e
    move p0, v0

    :goto_f
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0
    :try_end_13
    .catchall {:try_start_4 .. :try_end_13} :catchall_14

    goto :goto_1d

    :catchall_14
    move-exception p0

    sget-object v2, Lt0i;->b:Lp0i;

    new-instance v2, Lq0i;

    invoke-direct {v2, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p0, v2

    :goto_1d
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    instance-of v3, p0, Lq0i;

    if-eqz v3, :cond_24

    move-object p0, v2

    :cond_24
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_49

    sget-object p0, Llah;->b:Ljava/lang/String;

    if-eqz p0, :cond_48

    const-string v2, "."

    invoke-static {p0, v2}, Lkotlin/text/StringsKt;->h0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_3d

    invoke-static {p0}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_3e

    :cond_3d
    const/4 p0, 0x0

    :goto_3e
    if-eqz p0, :cond_49

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    const/16 v2, 0x3f

    if-lt p0, v2, :cond_49

    :cond_48
    return v1

    :cond_49
    return v0
.end method

.method public static final f()Ljava/lang/String;
    .registers 1

    sget-object v0, Lfcp;->a:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method
