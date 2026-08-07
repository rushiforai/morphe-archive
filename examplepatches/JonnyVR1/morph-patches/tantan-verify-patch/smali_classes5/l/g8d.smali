.class public final synthetic Ll/g8d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Z


# direct methods
.method public synthetic constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/g8d;->a:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/g8d;->a:Z

    invoke-static {p0}, Lcom/p1/mobile/putong/core/util/DebugUtil;->W9(Z)V

    return-void
.end method
