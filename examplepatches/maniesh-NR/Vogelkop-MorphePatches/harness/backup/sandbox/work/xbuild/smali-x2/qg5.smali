.class public final Lqg5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liak;


# instance fields
.field public final synthetic a:Lrg5;


# direct methods
.method public constructor <init>(Lrg5;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqg5;->a:Lrg5;

    return-void
.end method


# virtual methods
.method public final getValue()Ljava/lang/Object;
    .registers 1

    iget-object p0, p0, Lqg5;->a:Lrg5;

    iget-object p0, p0, Lrg5;->h:Lt0g;

    invoke-virtual {p0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhjm;

    return-object p0
.end method
