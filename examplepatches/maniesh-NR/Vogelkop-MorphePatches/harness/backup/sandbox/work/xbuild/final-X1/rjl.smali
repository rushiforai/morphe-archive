.class public final Lrjl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpaj;


# instance fields
.field public final synthetic a:Ld91;


# direct methods
.method public constructor <init>(Ld91;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrjl;->a:Ld91;

    return-void
.end method


# virtual methods
.method public final a(JLd2c;Ln27;)Lw7d;
    .registers 5

    new-instance p1, Lltf;

    iget-object p0, p0, Lrjl;->a:Ld91;

    invoke-direct {p1, p0}, Lltf;-><init>(Ld91;)V

    return-object p1
.end method
