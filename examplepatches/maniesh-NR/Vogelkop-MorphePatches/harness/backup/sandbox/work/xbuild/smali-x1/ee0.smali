.class public final Lee0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lee0;

.field public static final c:Lee0;

.field public static final d:Lee0;

.field public static final e:Lee0;

.field public static final f:Lee0;

.field public static final g:Lee0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lee0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lee0;-><init>(I)V

    sput-object v0, Lee0;->b:Lee0;

    new-instance v0, Lee0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lee0;-><init>(I)V

    sput-object v0, Lee0;->c:Lee0;

    new-instance v0, Lee0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lee0;-><init>(I)V

    sput-object v0, Lee0;->d:Lee0;

    new-instance v0, Lee0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lee0;-><init>(I)V

    sput-object v0, Lee0;->e:Lee0;

    new-instance v0, Lee0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lee0;-><init>(I)V

    sput-object v0, Lee0;->f:Lee0;

    new-instance v0, Lee0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lee0;-><init>(I)V

    sput-object v0, Lee0;->g:Lee0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lee0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lee0;->a:B

    return p0
.end method
