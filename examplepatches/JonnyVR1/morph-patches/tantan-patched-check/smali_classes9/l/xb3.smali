.class public final synthetic Ll/xb3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/gc3;


# direct methods
.method public synthetic constructor <init>(Ll/gc3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xb3;->a:Ll/gc3;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xb3;->a:Ll/gc3;

    check-cast p1, Ll/se3;

    invoke-static {p0, p1}, Ll/gc3;->R3(Ll/gc3;Ll/se3;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
