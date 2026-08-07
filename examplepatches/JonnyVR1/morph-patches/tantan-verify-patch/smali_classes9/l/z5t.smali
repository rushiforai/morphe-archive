.class public final synthetic Ll/z5t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/pcj;


# direct methods
.method public synthetic constructor <init>(Ll/pcj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z5t;->a:Ll/pcj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z5t;->a:Ll/pcj;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/i6t;->X2(Ll/pcj;Landroid/net/NetworkInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
