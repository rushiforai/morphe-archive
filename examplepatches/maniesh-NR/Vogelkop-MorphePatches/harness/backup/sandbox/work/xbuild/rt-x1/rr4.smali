.class public final Lrr4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I

.field public final c:B

.field public final d:Z

.field public final e:Z

.field public final f:Z

.field public final g:Z

.field public final h:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;IIZZIZZ)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrr4;->a:Ljava/lang/String;

    iput p2, p0, Lrr4;->b:I

    iput-byte p3, p0, Lrr4;->c:B

    iput-boolean p4, p0, Lrr4;->d:Z

    iput-boolean p5, p0, Lrr4;->e:Z

    iput-boolean p6, p0, Lrr4;->f:Z

    iput-boolean p7, p0, Lrr4;->g:Z

    iput-boolean p8, p0, Lrr4;->h:Z

    return-void
.end method

.method public static a(IILjava/lang/String;ZZI)Lrr4;
    .registers 15

    new-instance v0, Lrr4;

    const/4 v7, 0x0

    const/4 v8, 0x0

    move v2, p0

    move v3, p1

    move-object v1, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v8}, Lrr4;-><init>(Ljava/lang/String;IIZZIZZ)V

    return-object v0
.end method
