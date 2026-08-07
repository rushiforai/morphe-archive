.class public final synthetic Ll/qye;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/sye;


# direct methods
.method public synthetic constructor <init>(Ll/sye;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qye;->a:Ll/sye;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qye;->a:Ll/sye;

    check-cast p1, Ll/pf60;

    invoke-static {p0, p1}, Ll/sye;->d(Ll/sye;Ll/pf60;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method
