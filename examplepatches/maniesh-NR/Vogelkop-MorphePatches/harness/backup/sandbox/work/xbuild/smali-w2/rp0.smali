.class public final Lrp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lrp0;

.field public static final c:Lrp0;

.field public static final d:Lrp0;

.field public static final e:Lrp0;

.field public static final f:Lrp0;

.field public static final g:Lrp0;

.field public static final h:Lrp0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lrp0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lrp0;-><init>(I)V

    sput-object v0, Lrp0;->b:Lrp0;

    new-instance v0, Lrp0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lrp0;-><init>(I)V

    sput-object v0, Lrp0;->c:Lrp0;

    new-instance v0, Lrp0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lrp0;-><init>(I)V

    sput-object v0, Lrp0;->d:Lrp0;

    new-instance v0, Lrp0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lrp0;-><init>(I)V

    sput-object v0, Lrp0;->e:Lrp0;

    new-instance v0, Lrp0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lrp0;-><init>(I)V

    sput-object v0, Lrp0;->f:Lrp0;

    new-instance v0, Lrp0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lrp0;-><init>(I)V

    sput-object v0, Lrp0;->g:Lrp0;

    new-instance v0, Lrp0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lrp0;-><init>(I)V

    sput-object v0, Lrp0;->h:Lrp0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lrp0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lrp0;->a:B

    return p0
.end method
