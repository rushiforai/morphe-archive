.class public final Lk4k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnue;


# instance fields
.field public final a:Lize;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lize;

    sget-object v1, Llue;->b:Llue;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lk4k;->a:Lize;

    return-void
.end method


# virtual methods
.method public final getVisibility()Lize;
    .registers 1

    iget-object p0, p0, Lk4k;->a:Lize;

    return-object p0
.end method
