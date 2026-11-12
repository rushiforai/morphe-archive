.class public final Lll0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lll0;

.field public static final c:Lll0;

.field public static final d:Lll0;

.field public static final e:Lll0;

.field public static final f:Lll0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lll0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lll0;-><init>(I)V

    sput-object v0, Lll0;->b:Lll0;

    new-instance v0, Lll0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lll0;-><init>(I)V

    sput-object v0, Lll0;->c:Lll0;

    new-instance v0, Lll0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lll0;-><init>(I)V

    sput-object v0, Lll0;->d:Lll0;

    new-instance v0, Lll0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lll0;-><init>(I)V

    sput-object v0, Lll0;->e:Lll0;

    new-instance v0, Lll0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lll0;-><init>(I)V

    sput-object v0, Lll0;->f:Lll0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lll0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lll0;->a:B

    return p0
.end method
