.class public final Lef0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Lef0;

.field public static final c:Lef0;

.field public static final d:Lef0;

.field public static final e:Lef0;


# instance fields
.field public final a:S


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lef0;

    const-wide/16 v1, 0x1

    invoke-direct {v0, v1, v2}, Lef0;-><init>(J)V

    sput-object v0, Lef0;->b:Lef0;

    new-instance v0, Lef0;

    const-wide/16 v1, 0x10

    invoke-direct {v0, v1, v2}, Lef0;-><init>(J)V

    sput-object v0, Lef0;->c:Lef0;

    new-instance v0, Lef0;

    const-wide/16 v1, 0x100

    invoke-direct {v0, v1, v2}, Lef0;-><init>(J)V

    sput-object v0, Lef0;->d:Lef0;

    new-instance v0, Lef0;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lef0;-><init>(J)V

    sput-object v0, Lef0;->e:Lef0;

    return-void
.end method

.method public constructor <init>(J)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    long-to-int p1, p1

    iput-short p1, p0, Lef0;->a:S

    return-void
.end method
