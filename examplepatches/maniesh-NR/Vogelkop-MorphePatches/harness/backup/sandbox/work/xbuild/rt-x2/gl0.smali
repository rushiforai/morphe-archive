.class public final Lgl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lgl0;

.field public static final c:Lgl0;

.field public static final d:Lgl0;

.field public static final e:Lgl0;

.field public static final f:Lgl0;

.field public static final g:Lgl0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lgl0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lgl0;-><init>(I)V

    sput-object v0, Lgl0;->b:Lgl0;

    new-instance v0, Lgl0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lgl0;-><init>(I)V

    sput-object v0, Lgl0;->c:Lgl0;

    new-instance v0, Lgl0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lgl0;-><init>(I)V

    sput-object v0, Lgl0;->d:Lgl0;

    new-instance v0, Lgl0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lgl0;-><init>(I)V

    sput-object v0, Lgl0;->e:Lgl0;

    new-instance v0, Lgl0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lgl0;-><init>(I)V

    sput-object v0, Lgl0;->f:Lgl0;

    new-instance v0, Lgl0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lgl0;-><init>(I)V

    sput-object v0, Lgl0;->g:Lgl0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lgl0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lgl0;->a:B

    return p0
.end method
