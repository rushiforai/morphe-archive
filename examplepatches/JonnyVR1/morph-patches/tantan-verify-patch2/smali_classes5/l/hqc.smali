.class public final synthetic Ll/hqc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hqc;->a:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hqc;->a:Ljava/util/ArrayList;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/util/DebugUtil;->Mb(Ljava/util/ArrayList;)V

    return-void
.end method
