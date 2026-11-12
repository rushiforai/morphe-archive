.class public final Lfx1;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4

    sget-object v0, Lix1;->b:Lix1;

    const/4 v1, 0x2

    invoke-direct {p0, v0, v1}, Ln1;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lfx1;->c:Ljava/lang/String;

    return-void
.end method
