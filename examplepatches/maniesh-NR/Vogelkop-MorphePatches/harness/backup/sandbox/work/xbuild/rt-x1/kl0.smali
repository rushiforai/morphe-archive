.class public final Lkl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lkl0;

.field public static final c:Lkl0;

.field public static final d:Lkl0;

.field public static final e:Lkl0;

.field public static final f:Lkl0;

.field public static final g:Lkl0;

.field public static final h:Lkl0;

.field public static final i:Lkl0;

.field public static final j:Lkl0;

.field public static final k:Lkl0;

.field public static final l:Lkl0;

.field public static final m:Lkl0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkl0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkl0;-><init>(I)V

    sput-object v0, Lkl0;->b:Lkl0;

    new-instance v0, Lkl0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lkl0;-><init>(I)V

    sput-object v0, Lkl0;->c:Lkl0;

    new-instance v0, Lkl0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lkl0;-><init>(I)V

    sput-object v0, Lkl0;->d:Lkl0;

    new-instance v0, Lkl0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lkl0;-><init>(I)V

    sput-object v0, Lkl0;->e:Lkl0;

    new-instance v0, Lkl0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lkl0;-><init>(I)V

    sput-object v0, Lkl0;->f:Lkl0;

    new-instance v0, Lkl0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lkl0;-><init>(I)V

    sput-object v0, Lkl0;->g:Lkl0;

    new-instance v0, Lkl0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lkl0;-><init>(I)V

    sput-object v0, Lkl0;->h:Lkl0;

    new-instance v0, Lkl0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lkl0;-><init>(I)V

    sput-object v0, Lkl0;->i:Lkl0;

    new-instance v0, Lkl0;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lkl0;-><init>(I)V

    sput-object v0, Lkl0;->j:Lkl0;

    new-instance v0, Lkl0;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lkl0;-><init>(I)V

    sput-object v0, Lkl0;->k:Lkl0;

    new-instance v0, Lkl0;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lkl0;-><init>(I)V

    sput-object v0, Lkl0;->l:Lkl0;

    new-instance v0, Lkl0;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lkl0;-><init>(I)V

    sput-object v0, Lkl0;->m:Lkl0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lkl0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lkl0;->a:B

    return p0
.end method
