.class public final Lkc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lkc0;

.field public static final c:Lkc0;

.field public static final d:Lkc0;

.field public static final e:Lkc0;

.field public static final f:Lkc0;

.field public static final g:Lkc0;

.field public static final h:Lkc0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkc0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkc0;-><init>(I)V

    sput-object v0, Lkc0;->b:Lkc0;

    new-instance v0, Lkc0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lkc0;-><init>(I)V

    sput-object v0, Lkc0;->c:Lkc0;

    new-instance v0, Lkc0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lkc0;-><init>(I)V

    sput-object v0, Lkc0;->d:Lkc0;

    new-instance v0, Lkc0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lkc0;-><init>(I)V

    sput-object v0, Lkc0;->e:Lkc0;

    new-instance v0, Lkc0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lkc0;-><init>(I)V

    sput-object v0, Lkc0;->f:Lkc0;

    new-instance v0, Lkc0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lkc0;-><init>(I)V

    sput-object v0, Lkc0;->g:Lkc0;

    new-instance v0, Lkc0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lkc0;-><init>(I)V

    sput-object v0, Lkc0;->h:Lkc0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lkc0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lkc0;->a:B

    return p0
.end method
