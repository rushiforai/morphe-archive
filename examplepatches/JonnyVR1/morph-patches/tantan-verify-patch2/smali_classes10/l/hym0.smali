.class public final synthetic Ll/hym0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/kym0;


# direct methods
.method public synthetic constructor <init>(Ll/kym0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hym0;->a:Ll/kym0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hym0;->a:Ll/kym0;

    check-cast p1, Ll/x34;

    invoke-static {p0, p1}, Ll/kym0;->R3(Ll/kym0;Ll/x34;)Ll/q54;

    move-result-object p0

    return-object p0
.end method
