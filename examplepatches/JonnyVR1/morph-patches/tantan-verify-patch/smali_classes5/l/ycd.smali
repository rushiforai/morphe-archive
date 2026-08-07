.class public final synthetic Ll/ycd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ycd;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ycd;->a:Ljava/lang/String;

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/util/DebugUtil;->Sf(Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method
