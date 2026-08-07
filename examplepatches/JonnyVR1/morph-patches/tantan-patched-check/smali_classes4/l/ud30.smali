.class public final synthetic Ll/ud30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ud30;->a:Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ud30;->a:Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->E1(Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;Lcom/p1/mobile/android/app/c;)Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

    move-result-object p0

    return-object p0
.end method
