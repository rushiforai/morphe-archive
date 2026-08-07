.class public final synthetic Ll/wm80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/zm80;


# direct methods
.method public synthetic constructor <init>(Ll/zm80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wm80;->a:Ll/zm80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wm80;->a:Ll/zm80;

    check-cast p1, Ll/a260;

    invoke-static {p0, p1}, Ll/zm80;->L3(Ll/zm80;Ll/a260;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
