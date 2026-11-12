.class public final Lyo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lyo0;

.field public static final c:Lyo0;

.field public static final d:Lyo0;

.field public static final e:Lyo0;

.field public static final f:Lyo0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lyo0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lyo0;-><init>(I)V

    sput-object v0, Lyo0;->b:Lyo0;

    new-instance v0, Lyo0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lyo0;-><init>(I)V

    sput-object v0, Lyo0;->c:Lyo0;

    new-instance v0, Lyo0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lyo0;-><init>(I)V

    sput-object v0, Lyo0;->d:Lyo0;

    new-instance v0, Lyo0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lyo0;-><init>(I)V

    sput-object v0, Lyo0;->e:Lyo0;

    new-instance v0, Lyo0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lyo0;-><init>(I)V

    sput-object v0, Lyo0;->f:Lyo0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lyo0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lyo0;->a:B

    return p0
.end method
