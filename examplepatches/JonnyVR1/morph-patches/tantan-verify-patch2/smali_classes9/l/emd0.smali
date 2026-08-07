.class public Ll/emd0;
.super Ll/s4j0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/s4j0<",
        "Ll/rdh0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/rdh0;


# direct methods
.method public constructor <init>(Ll/rdh0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/s4j0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/emd0;->a:Ll/rdh0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic a()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/emd0;->c()Ll/rdh0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b()I
    .locals 0

    .line 1
    const/16 p0, 0x8

    .line 2
    .line 3
    return p0
.end method

.method public c()Ll/rdh0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/emd0;->a:Ll/rdh0;

    .line 2
    .line 3
    return-object p0
.end method
