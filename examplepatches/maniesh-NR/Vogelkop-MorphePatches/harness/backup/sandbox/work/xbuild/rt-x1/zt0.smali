.class public final Lzt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lzt0;

.field public static final c:Lzt0;

.field public static final d:Lzt0;

.field public static final e:Lzt0;

.field public static final f:Lzt0;

.field public static final g:Lzt0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lzt0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lzt0;-><init>(I)V

    sput-object v0, Lzt0;->b:Lzt0;

    new-instance v0, Lzt0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lzt0;-><init>(I)V

    sput-object v0, Lzt0;->c:Lzt0;

    new-instance v0, Lzt0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lzt0;-><init>(I)V

    sput-object v0, Lzt0;->d:Lzt0;

    new-instance v0, Lzt0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lzt0;-><init>(I)V

    sput-object v0, Lzt0;->e:Lzt0;

    new-instance v0, Lzt0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lzt0;-><init>(I)V

    sput-object v0, Lzt0;->f:Lzt0;

    new-instance v0, Lzt0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lzt0;-><init>(I)V

    sput-object v0, Lzt0;->g:Lzt0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lzt0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lzt0;->a:B

    return p0
.end method
