.class public final synthetic Ll/mwh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/cxh;


# direct methods
.method public synthetic constructor <init>(Ll/cxh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mwh;->a:Ll/cxh;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mwh;->a:Ll/cxh;

    invoke-static {p0}, Ll/cxh;->i(Ll/cxh;)V

    return-void
.end method
