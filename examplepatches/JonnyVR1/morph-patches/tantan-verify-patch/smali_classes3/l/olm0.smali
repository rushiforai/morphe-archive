.class public final synthetic Ll/olm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/hnm0;


# direct methods
.method public synthetic constructor <init>(Ll/hnm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/olm0;->a:Ll/hnm0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/olm0;->a:Ll/hnm0;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/hnm0;->X3(Ll/hnm0;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
