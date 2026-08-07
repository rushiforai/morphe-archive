.class public final synthetic Ll/sco;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/xco;


# direct methods
.method public synthetic constructor <init>(Ll/xco;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sco;->a:Ll/xco;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sco;->a:Ll/xco;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/xco;->p0(Ll/xco;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
