.class public final synthetic Ll/vi9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/StringBuilder;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/StringBuilder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vi9;->a:Ljava/lang/StringBuilder;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vi9;->a:Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->k3(Ljava/lang/StringBuilder;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
