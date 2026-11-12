.class public abstract Lkkp;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ldrj;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ldrj;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Ldrj;-><init>(B)V

    sput-object v0, Lkkp;->a:Ldrj;

    return-void
.end method
