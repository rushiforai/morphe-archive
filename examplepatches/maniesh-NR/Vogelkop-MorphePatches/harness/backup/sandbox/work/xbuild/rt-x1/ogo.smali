.class public final Logo;
.super Lwbp;
.source "SourceFile"


# instance fields
.field public final synthetic b:Lcko;


# direct methods
.method public constructor <init>(Lcko;)V
    .registers 2

    iput-object p1, p0, Logo;->b:Lcko;

    invoke-direct {p0}, Lwbp;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(ILjava/lang/Object;)V
    .registers 3

    invoke-static {p2}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    if-eqz p1, :cond_17

    iget-object p0, p0, Logo;->b:Lcko;

    invoke-virtual {p0}, Lcko;->e()Lp7p;

    move-result-object p0

    if-eqz p0, :cond_17

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    const/16 p2, 0x7d0

    invoke-virtual {p0, p2, p1}, Lp7p;->g(ILjava/lang/String;)V

    :cond_17
    return-void
.end method
