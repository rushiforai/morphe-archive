.class public final Lb70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lb70;

.field public static final c:Lb70;

.field public static final d:Lb70;

.field public static final e:Lb70;

.field public static final f:Lb70;

.field public static final g:Lb70;

.field public static final h:Lb70;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lb70;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lb70;-><init>(I)V

    sput-object v0, Lb70;->b:Lb70;

    new-instance v0, Lb70;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lb70;-><init>(I)V

    sput-object v0, Lb70;->c:Lb70;

    new-instance v0, Lb70;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lb70;-><init>(I)V

    sput-object v0, Lb70;->d:Lb70;

    new-instance v0, Lb70;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lb70;-><init>(I)V

    sput-object v0, Lb70;->e:Lb70;

    new-instance v0, Lb70;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lb70;-><init>(I)V

    sput-object v0, Lb70;->f:Lb70;

    new-instance v0, Lb70;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lb70;-><init>(I)V

    sput-object v0, Lb70;->g:Lb70;

    new-instance v0, Lb70;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lb70;-><init>(I)V

    sput-object v0, Lb70;->h:Lb70;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lb70;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lb70;->a:B

    return p0
.end method
