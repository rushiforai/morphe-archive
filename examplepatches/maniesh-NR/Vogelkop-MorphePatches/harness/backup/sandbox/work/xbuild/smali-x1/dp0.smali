.class public final Ldp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Ldp0;

.field public static final c:Ldp0;

.field public static final d:Ldp0;

.field public static final e:Ldp0;

.field public static final f:Ldp0;

.field public static final g:Ldp0;

.field public static final h:Ldp0;

.field public static final i:Ldp0;

.field public static final j:Ldp0;

.field public static final k:Ldp0;

.field public static final l:Ldp0;

.field public static final m:Ldp0;

.field public static final n:Ldp0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ldp0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ldp0;-><init>(I)V

    sput-object v0, Ldp0;->b:Ldp0;

    new-instance v0, Ldp0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ldp0;-><init>(I)V

    sput-object v0, Ldp0;->c:Ldp0;

    new-instance v0, Ldp0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ldp0;-><init>(I)V

    sput-object v0, Ldp0;->d:Ldp0;

    new-instance v0, Ldp0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ldp0;-><init>(I)V

    sput-object v0, Ldp0;->e:Ldp0;

    new-instance v0, Ldp0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ldp0;-><init>(I)V

    sput-object v0, Ldp0;->f:Ldp0;

    new-instance v0, Ldp0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ldp0;-><init>(I)V

    sput-object v0, Ldp0;->g:Ldp0;

    new-instance v0, Ldp0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Ldp0;-><init>(I)V

    sput-object v0, Ldp0;->h:Ldp0;

    new-instance v0, Ldp0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Ldp0;-><init>(I)V

    sput-object v0, Ldp0;->i:Ldp0;

    new-instance v0, Ldp0;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Ldp0;-><init>(I)V

    sput-object v0, Ldp0;->j:Ldp0;

    new-instance v0, Ldp0;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Ldp0;-><init>(I)V

    sput-object v0, Ldp0;->k:Ldp0;

    new-instance v0, Ldp0;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ldp0;-><init>(I)V

    sput-object v0, Ldp0;->l:Ldp0;

    new-instance v0, Ldp0;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Ldp0;-><init>(I)V

    sput-object v0, Ldp0;->m:Ldp0;

    new-instance v0, Ldp0;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Ldp0;-><init>(I)V

    sput-object v0, Ldp0;->n:Ldp0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Ldp0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Ldp0;->a:B

    return p0
.end method
