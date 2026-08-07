.class public final synthetic Ll/f5j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/i5j;


# direct methods
.method public synthetic constructor <init>(Ll/i5j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f5j;->a:Ll/i5j;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f5j;->a:Ll/i5j;

    check-cast p1, Ll/xcd0;

    invoke-static {p0, p1}, Ll/i5j;->K3(Ll/i5j;Ll/xcd0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
