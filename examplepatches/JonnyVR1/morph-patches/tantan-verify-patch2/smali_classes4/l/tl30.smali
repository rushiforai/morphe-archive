.class public final synthetic Ll/tl30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    check-cast p2, Lcom/p1/mobile/android/app/c;

    invoke-static {p1, p2}, Ll/so30;->f2(Lcom/p1/mobile/putong/core/data/UserPrivilege;Lcom/p1/mobile/android/app/c;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
