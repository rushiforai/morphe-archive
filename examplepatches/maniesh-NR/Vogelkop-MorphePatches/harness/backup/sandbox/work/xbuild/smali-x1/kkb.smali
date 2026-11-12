.class public final Lkkb;
.super Lmkb;
.source "SourceFile"


# instance fields
.field public final a:Laln;

.field public final b:I


# direct methods
.method public constructor <init>(Laln;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkkb;->a:Laln;

    iput p2, p0, Lkkb;->b:I

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lkkb;->a:Laln;

    invoke-interface {p0}, Laln;->getId()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
