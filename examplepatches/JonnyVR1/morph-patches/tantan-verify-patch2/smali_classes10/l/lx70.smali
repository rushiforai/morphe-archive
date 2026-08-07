.class public final synthetic Ll/lx70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/sx70;


# direct methods
.method public synthetic constructor <init>(Ll/sx70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lx70;->a:Ll/sx70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lx70;->a:Ll/sx70;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    invoke-static {p0, p1}, Ll/sx70;->M3(Ll/sx70;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    return-void
.end method
