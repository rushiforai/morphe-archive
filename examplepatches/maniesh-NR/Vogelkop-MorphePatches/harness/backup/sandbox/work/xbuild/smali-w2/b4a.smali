.class public abstract Lb4a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lkk3;

.field public static final b:Lkk3;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkk3;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lkk3;-><init>(B)V

    sput-object v0, Lb4a;->a:Lkk3;

    new-instance v0, Lkk3;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lkk3;-><init>(B)V

    sput-object v0, Lb4a;->b:Lkk3;

    return-void
.end method
