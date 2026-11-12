.class public final Loi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Loi0;

.field public static final c:Loi0;

.field public static final d:Loi0;

.field public static final e:Loi0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Loi0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Loi0;-><init>(I)V

    sput-object v0, Loi0;->b:Loi0;

    new-instance v0, Loi0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Loi0;-><init>(I)V

    sput-object v0, Loi0;->c:Loi0;

    new-instance v0, Loi0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Loi0;-><init>(I)V

    sput-object v0, Loi0;->d:Loi0;

    new-instance v0, Loi0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Loi0;-><init>(I)V

    sput-object v0, Loi0;->e:Loi0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Loi0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Loi0;->a:B

    return p0
.end method
