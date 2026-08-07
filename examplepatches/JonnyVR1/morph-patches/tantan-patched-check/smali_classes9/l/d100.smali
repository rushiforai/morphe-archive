.class public final synthetic Ll/d100;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/h100;


# direct methods
.method public synthetic constructor <init>(Ll/h100;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d100;->a:Ll/h100;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d100;->a:Ll/h100;

    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    invoke-static {p0, p1}, Ll/h100;->a(Ll/h100;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    return-void
.end method
