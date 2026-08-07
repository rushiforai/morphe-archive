.class public final synthetic Ll/cxb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fxb;


# direct methods
.method public synthetic constructor <init>(Ll/fxb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cxb;->a:Ll/fxb;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cxb;->a:Ll/fxb;

    invoke-static {p0}, Ll/fxb;->q0(Ll/fxb;)V

    return-void
.end method
