.class public final synthetic Ll/tb9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/tb9;->a:I

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Ll/tb9;->a:I

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/n;->h3(I)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
