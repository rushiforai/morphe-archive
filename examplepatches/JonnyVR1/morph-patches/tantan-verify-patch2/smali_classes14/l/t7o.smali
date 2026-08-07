.class public final synthetic Ll/t7o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b8o;


# direct methods
.method public synthetic constructor <init>(Ll/b8o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t7o;->a:Ll/b8o;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t7o;->a:Ll/b8o;

    check-cast p1, Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;

    invoke-static {p0, p1}, Ll/b8o;->e(Ll/b8o;Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;)V

    return-void
.end method
