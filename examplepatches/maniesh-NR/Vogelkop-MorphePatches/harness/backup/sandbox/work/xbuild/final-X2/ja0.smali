.class public final Lja0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lja0;

.field public static final c:Lja0;

.field public static final d:Lja0;

.field public static final e:Lja0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lja0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lja0;-><init>(I)V

    sput-object v0, Lja0;->b:Lja0;

    new-instance v0, Lja0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lja0;-><init>(I)V

    sput-object v0, Lja0;->c:Lja0;

    new-instance v0, Lja0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lja0;-><init>(I)V

    sput-object v0, Lja0;->d:Lja0;

    new-instance v0, Lja0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lja0;-><init>(I)V

    sput-object v0, Lja0;->e:Lja0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lja0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lja0;->a:B

    return p0
.end method
