.class public final Ldl5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lndc;

.field public final b:Lva2;


# direct methods
.method public constructor <init>(Lndc;Lva2;)V
    .registers 4

    sget-object v0, Lqcc;->a:Lqcc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldl5;->a:Lndc;

    iput-object p2, p0, Ldl5;->b:Lva2;

    return-void
.end method
