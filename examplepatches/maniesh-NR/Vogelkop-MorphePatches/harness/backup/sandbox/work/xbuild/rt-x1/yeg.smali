.class public abstract Lyeg;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lhp7;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lkof;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Lkof;-><init>(B)V

    new-instance v1, Lhp7;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lhp7;-><init>(Lkotlin/jvm/functions/Function0;B)V

    sput-object v1, Lyeg;->a:Lhp7;

    return-void
.end method
