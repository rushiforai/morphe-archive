.class public final synthetic Ll/nav;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/uav;


# direct methods
.method public synthetic constructor <init>(Ll/uav;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nav;->a:Ll/uav;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nav;->a:Ll/uav;

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {p0, p1}, Ll/uav;->U2(Ll/uav;Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
