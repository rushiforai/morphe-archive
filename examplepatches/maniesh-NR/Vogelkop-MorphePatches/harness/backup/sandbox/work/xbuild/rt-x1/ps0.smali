.class public final Lps0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lps0;

.field public static final c:Lps0;

.field public static final d:Lps0;

.field public static final e:Lps0;

.field public static final f:Lps0;

.field public static final g:Lps0;

.field public static final h:Lps0;

.field public static final i:Lps0;

.field public static final j:Lps0;

.field public static final k:Lps0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lps0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lps0;-><init>(I)V

    sput-object v0, Lps0;->b:Lps0;

    new-instance v0, Lps0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lps0;-><init>(I)V

    sput-object v0, Lps0;->c:Lps0;

    new-instance v0, Lps0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lps0;-><init>(I)V

    sput-object v0, Lps0;->d:Lps0;

    new-instance v0, Lps0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lps0;-><init>(I)V

    sput-object v0, Lps0;->e:Lps0;

    new-instance v0, Lps0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lps0;-><init>(I)V

    sput-object v0, Lps0;->f:Lps0;

    new-instance v0, Lps0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lps0;-><init>(I)V

    sput-object v0, Lps0;->g:Lps0;

    new-instance v0, Lps0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lps0;-><init>(I)V

    sput-object v0, Lps0;->h:Lps0;

    new-instance v0, Lps0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lps0;-><init>(I)V

    sput-object v0, Lps0;->i:Lps0;

    new-instance v0, Lps0;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lps0;-><init>(I)V

    sput-object v0, Lps0;->j:Lps0;

    new-instance v0, Lps0;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lps0;-><init>(I)V

    sput-object v0, Lps0;->k:Lps0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lps0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lps0;->a:B

    return p0
.end method
