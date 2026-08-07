.class public final synthetic Ll/abm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/bbm;


# direct methods
.method public synthetic constructor <init>(Ll/bbm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/abm;->a:Ll/bbm;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/abm;->a:Ll/bbm;

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Ll/bbm;->c(Ll/bbm;Ll/uxj0;)Lcom/android/billingclient/api/a;

    move-result-object p0

    return-object p0
.end method
