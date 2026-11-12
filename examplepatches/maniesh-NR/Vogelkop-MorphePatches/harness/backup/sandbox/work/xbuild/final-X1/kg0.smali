.class public final Lkg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lkg0;

.field public static final c:Lkg0;

.field public static final d:Lkg0;

.field public static final e:Lkg0;

.field public static final f:Lkg0;

.field public static final g:Lkg0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkg0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkg0;-><init>(I)V

    sput-object v0, Lkg0;->b:Lkg0;

    new-instance v0, Lkg0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lkg0;-><init>(I)V

    sput-object v0, Lkg0;->c:Lkg0;

    new-instance v0, Lkg0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lkg0;-><init>(I)V

    sput-object v0, Lkg0;->d:Lkg0;

    new-instance v0, Lkg0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lkg0;-><init>(I)V

    sput-object v0, Lkg0;->e:Lkg0;

    new-instance v0, Lkg0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lkg0;-><init>(I)V

    sput-object v0, Lkg0;->f:Lkg0;

    new-instance v0, Lkg0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lkg0;-><init>(I)V

    sput-object v0, Lkg0;->g:Lkg0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lkg0;->a:B

    return-void
.end method

.method public static final a(I)Lkg0;
    .registers 2

    if-eqz p0, :cond_25

    const/4 v0, 0x1

    if-eq p0, v0, :cond_22

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1f

    const/4 v0, 0x3

    if-eq p0, v0, :cond_1c

    const/4 v0, 0x4

    if-eq p0, v0, :cond_19

    const/4 v0, 0x5

    if-ne p0, v0, :cond_14

    sget-object p0, Lkg0;->g:Lkg0;

    return-object p0

    :cond_14
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :cond_19
    sget-object p0, Lkg0;->f:Lkg0;

    return-object p0

    :cond_1c
    sget-object p0, Lkg0;->e:Lkg0;

    return-object p0

    :cond_1f
    sget-object p0, Lkg0;->d:Lkg0;

    return-object p0

    :cond_22
    sget-object p0, Lkg0;->c:Lkg0;

    return-object p0

    :cond_25
    sget-object p0, Lkg0;->b:Lkg0;

    return-object p0
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lkg0;->a:B

    return p0
.end method
