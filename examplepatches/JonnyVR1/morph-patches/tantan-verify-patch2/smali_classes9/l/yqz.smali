.class public final synthetic Ll/yqz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/pf60;


# direct methods
.method public synthetic constructor <init>(Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yqz;->a:Ll/pf60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yqz;->a:Ll/pf60;

    check-cast p1, Ll/qbm;

    invoke-static {p0, p1}, Ll/tvz;->da(Ll/pf60;Ll/qbm;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
