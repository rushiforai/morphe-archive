.class public final synthetic Ll/dlr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p1}, Ll/mlr;->k0(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
