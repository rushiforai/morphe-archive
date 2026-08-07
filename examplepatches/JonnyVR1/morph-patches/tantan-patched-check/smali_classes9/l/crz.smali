.class public final synthetic Ll/crz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zcj;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/crz;->a:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/crz;->a:Ljava/util/ArrayList;

    invoke-static {p0, p1}, Ll/tvz;->Ma(Ljava/util/ArrayList;[Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object p0

    return-object p0
.end method
