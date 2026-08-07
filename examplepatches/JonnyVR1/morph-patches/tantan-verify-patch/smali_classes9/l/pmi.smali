.class public final synthetic Ll/pmi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/tmi;


# direct methods
.method public synthetic constructor <init>(Ll/tmi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pmi;->a:Ll/tmi;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pmi;->a:Ll/tmi;

    check-cast p1, Ll/wmi;

    invoke-static {p0, p1}, Ll/tmi;->K3(Ll/tmi;Ll/wmi;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
