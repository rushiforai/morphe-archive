.class public final synthetic Ll/ews0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xuw0;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/bqs0;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/bqs0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ews0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ews0;->b:Ll/bqs0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)Ll/hpr;
    .locals 1

    .line 1
    check-cast p1, Ll/cvs0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/ews0;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ews0;->b:Ll/bqs0;

    .line 6
    .line 7
    invoke-interface {p1, v0, p0}, Ll/cvs0;->q0(Ljava/lang/String;Ll/bqs0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
