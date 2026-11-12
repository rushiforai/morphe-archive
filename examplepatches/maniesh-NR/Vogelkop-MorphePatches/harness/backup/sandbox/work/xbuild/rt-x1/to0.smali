.class public final Lto0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lto0;

.field public static final c:Lto0;

.field public static final d:Lto0;

.field public static final e:Lto0;

.field public static final f:Lto0;

.field public static final g:Lto0;

.field public static final h:Lto0;

.field public static final i:Lto0;

.field public static final j:Lto0;

.field public static final k:Lto0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lto0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lto0;-><init>(I)V

    sput-object v0, Lto0;->b:Lto0;

    new-instance v0, Lto0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lto0;-><init>(I)V

    sput-object v0, Lto0;->c:Lto0;

    new-instance v0, Lto0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lto0;-><init>(I)V

    sput-object v0, Lto0;->d:Lto0;

    new-instance v0, Lto0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lto0;-><init>(I)V

    sput-object v0, Lto0;->e:Lto0;

    new-instance v0, Lto0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lto0;-><init>(I)V

    sput-object v0, Lto0;->f:Lto0;

    new-instance v0, Lto0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lto0;-><init>(I)V

    sput-object v0, Lto0;->g:Lto0;

    new-instance v0, Lto0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lto0;-><init>(I)V

    sput-object v0, Lto0;->h:Lto0;

    new-instance v0, Lto0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lto0;-><init>(I)V

    sput-object v0, Lto0;->i:Lto0;

    new-instance v0, Lto0;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lto0;-><init>(I)V

    sput-object v0, Lto0;->j:Lto0;

    new-instance v0, Lto0;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lto0;-><init>(I)V

    sput-object v0, Lto0;->k:Lto0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lto0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lto0;->a:B

    return p0
.end method
