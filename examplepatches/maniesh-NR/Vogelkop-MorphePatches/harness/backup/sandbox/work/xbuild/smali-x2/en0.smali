.class public final Len0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Len0;

.field public static final c:Len0;

.field public static final d:Len0;

.field public static final e:Len0;

.field public static final f:Len0;

.field public static final g:Len0;

.field public static final h:Len0;

.field public static final i:Len0;

.field public static final j:Len0;

.field public static final k:Len0;

.field public static final l:Len0;

.field public static final m:Len0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Len0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Len0;-><init>(I)V

    sput-object v0, Len0;->b:Len0;

    new-instance v0, Len0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Len0;-><init>(I)V

    sput-object v0, Len0;->c:Len0;

    new-instance v0, Len0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Len0;-><init>(I)V

    sput-object v0, Len0;->d:Len0;

    new-instance v0, Len0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Len0;-><init>(I)V

    sput-object v0, Len0;->e:Len0;

    new-instance v0, Len0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Len0;-><init>(I)V

    sput-object v0, Len0;->f:Len0;

    new-instance v0, Len0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Len0;-><init>(I)V

    sput-object v0, Len0;->g:Len0;

    new-instance v0, Len0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Len0;-><init>(I)V

    sput-object v0, Len0;->h:Len0;

    new-instance v0, Len0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Len0;-><init>(I)V

    sput-object v0, Len0;->i:Len0;

    new-instance v0, Len0;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Len0;-><init>(I)V

    sput-object v0, Len0;->j:Len0;

    new-instance v0, Len0;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Len0;-><init>(I)V

    sput-object v0, Len0;->k:Len0;

    new-instance v0, Len0;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Len0;-><init>(I)V

    sput-object v0, Len0;->l:Len0;

    new-instance v0, Len0;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Len0;-><init>(I)V

    sput-object v0, Len0;->m:Len0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Len0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Len0;->a:B

    return p0
.end method
