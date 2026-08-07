.class public final synthetic Ll/m5t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/vwt;


# direct methods
.method public synthetic constructor <init>(Ll/vwt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m5t;->a:Ll/vwt;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m5t;->a:Ll/vwt;

    invoke-static {p0}, Lcom/p1/mobile/putong/live/LiveModule;->N(Ll/vwt;)V

    return-void
.end method
