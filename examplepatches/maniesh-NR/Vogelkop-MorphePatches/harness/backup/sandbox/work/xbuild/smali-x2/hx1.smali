.class public final Lhx1;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final c:Lu7k;


# direct methods
.method public constructor <init>(Lu7k;)V
    .registers 4

    sget-object v0, Lix1;->a:Lix1;

    const/4 v1, 0x2

    invoke-direct {p0, v0, v1}, Ln1;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lhx1;->c:Lu7k;

    return-void
.end method
