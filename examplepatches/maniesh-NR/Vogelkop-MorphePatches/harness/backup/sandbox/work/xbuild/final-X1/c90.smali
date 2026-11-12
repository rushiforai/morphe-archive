.class public final Lc90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lc90;

.field public static final c:Lc90;


# instance fields
.field public final a:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lc90;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lc90;-><init>(I)V

    sput-object v0, Lc90;->b:Lc90;

    new-instance v0, Lc90;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lc90;-><init>(I)V

    sput-object v0, Lc90;->c:Lc90;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lc90;->a:Z

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-boolean p0, p0, Lc90;->a:Z

    return p0
.end method
