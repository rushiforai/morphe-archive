.class public final synthetic Ll/ais;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/bjs;


# direct methods
.method public synthetic constructor <init>(Ll/bjs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ais;->a:Ll/bjs;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ais;->a:Ll/bjs;

    check-cast p1, Ll/pxj;

    invoke-static {p0, p1}, Ll/bjs;->q4(Ll/bjs;Ll/pxj;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
