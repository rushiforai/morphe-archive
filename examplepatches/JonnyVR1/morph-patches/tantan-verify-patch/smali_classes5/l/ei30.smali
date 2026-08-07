.class public final synthetic Ll/ei30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/newui/main/base/TabName;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ei30;->a:Lcom/p1/mobile/putong/newui/main/base/TabName;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ei30;->a:Lcom/p1/mobile/putong/newui/main/base/TabName;

    check-cast p1, Ll/pf60;

    invoke-static {p0, p1}, Ll/ji30;->d(Lcom/p1/mobile/putong/newui/main/base/TabName;Ll/pf60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
