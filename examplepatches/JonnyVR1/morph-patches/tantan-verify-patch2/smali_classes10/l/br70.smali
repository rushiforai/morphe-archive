.class public final synthetic Ll/br70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/fr70;


# direct methods
.method public synthetic constructor <init>(Ll/fr70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/br70;->a:Ll/fr70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/br70;->a:Ll/fr70;

    check-cast p1, Ll/aa80;

    invoke-static {p0, p1}, Ll/fr70;->V3(Ll/fr70;Ll/aa80;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method
