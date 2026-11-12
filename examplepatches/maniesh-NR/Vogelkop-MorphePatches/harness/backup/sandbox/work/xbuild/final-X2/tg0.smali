.class public final Ltg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Ltg0;

.field public static final c:Ltg0;

.field public static final d:Ltg0;

.field public static final e:Ltg0;

.field public static final f:Ltg0;

.field public static final g:Ltg0;

.field public static final h:Ltg0;

.field public static final i:Ltg0;

.field public static final j:Ltg0;

.field public static final k:Ltg0;

.field public static final l:Ltg0;

.field public static final m:Ltg0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ltg0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ltg0;-><init>(I)V

    sput-object v0, Ltg0;->b:Ltg0;

    new-instance v0, Ltg0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ltg0;-><init>(I)V

    sput-object v0, Ltg0;->c:Ltg0;

    new-instance v0, Ltg0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ltg0;-><init>(I)V

    sput-object v0, Ltg0;->d:Ltg0;

    new-instance v0, Ltg0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ltg0;-><init>(I)V

    sput-object v0, Ltg0;->e:Ltg0;

    new-instance v0, Ltg0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ltg0;-><init>(I)V

    sput-object v0, Ltg0;->f:Ltg0;

    new-instance v0, Ltg0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ltg0;-><init>(I)V

    sput-object v0, Ltg0;->g:Ltg0;

    new-instance v0, Ltg0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Ltg0;-><init>(I)V

    sput-object v0, Ltg0;->h:Ltg0;

    new-instance v0, Ltg0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Ltg0;-><init>(I)V

    sput-object v0, Ltg0;->i:Ltg0;

    new-instance v0, Ltg0;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Ltg0;-><init>(I)V

    sput-object v0, Ltg0;->j:Ltg0;

    new-instance v0, Ltg0;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Ltg0;-><init>(I)V

    sput-object v0, Ltg0;->k:Ltg0;

    new-instance v0, Ltg0;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ltg0;-><init>(I)V

    sput-object v0, Ltg0;->l:Ltg0;

    new-instance v0, Ltg0;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Ltg0;-><init>(I)V

    sput-object v0, Ltg0;->m:Ltg0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Ltg0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Ltg0;->a:B

    return p0
.end method
