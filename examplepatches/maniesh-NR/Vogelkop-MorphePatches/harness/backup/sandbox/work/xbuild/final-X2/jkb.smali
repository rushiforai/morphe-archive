.class public Ljkb;
.super Lmkb;
.source "SourceFile"


# instance fields
.field public final a:Laln;


# direct methods
.method public constructor <init>(Laln;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljkb;->a:Laln;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Ljkb;->a:Laln;

    invoke-interface {p0}, Laln;->getId()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
