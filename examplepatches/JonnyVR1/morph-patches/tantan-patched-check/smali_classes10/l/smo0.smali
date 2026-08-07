.class public final synthetic Ll/smo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/zmo0;


# direct methods
.method public synthetic constructor <init>(Ll/zmo0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/smo0;->a:Ll/zmo0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smo0;->a:Ll/zmo0;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/zmo0;->d(Ll/zmo0;Landroid/net/NetworkInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
