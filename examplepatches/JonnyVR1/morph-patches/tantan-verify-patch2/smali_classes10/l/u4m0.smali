.class public final synthetic Ll/u4m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/media/ttmediautils/download/Action1;


# instance fields
.field public final synthetic a:Ll/k5m0;


# direct methods
.method public synthetic constructor <init>(Ll/k5m0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u4m0;->a:Ll/k5m0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u4m0;->a:Ll/k5m0;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/k5m0;->W(Ll/k5m0;Ljava/lang/String;)V

    return-void
.end method
