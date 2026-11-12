.class public final Llpk;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final c:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;)V
    .registers 4

    sget-object v0, Lnpk;->b:Lnpk;

    const/16 v1, 0x14

    invoke-direct {p0, v0, v1}, Ln1;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Llpk;->c:Ljava/util/ArrayList;

    return-void
.end method
