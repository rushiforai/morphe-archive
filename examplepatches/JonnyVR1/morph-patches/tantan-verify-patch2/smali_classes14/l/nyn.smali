.class public final synthetic Ll/nyn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/qyn;


# direct methods
.method public synthetic constructor <init>(Ll/qyn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nyn;->a:Ll/qyn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nyn;->a:Ll/qyn;

    check-cast p1, Ll/evs;

    invoke-static {p0, p1}, Ll/qyn;->S2(Ll/qyn;Ll/evs;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
