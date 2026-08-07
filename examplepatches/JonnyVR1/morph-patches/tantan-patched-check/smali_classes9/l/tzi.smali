.class public final synthetic Ll/tzi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/vzi;


# direct methods
.method public synthetic constructor <init>(Ll/vzi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tzi;->a:Ll/vzi;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tzi;->a:Ll/vzi;

    check-cast p1, Ll/nwi;

    invoke-static {p0, p1}, Ll/vzi;->J3(Ll/vzi;Ll/nwi;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
