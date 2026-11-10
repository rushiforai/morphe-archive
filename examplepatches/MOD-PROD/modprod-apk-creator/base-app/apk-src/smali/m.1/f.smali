.class public final Lm/f;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Lm/f;


# instance fields
.field public volatile a:Ljava/lang/Thread;

.field public volatile b:Lm/f;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lm/f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lm/f;->c:Lm/f;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lm/g;->f:LD/g;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, LD/g;->L(Lm/f;Ljava/lang/Thread;)V

    return-void
.end method
