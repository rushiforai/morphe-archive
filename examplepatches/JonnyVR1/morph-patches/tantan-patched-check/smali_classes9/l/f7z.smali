.class public final synthetic Ll/f7z;
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

    iput-object p1, p0, Ll/f7z;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f7z;->a:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatHeat;

    invoke-static {p0, p1}, Ll/nbz;->r0(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatHeat;)V

    return-void
.end method
