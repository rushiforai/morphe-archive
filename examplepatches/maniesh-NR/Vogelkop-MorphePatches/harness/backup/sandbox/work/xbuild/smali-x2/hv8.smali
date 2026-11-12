.class public final Lhv8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmv8;


# static fields
.field public static final f:Ljxh;

.field public static final g:Ljxh;


# instance fields
.field public final a:Landroid/graphics/Paint;

.field public final b:Lzyk;

.field public final c:Lzyk;

.field public final d:Lzyk;

.field public final e:Lkv8;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljxh;

    const v1, 0x7f07096c

    invoke-direct {v0, v1}, Ljxh;-><init>(I)V

    sput-object v0, Lhv8;->f:Ljxh;

    new-instance v0, Ljxh;

    const v1, 0x7f07096b

    invoke-direct {v0, v1}, Ljxh;-><init>(I)V

    sput-object v0, Lhv8;->g:Ljxh;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lhv8;->a:Landroid/graphics/Paint;

    new-instance v0, Lgv8;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lgv8;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lhv8;->b:Lzyk;

    new-instance v0, Lvg4;

    const/4 v1, 0x6

    invoke-direct {v0, p1, v1}, Lvg4;-><init>(Landroid/content/Context;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lhv8;->c:Lzyk;

    new-instance v0, Lvg4;

    const/4 v1, 0x7

    invoke-direct {v0, p1, v1}, Lvg4;-><init>(Landroid/content/Context;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lhv8;->d:Lzyk;

    sget-object p1, Lkv8;->d:Lkv8;

    iput-object p1, p0, Lhv8;->e:Lkv8;

    return-void
.end method


# virtual methods
.method public final b()Lkv8;
    .registers 1

    iget-object p0, p0, Lhv8;->e:Lkv8;

    return-object p0
.end method

.method public final c(Landroid/graphics/Canvas;IILlv8;)V
    .registers 15

    iget-object v0, p0, Lhv8;->b:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    sub-int/2addr p3, v1

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    iget-object v1, p0, Lhv8;->d:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    sub-int/2addr v0, v2

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v0, p3

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Number;

    invoke-virtual {p3}, Ljava/lang/Number;->intValue()I

    move-result p3

    add-int/2addr p3, v0

    div-int/lit8 v1, p2, 0x2

    iget-object v2, p0, Lhv8;->c:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    sub-int v3, v1, v3

    if-gez v3, :cond_47

    const/4 v3, 0x0

    :cond_47
    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v1

    if-gt v2, p2, :cond_57

    move p2, v2

    :cond_57
    iget p4, p4, Llv8;->a:I

    iget-object v9, p0, Lhv8;->a:Landroid/graphics/Paint;

    invoke-virtual {v9, p4}, Landroid/graphics/Paint;->setColor(I)V

    int-to-float v5, v3

    int-to-float v6, v0

    int-to-float v7, p2

    int-to-float v8, p3

    move-object v4, p1

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void
.end method
