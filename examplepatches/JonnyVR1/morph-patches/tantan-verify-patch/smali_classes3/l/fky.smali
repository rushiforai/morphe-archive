.class public final synthetic Ll/fky;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fky;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fky;->a:Ljava/lang/String;

    check-cast p1, Ll/nsv;

    invoke-static {p0, p1}, Ll/gky;->E(Ljava/lang/String;Ll/nsv;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
