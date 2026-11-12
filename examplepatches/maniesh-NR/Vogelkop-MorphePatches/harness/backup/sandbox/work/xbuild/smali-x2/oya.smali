.class public abstract Loya;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/HashSet;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Loya;->a:Ljava/util/HashSet;

    return-void
.end method

.method public static a(Lnya;)V
    .registers 2

    sget-object v0, Lyne;->b:Ldeg;

    invoke-virtual {v0, p0}, Ldeg;->b(Lacl;)V

    sget-object v0, Loya;->a:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public static b(Ljava/lang/String;IIIILmya;)Lnya;
    .registers 10

    new-instance v0, Lnya;

    invoke-direct {v0, p5}, Lnya;-><init>(Lmya;)V

    const-string p5, "/"

    invoke-virtual {p0, p5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p5

    if-eqz p5, :cond_19

    sget-object p5, Lyne;->b:Ldeg;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p5, v1}, Ldeg;->h(Ljava/io/File;)Ldwh;

    move-result-object p0

    goto :goto_1f

    :cond_19
    sget-object p5, Lyne;->b:Ldeg;

    invoke-virtual {p5, p0}, Ldeg;->i(Ljava/lang/String;)Ldwh;

    move-result-object p0

    :goto_1f
    and-int/lit16 p5, p3, 0x1000

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eqz p5, :cond_2a

    new-array p5, v2, [I

    invoke-virtual {p0, v1, p5}, Ldwh;->h(I[I)V

    :cond_2a
    and-int/lit16 p3, p3, 0x4000

    const/4 p5, 0x3

    if-eqz p3, :cond_34

    new-array p3, v2, [I

    invoke-virtual {p0, p5, p3}, Ldwh;->i(I[I)V

    :cond_34
    const/16 p3, -0xa

    const/4 v3, 0x1

    if-gt p4, p3, :cond_3d

    invoke-virtual {p0, v3}, Ldwh;->l(I)V

    goto :goto_48

    :cond_3d
    const/16 p3, 0xa

    if-gt p4, p3, :cond_45

    invoke-virtual {p0, v1}, Ldwh;->l(I)V

    goto :goto_48

    :cond_45
    invoke-virtual {p0, p5}, Ldwh;->l(I)V

    :goto_48
    if-gtz p1, :cond_4c

    if-lez p2, :cond_63

    :cond_4c
    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    move-result p3

    invoke-static {v2, p2}, Ljava/lang/Math;->max(II)I

    move-result p4

    iget-object p5, p0, Ldwh;->b:Lgvh;

    invoke-virtual {p5, p3, p4}, Lgvh;->b(II)V

    if-lez p1, :cond_60

    if-lez p2, :cond_60

    invoke-virtual {p0}, Ldwh;->a()V

    :cond_60
    invoke-virtual {p0}, Ldwh;->j()V

    :cond_63
    sget-object p1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p0, p1}, Ldwh;->c(Landroid/graphics/Bitmap$Config;)V

    invoke-virtual {p0, v0}, Ldwh;->f(Lacl;)V

    iget-boolean p0, v0, Lnya;->c:Z

    if-eqz p0, :cond_71

    const/4 p0, 0x0

    return-object p0

    :cond_71
    iput-boolean v3, v0, Lnya;->b:Z

    sget-object p0, Loya;->a:Ljava/util/HashSet;

    invoke-virtual {p0, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
