.class public abstract Lwz3;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lixh;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lixh;

    const/high16 v1, 0x40800000    # 4.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lwz3;->a:Lixh;

    return-void
.end method
