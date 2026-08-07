.class public final synthetic Ll/srb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/qrl;


# direct methods
.method public synthetic constructor <init>(Ll/qrl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/srb;->a:Ll/qrl;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/srb;->a:Ll/qrl;

    invoke-interface {p0}, Ll/qrl;->onStart()V

    return-void
.end method
