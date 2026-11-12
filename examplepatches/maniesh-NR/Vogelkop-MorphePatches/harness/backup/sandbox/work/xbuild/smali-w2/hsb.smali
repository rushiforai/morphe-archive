.class public abstract Lhsb;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lkotlinx/serialization/json/d;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lqqb;->b(Ljava/lang/Number;)Lkotlinx/serialization/json/d;

    move-result-object v0

    sput-object v0, Lhsb;->a:Lkotlinx/serialization/json/d;

    return-void
.end method
