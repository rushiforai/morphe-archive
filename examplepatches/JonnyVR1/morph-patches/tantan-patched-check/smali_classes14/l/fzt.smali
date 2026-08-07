.class public final synthetic Ll/fzt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/rtr;


# direct methods
.method public synthetic constructor <init>(Ll/rtr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fzt;->a:Ll/rtr;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fzt;->a:Ll/rtr;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->w(Ll/rtr;Ljava/lang/Throwable;)Ll/rtr;

    move-result-object p0

    return-object p0
.end method
