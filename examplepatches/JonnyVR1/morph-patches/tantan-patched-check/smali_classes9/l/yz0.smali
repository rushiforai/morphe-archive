.class public final synthetic Ll/yz0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/zz0;


# direct methods
.method public synthetic constructor <init>(Ll/zz0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yz0;->a:Ll/zz0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yz0;->a:Ll/zz0;

    check-cast p1, Ll/q35;

    invoke-static {p0, p1}, Ll/zz0;->J3(Ll/zz0;Ll/q35;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
