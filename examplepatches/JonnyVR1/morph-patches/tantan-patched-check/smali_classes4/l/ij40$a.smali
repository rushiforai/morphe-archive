.class public Ll/ij40$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ij40;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field public static final h:I

.field public static final i:I

.field public static final j:I

.field public static final k:I


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

.field public b:Ljava/lang/String;

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:Landroid/graphics/Typeface;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/agc0;->B:I

    .line 2
    .line 3
    sput v0, Ll/ij40$a;->h:I

    .line 4
    .line 5
    sget v0, Ll/agc0;->C:I

    .line 6
    .line 7
    sput v0, Ll/ij40$a;->i:I

    .line 8
    .line 9
    sget v0, Ll/c9c0;->n:I

    .line 10
    .line 11
    sput v0, Ll/ij40$a;->j:I

    .line 12
    .line 13
    sget v0, Ll/c9c0;->p0:I

    .line 14
    .line 15
    sput v0, Ll/ij40$a;->k:I

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/ij40$a;->j:I

    .line 5
    .line 6
    iput v0, p0, Ll/ij40$a;->c:I

    .line 7
    .line 8
    sget v0, Ll/ij40$a;->k:I

    .line 9
    .line 10
    iput v0, p0, Ll/ij40$a;->d:I

    .line 11
    .line 12
    sget v0, Ll/ij40$a;->h:I

    .line 13
    .line 14
    iput v0, p0, Ll/ij40$a;->e:I

    .line 15
    .line 16
    sget v0, Ll/ij40$a;->i:I

    .line 17
    .line 18
    iput v0, p0, Ll/ij40$a;->f:I

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Ll/ij40$a;->g:Landroid/graphics/Typeface;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public a()Ll/ij40;
    .locals 8

    .line 1
    new-instance v0, Ll/ij40;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ij40$a;->a:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ij40$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iget v3, p0, Ll/ij40$a;->c:I

    .line 8
    .line 9
    iget v4, p0, Ll/ij40$a;->d:I

    .line 10
    .line 11
    iget v5, p0, Ll/ij40$a;->e:I

    .line 12
    .line 13
    iget v6, p0, Ll/ij40$a;->f:I

    .line 14
    .line 15
    iget-object v7, p0, Ll/ij40$a;->g:Landroid/graphics/Typeface;

    .line 16
    .line 17
    invoke-direct/range {v0 .. v7}, Ll/ij40;-><init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;IIIILandroid/graphics/Typeface;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public b(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Ll/ij40$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ij40$a;->a:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/lang/String;)Ll/ij40$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ij40$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(I)Ll/ij40$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/ij40$a;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public e(I)Ll/ij40$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/ij40$a;->d:I

    .line 2
    .line 3
    return-object p0
.end method
