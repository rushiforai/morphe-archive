.class public final synthetic Ll/ptc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/byd0;


# direct methods
.method public synthetic constructor <init>(Ll/byd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ptc;->a:Ll/byd0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ptc;->a:Ll/byd0;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/util/DebugUtil;->Yc(Ll/byd0;Ljava/lang/String;)V

    return-void
.end method
