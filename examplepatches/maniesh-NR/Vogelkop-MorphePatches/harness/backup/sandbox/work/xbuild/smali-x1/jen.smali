.class public abstract Ljen;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lkk3;

.field public static final b:Lkk3;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkk3;

    const/16 v1, 0x13

    invoke-direct {v0, v1}, Lkk3;-><init>(B)V

    sput-object v0, Ljen;->a:Lkk3;

    new-instance v0, Lkk3;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Lkk3;-><init>(B)V

    sput-object v0, Ljen;->b:Lkk3;

    return-void
.end method
