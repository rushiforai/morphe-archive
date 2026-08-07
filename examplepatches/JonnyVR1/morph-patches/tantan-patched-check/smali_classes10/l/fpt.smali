.class public final synthetic Ll/fpt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/e80;


# direct methods
.method public synthetic constructor <init>(Ll/e80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fpt;->a:Ll/e80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fpt;->a:Ll/e80;

    check-cast p1, Ll/e80;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;->f(Ll/e80;Ll/e80;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
