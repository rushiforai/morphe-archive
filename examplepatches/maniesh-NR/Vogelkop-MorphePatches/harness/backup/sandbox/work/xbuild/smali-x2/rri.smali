.class public final Lrri;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Lrri;


# instance fields
.field public final a:I

.field public final b:B

.field public final c:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lrri;

    const/4 v1, 0x0

    const/4 v2, 0x1

    const v3, 0x7fffffff

    invoke-direct {v0, v3, v1, v2}, Lrri;-><init>(IIZ)V

    sput-object v0, Lrri;->d:Lrri;

    return-void
.end method

.method public constructor <init>(IIZ)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lrri;->a:I

    iput-byte p2, p0, Lrri;->b:B

    iput-boolean p3, p0, Lrri;->c:Z

    return-void
.end method
