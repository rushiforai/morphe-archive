.class public final Ldf0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ldf0;


# instance fields
.field public final a:B

.field public final b:B

.field public final c:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Ldf0;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v1}, Ldf0;-><init>(ILjava/lang/Object;B)V

    sput-object v0, Ldf0;->d:Ldf0;

    return-void
.end method

.method public constructor <init>(ILjava/lang/Object;B)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p3, p0, Ldf0;->a:B

    int-to-byte p1, p1

    iput-byte p1, p0, Ldf0;->b:B

    iput-object p2, p0, Ldf0;->c:Ljava/lang/Object;

    return-void
.end method
