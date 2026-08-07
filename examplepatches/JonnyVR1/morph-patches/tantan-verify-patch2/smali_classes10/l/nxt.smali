.class public final synthetic Ll/nxt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/uxt;


# direct methods
.method public synthetic constructor <init>(Ll/uxt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nxt;->a:Ll/uxt;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxt;->a:Ll/uxt;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/uxt;->P3(Ll/uxt;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
