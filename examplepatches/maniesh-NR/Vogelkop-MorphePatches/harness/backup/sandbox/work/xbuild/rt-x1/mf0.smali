.class public final Lmf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lmf0;

.field public static final c:Lmf0;

.field public static final d:Lmf0;

.field public static final e:Lmf0;

.field public static final f:Lmf0;

.field public static final g:Lmf0;

.field public static final h:Lmf0;

.field public static final i:Lmf0;

.field public static final j:Lmf0;

.field public static final k:Lmf0;

.field public static final l:Lmf0;

.field public static final m:Lmf0;

.field public static final n:Lmf0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lmf0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lmf0;-><init>(I)V

    sput-object v0, Lmf0;->b:Lmf0;

    new-instance v0, Lmf0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lmf0;-><init>(I)V

    sput-object v0, Lmf0;->c:Lmf0;

    new-instance v0, Lmf0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lmf0;-><init>(I)V

    sput-object v0, Lmf0;->d:Lmf0;

    new-instance v0, Lmf0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lmf0;-><init>(I)V

    sput-object v0, Lmf0;->e:Lmf0;

    new-instance v0, Lmf0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lmf0;-><init>(I)V

    sput-object v0, Lmf0;->f:Lmf0;

    new-instance v0, Lmf0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lmf0;-><init>(I)V

    sput-object v0, Lmf0;->g:Lmf0;

    new-instance v0, Lmf0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lmf0;-><init>(I)V

    sput-object v0, Lmf0;->h:Lmf0;

    new-instance v0, Lmf0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lmf0;-><init>(I)V

    sput-object v0, Lmf0;->i:Lmf0;

    new-instance v0, Lmf0;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lmf0;-><init>(I)V

    sput-object v0, Lmf0;->j:Lmf0;

    new-instance v0, Lmf0;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lmf0;-><init>(I)V

    sput-object v0, Lmf0;->k:Lmf0;

    new-instance v0, Lmf0;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lmf0;-><init>(I)V

    sput-object v0, Lmf0;->l:Lmf0;

    new-instance v0, Lmf0;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lmf0;-><init>(I)V

    sput-object v0, Lmf0;->m:Lmf0;

    new-instance v0, Lmf0;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lmf0;-><init>(I)V

    sput-object v0, Lmf0;->n:Lmf0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lmf0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lmf0;->a:B

    return p0
.end method
