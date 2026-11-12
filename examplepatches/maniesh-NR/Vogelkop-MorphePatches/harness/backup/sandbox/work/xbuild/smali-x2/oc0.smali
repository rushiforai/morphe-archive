.class public final Loc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Loc0;

.field public static final c:Loc0;

.field public static final d:Loc0;

.field public static final e:Loc0;

.field public static final f:Loc0;

.field public static final g:Loc0;

.field public static final h:Loc0;

.field public static final i:Loc0;

.field public static final j:Loc0;

.field public static final k:Loc0;

.field public static final l:Loc0;

.field public static final m:Loc0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Loc0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Loc0;-><init>(I)V

    sput-object v0, Loc0;->b:Loc0;

    new-instance v0, Loc0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Loc0;-><init>(I)V

    sput-object v0, Loc0;->c:Loc0;

    new-instance v0, Loc0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Loc0;-><init>(I)V

    sput-object v0, Loc0;->d:Loc0;

    new-instance v0, Loc0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Loc0;-><init>(I)V

    sput-object v0, Loc0;->e:Loc0;

    new-instance v0, Loc0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Loc0;-><init>(I)V

    sput-object v0, Loc0;->f:Loc0;

    new-instance v0, Loc0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Loc0;-><init>(I)V

    sput-object v0, Loc0;->g:Loc0;

    new-instance v0, Loc0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Loc0;-><init>(I)V

    sput-object v0, Loc0;->h:Loc0;

    new-instance v0, Loc0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Loc0;-><init>(I)V

    sput-object v0, Loc0;->i:Loc0;

    new-instance v0, Loc0;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Loc0;-><init>(I)V

    sput-object v0, Loc0;->j:Loc0;

    new-instance v0, Loc0;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Loc0;-><init>(I)V

    sput-object v0, Loc0;->k:Loc0;

    new-instance v0, Loc0;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Loc0;-><init>(I)V

    sput-object v0, Loc0;->l:Loc0;

    new-instance v0, Loc0;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Loc0;-><init>(I)V

    sput-object v0, Loc0;->m:Loc0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Loc0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Loc0;->a:B

    return p0
.end method
