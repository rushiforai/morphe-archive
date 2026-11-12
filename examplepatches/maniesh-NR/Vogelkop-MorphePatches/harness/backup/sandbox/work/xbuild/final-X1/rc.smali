.class public Lrc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpc;

.field public final b:Ljf;

.field public final c:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-byte v0, Ljf;->g:B

    return-void
.end method

.method public constructor <init>(Lpc;Ljf;Z)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrc;->a:Lpc;

    iput-object p2, p0, Lrc;->b:Ljf;

    iput-boolean p3, p0, Lrc;->c:Z

    return-void
.end method
