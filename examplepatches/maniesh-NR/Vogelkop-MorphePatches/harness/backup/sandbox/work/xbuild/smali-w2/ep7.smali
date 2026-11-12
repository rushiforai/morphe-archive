.class public abstract Lep7;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lii;

.field public static final b:Lii;

.field public static final c:Lii;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lii;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lii;-><init>(B)V

    sput-object v0, Lep7;->a:Lii;

    new-instance v0, Lii;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lii;-><init>(B)V

    sput-object v0, Lep7;->b:Lii;

    new-instance v0, Lii;

    const/16 v1, 0xd

    invoke-direct {v0, v1}, Lii;-><init>(B)V

    sput-object v0, Lep7;->c:Lii;

    return-void
.end method
