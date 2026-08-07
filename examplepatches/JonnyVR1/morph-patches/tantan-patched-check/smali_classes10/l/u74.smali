.class public final synthetic Ll/u74;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/z74;


# direct methods
.method public synthetic constructor <init>(Ll/z74;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u74;->a:Ll/z74;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u74;->a:Ll/z74;

    check-cast p1, Ll/b45;

    invoke-static {p0, p1}, Ll/z74;->Y3(Ll/z74;Ll/b45;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
