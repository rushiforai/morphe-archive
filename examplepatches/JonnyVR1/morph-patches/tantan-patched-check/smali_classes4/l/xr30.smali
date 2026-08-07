.class public final synthetic Ll/xr30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yr30;


# direct methods
.method public synthetic constructor <init>(Ll/yr30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xr30;->a:Ll/yr30;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xr30;->a:Ll/yr30;

    check-cast p1, Lcom/p1/mobile/putong/data/VisitorCounter;

    invoke-static {p0, p1}, Ll/yr30;->f0(Ll/yr30;Lcom/p1/mobile/putong/data/VisitorCounter;)V

    return-void
.end method
