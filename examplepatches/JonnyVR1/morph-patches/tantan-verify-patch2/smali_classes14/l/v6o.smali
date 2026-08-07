.class public final synthetic Ll/v6o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/h7o;


# direct methods
.method public synthetic constructor <init>(Ll/h7o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v6o;->a:Ll/h7o;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v6o;->a:Ll/h7o;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/h7o;->b3(Ll/h7o;Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
