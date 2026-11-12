.class public abstract Lxne;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lii;

.field public static final b:Lii;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lii;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Lii;-><init>(B)V

    sget-object v1, Lvml;->d:Lumi;

    invoke-static {v0, v1}, Lcom/opera/android/Lazy;->e(Lcom/opera/android/Lazy;Lumi;)V

    sput-object v0, Lxne;->a:Lii;

    new-instance v0, Lii;

    const/16 v1, 0x12

    invoke-direct {v0, v1}, Lii;-><init>(B)V

    sput-object v0, Lxne;->b:Lii;

    return-void
.end method
