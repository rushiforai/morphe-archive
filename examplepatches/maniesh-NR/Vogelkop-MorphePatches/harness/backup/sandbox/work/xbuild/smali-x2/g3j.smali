.class public abstract Lg3j;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lzyk;

.field public static final b:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lgzh;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Lgzh;-><init>(B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    sput-object v0, Lg3j;->a:Lzyk;

    new-instance v0, Lgzh;

    const/16 v1, 0x12

    invoke-direct {v0, v1}, Lgzh;-><init>(B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    sput-object v0, Lg3j;->b:Lzyk;

    return-void
.end method
