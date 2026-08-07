.class public final synthetic Ll/hr9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hr9;->a:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hr9;->a:Ljava/util/ArrayList;

    check-cast p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/s;->M3(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
