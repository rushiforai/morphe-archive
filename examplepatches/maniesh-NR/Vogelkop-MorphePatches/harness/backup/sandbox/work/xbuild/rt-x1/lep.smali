.class public abstract Llep;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lz4k;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lz4k;

    const/16 v1, 0x15

    invoke-direct {v0, v1}, Lz4k;-><init>(B)V

    sput-object v0, Llep;->a:Lz4k;

    return-void
.end method
