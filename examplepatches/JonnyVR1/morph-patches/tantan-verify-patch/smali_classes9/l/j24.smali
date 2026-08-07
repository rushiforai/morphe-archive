.class public final synthetic Ll/j24;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/l24;


# direct methods
.method public synthetic constructor <init>(Ll/l24;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j24;->a:Ll/l24;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j24;->a:Ll/l24;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;

    invoke-static {p0, p1}, Ll/l24;->l4(Ll/l24;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V

    return-void
.end method
