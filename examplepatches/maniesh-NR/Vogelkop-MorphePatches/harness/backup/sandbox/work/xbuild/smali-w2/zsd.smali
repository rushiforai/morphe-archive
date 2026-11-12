.class public final Lzsd;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Lzsd;


# instance fields
.field public final a:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lzsd;

    invoke-direct {v0}, Lzsd;-><init>()V

    sput-object v0, Lzsd;->b:Lzsd;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lzsd;->a:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 3

    const/16 v0, 0x14

    if-eq p1, v0, :cond_1e

    const/16 v0, 0x50

    if-lt p1, v0, :cond_d

    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lzsd;->b(I)V

    return-void

    :cond_d
    const/16 v0, 0xf

    if-lt p1, v0, :cond_16

    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lzsd;->b(I)V

    return-void

    :cond_16
    const/16 v0, 0xa

    if-lt p1, v0, :cond_1e

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lzsd;->b(I)V

    :cond_1e
    return-void
.end method

.method public final b(I)V
    .registers 5

    iget-object p0, p0, Lzsd;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_15

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lysd;

    invoke-interface {v2, p1}, Lysd;->l(I)V

    goto :goto_7

    :cond_15
    return-void
.end method
