.class public final synthetic Ll/jc2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/pc2;


# direct methods
.method public synthetic constructor <init>(Ll/pc2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jc2;->a:Ll/pc2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jc2;->a:Ll/pc2;

    check-cast p1, Ll/pf60;

    invoke-static {p0, p1}, Ll/pc2;->d(Ll/pc2;Ll/pf60;)Ll/hpl;

    move-result-object p0

    return-object p0
.end method
