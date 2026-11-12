.class public abstract Lg1o;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:B

.field public final f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;IIIII)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lg1o;->a:I

    iput p3, p0, Lg1o;->b:I

    iput p4, p0, Lg1o;->c:I

    iput p5, p0, Lg1o;->d:I

    iput-byte p6, p0, Lg1o;->e:B

    iput-object p1, p0, Lg1o;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f141407

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public b()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public c()I
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public d()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method
