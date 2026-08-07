.class public final synthetic Ll/f7a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/o7a;


# direct methods
.method public synthetic constructor <init>(Ll/o7a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f7a;->a:Ll/o7a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f7a;->a:Ll/o7a;

    check-cast p1, Ll/ovb0;

    invoke-static {p0, p1}, Ll/o7a;->a3(Ll/o7a;Ll/ovb0;)Ll/ovb0;

    move-result-object p0

    return-object p0
.end method
