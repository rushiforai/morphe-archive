.class public final Lowl;
.super Lpwl;
.source "SourceFile"


# instance fields
.field public final i:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorb;)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lpwl;-><init>(Lorb;B)V

    const-string v0, "authentication_string"

    invoke-virtual {p1, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lowl;->i:Ljava/lang/String;

    return-void
.end method
