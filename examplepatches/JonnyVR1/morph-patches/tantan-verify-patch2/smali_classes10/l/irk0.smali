.class public final synthetic Ll/irk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/nrk0;


# direct methods
.method public synthetic constructor <init>(Ll/nrk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/irk0;->a:Ll/nrk0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/irk0;->a:Ll/nrk0;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/nrk0;->M3(Ll/nrk0;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
