.class public abstract Lbcj;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lhp7;

.field public static final b:Lhp7;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lgzh;

    const/16 v1, 0x13

    invoke-direct {v0, v1}, Lgzh;-><init>(B)V

    new-instance v1, Lhp7;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lhp7;-><init>(Lkotlin/jvm/functions/Function0;B)V

    sput-object v1, Lbcj;->a:Lhp7;

    new-instance v0, Lgzh;

    const/16 v1, 0x15

    invoke-direct {v0, v1}, Lgzh;-><init>(B)V

    new-instance v1, Lhp7;

    invoke-direct {v1, v0, v2}, Lhp7;-><init>(Lkotlin/jvm/functions/Function0;B)V

    sput-object v1, Lbcj;->b:Lhp7;

    return-void
.end method
