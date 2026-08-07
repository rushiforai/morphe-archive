.class public final synthetic Ll/kvs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bws;


# direct methods
.method public synthetic constructor <init>(Ll/bws;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kvs;->a:Ll/bws;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kvs;->a:Ll/bws;

    check-cast p1, Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;

    invoke-static {p0, p1}, Ll/bws;->e3(Ll/bws;Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;)V

    return-void
.end method
