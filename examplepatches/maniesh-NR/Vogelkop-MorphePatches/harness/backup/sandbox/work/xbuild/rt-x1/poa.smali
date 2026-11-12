.class public abstract Lpoa;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lcrb;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Laym;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Laym;-><init>(B)V

    sget-object v1, Lrpb;->d:Lqpb;

    invoke-static {v1, v0}, Lphj;->o(Lrpb;Lkotlin/jvm/functions/Function1;)Lcrb;

    move-result-object v0

    sput-object v0, Lpoa;->a:Lcrb;

    return-void
.end method
