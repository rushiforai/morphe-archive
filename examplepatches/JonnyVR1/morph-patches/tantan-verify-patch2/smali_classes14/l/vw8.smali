.class public final synthetic Ll/vw8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/Boolean;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vw8;->a:Ljava/lang/Boolean;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vw8;->a:Ljava/lang/Boolean;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/j;->d4(Ljava/lang/Boolean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
