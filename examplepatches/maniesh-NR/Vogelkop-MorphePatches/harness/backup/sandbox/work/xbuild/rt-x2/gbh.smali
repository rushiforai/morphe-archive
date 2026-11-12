.class public abstract Lgbh;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lkk3;

.field public static final b:Lkk3;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkk3;

    const/16 v1, 0xd

    invoke-direct {v0, v1}, Lkk3;-><init>(B)V

    sput-object v0, Lgbh;->a:Lkk3;

    new-instance v0, Lkk3;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Lkk3;-><init>(B)V

    sput-object v0, Lgbh;->b:Lkk3;

    return-void
.end method
