.class public final synthetic Ll/g40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/i40;


# direct methods
.method public synthetic constructor <init>(Ll/i40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g40;->a:Ll/i40;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g40;->a:Ll/i40;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/i40;->J3(Ll/i40;Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
