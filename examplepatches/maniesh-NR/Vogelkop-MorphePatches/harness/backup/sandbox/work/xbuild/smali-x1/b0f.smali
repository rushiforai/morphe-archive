.class public final Lb0f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final a:D


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lwp8;->a:[[D

    const-wide v0, 0x3ff6a09e667f3bcdL    # 1.4142135623730951

    sput-wide v0, Lb0f;->a:D

    return-void
.end method
