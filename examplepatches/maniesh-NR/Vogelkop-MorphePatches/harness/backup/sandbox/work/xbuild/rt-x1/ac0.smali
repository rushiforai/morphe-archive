.class public final Lac0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lac0;

.field public static final c:Lac0;

.field public static final d:Lac0;

.field public static final e:Lac0;

.field public static final f:Lac0;

.field public static final g:Lac0;

.field public static final h:Lac0;

.field public static final i:Lac0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lac0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lac0;-><init>(I)V

    sput-object v0, Lac0;->b:Lac0;

    new-instance v0, Lac0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lac0;-><init>(I)V

    sput-object v0, Lac0;->c:Lac0;

    new-instance v0, Lac0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lac0;-><init>(I)V

    sput-object v0, Lac0;->d:Lac0;

    new-instance v0, Lac0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lac0;-><init>(I)V

    sput-object v0, Lac0;->e:Lac0;

    new-instance v0, Lac0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lac0;-><init>(I)V

    sput-object v0, Lac0;->f:Lac0;

    new-instance v0, Lac0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lac0;-><init>(I)V

    sput-object v0, Lac0;->g:Lac0;

    new-instance v0, Lac0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lac0;-><init>(I)V

    sput-object v0, Lac0;->h:Lac0;

    new-instance v0, Lac0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lac0;-><init>(I)V

    sput-object v0, Lac0;->i:Lac0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lac0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lac0;->a:B

    return p0
.end method
