.class public final Lqh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lqh0;

.field public static final c:Lqh0;

.field public static final d:Lqh0;

.field public static final e:Lqh0;

.field public static final f:Lqh0;

.field public static final g:Lqh0;

.field public static final h:Lqh0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lqh0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lqh0;-><init>(I)V

    sput-object v0, Lqh0;->b:Lqh0;

    new-instance v0, Lqh0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lqh0;-><init>(I)V

    sput-object v0, Lqh0;->c:Lqh0;

    new-instance v0, Lqh0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lqh0;-><init>(I)V

    sput-object v0, Lqh0;->d:Lqh0;

    new-instance v0, Lqh0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lqh0;-><init>(I)V

    sput-object v0, Lqh0;->e:Lqh0;

    new-instance v0, Lqh0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lqh0;-><init>(I)V

    sput-object v0, Lqh0;->f:Lqh0;

    new-instance v0, Lqh0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lqh0;-><init>(I)V

    sput-object v0, Lqh0;->g:Lqh0;

    new-instance v0, Lqh0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lqh0;-><init>(I)V

    sput-object v0, Lqh0;->h:Lqh0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lqh0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lqh0;->a:B

    return p0
.end method
