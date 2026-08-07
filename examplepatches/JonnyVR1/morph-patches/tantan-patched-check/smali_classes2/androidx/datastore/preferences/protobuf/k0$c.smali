.class public Landroidx/datastore/preferences/protobuf/k0$c;
.super Landroidx/datastore/preferences/protobuf/k0$g;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/datastore/preferences/protobuf/k0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/datastore/preferences/protobuf/k0<",
        "TK;TV;>.g;"
    }
.end annotation


# instance fields
.field public final synthetic b:Landroidx/datastore/preferences/protobuf/k0;


# direct methods
.method public constructor <init>(Landroidx/datastore/preferences/protobuf/k0;)V
    .locals 1

    .line 1
    iput-object p1, p0, Landroidx/datastore/preferences/protobuf/k0$c;->b:Landroidx/datastore/preferences/protobuf/k0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, p1, v0}, Landroidx/datastore/preferences/protobuf/k0$g;-><init>(Landroidx/datastore/preferences/protobuf/k0;Landroidx/datastore/preferences/protobuf/k0$a;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public synthetic constructor <init>(Landroidx/datastore/preferences/protobuf/k0;Landroidx/datastore/preferences/protobuf/k0$a;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1}, Landroidx/datastore/preferences/protobuf/k0$c;-><init>(Landroidx/datastore/preferences/protobuf/k0;)V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroidx/datastore/preferences/protobuf/k0$b;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/k0$c;->b:Landroidx/datastore/preferences/protobuf/k0;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-direct {v0, p0, v1}, Landroidx/datastore/preferences/protobuf/k0$b;-><init>(Landroidx/datastore/preferences/protobuf/k0;Landroidx/datastore/preferences/protobuf/k0$a;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method
