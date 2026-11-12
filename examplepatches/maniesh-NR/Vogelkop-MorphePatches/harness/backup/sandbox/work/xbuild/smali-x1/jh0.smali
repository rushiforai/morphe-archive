.class public final Ljh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Ljh0;

.field public static final c:Ljh0;

.field public static final d:Ljh0;

.field public static final e:Ljh0;

.field public static final f:Ljh0;

.field public static final g:Ljh0;

.field public static final h:Ljh0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljh0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljh0;-><init>(I)V

    sput-object v0, Ljh0;->b:Ljh0;

    new-instance v0, Ljh0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljh0;-><init>(I)V

    sput-object v0, Ljh0;->c:Ljh0;

    new-instance v0, Ljh0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljh0;-><init>(I)V

    sput-object v0, Ljh0;->d:Ljh0;

    new-instance v0, Ljh0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljh0;-><init>(I)V

    sput-object v0, Ljh0;->e:Ljh0;

    new-instance v0, Ljh0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljh0;-><init>(I)V

    sput-object v0, Ljh0;->f:Ljh0;

    new-instance v0, Ljh0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljh0;-><init>(I)V

    sput-object v0, Ljh0;->g:Ljh0;

    new-instance v0, Ljh0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Ljh0;-><init>(I)V

    sput-object v0, Ljh0;->h:Ljh0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Ljh0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Ljh0;->a:B

    return p0
.end method
