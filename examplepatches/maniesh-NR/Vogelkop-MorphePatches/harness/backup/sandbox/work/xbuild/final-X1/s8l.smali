.class public final Ls8l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Lt8l;


# direct methods
.method public constructor <init>(Lt8l;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls8l;->a:Lt8l;

    return-void
.end method


# virtual methods
.method public final H(Lb2l;Lb2l;I)V
    .registers 4

    iget-object p0, p0, Ls8l;->a:Lt8l;

    iget-object p1, p0, Lt8l;->c:Lpde;

    invoke-virtual {p0}, Lt8l;->a()Lq8l;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method
