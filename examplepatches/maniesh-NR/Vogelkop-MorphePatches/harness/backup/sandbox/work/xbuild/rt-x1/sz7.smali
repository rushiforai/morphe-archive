.class public abstract Lsz7;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lsk7;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Lsk7;-><init>(B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    sput-object v0, Lsz7;->a:Lzyk;

    return-void
.end method
