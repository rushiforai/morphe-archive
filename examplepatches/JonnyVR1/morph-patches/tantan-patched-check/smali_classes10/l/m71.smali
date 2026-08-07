.class public final synthetic Ll/m71;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/o81;


# direct methods
.method public synthetic constructor <init>(Ll/o81;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m71;->a:Ll/o81;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m71;->a:Ll/o81;

    check-cast p1, Ll/x61;

    invoke-static {p0, p1}, Ll/o81;->f4(Ll/o81;Ll/x61;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
