.class public final Ll/sjm$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/sjm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000T\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J)\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000c\u001a\u00020\u000b2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u0017\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0019\u0010\u0017\u001a\u0004\u0018\u00010\u00162\u0006\u0010\u0015\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u001f\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u0015\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\u001a\u0010\u001bR*\u0010\u001e\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001c8\u0006@BX\u0087\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001e\u0010\u001f\u0012\u0004\u0008\"\u0010\u0003\u001a\u0004\u0008 \u0010!\u00a8\u0006#"
    }
    d2 = {
        "Ll/sjm$b;",
        "",
        "<init>",
        "()V",
        "Landroid/content/Context;",
        "context",
        "Ll/sjm$a;",
        "i",
        "(Landroid/content/Context;)Ll/sjm$a;",
        "Ll/uup0;",
        "webpBitmapFactory",
        "Ll/ujm;",
        "imagePipelineExperiments",
        "Ll/p13;",
        "bitmapCreator",
        "",
        "j",
        "(Ll/uup0;Ll/ujm;Ll/p13;)V",
        "Ll/b4e;",
        "f",
        "(Landroid/content/Context;)Ll/b4e;",
        "builder",
        "Ll/xkm;",
        "g",
        "(Ll/sjm$a;)Ll/xkm;",
        "",
        "h",
        "(Ll/sjm$a;Ll/ujm;)I",
        "Ll/sjm$c;",
        "value",
        "defaultImageRequestConfig",
        "Ll/sjm$c;",
        "e",
        "()Ll/sjm$c;",
        "getDefaultImageRequestConfig$annotations",
        "imagepipeline_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/sjm$b;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic a(Ll/sjm$b;Landroid/content/Context;)Ll/b4e;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sjm$b;->f(Landroid/content/Context;)Ll/b4e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic b(Ll/sjm$b;Ll/sjm$a;)Ll/xkm;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sjm$b;->g(Ll/sjm$a;)Ll/xkm;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic c(Ll/sjm$b;Ll/sjm$a;Ll/ujm;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sjm$b;->h(Ll/sjm$a;Ll/ujm;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic d(Ll/sjm$b;Ll/uup0;Ll/ujm;Ll/p13;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/sjm$b;->j(Ll/uup0;Ll/ujm;Ll/p13;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final e()Ll/sjm$c;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {}, Ll/sjm;->I()Ll/sjm$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final f(Landroid/content/Context;)Ll/b4e;
    .locals 0

    .line 1
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/b4e;->m(Landroid/content/Context;)Ll/b4e$b;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/b4e$b;->n()Ll/b4e;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p0, "DiskCacheConfig.getDefaultMainDiskCacheConfig"

    .line 17
    .line 18
    invoke-static {p0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :try_start_0
    invoke-static {p1}, Ll/b4e;->m(Landroid/content/Context;)Ll/b4e$b;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/b4e$b;->n()Ll/b4e;

    .line 26
    .line 27
    .line 28
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    invoke-static {}, Ll/i9j;->b()V

    .line 30
    .line 31
    .line 32
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    return-object p0

    .line 36
    :catchall_0
    move-exception p0

    .line 37
    invoke-static {}, Ll/i9j;->b()V

    .line 38
    .line 39
    .line 40
    throw p0
.end method

.method public final g(Ll/sjm$a;)Ll/xkm;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/sjm$a;->B()Ll/xkm;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/sjm$a;->C()Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p0, "You can\'t define a custom ImageTranscoderFactory and provide an ImageTranscoderType"

    .line 15
    .line 16
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0

    .line 21
    :cond_1
    :goto_0
    invoke-virtual {p1}, Ll/sjm$a;->B()Ll/xkm;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final h(Ll/sjm$a;Ll/ujm;)I
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/sjm$a;->E()Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-virtual {p2}, Ll/ujm;->n()J

    .line 13
    .line 14
    .line 15
    move-result-wide p0

    .line 16
    const-wide/16 v0, 0x2

    .line 17
    .line 18
    cmp-long p0, p0, v0

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 23
    .line 24
    const/16 p1, 0x1b

    .line 25
    .line 26
    if-lt p0, p1, :cond_1

    .line 27
    .line 28
    const/4 p0, 0x2

    .line 29
    return p0

    .line 30
    :cond_1
    invoke-virtual {p2}, Ll/ujm;->n()J

    .line 31
    .line 32
    .line 33
    move-result-wide p0

    .line 34
    const-wide/16 v0, 0x1

    .line 35
    .line 36
    cmp-long p0, p0, v0

    .line 37
    .line 38
    if-nez p0, :cond_2

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_2
    invoke-virtual {p2}, Ll/ujm;->n()J

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method public final i(Landroid/content/Context;)Ll/sjm$a;
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance p0, Ll/sjm$a;

    .line 5
    .line 6
    invoke-direct {p0, p1}, Ll/sjm$a;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public final j(Ll/uup0;Ll/ujm;Ll/p13;)V
    .locals 0

    .line 1
    sput-object p1, Ll/vup0;->b:Ll/uup0;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/ujm;->A()Ll/uup0$a;

    .line 4
    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    invoke-interface {p1, p3}, Ll/uup0;->a(Ll/p13;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
