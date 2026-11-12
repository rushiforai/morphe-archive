.class public final Lyf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lyf0;

.field public static final c:Lyf0;

.field public static final d:Lyf0;

.field public static final e:Lyf0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lyf0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lyf0;-><init>(I)V

    sput-object v0, Lyf0;->b:Lyf0;

    new-instance v0, Lyf0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lyf0;-><init>(I)V

    sput-object v0, Lyf0;->c:Lyf0;

    new-instance v0, Lyf0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lyf0;-><init>(I)V

    sput-object v0, Lyf0;->d:Lyf0;

    new-instance v0, Lyf0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lyf0;-><init>(I)V

    sput-object v0, Lyf0;->e:Lyf0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lyf0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lyf0;->a:B

    return p0
.end method
