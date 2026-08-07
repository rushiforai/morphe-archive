.class public final Lcom/immomo/momo/brotlij/Brotli;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/momo/brotlij/Brotli$Mode;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u00c6\u0002\u0018\u00002\u00020\u0001:\u0001\tB\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u0017\u0010\u0008\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0005\u0010\u0006\u001a\u0004\u0008\u0005\u0010\u0007\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/immomo/momo/brotlij/Brotli;",
        "",
        "<init>",
        "()V",
        "Lcom/immomo/momo/brotlij/Brotli$Mode;",
        "a",
        "Lcom/immomo/momo/brotlij/Brotli$Mode;",
        "()Lcom/immomo/momo/brotlij/Brotli$Mode;",
        "DEFAULT_MODE",
        "Mode",
        "brotlij_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/immomo/momo/brotlij/Brotli;

.field private static final a:Lcom/immomo/momo/brotlij/Brotli$Mode;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/momo/brotlij/Brotli;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momo/brotlij/Brotli;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/momo/brotlij/Brotli;->INSTANCE:Lcom/immomo/momo/brotlij/Brotli;

    .line 7
    .line 8
    sget-object v0, Lcom/immomo/momo/brotlij/Brotli$Mode;->GENERIC:Lcom/immomo/momo/brotlij/Brotli$Mode;

    .line 9
    .line 10
    sput-object v0, Lcom/immomo/momo/brotlij/Brotli;->a:Lcom/immomo/momo/brotlij/Brotli$Mode;

    .line 11
    .line 12
    const-string v0, "brotli"

    .line 13
    .line 14
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()Lcom/immomo/momo/brotlij/Brotli$Mode;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/immomo/momo/brotlij/Brotli;->a:Lcom/immomo/momo/brotlij/Brotli$Mode;

    .line 2
    .line 3
    return-object p0
.end method
