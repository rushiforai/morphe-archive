.class public abstract Lej9;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lii;

.field public static final b:Lii;

.field public static c:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lii;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Lii;-><init>(B)V

    sput-object v0, Lej9;->a:Lii;

    new-instance v0, Lii;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Lii;-><init>(B)V

    sput-object v0, Lej9;->b:Lii;

    return-void
.end method
