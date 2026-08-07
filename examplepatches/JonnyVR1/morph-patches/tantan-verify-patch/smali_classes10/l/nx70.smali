.class public final synthetic Ll/nx70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/sx70;


# direct methods
.method public synthetic constructor <init>(Ll/sx70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nx70;->a:Ll/sx70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nx70;->a:Ll/sx70;

    check-cast p1, Ll/qc80;

    invoke-static {p0, p1}, Ll/sx70;->K3(Ll/sx70;Ll/qc80;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
