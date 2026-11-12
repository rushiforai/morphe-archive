.class public abstract Lbkf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lhp7;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lvme;

    const/16 v1, 0x17

    invoke-direct {v0, v1}, Lvme;-><init>(B)V

    new-instance v1, Lhp7;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Lhp7;-><init>(Lkotlin/jvm/functions/Function0;B)V

    sput-object v1, Lbkf;->a:Lhp7;

    return-void
.end method
