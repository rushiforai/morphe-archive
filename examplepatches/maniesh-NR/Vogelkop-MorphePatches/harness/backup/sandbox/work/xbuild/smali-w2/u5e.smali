.class public abstract Lu5e;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Lqfb;

.field public static final b:Lzyk;

.field public static final c:Lzyk;

.field public static final d:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Luuc;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Luuc;-><init>(B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    sput-object v0, Lu5e;->b:Lzyk;

    new-instance v0, Luuc;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Luuc;-><init>(B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    sput-object v0, Lu5e;->c:Lzyk;

    new-instance v0, Luuc;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Luuc;-><init>(B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    sput-object v0, Lu5e;->d:Lzyk;

    return-void
.end method

.method public static a()Lmxb;
    .registers 1

    sget-object v0, Lu5e;->a:Lqfb;

    if-nez v0, :cond_5

    const/4 v0, 0x0

    :cond_5
    iget-object v0, v0, Lqfb;->b:Ljava/lang/Object;

    check-cast v0, Lmxb;

    return-object v0
.end method
